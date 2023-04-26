//
//  MessageContainerModel.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

class TextInputComponentViewModel {
    var placeHolder:String
    var sendButtonImageName:String
    
    init(placeHolder:String, sendButtonImageName:String) {
        self.placeHolder = placeHolder
        self.sendButtonImageName = sendButtonImageName
    }
}
