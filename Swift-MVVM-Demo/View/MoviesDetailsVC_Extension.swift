//
//  MoviesDetailsVC_Extension.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import UIKit
import Foundation

extension MoviesDetailsVC: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Tableview delegate/datasource methods
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Movie Characters"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.listOfCharacters.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.accessoryType = .none
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoviesListTableViewCell.cellIdentifier) as! MoviesListTableViewCell
        cell.titleLabelText.text = "Name: N/A"

        cell.titleLabelText.text = self.viewModel.listOfCharacters[indexPath.row].name
        return cell
    }
    
}
