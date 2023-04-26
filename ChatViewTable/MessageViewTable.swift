//
//  ChatTableView.swift
//  ChatAppV2
//
//  Created by tornike on 26.04.23.
//

import UIKit

class MessageViewTable: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    let data: [String]
    
    override init(frame: CGRect, style: UITableView.Style) {
        // Initialize the data array
        data = ["Item 1", "Item 2", "Item 3"]
        
        super.init(frame: frame, style: style)
        
        // Set the data source and delegate
        dataSource = self
        delegate = self
        
        // Register a cell for the table view
        register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.backgroundColor = .green
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected item \(indexPath.row + 1)")
    }
}
