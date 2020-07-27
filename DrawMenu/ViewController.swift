//
//  ViewController.swift
//  DrawMenu
//
//  Created by maochun on 2020/7/27.
//  Copyright © 2020 maochun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var drawerMenu : DrawerMenuView = {
        let theView = DrawerMenuView()
        theView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(theView)
            
        
        NSLayoutConstraint.activate([
           
            theView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            theView.leftAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            theView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
            //theView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0),
            theView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 2/3)
           
        ])
        
        return theView
        
    }()
    
    lazy var menuButton: UIButton = {
       
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("menu", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(onMenuAction), for: .touchUpInside)
        
        self.view.addSubview(btn)

        NSLayoutConstraint.activate([
           
            btn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            btn.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
            btn.widthAnchor.constraint(equalToConstant: 100)
           
        ])

        return btn
    }()
    
    var menuShow = false
    var type = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let _ = drawerMenu
        let _ = menuButton
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapped))
        self.view.addGestureRecognizer(tap)
    }

    @objc func onMenuAction(){
        switch self.type {
        case 0:
            if menuShow{
                //self.view.frame.origin.x += 140
                var frame = self.drawerMenu.frame
                frame.origin.x += frame.width
                UIView.animate(withDuration: 0.5) {
                    self.drawerMenu.frame = frame
                }
                menuShow = false
            }else{
                //self.view.frame.origin.x -= 140
                var frame = self.drawerMenu.frame
                frame.origin.x -= frame.width
                UIView.animate(withDuration: 0.5) {
                    self.drawerMenu.frame = frame
                }
                menuShow = true
            }
            break
            
        case 1:
            if menuShow{
                //self.view.frame.origin.x += 140
                var frame = self.view.frame
                frame.origin.x += self.drawerMenu.frame.width
                UIView.animate(withDuration: 0.5) {
                    self.view.frame = frame
                }
                menuShow = false
            }else{
                //self.view.frame.origin.x -= 140
                var frame = self.view.frame
                frame.origin.x -= self.drawerMenu.frame.width
                UIView.animate(withDuration: 0.5) {
                    self.view.frame = frame
                }
                menuShow = true
            }
            break
            
        default:
            break
        }
        
    }
    
    @objc func onTapped(){
        onMenuAction()
    }
}

