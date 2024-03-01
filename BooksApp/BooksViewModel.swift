//
//  BooksViewModel.swift
//  BooksApp
//
//  Created by Sonun on 22/2/24.
//

import Foundation
import Alamofire

class BooksViewModel: ObservableObject {
    
    @Published var bookResults: [Item] = []
    
    func getBooks(searchText: String) {
        NetworkManager().fetchData(searchText) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.bookResults = data.items
                }
                
            case .failure(let error):
                print("Ошибка при получении данных \(error)")
            }
        }
    }
    
    func ensureNoSpacesInUrl(_ urlString: String?) -> String {
        guard let urlString = urlString?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return "" // URL-адрес изображения-заглушки, если URL изначально недоступен
        }

        return urlString
    }
}
