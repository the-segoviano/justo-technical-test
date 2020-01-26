//
//  ViewController.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 24/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import UIKit

class ListRandomUserViewController: UITableViewController {

    private var randomUsers: [RandomUser] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Random Users"
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.register(RandomUserCell.self, forCellReuseIdentifier: "CellRandomUser")
        let addItem = UIBarButtonItem(barButtonSystemItem: .add, target: self,
                                      action: #selector(self.addRandomUserByRequest))
        self.navigationItem.rightBarButtonItem = addItem
        
        for _ in 1...4 {
            addRandomUserByRequest()
        }
        
    }
    
    
    @objc func addRandomUserByRequest() {
        let urlRandomUser = URL(string: "https://randomuser.me/api/")!
        let task = URLSession.shared.dataTask(with: urlRandomUser) { (data, response, error) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let randomUserDictionaryParsed = json as? Dictionary<String, Any> {
                    if let randomUserDictionary = randomUserDictionaryParsed["results"] as? [Dictionary<String, Any>] {
                        if let randomUserDictionary = randomUserDictionary.first {
                            let newRandomUser = RandomUser(randomUserDictionary: randomUserDictionary)
                            self.randomUsers.append(newRandomUser)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    

}


// MARK: Delegate & DataSource

extension ListRandomUserViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellRandomUser", for: indexPath)
        if let cell = cell as? RandomUserCell {
            let randomUser = randomUsers[indexPath.row]
            cell.setUpView(randomUser: randomUser)
            return cell
        }
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let randomUser = randomUsers[indexPath.row]
        let profile = ProfileRandomUserViewController()
        profile.randomUserSelected = randomUser
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
}
