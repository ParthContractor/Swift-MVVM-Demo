//
//  MoviesDetailsVC.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import UIKit

class MoviesDetailsVC: UIViewController {
    var viewModel = MovieDetailsViewModel()
    
    // MARK: - initilisers
    init(nibName:String){
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var lblProducerName: UILabel!
    @IBOutlet var lblDirectorName: UILabel!
    @IBOutlet var lblReleaseDateName: UILabel!

    // MARK: - initial setup
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.viewModel.navigationBarTitleForLandingView
        moviewDetailsDataSetup()
    }
    
    private func moviewDetailsDataSetup() {
        lblDirectorName.text = "Director: " + (viewModel.dataSource?.director ?? "N/A")
        lblProducerName.text = "Producer: " + (viewModel.dataSource?.producer ?? "N/A")
        lblReleaseDateName.text = "Release Date: " + (viewModel.dataSource?.release_date ?? "N/A")
    }
    
}
