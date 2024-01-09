//
//  AccesoriesView.swift
//  HomeKitLearning
//
//  Created by dary winata nugraha djati on 26/08/23.
//

import SwiftUI
import HomeKit

struct AccesoriesView: View {
    
    var homeId : UUID
    @ObservedObject var model : HomeStore
    
    var body: some View {
        List {
            Section(header: HStack {
                Text("My Accesories")
            }) {
                ForEach(model.accesories, id: \.self) { accesory in
                    NavigationLink(value: accesory) {
                        Text(accesory.name)
                    }.navigationDestination(for: HMAccessory.self) { accesory in
                        ServiceView(accId: accesory.uniqueIdentifier, homeId: homeId, model: model)
                    }
                }
            }
        }.onAppear {
            model.findAccesories(homeId: homeId)
        }
    }
}

struct AccesoriesView_Previews: PreviewProvider {
    static var previews: some View {
        AccesoriesView(homeId: UUID(), model: HomeStore())
    }
}
