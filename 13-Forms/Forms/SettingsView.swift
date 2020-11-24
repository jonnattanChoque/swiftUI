//
//  SettingsView.swift
//  Forms
//
//  Created by MacBook Retina on 23/11/20.
//

import SwiftUI

struct SettingsView: View {
    @State private var selectedOrder = 0
    @State private var showPurchasedOnly = false
    @State private var maxPrice = 5 {
        didSet{
            if maxPrice > 5 {
                maxPrice = 5
            }
            
            if maxPrice < 1{
                maxPrice = 1
            }
        }
    }
    
    private var sortinOrders = [
        "Alfabeticament",
        "Los favoritos al inicio",
        "Los comprados al inicio"
    ]
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Ordena los cursos".uppercased())) {
                    Picker(selection: $selectedOrder, label: Text("Orden de los cursos"), content: {
                        ForEach(0..<sortinOrders.count, id: \.self){
                            Text(self.sortinOrders[$0])
                        }
                    })
                }
                Section(header: Text("Filtrar los cursos".uppercased())) {
                    Toggle(isOn: $showPurchasedOnly, label: {
                        Text("Mostrar solo los cursos comprados")
                    })
                    
                    Stepper(
                        onIncrement: { self.maxPrice  += 1 },
                        onDecrement: { self.maxPrice -= 1 },
                        label: {
                            Text("Mostrar \(String(repeating: "$", count: maxPrice)) o menos")
                        })
                }
            }.navigationBarTitle(Text("Configuración"))
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
