//
//  ViewWithDrawMenuView.swift
//  DrawMenu
//
//  Created by maochun on 2020/12/30.
//  Copyright © 2020 maochun. All rights reserved.
//

import UIKit

class ViewWithDrawerMenuView: UIView {
    
    
    lazy var drawerMenu : DrawerMenuView = {
        let theView = DrawerMenuView()
        theView.translatesAutoresizingMaskIntoConstraints = false
        
        theView.onSelectMenuItemBlock = {() -> Void in
            self.onMenuAction()
        }
        
        self.addSubview(theView)
            
        
        if self.type == 1{
        
            NSLayoutConstraint.activate([
               
                theView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
                theView.leftAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
                theView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                //theView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0),
                theView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 2/3)
               
            ])
            
        }else{
            
            NSLayoutConstraint.activate([
               
                theView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
                theView.rightAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
                theView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
                //theView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0),
                theView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 2/3)
               
            ])
        }
        
        
        return theView
        
    }()
    
    lazy var menuButton: UIButton = {
       
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("menu", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(onMenuAction), for: .touchUpInside)
        
        self.addSubview(btn)

        if self.type == 1{
            NSLayoutConstraint.activate([
               
                btn.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
                btn.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
                btn.widthAnchor.constraint(equalToConstant: 100)
               
            ])
        }else{
            NSLayoutConstraint.activate([
               
                btn.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
                btn.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
                btn.widthAnchor.constraint(equalToConstant: 100)
               
            ])
        }

        return btn
    }()
    
    var menuShow = false
    var type = 0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let _ = drawerMenu
        let _ = menuButton
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTapped))
        
        tap.delegate = self
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        //print("hitTest")
        
        
        let subPoint = self.drawerMenu.convert(point, from: self)
        if let result = self.drawerMenu.hitTest(subPoint, with: event) {
            return result
        }

        
        return super.hitTest(point, with: event)
    }
    
    @objc func onMenuAction(){
        switch self.type {
        case 0:
            if menuShow{
                //self.view.frame.origin.x += 140
                var frame = self.frame
                frame.origin.x -= self.drawerMenu.frame.width
                UIView.animate(withDuration: 0.3) {
                    self.frame = frame
                }
                menuShow = false
            }else{
                //self.view.frame.origin.x -= 140
                var frame = self.frame
                frame.origin.x += self.drawerMenu.frame.width
                UIView.animate(withDuration: 0.3) {
                    self.frame = frame
                }
                menuShow = true
            }
            break
            
        case 1:
            if menuShow{
                //self.view.frame.origin.x += 140
                var frame = self.frame
                frame.origin.x += self.drawerMenu.frame.width
                UIView.animate(withDuration: 0.3) {
                    self.frame = frame
                }
                menuShow = false
            }else{
                //self.view.frame.origin.x -= 140
                var frame = self.frame
                frame.origin.x -= self.drawerMenu.frame.width
                UIView.animate(withDuration: 0.3) {
                    self.frame = frame
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


extension ViewWithDrawerMenuView: UIGestureRecognizerDelegate {

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        var view = touch.view
        while view != nil {
            if view is UICollectionView || view is UITableView || view is DrawerMenuView || !menuShow{
                return false
            } else {
                view = view!.superview
            }
        }
        return true
    }
}
