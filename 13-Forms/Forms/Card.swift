//
//  Card.swift
//  Navigation
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI


struct Card: View {
    var id = UUID()
    var imageNam: String
    var author: String
    var title: String
    var price: String
    var oldPrice: String
    
    var body: some View {
        VStack {
            Image("spiderman")
                .resizable().aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text(author)
                        .font(.headline).foregroundColor(.secondary)
                    Text(title.uppercased())
                        .font(.title).fontWeight(.bold).foregroundColor(.primary).lineLimit(2)
                    HStack {
                        Text(price)
                            .font(.headline).font(.caption).foregroundColor(.primary)
                        Text(oldPrice)
                            .font(.headline).font(.caption).foregroundColor(.secondary).strikethrough()
                    }
                }
                Spacer()
            }.padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
            .stroke(Color(red: 130/255, green: 130/255, blue: 0.2, opacity: 1), lineWidth: 1)
        )
            .padding([.top, .horizontal])
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(imageNam: "spiderman", author: "Jonnattan Choque", title: "Curso 1 de programación", price: "$11.99", oldPrice: "$111.99")
    }
}
