//
//  ViewController.swift
//  MVVM Básico
//
//  Created by Carlos on 07/05/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModelList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bind()
    }
    
    private func setupView() {
        activity.isHidden = false
        activity.startAnimating()
        viewModel.retrieveDataList()
    }

    private func bind() {
        viewModel.refreshData = { [weak self] () in
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activity.stopAnimating()
                self?.activity.isHidden = true
            }
        }
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
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
        tableView.deselectRow(at: indexPath, animated: true)
        alert()
    }
    
    func alert() {
        let alert = UIAlertController(title: "Info", message: "Change target to MVVM Navegable and run again", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}

