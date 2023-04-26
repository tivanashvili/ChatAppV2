//
//  MessageTextView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

class TextInputComponentView : UIView, UITextViewDelegate {
    
    // MARK : variables
    private let containerView = UIView()
    
    private var textView: UITextView = UITextView()
    private var messageComponentModel: TextInputComponentViewModel?
    
    private var button: UIButton = UIButton()
    
    // MARK: init
    init(frame: CGRect, messageComponentModel: TextInputComponentViewModel) {
        super.init(frame: frame)
        self.messageComponentModel = messageComponentModel
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    // MARK: setup
    private func setUp(){
        setUpContainerView()
        setUpTextView()
        setUpButton()
        setUpLayoutConstraints()
    }
    
    private func setUpContainerView(){
        containerView.layer.borderWidth = 1.0
        containerView.layer.borderColor = CGColor(red: 0.62, green: 0.38, blue: 1.00, alpha: 1.00)
        containerView.layer.cornerRadius = 28
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpTextView() {
        textView.text = messageComponentModel!.placeHolder
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.cornerRadius = 28
        textView.isScrollEnabled = false
        textView.textContainer.lineBreakMode = .byWordWrapping
        textView.textContainer.maximumNumberOfLines = 5
        textView.textColor = UIColor.lightGray
        textView.delegate = self
        textView.textAlignment = .center
        
        containerView.addSubview(textView)
    }
    
    private func setUpButton() {
            button.setImage(UIImage(named: messageComponentModel!.sendButtonImageName), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(button)
    }
    
    // MARK: layout constraints
    private func setUpLayoutConstraints(){
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            textView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            textView.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -5),
            
            button.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12),
            button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 32),
            button.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
    
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = messageComponentModel?  .placeHolder
            textView.textColor = UIColor.lightGray
        }
    }
}
