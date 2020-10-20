//
//  LazyInjected.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import Foundation

@propertyWrapper
struct LazyInjected<Service> {

    private(set) lazy var service = ServiceLocator.shared.resolve(Service.self)

    var wrappedValue: Service {
        mutating get { return service }
        mutating set { service = newValue }
    }
}
