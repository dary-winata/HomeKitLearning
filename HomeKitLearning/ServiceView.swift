//
//  ServiceView.swift
//  HomeKitLearning
//
//  Created by dary winata nugraha djati on 26/08/23.
//

import SwiftUI
import HomeKit

struct ServiceView: View {
    
    var accId: UUID
    var homeId: UUID
    @ObservedObject var model : HomeStore
    
    var body: some View {
        List {
            Section(header: HStack {
                Text("Services")
            }) {
                ForEach(model.services, id:\.self) { service in
                    NavigationLink(value: service) {
                        Text(service.name)
                    }.navigationDestination(for: HMService.self) { service in
                        CharacteristicView(homeId: homeId, accId: accId, serviceId: service.uniqueIdentifier, homeStore: model)
                    }
                }
            }
        }.onAppear {
            model.findServices(accId: accId, homeId: homeId)
        }
    }
}

struct ServiceView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceView(accId: UUID(), homeId: UUID(), model: HomeStore())
    }
}
