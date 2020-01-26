//
//  ProfileRandomUserViewController.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import UIKit

class ProfileRandomUserViewController: UITableViewController {
    
    var randomUserSelected: RandomUser?
    
    private let sections = ["avatar", "flag", "location", "description", "phone", "email"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationItem.title = randomUserSelected?.name?.first
        self.tableView.separatorStyle = .none
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        self.tableView.register(AvatarCell.self, forCellReuseIdentifier: "AvatarCell")
        self.tableView.register(CustomUserLocationCell.self, forCellReuseIdentifier: "CustomUserLocationCell")
        self.tableView.reloadData()
        let shareItem = UIBarButtonItem(barButtonSystemItem: .action, target: self,
                                      action: #selector(self.share))
        self.navigationItem.rightBarButtonItem = shareItem
    }
    
    func flag(from country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.uppercased().unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return s
    }
    
    
    @objc func share() {
        if let randomUser = randomUserSelected {
            let objectsToShare = [randomUser.name?.first as Any, randomUser.phone, randomUser.email] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
        }
    }
    
    
}


// MARK: Delegate & DataSource

extension ProfileRandomUserViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = sections[indexPath.row]
        
        if section == "avatar" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell", for: indexPath)
            if let cell = cell as? AvatarCell{
                if let url = randomUserSelected?.picture?.large {
                    cell.setUpView(urlImage: url)
                }
                return cell
            }
        }
        
        if section == "flag" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            if let nat = randomUserSelected?.nat {
                cell.selectionStyle = .none
                cell.textLabel?.numberOfLines = 0
                cell.textLabel?.font = UIFont.init(name: (cell.textLabel?.font.familyName)!, size: 32)
                cell.textLabel?.text = "Hi, here you are a Snapshoot from my country(\(flag(from: nat))). Sometimes appears in middle of the sea or in middle of Arctic."
            }
            return cell
        }
        
        if section == "location" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CustomUserLocationCell", for: indexPath)
            if let cell = cell as? CustomUserLocationCell {
                if let randomUser = randomUserSelected {
                    cell.setUpView(randomUser: randomUser)
                }
                return cell
            }
        }
        
        if section == "description" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.selectionStyle = .none
            cell.imageView?.contentMode = .scaleAspectFit
            cell.imageView?.image = nil
            cell.textLabel?.text = "We can keep in touch:"
            cell.setNeedsLayout()
            return cell
        }
        
        if section == "phone" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.imageView?.contentMode = .scaleAspectFit
            cell.imageView?.image = UIImage(named: "phone")
            cell.selectionStyle = .default
            if let randomUser = randomUserSelected {
                cell.textLabel?.text = randomUser.phone
            }
            cell.setNeedsLayout()
            return cell
        }
        
        
        if section == "email" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.imageView?.contentMode = .scaleAspectFit
            cell.imageView?.image = UIImage(named: "mail")
            cell.selectionStyle = .default
            if let randomUser = randomUserSelected {
                cell.textLabel?.text = randomUser.email
            }
            cell.setNeedsLayout()
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = sections[indexPath.row]
        if section == "avatar" {
            return 130
        }
        if section == "location" {
            return 250
        }
        return UITableView.automaticDimension
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


