//
//  HomeViewController.swift
//  MVVM Navegable
//
//  Created by Carlos on 07/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    let router = Router()
    var viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()
        setupView()
        bind()
    }
    
    private func setupView() {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        viewModel.getPostsList()
    }
    
    private func bind() {
        viewModel.refreshData = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.isHidden = true
            }
        }
    }
    
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        let object = viewModel.dataArray[indexPath.row]
        
        cell?.textLabel?.text = object.title
        cell?.detailTextLabel?.text = object.body
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postData = viewModel.dataArray[indexPath.row]
        router.goToDetailViewController(navigationController: navigationController, post: postData)
    }
    
}

