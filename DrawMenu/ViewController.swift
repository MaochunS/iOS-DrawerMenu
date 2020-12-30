//
//  ViewController.swift
//  DrawMenu
//
//  Created by maochun on 2020/7/27.
//  Copyright © 2020 maochun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var testButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Test Button", for: .normal)
        btn.setTitleColor(.blue, for: .normal)
        
        self.view.addSubview(btn)
        
        NSLayoutConstraint.activate([
            btn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            btn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        return btn
        
    }()
    
    
    override func loadView() {
        self.view = ViewWithDrawerMenuView()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .gray
        
        let _ = self.testButton
        
    }
    
    
    
    
    
}


