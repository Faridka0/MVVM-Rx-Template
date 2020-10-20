//
//  ServiceLocator.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import Foundation

class ServiceLocator {
    
    func resolve<Service>(_ service: Service.Type) -> Service {
        guard let resolution = container?.resolve(Service.self) else {
            fatalError("Can not resolve service for type \(service)")
        }
        
        return resolution
    }
    
    private(set) var container: DependanciesContainer?
    
    static let shared = ServiceLocator()
    
    private init() {}
    
    func createContainer() {
        let container = DependanciesContainer()
        container.register(IHttpClient.self, registrationBlock: HttpClient.init)
        self.container = container
    }
}

