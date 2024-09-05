//
//  IndicatorHelper.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import Foundation
import UIKit
import NVActivityIndicatorView

extension UIViewController: NVActivityIndicatorViewable{
  func startIndicator(){
      startAnimating(CGSize(width: 100, height: 100),message: "",type: .ballClipRotate,color: .blue)
  }
}
