//
//  Course.swift
//  Tinder
//
//  Created by MacBook Retina on 20/12/20.
//

import Foundation

struct Course{
    var name: String
    var imag: String
}

#if DEBUG
var course: [Course] = [
    Course(name: "Curso numro 1", imag: "spiderman"),
    Course(name: "Curso numero 2", imag: "spiderman"),
    Course(name: "Curso número 3", imag: "spiderman"),
    Course(name: "Curso numro 4", imag: "spiderman"),
    Course(name: "Curso numero 5", imag: "spiderman"),
    Course(name: "Curso número 6", imag: "spiderman")
]
#endif
