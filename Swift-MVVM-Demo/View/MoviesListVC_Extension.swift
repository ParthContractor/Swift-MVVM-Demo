//
//  MoviesListVC_Extension.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import Foundation
import UIKit

extension MoviesListVC: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Tableview delegate/datasource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let rowsData = self.viewModel.dataSource {
            return rowsData.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         cell.accessoryType = .disclosureIndicator
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListTableViewCell.cellIdentifier) as! MoviesListTableViewCell
        if let rowsData = self.viewModel.dataSource {
            cell.titleLabelText.text = rowsData[indexPath.row].title
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let movieDetailsVC = MoviesDetailsVC(nibName: "MoviesDetailsVC")
        if let rowsData = self.viewModel.dataSource {
            movieDetailsVC.viewModel.navigationBarTitleForLandingView = rowsData[indexPath.row].title
            movieDetailsVC.viewModel.dataSource = rowsData[indexPath.row]
        }
        self.navigationController?.pushViewController(movieDetailsVC, animated: true)
    }

}
