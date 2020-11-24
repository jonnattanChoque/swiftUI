//
//  Curso.swift
//  Forms
//
//  Created by MacBook Retina on 19/11/20.
//

import Foundation

struct Curso: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var type: String
    var priceLevel: Int
    var featured: Bool
    var purchased: Bool
}
