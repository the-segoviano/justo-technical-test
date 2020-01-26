//
//  CustomUserLocationCell.swift
//  Justo Technical Test
//
//  Created by Luis Segoviano on 26/01/20.
//  Copyright © 2020 Luis Segoviano. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CustomUserLocationCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(randomUser: RandomUser) {
        selectionStyle = .none
        if randomUser.location?.coordinates != nil,
            let latitude = randomUser.location?.coordinates?.latitude,
            let longitude = randomUser.location?.coordinates?.longitude {
            let mapSnapshotOptions = MKMapSnapshotter.Options()
            let needleLocation = CLLocationCoordinate2DMake(CLLocationDegrees(Float(latitude)!),
                                                            CLLocationDegrees(Float(longitude)!))
            let region = MKCoordinateRegion(center: needleLocation, latitudinalMeters: 40000, longitudinalMeters: 40000)
            mapSnapshotOptions.region = region
            mapSnapshotOptions.scale = UIScreen.main.scale
            mapSnapshotOptions.size = CGSize(width: UIScreen.main.bounds.width, height: 250)
            mapSnapshotOptions.showsBuildings = true
            mapSnapshotOptions.showsPointsOfInterest = true
            mapSnapshotOptions.mapType = .hybrid
            
            let activityView = UIActivityIndicatorView(style: .gray)
            activityView.translatesAutoresizingMaskIntoConstraints = false
            activityView.hidesWhenStopped = true
            addSubview(activityView)
            activityView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
            activityView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
            activityView.startAnimating()
            
            let snapshotter = MKMapSnapshotter(options: mapSnapshotOptions)
            snapshotter.start { snapshot, error in
                activityView.stopAnimating()
                if let err = error {
                    let labelError = UILabel()
                    labelError.translatesAutoresizingMaskIntoConstraints = false
                    labelError.text = err as? String
                    self.addSubview(labelError)
                    labelError.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
                    labelError.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
                    labelError.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
                    labelError.heightAnchor.constraint(equalToConstant: 30).isActive = true
                }
                else if snapshot != nil {
                    let image = snapshot?.image
                    let imageMap = UIImageView(image: image)
                    self.addSubview(imageMap)
                    self.addConstraintsWithFormat(format: "H:|[v0]|", views: imageMap)
                    self.addConstraintsWithFormat(format: "V:|[v0]|", views: imageMap)
                }
            }
        }
    }
}
