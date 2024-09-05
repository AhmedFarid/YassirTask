//
//  HomeViewController + TableViewDelegate.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeTableViewCell", bundle: .main), forCellReuseIdentifier: "HomeTableViewCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.homeResponseResult.value?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {return UITableViewCell()}
        guard let data = viewModel.homeResponseResult.value?[indexPath.row] else {return UITableViewCell()}
        cell.configureCell(data: data)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.item == (viewModel.homeResponseResult.value?.count ?? 0) - 1 {
            self.viewModel.getMoreData(status: status)
        } else {
            cell.alpha = 0
            UIView.animate(withDuration: 0.8, delay: 0,usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.allowUserInteraction, .curveEaseInOut], animations: {
              cell.alpha = 1
            },completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.goToDetails(indexPath: indexPath)
    }
}
