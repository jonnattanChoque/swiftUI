//
//  ContentView.swift
//  Tinder
//
//  Created by MacBook Retina on 20/12/20.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var dragState = DragState.none
    @State private var removalTransition = AnyTransition.leadingBottomAtRemoval
    @State private var lastCardIdx = -1
    @State var deck : [CardView] = {
        var cards = [CardView]()
        
        for idx in 0..<2 {
            cards.append(CardView(courses: course[idx]))
        }
        
        return cards
    }()
    
    private let threshold : CGFloat = 100
    
    
    var body: some View {
        ZStack{
            ForEach(deck){ card in
                card
                    .zIndex(self.isTopView(card: card) ? 1 : 0)
                    .overlay(
                        ZStack{
                            Image(systemName: "xmark").foregroundColor(Color.red).font(.system(size: 120)).opacity(self.dragState.translaion.width < -self.threshold && self.isTopView(card: card) ? 1 : 0)
                            Image(systemName: "heart").foregroundColor(Color.green).font(.system(size: 120)).opacity(self.dragState.translaion.width > self.threshold && self.isTopView(card: card) ? 1 : 0)
                        }
                    )
                    .offset(x: self.isTopView(card: card) ? self.dragState.translaion.width : 0, y: self.isTopView(card: card) ? self.dragState.translaion.height: 0)
                    .scaleEffect(self.dragState.isDragging && self.isTopView(card: card) ? 0.9 : 1.0)
                    .rotationEffect(Angle(degrees: Double(self.isTopView(card: card) ? self.dragState.translaion.width/10 : 0)))
                    .animation(.interpolatingSpring(stiffness: 200, damping: 100))
                    .transition(self.removalTransition)
                    .gesture(LongPressGesture(minimumDuration: 0.01)
                        .sequenced(before: DragGesture())
                        .updating(self.$dragState, body: {(value, state, translation) in
                            switch value{
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                            }
                        })
                        .onChanged({ (value) in
                            guard case .second(true, let drag?) = value else{return}
                            self.removalTransition = drag.translation.width > 0 ? .trailingBottomAtRemoval : .leadingBottomAtRemoval
                        })
                        .onEnded{ (value) in
                            guard case .second(true, let drag?) = value else{
                                return
                            }
                            if drag.translation.width > self.threshold || drag.translation.width < -self.threshold{
                                self.updateDeck()
                            }
                        }
                    )
            }
        }
        BotomBarView().opacity(self.dragState.isDragging ? 0.1 : 1.0).animation(.linear)
    }
    
    private func isTopView(card: CardView)->Bool{
        guard let idx = deck.firstIndex(where: { $0.id == card.id }) else{ return false}
        
        return idx == 0
    }
    
    private func updateDeck(){
        deck.removeFirst()
        self.lastCardIdx += 1
        
        let newCourse = course[self.lastCardIdx % course.count]
        let newCardView = CardView(courses: newCourse)
        deck.append(newCardView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        Group {
//            ContentView()
//            TopBarView().previewLayout(.sizeThatFits)
//            BotomBarView().previewLayout(.fixed(width: 300, height: 100))
//        }
        VStack{
            TopBarView()
            ContentView()
        }
    }
}

struct TopBarView: View {
    var body: some View {
        HStack{
            Image(systemName: "line.horizontal.3").font(.system(size: 25)).foregroundColor(Color.black)
            Spacer()
            Image(systemName: "book.fill").font(.system(size: 35)).foregroundColor(Color.black)
            Spacer()
            Image(systemName: "archivebox.fill").font(.system(size: 25)).foregroundColor(Color.black)
        }.padding(15)
    }
}
struct BotomBarView: View {
    var body: some View {
        HStack{
            Image(systemName: "xmark").font(.system(size: 25)).foregroundColor(Color.black)
            Spacer()
            Button(action: {
                print("Hoa")
            }, label: {
                Text("Comprar el curso")
                    .bold()
                    .foregroundColor(Color.white)
                    .padding(.all, 20)
                    .background(Color.black)
                    .cornerRadius(12)
            }).padding(15)
            Spacer()
            Image(systemName: "heart").font(.system(size: 35))
        }.padding(15)
    }
}
