//
//  MenuModel.swift
//  DrawMenu
//
//  Created by maochun on 2020/12/30.
//  Copyright © 2020 maochun. All rights reserved.
//

import Foundation

class MenuItemModel{
    var title = ""
    
    init(title:String) {
        self.title = title
    }
}

class MenuModel {
    
    var items = [MenuItemModel]()
    var count = 0
    
    static let shared: MenuModel = {
        let shared = MenuModel()
        
        return shared
    }()


    private init() {
        items.append(MenuItemModel.init(title: "Menu Item 1"))
        items.append(MenuItemModel.init(title: "Menu Item 2"))
        items.append(MenuItemModel.init(title: "Menu Item 3"))
        items.append(MenuItemModel.init(title: "Menu Item 4"))
        items.append(MenuItemModel.init(title: "Menu Item 5"))
        
        count = items.count
    }
    
    func getItem(idx:Int) -> MenuItemModel{
        return items[idx]
    }
    
    func getItemTitle(idx:Int) -> String{
        return items[idx].title
    }
    
   
}
