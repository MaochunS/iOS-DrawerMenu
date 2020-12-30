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
    
    let vc1 = Test1ViewController()
    let vc2 = Test2ViewController()
    
    
    override func loadView() {
        let drawerMenuView = ViewWithDrawerMenuView()
        drawerMenuView.delegate = self
        self.view = drawerMenuView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .gray
        
       
        let _ = self.testButton
        
    }
    
    
}

extension ViewController: ViewWithDrawerMenuViewDelegate{
    func didSelectMenuItem(idx: Int) {
        print("select menu \(idx) " + MenuModel.shared.getItemTitle(idx: idx))
        
        switch idx {
        case 0:
            self.present(vc1, animated: true, completion: nil)
        case 1:
            self.present(vc2, animated: true, completion: nil)
        default:
            self.present(vc1, animated: true, completion: nil)
        }
    }
    
    
}

