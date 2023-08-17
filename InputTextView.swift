//
//  InputTextView.swift
//  InstagramFirestoreTutorial
//
//  Created by yiyein on 2023/08/14.
//

import UIKit
import SnapKit

class InputTextView: UITextView {

    // MARK: - Properties
    
    var placeholderText: String? {
        didSet { placeholderLabel.text = placeholderText }
    }
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    
    var placeholderShouldRowCenter = true {
        didSet {
            if placeholderShouldRowCenter {
                placeholderLabel.snp.makeConstraints { make in
                    make.leading.equalTo(snp.leading).offset(8)
                    make.trailing.equalTo(snp.trailing)
                    make.centerY.equalTo(self)
                }
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(6)
            make.left.equalTo(snp.left).offset(8)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func handleTextDidChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }
}
 
