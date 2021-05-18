//
//  Mission.swift
//  Moonshot
//
//  Created by Никита Зименко on 18.05.2021.
//

import Foundation

struct Mission: Identifiable, Codable {
    
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
}
