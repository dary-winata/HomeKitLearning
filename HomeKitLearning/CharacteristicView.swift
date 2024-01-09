//
//  CharacteristicView.swift
//  HomeKitLearning
//
//  Created by dary winata nugraha djati on 26/08/23.
//

import SwiftUI
import HomeKit

struct CharacteristicView: View {
    
    var homeId: UUID
    var accId: UUID
    var serviceId: UUID
    @ObservedObject var homeStore: HomeStore
    
    var body: some View {
        List {
            Section(header: HStack {
                Text("Characteristic")
            }) {
                ForEach(homeStore.characteristics, id: \.self) { char in
                    NavigationLink(value: char) {
                        Text(char.localizedDescription)
                    }.navigationDestination(for: HMCharacteristic.self) { char in
                        Text(char.metadata?.description ?? "no info")
                    }
                }
            }
        }.onAppear {
            homeStore.findCharacteristic(serviceId: serviceId, accId: accId, homeId: homeId)
        }
    }
}

struct CharacteristicView_Previews: PreviewProvider {
    static var previews: some View {
        CharacteristicView(homeId: UUID(), accId: UUID(), serviceId: UUID(), homeStore: HomeStore())
    }
}
