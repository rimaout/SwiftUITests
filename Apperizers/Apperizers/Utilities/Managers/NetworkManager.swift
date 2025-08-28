//
//  NetworkManager.swift
//  Apperizers
//
//  Created by Matteo on 19/08/25.
//

import UIKit

final class NetworkManager {

    static let shared = NetworkManager()
    private let imgCache = NSCache<NSString, UIImage>()

    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init() {}
    
    func getAppetizers() async throws -> [Appetizer] {
        
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            let decodedResponde = try decoder.decode(AppetizerResponse.self, from: data)
            return decodedResponde.request
        } catch {
            throw APError.invalidData
        }
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        // if the operation fails no error are returned, because we a placeholder image will be displayed
        
        let cacheKey = NSString(string: urlString)
        
        if let image = imgCache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, response, error in
                
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.imgCache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
