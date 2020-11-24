//
//  ShareDataApp.swift
//  ShareData
//
//  Created by MacBook Retina on 23/11/20.
//

import SwiftUI

@main
struct ShareDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(SettingFactory())
        }
    }
}
