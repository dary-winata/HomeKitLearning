//
//  ContentView.swift
//  HomeKitLearning
//
//  Created by dary winata nugraha djati on 26/08/23.
//

import SwiftUI
import HomeKit

struct ContentView: View {
    
    @ObservedObject var model: HomeStore
    @State var stackView = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackView) {
            VStack {
                List {
                    Section(header: HStack {
                        Text("My Home")
                    }) {
                        ForEach(model.homes, id: \.uniqueIdentifier) { home in
                            NavigationLink(value: home) {
                                Text("\(home.name)")
                            }.navigationDestination(for: HMHome.self) { home in
                                AccesoriesView(homeId: home.uniqueIdentifier, model: model)
                            }
                        }
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(model: HomeStore())
    }
}
