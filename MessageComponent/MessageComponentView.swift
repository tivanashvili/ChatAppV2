//
//  MessageTextView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

class    : UIView {
    
    // MARK : variable
    private let containerView = UIView()
    
    private var textView: UITextView = UITextView()
    private var messageComponentModel: MessageComponentViewModel?
    
    private var button: UIButton = UIButton()
    
    // MARK : init
    init(frame: CGRect, messageComponentModel: MessageComponentViewModel) {
        super.init(frame: frame)
        self.messageComponentModel = messageComponentModel
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    // MARK : setup
    private func setUp(){
        setUpContainerView()
        setUpTextView()
        setUpButton()
        setUpLayoutConstraints()
    }
    
    private func setUpContainerView(){
        containerView.backgroundColor = .red
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpTextView() {
        textView.text = messageComponentModel!.placeHolder
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.backgroundColor = .black
        containerView.addSubview(textView)
    }
    
    private func setUpButton() {
        button.setImage(UIImage(named: messageComponentModel!.sendButtonImageName), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        containerView.addSubview(button)
    }
    
    // MARK : layout constraints
    private func setUpLayoutConstraints(){
        addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            textView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            textView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            textView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -160),
            
            button.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12),
            button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12),
            button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -60),
            button.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 32),
            button.widthAnchor.constraint(equalToConstant: 32),
        ])
    }
}
