//
//  GenericViewCell.swift
//  TesteNeon
//
//  Created by Gustavo Kin on 28/09/19.
//  Copyright © 2019 Gustavo Kin. All rights reserved.
//

import UIKit

internal class GenericViewCell: UITableViewCell {
    static let cellIdentifier = "GenericViewCellIdentifier"
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var shortNameLabel: UILabel!
    @IBOutlet weak var clientPhotoImage: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var totalValueLabel: UILabel!
    
    var friendsModel: FriendsModel? {
        didSet {
            guard let friendsModel = friendsModel else {
                return
            }
            if let value = friendsModel.value {
                totalValueLabel.text = value
                totalValueLabel.isHidden = false
            } else {
                totalValueLabel.isHidden = true
            }
            
            nameLabel.text = friendsModel.name
            phoneLabel.text = friendsModel.phone
            shortNameLabel.text = friendsModel.shortName
            
            if let clientImage = UIImage(named: friendsModel.imageName) {
                clientPhotoImage.image = clientImage
                clientPhotoImage.isHidden = false
                shortNameLabel.isHidden = true
            } else {
                clientPhotoImage.isHidden = true
                shortNameLabel.isHidden = false
            }
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageContainer.layer.cornerRadius = imageContainer.frame.height / 2
        imageContainer.layer.borderWidth = 1
        imageContainer.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        clientPhotoImage.layer.cornerRadius = clientPhotoImage.frame.height / 2
    }
}
