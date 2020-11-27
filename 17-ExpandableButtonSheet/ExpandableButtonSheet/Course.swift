//
//  Course.swift
//  ExpandableButtonSheet
//
//  Created by MacBook Retina on 26/11/20.
//

import Foundation

struct Course: Identifiable {
    var id: UUID = UUID()
    var name: String
    var description: String
    var image: String
    var type: String
    var priceLevel: Int
    var visited: Bool
    
    init(name: String, description: String, image: String, type: String, price: Int) {
        self.name = name
        self.description = description
        self.image = image
        self.type = type
        self.priceLevel = price
        self.visited = false
    }
    
    init() {
        self.init(name: "", description: "", image: "", type: "", price: 0)
    }
}

#if DEBUG
var courses: [Course] = [
    Course(name: "Curso numero 1", description: "Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas, las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.", image: "spiderman", type: "UNO", price: 3),
    Course(name: "Curso numero 2", description: "", image: "spiderman", type: "DOS", price: 4),
    Course(name: "Curso numero 3", description: "", image: "spiderman", type: "DOS", price: 1),
    Course(name: "Curso numero 4", description: "", image: "spiderman", type: "UNO", price: 2),
    Course(name: "Curso numero 5", description: "", image: "spiderman", type: "DOS", price: 5),
    Course(name: "Curso numero 6", description: "", image: "spiderman", type: "UNO", price: 3)
]
#endif
