//
//  AvatarCell.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 26/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import UIKit

class AvatarCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(urlImage: String) {
        selectionStyle = .none
        let avatar = UIImageView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.clipsToBounds = true
        addSubview(avatar)
        avatar.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        avatar.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        avatar.widthAnchor.constraint(equalToConstant: 120).isActive = true
        avatar.heightAnchor.constraint(equalToConstant: 120).isActive = true
        avatar.layer.cornerRadius = 120/2
        
        if !urlImage.isEmpty, self.imageView?.image == nil {
            avatar.image = UIImage(named: "avatar")!
            self.imageView?.setImageFor(url: URL(string: urlImage)!) { image in
                avatar.image = image
            }
        }
        
    }
    
}
