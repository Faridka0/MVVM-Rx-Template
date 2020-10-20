//
//  Reactive+Extension.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import UIKit
import RxSwift
import RxCocoa

//MARK: - Codable
extension ObservableType where Element == Data {
  func map<T>(_ type: T.Type) -> Observable<T?> where T: Decodable {
    return self.map { data -> T? in
        return data.decoded(type)
    }
  }
}

//MARK: - View Controller
extension Reactive where Base: UIViewController {
    var viewDidAppear: ControlEvent<Void> {
        let source = self.methodInvoked(#selector(Base.viewDidAppear)).map { _ in }
        return ControlEvent(events: source)
    }
}
