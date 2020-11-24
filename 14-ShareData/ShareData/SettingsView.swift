//
//  SettingsView.swift
//  Forms
//
//  Created by MacBook Retina on 23/11/20.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: SettingFactory
    
    @State private var selectedOrder = SortinOrdersType.alphabetical
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
    
    @Environment(\.presentationMode) var presentationMode
    
    var sortinOrders = [
        "Alfabeticament",
        "Los favoritos al inicio",
        "Los comprados al inicio"
    ]
    
    var body: some View {
        NavigationView {
            Form{
                Section(header: Text("Ordena los cursos".uppercased())) {
                    Picker(selection: $selectedOrder, label: Text("Orden de los cursos"), content: {
                        ForEach(SortinOrdersType.allCases, id: \.self) { ordered in
                            Text(ordered.description)
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
            .navigationBarItems(
                leading:
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "arrowtriangle.down.circle")
                            .font(.title)
                            .foregroundColor(.gray)
                    }),
                trailing:
                    Button(action: {
                        self.settings.order = self.selectedOrder
                        self.settings.showPurchasedOnly = self.showPurchasedOnly
                        self.settings.maxPrice = self.maxPrice
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    })
            )
        }.onAppear(){
            print("------------------INICIO-------------------------")
            print(self.settings.maxPrice)
            print("--------------------FIN-----------------------")
            self.selectedOrder = self.settings.order
            self.showPurchasedOnly = self.settings.showPurchasedOnly
            self.maxPrice = self.settings.maxPrice
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingFactory())
    }
}
