//
//  DetailsRouter.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import UIKit

class DetailsRouter {

    weak var viewController: UIViewController?

    static func setup(with data: ResultData) -> UIViewController {
        let router = DetailsRouter()
        let view = DetailsViewController(with: DetailsViewModel(router: router, homeResponseResult: data))
        router.viewController = view
        return view
    }
}
