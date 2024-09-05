//
//  HomeViewModel.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import Foundation
import Combine

class HomeViewModel {

    // MARK: - Variables
    var homeDataApi: HomeRequestAPI
    var router: HomeRouter

    var showHUD: PassthroughSubject<Bool, Never> = PassthroughSubject<Bool, Never>()
    var errorMessage: PassthroughSubject<String?, Never> = PassthroughSubject<String?, Never>()
    var homeResponse: CurrentValueSubject<HomeModel?, Never> = CurrentValueSubject<HomeModel?, Never>(nil)
    var homeResponseResult: CurrentValueSubject<[ResultData]?, Never> = CurrentValueSubject<[ResultData]?, Never>(nil)

    var currentPage = 1
    var isLastPage = false
    init(homeDataApi: HomeRequestAPI, router: HomeRouter) {
        self.homeDataApi = homeDataApi
        self.router = router
        getHomeDate(status: "")
    }

    func getHomeDate(status: String) {
        showHUD.send(true)
        homeDataApi.getHomeData(body: ["count": 20, "page": 1, "status": status]) { [weak self] result in
            guard let self = self else { return }
            self.showHUD.send(false)
            switch result {
            case .success(let data):
                if let data = data {
                    homeResponse.send(data)
                    homeResponseResult.send(data.results)
                }
            case .failure(let error):
                self.errorMessage.send(error.localizedDescription)
            }
        }
    }

    func getMoreData(status: String) {
        guard isLastPage == false else {return}
        currentPage = currentPage + 1
        homeDataApi.getHomeData(body: ["count": 20, "page": currentPage, "status": status]) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                if let data = data {
                    isLastPage = data.info?.next == nil
                    homeResponse.send(data)
                    homeResponseResult.value?.append(contentsOf: data.results ?? [])
                }
            case .failure(let error):
                self.errorMessage.send(error.localizedDescription)
            }
        }
    }

    func goToDetails(indexPath: IndexPath) {
        guard let data = homeResponseResult.value?[indexPath.row] else {return}
        router.goToDetails(data: data)
    }
}
