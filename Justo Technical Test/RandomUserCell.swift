//
//  CellRandomUser.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 25/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import UIKit

class RandomUserCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(randomUser: RandomUser) {
        self.textLabel?.text = randomUser.name?.getFullUserName()
        self.detailTextLabel?.text = randomUser.location?.getFullAddress()
        self.detailTextLabel?.textColor = .darkGray
        self.detailTextLabel?.numberOfLines = 0
        self.accessoryType = .disclosureIndicator
        if randomUser.picture?.thumbnail != nil, self.imageView?.image == nil,
            let thumb = randomUser.picture?.thumbnail, !thumb.isEmpty {
            self.imageView?.image = UIImage(named: "avatar")!
            self.imageView?.setImageFor(url: URL(string: thumb)!) { image in
                self.imageView?.image = image
                self.setNeedsLayout()
            }
        }
    }
    
}
