//
//  DetailsViewController.swift
//  IOSTask
//
//  Created by Farido on 05/09/2024.
//

import UIKit

class DetailsViewController: UIViewController {
    // MARK: - Outlet
    @IBOutlet weak var detailsImage: UIImageView!
    @IBOutlet weak var detailsTitleLabel: UILabel!
    @IBOutlet weak var detailsSubTitleLabel: UILabel!
    @IBOutlet weak var detailsLocationLabel: UILabel!
    @IBOutlet weak var detailsStatusLabel: UILabel!
    

    // MARK: - Variables
    let viewModel: DetailsViewModel

    // MARK: - ViewLifeCycle
    init(with viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsViewController", bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDate()
    }

    func setupDate() {
        ImageLoaderHelper.loadImage(imageUrl: viewModel.homeResponseResult?.image ?? "", imageView: detailsImage)
        detailsTitleLabel.text = viewModel.homeResponseResult?.name ?? ""
        detailsSubTitleLabel.text = "\(viewModel.homeResponseResult?.species ?? "") - \(viewModel.homeResponseResult?.gender ?? "")"
        detailsLocationLabel.text = viewModel.homeResponseResult?.location?.name ?? ""
        detailsStatusLabel.text = viewModel.homeResponseResult?.status ?? ""
    }
}
