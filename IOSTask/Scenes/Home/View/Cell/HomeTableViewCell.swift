//
//  HomeTableViewCell.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLabelCell: UILabel!
    @IBOutlet weak var subTitleLabelCell: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        imageCell.layer.cornerRadius = 10
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
    }

    func configureCell(data: ResultData) {
        ImageLoaderHelper.loadImage(imageUrl: data.image ?? "", imageView: imageCell)
        titleLabelCell.text = data.name
        subTitleLabelCell.text = data.species
    }
}
