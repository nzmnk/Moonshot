//
//  Bundle-Decodable.swift
//  
//
//  Created by Никита Зименко on 15.05.2021.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {  //Made generic with help of "T" placeholder. Needed to put conformation to Codable protocol
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        let formatter = DateFormatter() // Applied date formatting 
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        return loaded
    }
}
