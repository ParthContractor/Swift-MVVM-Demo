//
//  MoviesListTableViewCell.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import UIKit

class MoviesListTableViewCell: UITableViewCell {

    static let cellIdentifier = "MoviesListTableViewCellId"
    @IBOutlet var movieNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        decorateMovieNameLabel()
    }
    
    var movieNameLabelFont = UIFont.ThemeFont.titleFont {
        didSet {
            movieNameLabel.font = movieNameLabelFont
        }
    }

    private func decorateMovieNameLabel()  {
        movieNameLabel.adjustsFontSizeToFitWidth = false
        movieNameLabel.font = movieNameLabelFont
        movieNameLabel.textColor = UIColor.ThemeColor.titleColor
    }
}
