//
//  SettingFactory.swift
//  ShareData
//
//  Created by MacBook Retina on 23/11/20.
//

import Foundation

final class SettingFactory: ObservableObject {
    @Published var defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            "app.view.settings.order" : 0,
            "app.view.settings.showPurchasedOnly" : false,
            "app.view.settings.maxPrice" : 5
        ])
    }
    
    var order: SortinOrdersType{
        get{
            SortinOrdersType(type: defaults.integer(forKey: "app.view.settings.order"))
        }
        set{
            defaults.setValue(newValue.rawValue, forKey: "app.view.settings.order")
        }
    }
    var showPurchasedOnly: Bool{
        get{
            defaults.bool(forKey: "app.view.settings.showPurchasedOnly")
        }
        set{
            defaults.setValue(newValue, forKey: "app.view.settings.showPurchasedOnly")
        }
    }
    var maxPrice: Int{
        get{
            defaults.integer(forKey: "app.view.settings.maxPrice")
        }
        set{
            defaults.setValue(newValue, forKey: "app.view.settings.maxPrice")
        }
    }
}
