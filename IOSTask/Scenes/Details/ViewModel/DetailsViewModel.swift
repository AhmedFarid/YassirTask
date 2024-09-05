//
//  DetailsViewModel.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import Foundation
import Combine

class DetailsViewModel {

    // MARK: - Variables
    var router: DetailsRouter
    var homeResponseResult: ResultData?

    init(router: DetailsRouter, homeResponseResult: ResultData) {
        self.router = router
        self.homeResponseResult = homeResponseResult
    }
}
