//
//  delmeView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

class DelmeView :UIView{
    private let uiView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    // MARK : init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayoutConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpLayoutConstraints()
    }
    
    private func setUpLayoutConstraints(){
        uiView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(uiView)
        NSLayoutConstraint.activate([
            uiView.topAnchor.constraint(equalTo: topAnchor),
            uiView.trailingAnchor.constraint(equalTo: trailingAnchor),
            uiView.leadingAnchor.constraint(equalTo: leadingAnchor),
            uiView.bottomAnchor.constraint(equalTo: bottomAnchor),
            uiView.heightAnchor.constraint(equalToConstant: 50),
            uiView.widthAnchor.constraint(equalToConstant: 50),
        ])
    }
}
