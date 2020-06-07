//
//  DetailViewController.swift
//  MVVM Navegable
//
//  Created by Carlos on 07/06/2020.
//  Copyright © 2020 TestCompany. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var postData : Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        configureView()
    }
    
    func setupUI() {
        titleLabel.sizeToFit()
        detailLabel.sizeToFit()
    }
    
    func configureView() {
        if let title = postData?.title,
            let body = postData?.body {
            titleLabel.text = title
            detailLabel.text = "\(body)\n\(body)\n\(body)\n\(body)\n\(body)\n\(body)\n\(body)\n\(body)\n\(body)\n\(body)"
        }
    }

}
