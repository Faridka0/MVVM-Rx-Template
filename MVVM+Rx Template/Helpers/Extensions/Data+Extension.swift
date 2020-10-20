//
//  Data+Extension.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import Foundation

extension Data {
    func decoded<T: Decodable>(_ type: T.Type) -> T? {
        let json = JSONDecoder()
        do {
            let jsonData = try json.decode(type.self, from: self)
            return jsonData
        } catch {
            print("Error to encode model \(T.self) (weight: \(self) to data: " + error.localizedDescription)
            return nil
        }
    }
}
