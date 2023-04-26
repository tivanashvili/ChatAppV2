//
//  ChatView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

class ChatView : UIView {
    
    private let chatView = UIView()
    private let messageViewTable = MessageViewTable()
    private let textInputComponentView = TextInputComponentView(
                                        frame: CGRect(),
                                        messageComponentModel:TextInputComponentViewModel(placeHolder:
                                                                                            CommonConstants.MessageComponentPlaceHolder, sendButtonImageName: ImageNames.SendButton))
    
    // MARK : init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUp()
    }
    
    private func setUp(){
        setUpChatView()
        setUpMessageViewTable()
        setUpTextInputComponentView()
        setUpLayoutConstraints()
    }
    
    private func setUpChatView(){
        chatView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpMessageViewTable(){
        messageViewTable.translatesAutoresizingMaskIntoConstraints = false
        chatView.addSubview(messageViewTable)
    }
    
    private func setUpTextInputComponentView(){
        textInputComponentView.translatesAutoresizingMaskIntoConstraints = false
        chatView.addSubview(textInputComponentView)
    }
    
    // MARK : layout constraints
    private func setUpLayoutConstraints(){
        addSubview(chatView)
        NSLayoutConstraint.activate([
            chatView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            chatView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            chatView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            chatView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            messageViewTable.topAnchor.constraint(equalTo: chatView.topAnchor, constant: 5),
            messageViewTable.bottomAnchor.constraint(equalTo: textInputComponentView.topAnchor, constant: 0),
            messageViewTable.leadingAnchor.constraint(equalTo: chatView.leadingAnchor, constant: 5),
            messageViewTable.trailingAnchor.constraint(equalTo: chatView.trailingAnchor, constant: -5),
            
            textInputComponentView.topAnchor.constraint(equalTo: messageViewTable.bottomAnchor, constant: 0),
            textInputComponentView.bottomAnchor.constraint(equalTo: chatView.bottomAnchor, constant: 0),
            textInputComponentView.trailingAnchor.constraint(equalTo: chatView.trailingAnchor, constant: 0),
            textInputComponentView.leadingAnchor.constraint(equalTo: chatView.leadingAnchor, constant: 0),
        ])
    }
}
