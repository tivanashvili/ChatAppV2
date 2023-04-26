//
//  ViewController.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

class ViewController: UIViewController {

    private let messageComponentView = MessageComponentView(
                                        frame: CGRect(),
                                        messageComponentModel:MessageComponentViewModel(placeHolder: CommonConstants.MessageComponentPlaceHolder, sendButtonImageName: ImageNames.SendButton))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(messageComponentView)
        setUpLayoutConstraints()
    }

    // MARK : layout constraints
    private func setUpLayoutConstraints(){
        messageComponentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            messageComponentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            messageComponentView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            messageComponentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            messageComponentView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

}

