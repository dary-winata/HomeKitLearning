//
//  HomeKitLearningApp.swift
//  HomeKitLearning
//
//  Created by dary winata nugraha djati on 26/08/23.
//

import SwiftUI

@main
struct HomeKitLearningApp: App {
//
//    @StateObject var homeStore: HomeStore = HomeStore()
    @StateObject var viewStack: ViewStack = ViewStack()
    
    var body: some Scene {
        WindowGroup {
            ContentView(model: HomeStore()).environmentObject(viewStack)
        }
    }
}
