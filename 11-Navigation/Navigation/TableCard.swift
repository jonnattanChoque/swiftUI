//
//  TableCard.swift
//  Navigation
//
//  Created by MacBook Retina on 13/11/20.
//  Copyright © 2020 com.valid. All rights reserved.
//

import SwiftUI

struct TableCard: View {
    var cards = [
        Card(imageNam: "spiderman", author: "Jonnattan Choque", title: "Curso 1 de programación", price: "$11.99", oldPrice: "$111.99"),
        Card(imageNam: "spiderman", author: "Jonnattan Choque", title: "Diseño 2 de programación", price: "$11.99", oldPrice: "$111.99"),
        Card(imageNam: "spiderman", author: "Jonnattan Choque", title: "Curso 3 de programación", price: "$11.99", oldPrice: "$111.99"),
        Card(imageNam: "spiderman", author: "Jonnattan Choque", title: "Diseño 4 de programación", price: "$11.99", oldPrice: "$111.99")
    ]
    
    init() {
        let apariencia = UINavigationBarAppearance()
        apariencia.largeTitleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 32)!,
            .foregroundColor: UIColor.systemGray4
        ]
        apariencia.titleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 18)!,
            .foregroundColor: UIColor.systemGray4
        ]
        apariencia.setBackIndicatorImage(UIImage(systemName: "arrow.left.circle.fill"), transitionMaskImage: UIImage(systemName: "arrow.left.circle"))
        
        UINavigationBar.appearance().tintColor = .black
        UINavigationBar.appearance().standardAppearance = apariencia
        UINavigationBar.appearance().compactAppearance = apariencia
        UINavigationBar.appearance().scrollEdgeAppearance = apariencia
    }
    var body: some View {
        NavigationView {
            List(cards.indices){ idx in
                NavigationLink(destination: DetailCard(card: self.cards[idx])) {
                    self.cards[idx]
                }
            }
            .navigationBarTitle("Mis tarjetas", displayMode: .automatic)//.inline .large
        }
    }
}

struct TableCard_Previews: PreviewProvider {
    static var previews: some View {
        TableCard()
    }
}
