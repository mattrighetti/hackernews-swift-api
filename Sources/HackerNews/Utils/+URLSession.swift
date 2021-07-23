//
//  File.swift
//  
//
//  Created by Mattia Righetti on 23/07/21.
//

import Foundation

extension URLSession {
    public static func request<T: Decodable>(urlString: String, type: T.Type, decoder: JSONDecoder = JSONDecoder(), completionHandler: @escaping ((T) -> Void)) {
        guard let url = URL(string: urlString) else { return }
        self.shared.dataTask(with: url) { data, _, _ in
            guard data != nil else { return }
            do {
                let object = try decoder.decode(T.self, from: data!)
                completionHandler(object)
            } catch {
                print("error retrieving data: \(error)")
            }
        }.resume()
    }
}
