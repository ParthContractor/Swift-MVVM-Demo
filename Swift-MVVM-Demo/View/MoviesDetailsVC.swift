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
    @IBOutlet var tableViewMovieCharacters: UITableView!
    
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
        initialSetUp()
        moviewDetailsDataSetup()
        cachedMovieCharactersSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard MovieDetailsViewModel.moviesCharactersCache.object(forKey: (self.viewModel.dataSource?.title ?? "N/A") as NSString) != nil else
        {
            loadCharactersData()
            return
        }
    }
    
    func initialSetUp(){
        //estimated row height for dynamic cell before actual height gets calculated based on constraints
        tableViewMovieCharacters.rowHeight = UITableView.automaticDimension
        tableViewMovieCharacters.estimatedRowHeight = 80
        
        //tableview cell registeration
        tableViewMovieCharacters.registerNib("MoviesListTableViewCell")
        tableViewMovieCharacters.tableFooterView = UIView()
    }
    
    private func moviewDetailsDataSetup() {
        title = self.viewModel.navigationBarTitleForLandingView
        
        lblDirectorName.text = "Director: " + (viewModel.dataSource?.director ?? "N/A")
        lblProducerName.text = "Producer: " + (viewModel.dataSource?.producer ?? "N/A")
        lblReleaseDateName.text = "Release Date: " + (viewModel.dataSource?.release_date ?? "N/A")
        
    }
    
    private func cachedMovieCharactersSetup() {
        if let cachedCharactersForKey = MovieDetailsViewModel.moviesCharactersCache.object(forKey: (self.viewModel.dataSource?.title ?? "N/A") as NSString) {
            self.viewModel.listOfCharacters = cachedCharactersForKey.data
            DispatchQueue.main.async {
                self.tableViewMovieCharacters.reloadData()
            }
        }
    }
    
    private func loadCharactersData() {
        if let charactersArray = viewModel.dataSource?.characters {
            showLoadingIndicator(onView: view)
            let loadCharactersGroup = DispatchGroup()
            for i in 0 ..< charactersArray.count {
                viewModel.urlString = charactersArray[i]
                
                loadCharactersGroup.enter()
                
                viewModel.fetchCharactersData {
                    loadCharactersGroup.leave()
                }
            }
            
            loadCharactersGroup.notify(queue: .main) {
                DispatchQueue.main.async {
                    self.tableViewMovieCharacters.reloadData()
                    self.removeLoadingIndicator()
                    self.viewModel.cacheMoviesCharactersData(self.viewModel.listOfCharacters, keyMovieName: self.viewModel.dataSource?.title ?? "N/A")
                }
            }
        }
    }
}
