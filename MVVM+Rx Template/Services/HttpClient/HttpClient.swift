//
//  HttpClient.swift
//  MVVM+Rx Template
//
//  Created by Фарид Гулиев on 20.10.2020.
//

import Foundation
import RxSwift
import RxCocoa

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
}

protocol IHttpClient: class {
    func request<T: Codable>(method: HTTPMethod,
                             type: T.Type,
                             url: URL,
                             parameters: [String: Any]?,
                             withAuth: Bool) -> Observable<T?>
}

extension IHttpClient {
    func request<T: Codable>(method: HTTPMethod = .post,
                             type: T.Type,
                             url: URL,
                             parameters: [String: Any]? = nil,
                             withAuth: Bool = true) -> Observable<T?> {
        return request(method: method, type: type, url: url, parameters: parameters, withAuth: withAuth)
    }
}

class HttpClient: IHttpClient {
    
    private let bag = DisposeBag()
    
    func request<T: Codable>(method: HTTPMethod,
                             type: T.Type,
                             url: URL,
                             parameters: [String: Any]?) -> Observable<T?> {
        
        let result: BehaviorRelay<T?> = BehaviorRelay(value: nil)
        
        var request = requestBuilder(method: method, url: url)
            // Fill params
            if let params = parameters {
                let data = try? JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
                request.httpBody = data
            }
            
            URLSession.shared.rx.response(request: request)
                .debug()
                .map({ $0.data })
                .map(T.self)
                .bind(to: result)
                .disposed(by: bag)
        
        return result.asObservable().skip(1)
    }
    
    
    //MARK: - Helpers
    private func requestBuilder(method: HTTPMethod, url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        // Fill headers
        request.allHTTPHeaderFields = ["Content-Type": "application/json", "Accept": "application/json"]
        request.httpMethod = method.rawValue
        return request
    }
}

