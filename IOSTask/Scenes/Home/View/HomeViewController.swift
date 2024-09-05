//
//  HomeViewController.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    // MARK: - Outlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segment: UISegmentedControl!

    // MARK: - Variables
    let viewModel: HomeViewModel
    var cancellable = Set<AnyCancellable>()
    var status = ""

    // MARK: - ViewLifeCycle
    init(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupNavigationUI()
        setBinding()
    }

    func setupNavigationUI() {
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    @IBAction func segmentedAction(_ sender: Any) {
        if segment.selectedSegmentIndex == 0  {
            viewModel.getHomeDate(status: "")
            status = ""
        } else if segment.selectedSegmentIndex == 1 {
            viewModel.getHomeDate(status: "Alive")
            status = "Alive"
        } else if segment.selectedSegmentIndex == 2 {
            viewModel.getHomeDate(status: "Dead")
            status = "Dead"
        } else {
            viewModel.getHomeDate(status: "unknown")
            status = "unknown"
        }
    }
}
