//
//  ChatListViewController.swift
//  MessengerTest
//
//  Created by Ryan Aubrey on 5/5/18.
//  Copyright © 2018 Ryan Aubrey. All rights reserved.
//

import UIKit

class ChatListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var chatListTableView: UITableView!
    
    var chatList: [String]!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        chatListTableView.delegate = self
        chatListTableView.dataSource = self
        
        chatList = ["Here I am", "Rock me", "Like a Hurricane"]
        
        // Observe firebase changes
        let query = Constants.refs.databaseChatsKeys.queryLimited(toLast: 10)
        self.showFullScreenLoadingIndicator()
        _ = query.observe(.childAdded, with: { [weak self] snapshot in
            self?.hideFullScreenLoadingIndicator()

            guard let data = snapshot.value as? [String: String], let name = data["chat_name"] else {
                return
            }
            
            self?.chatList.append(name)
            self?.chatListTableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Datasource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListTableViewCell") as! ChatListTableViewCell
        cell.configureCell(chatList[indexPath.row])
        return cell
    }
    
    
    // MARK: Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let chatViewController = ChatViewController()
        chatViewController.firebaseChatIdentifier = chatList[indexPath.row]
        self.navigationController?.pushViewController(chatViewController, animated: true)
        
    }
    
}
