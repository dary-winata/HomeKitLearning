//
//  HomeKit.swift
//  HomeKitLearning
//
//  Created by dary winata nugraha djati on 26/08/23.
//

import HomeKit

class HomeStore: NSObject, ObservableObject, HMHomeManagerDelegate {
    @Published var homes : [HMHome] = []
    @Published var accesories: [HMAccessory] = []
    @Published var services : [HMService] = []
    @Published var characteristics: [HMCharacteristic] = []
    private var manager : HMHomeManager?
    
    override init() {
        super.init()
        load()
    }
    
    func load() {
        if manager == nil {
            manager = .init()
            manager?.delegate = self
        }
    }
    
    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        print("Debug: Update homes!")
        self.homes = self.manager?.homes ?? []
    }
    
    func findAccesories(homeId: UUID) {
        guard let device = homes.first(where: {$0.uniqueIdentifier == homeId})?.accessories else {
            print("Error: accesories not found")
            return
        }
        
        accesories = device
    }
    
    func findServices(accId: UUID, homeId: UUID) {
        guard let service = homes.first(where: {$0.uniqueIdentifier == homeId})?.accessories.first(where: {$0.uniqueIdentifier == accId})?.services else {
            print("Error: Service not found")
            return
        }
        
        services = service
    }
    
    func findCharacteristic(serviceId: UUID, accId: UUID, homeId: UUID) {
        guard let characteristic = homes.first(where: { home in
            home.uniqueIdentifier == homeId
        })?.accessories.first(where: { acc in
            acc.uniqueIdentifier == accId
        })?.services.first(where: { service in
            service.uniqueIdentifier == serviceId
        })?.characteristics else {
            print("Error: No Characteristic")
            return
        }
        
        characteristics = characteristic
    }
}
