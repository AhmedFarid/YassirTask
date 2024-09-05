//
//  HomeRouter.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import UIKit

class HomeRouter {

    weak var viewController: UIViewController?

    static func setup() -> UIViewController {
        let router = HomeRouter()
        let homeRequestAPI = HomeRequestAPI()
        let view = HomeViewController(with: HomeViewModel(homeDataApi: homeRequestAPI, router: router))
        router.viewController = view
        return view
    }

    func goToDetails(data: ResultData) {
        let vc = DetailsRouter.setup(with: data)
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}
