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
    @IBOutlet var titleLabelText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        decorateMovieNameLabel()
    }
    
    var movieNameLabelFont = UIFont.ThemeFont.titleFont {
        didSet {
            titleLabelText.font = movieNameLabelFont
        }
    }

    private func decorateMovieNameLabel()  {
        titleLabelText.adjustsFontSizeToFitWidth = false
        titleLabelText.font = movieNameLabelFont
        titleLabelText.textColor = UIColor.ThemeColor.titleColor
    }
}
