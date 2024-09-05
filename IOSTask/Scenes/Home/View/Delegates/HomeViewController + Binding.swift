//
//  HomeViewController + Binding.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import UIKit

extension HomeViewController {
    func setBinding() {
        showHUDBinding()
        errorMessageBinding()
        homeResponseBinding()
    }

    func showHUDBinding() {
        viewModel.showHUD.receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] showHud in
                guard let self = self else {return}
                showHud ? self.startIndicator() : self.stopAnimating()
            })
            .store(in: &cancellable)
    }

    func errorMessageBinding() {
        viewModel.errorMessage.receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] message in
                guard let self = self else {return}
                print(message ?? "")
            })
            .store(in: &cancellable)
    }

    func homeResponseBinding() {
        viewModel.homeResponseResult
            .sink { [weak self] response in
                guard let self = self else {return}
                self.tableView.reloadData()
            }
            .store(in: &cancellable)
    }

}

