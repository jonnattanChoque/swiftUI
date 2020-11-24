//
//  ContentView.swift
//  ShareData
//
//  Created by MacBook Retina on 23/11/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: SettingFactory
    
    @State var cursos = [
        Curso(name: "Amagen 1", image: "spiderman", type: "Uno", priceLevel: 2, featured: true, purchased: false),
        Curso(name: "Emagen 2", image: "spiderman", type: "Uno", priceLevel: 1, featured: false, purchased: true),
        Curso(name: "Imagen 3", image: "spiderman", type: "Uno", priceLevel: 3, featured: true, purchased: false),
        Curso(name: "Omagen 4", image: "spiderman", type: "Uno", priceLevel: 4, featured: true, purchased: false),
        Curso(name: "Umagen 5", image: "spiderman", type: "Uno", priceLevel: 5, featured: false, purchased: true),
        Curso(name: "Bmagen 6", image: "spiderman", type: "Uno", priceLevel: 4, featured: true, purchased: false),
        Curso(name: "Zmagen 7", image: "spiderman", type: "Uno", priceLevel: 2, featured: true, purchased: false)
    ]
    @State var selectedCurse: Curso?
    @State private var showActionSheet = false
    @State private var showSettingsView = false
    
    init() {
        let apariencia = UINavigationBarAppearance()
        apariencia.largeTitleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 32)!,
            .foregroundColor: UIColor.systemGreen
        ]
        apariencia.titleTextAttributes = [
            .font: UIFont(name: "Times New Roman", size: 18)!,
            .foregroundColor: UIColor.systemGreen
        ]
        apariencia.setBackIndicatorImage(UIImage(systemName: "arrow.left.circle.fill"), transitionMaskImage: UIImage(systemName: "arrow.left.circle"))
        
        UINavigationBar.appearance().tintColor = .red
        UINavigationBar.appearance().standardAppearance = apariencia
        UINavigationBar.appearance().compactAppearance = apariencia
        UINavigationBar.appearance().scrollEdgeAppearance = apariencia
    }
    
    var body: some View {
        NavigationView {
            List{
                ForEach(cursos.filter(shouldShowCourse).sorted(by: self.settings.order.predicateShort())){ curso in
                    ZStack {
                        NavigationLink(destination: DetailView(curso: curso)) {
                            Celda(curso: curso).contextMenu{
                                Button(action: {
                                    self.setPurchased(item: curso)
                                }, label: {
                                    HStack{
                                        Text("Comprar")
                                        Image(systemName: "checkmark.circle.fill")
                                    }
                                })
                                
                                Button(action: {
                                    self.setFeatured(item: curso)
                                }, label: {
                                    HStack{
                                        Text("Destacar")
                                        Image(systemName: "star")
                                    }
                                })
                                
                                Button(action: {
                                    self.setPurchased(item: curso)
                                }, label: {
                                    HStack{
                                        Text("Eliminar")
                                        Image(systemName: "trash")
                                    }
                                })
                            }
                        }.onTapGesture {
                            self.showActionSheet.toggle()
                            self.selectedCurse = curso
                        }
                        .actionSheet(isPresented: self.$showActionSheet, content: {
                            ActionSheet(title: Text("indica tu acción"), message:nil, buttons: [
                                .default(Text("Marcar como favorito"), action: {
                                    if let curso = self.selectedCurse{
                                        self.setFeatured(item: curso)
                                    }
                                }),
                                .default(Text("Comprar"), action: {
                                    if let curso = self.selectedCurse{
                                        self.setPurchased(item: curso)
                                    }
                                }),
                                .destructive(Text("Eliminar curso"), action: {
                                    if let curso = self.selectedCurse{
                                        self.delete(item: curso)
                                    }
                                }),
                                .cancel()
                            ])
                        })
                    }
                }.onDelete(perform: { indexSet in
                    self.cursos.remove(atOffsets: indexSet)
                })
            }.navigationBarTitle("Mi listado con texto muy grande", displayMode: .automatic)//.inline .large
            .navigationBarItems(trailing:
                Button(action: {
                    self.showSettingsView = true
                }, label: {
                    Image(systemName: "line.horizontal.3.decrease.circle").font(.title).foregroundColor(.gray)
                })
            ).sheet(isPresented: $showSettingsView, content: {
                SettingsView().environmentObject(SettingFactory())
            })
        }
    }
    
    private func setFeatured(item curse: Curso){
        if let idx = self.cursos.firstIndex(where: {$0.id == curse.id}){
            self.cursos[idx].featured.toggle()
        }
    }
    
    private func setPurchased(item curse: Curso){
        if let idx = self.cursos.firstIndex(where: {$0.id == curse.id}){
            self.cursos[idx].purchased.toggle()
        }
    }
    
    private func delete(item curse: Curso){
        if let idx = self.cursos.firstIndex(where: {$0.id == curse.id}){
            self.cursos.remove(at: idx)
        }
    }
    
    private func shouldShowCourse(course: Curso) -> Bool{
        let checkPurchased = (self.settings.showPurchasedOnly && course.purchased) || !self.settings.showPurchasedOnly
        let checkPrice = (course.priceLevel <= self.settings.maxPrice)
        
        return true //checkPurchased && checkPrice
    }
}

struct ListaImagenes_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SettingFactory())
    }
}

struct Celda: View {
    var curso : Curso
    var body: some View {
        HStack {
            Image(curso.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50, alignment: .center)
                .clipShape(Circle())
                .padding(.trailing, 10)
            VStack(alignment: .leading){
                HStack{
                    Text(curso.name).font(.system(.body, design: .rounded)).bold()
                    Text(String(repeating: "$", count: curso.priceLevel)).font(.subheadline).foregroundColor(.gray)
                }
                Text(curso.type).font(.system(.subheadline, design: .rounded)).bold().foregroundColor(.secondary)
            }
            Spacer().layoutPriority(-10)
            
            if curso.featured {
                Image(systemName: "star.fill").foregroundColor(.yellow)
            }
            if curso.featured {
                Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
            }
        }
    }
}

