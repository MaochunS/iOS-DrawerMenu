//
//  DrawMenuView.swift
//  DrawMenu
//
//  Created by maochun on 2020/7/27.
//  Copyright © 2020 maochun. All rights reserved.
//

import UIKit

class DrawerMenuView: UIView {
    
    lazy var titleView: UIView = {
        let theview = UIView()
        theview.translatesAutoresizingMaskIntoConstraints = false
        theview.backgroundColor = .black
        
        
        self.addSubview(theview)
        
        NSLayoutConstraint.activate([
            
            theview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            theview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            theview.topAnchor.constraint(equalTo: self.topAnchor, constant:0),
            theview.heightAnchor.constraint(equalToConstant: 150)
            
        ])
        
        return theview
    }()
    
    lazy var listTableView: UITableView = {
        
        let tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        //tableView.borderWidth = 1.0
        tableView.backgroundColor = .white
        tableView.tableHeaderView = nil
        //tableView.contentInset = UIEdgeInsets(top: -30, left: 0, bottom: 0, right: 0);
        tableView.separatorStyle = .none
        tableView.allowsSelection = true
        //tableView.isEditing = true
        
        //tableView.allowsMultipleSelection = true
        //tableView.roundCorners(.allCorners, radius: 2.0)
        //tableView.layer.borderColor = UIColor(red: 0.22, green: 0.8, blue: 0.85, alpha: 1).cgColor
        //tableView.layer.borderWidth = 1
        //tableView.layer.masksToBounds = true
        //tableView.round(corners: [.bottomLeft, .bottomRight], radius: 5)
        //tableView.isHidden = true
        
        self.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: self.titleView.bottomAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"DrawerMenuTableViewCell")
        
        
        return tableView
    }()
    
    var menu = MenuModel.shared
    
    var selectedCellColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
    var selectedIdx : IndexPath?
    
    var onSelectMenuItemBlock : ((Int) -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let _ = self.titleView
        let _ = self.listTableView
        
    }
    
}


extension DrawerMenuView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return self.menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell
        cell = tableView.dequeueReusableCell(withIdentifier:"DrawerMenuTableViewCell", for:indexPath)
        
        cell.textLabel?.text = self.menu.getItemTitle(idx: indexPath.row)
        cell.textLabel?.textColor = .gray
        cell.backgroundColor = .white

        
        if indexPath == selectedIdx{
           
            cell.accessoryType = .checkmark
            cell.accessoryView = UIImageView(image: UIImage(named: "list_icon_check"))
        }else{
         
            cell.accessoryType = .none
            //cell.accessoryView = nil
        }
        
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Add a visual cue to indicate that the cell was selected.
        //self.inputField.text = items[indexPath.row]
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        tableView.cellForRow(at: indexPath)?.accessoryView = UIImageView(image: UIImage(named: "list_icon_check"))
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.cellForRow(at: indexPath)?.backgroundColor = self.selectedCellColor
        
        //self.listTableView.removeFromSuperview()
        //self.dropdownListShow = false
     
        self.selectedIdx = indexPath
        
        self.onSelectMenuItemBlock?(indexPath.row)
    
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        
        
        if let idx = self.selectedIdx{
        
            tableView.cellForRow(at: idx)?.accessoryType = .none
            tableView.cellForRow(at: idx)?.accessoryView = nil
            tableView.cellForRow(at: idx)?.backgroundColor = .none
        }
        
        return indexPath
    }
}
