//
//  Test1ViewController.swift
//  DrawMenu
//
//  Created by maochun on 2020/12/30.
//  Copyright © 2020 maochun. All rights reserved.
//

import UIKit

class Test1ViewController: UIViewController {

    lazy var theLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test1"
        label.textColor = .green
        
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Test1VC did load")
        self.view.backgroundColor = .gray
        
       
        let _ = self.theLabel
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapped))
        
        //tap.delegate = self
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func onTapped(){
        self.dismiss(animated: true, completion: nil)
    }
}
