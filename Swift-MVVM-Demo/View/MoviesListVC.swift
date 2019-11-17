//
//  MoviesListVC.swift
//  Swift-MVVM-Demo
//
//  Created by Parth on 17/11/19.
//  Copyright © 2019 Parth. All rights reserved.
//

import UIKit

class MoviesListVC: UIViewController {
    var viewModel = MoviesListViewModel()
    
    // MARK: - initilisers
    init(nibName:String){
        super.init(nibName: nibName, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet var tableViewMoviesList: UITableView!
    
    // MARK: - initial setup
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        loadData()
    }

    func initialSetUp(){
        //estimated row height for dynamic cell before actual height gets calculated based on constraints
        tableViewMoviesList.rowHeight = UITableView.automaticDimension
        tableViewMoviesList.estimatedRowHeight = 80
        
        //tableview cell registeration
        tableViewMoviesList.registerNib("MoviesListTableViewCell")
        tableViewMoviesList.tableFooterView = UIView()
        
        let refreshButton = UIBarButtonItem(title: "Refresh", style: .done, target: self, action: #selector(refreshTable))
        self.navigationItem.rightBarButtonItem  = refreshButton
    }
    
    
    @objc func refreshTable(){
        viewModel.moviesListCache.removeObject(forKey: CacheKeys.moviesData as NSString)
        loadData()
    }
    
    private func loadData() {
        if let _ = viewModel.moviesListCache.object(forKey: CacheKeys.moviesData as NSString) {
            DispatchQueue.main.async {
                self.handleTableViewData()
            }
        }
        else{
            showLoadingIndicator(onView: view)
            viewModel.fetchData {
                DispatchQueue.main.async {
                    //update UI
                    self.handleError()
                    self.handleNavigationTitle()
                    self.handleTableViewData()
                    self.removeLoadingIndicator()
                    self.viewModel.cacheMoviesData(self.viewModel.dataSource)
                }
            }
        }
    }
    
    private func handleError() {
        if let error = self.viewModel.RESTServiceError {
            self.presentAlert(withTitle: "Error", message: error.localizedDescription)
        }
    }
    
    private func handleNavigationTitle() {
        self.title = self.viewModel.navigationBarTitleForLandingView
    }
    
    private func handleTableViewData() {
        if let _ = self.viewModel.dataSource {
            tableViewMoviesList.reloadData()
        }
    }
}
