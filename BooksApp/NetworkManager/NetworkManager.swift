//
//  NetworkManager.swift
//  BooksApp
//
//  Created by Sonun on 23/2/24.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    static let networkManager = NetworkManager()

    func fetchData (_ query: String,  completion: @escaping (Result<Books, Error>) -> Void) {
        
        let parameters: [String: Any] = ["q": query]
        
        AF.request(Constants.baseURL, parameters: parameters).responseDecodable(of: Books.self) { response in
            let json = JSON(response.data ?? .init())
                        print("DATA\(json)")
            switch response.result {
            case .success(let value):
                print("Данные получены успешно: \(value)")
                completion(.success(value))
            case .failure(let error):
                print("Ошибка при получении данных: \(error)")
                completion(.failure(error))
            }
        }
    }
}
