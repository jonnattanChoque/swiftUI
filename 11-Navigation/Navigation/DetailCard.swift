//
//  DetailCard.swift
//  Navigation
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct DetailCard: View {
    var card : Card
    var body: some View {
        VStack {
            Image(card.imageNam)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 300)
                .cornerRadius(50)
                .clipped()
            Text(card.author)
                .font(.system(size: 30, weight: .black, design: .rounded))
            Text(card.price)
                .font(.system(.headline, design: .rounded))
            
            Spacer()
        }
    }
}

struct DetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCard(card: Card(imageNam: "spiderman", author: "Jonnatan", title: "My title", price: "$126789", oldPrice: "$289391"))
    }
}
