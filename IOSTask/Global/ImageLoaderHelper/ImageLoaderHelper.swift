//
//  ImageLoaderHelper.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import Foundation
import UIKit
import Kingfisher

class ImageLoaderHelper {
    class func loadImage(imageUrl url: String, imageView image: UIImageView?, placeholder: UIImage? = UIImage(named: "placeHolderImage")) {
        let urlWithoutEncoding = url
        let encodedLink = urlWithoutEncoding.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let encodedURL = NSURL(string: encodedLink!)! as URL
        image?.kf.indicatorType = .activity
        if let url = URL(string: "\(encodedURL)") {
            image?.kf.setImage(with: url, placeholder: placeholder)
        }else {
            image?.image = placeholder
        }
    }
}
