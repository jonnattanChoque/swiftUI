//
//  DraggableView.swift
//  Gestos
//
//  Created by MacBook Retina on 26/11/20.
//

import SwiftUI

struct DraggableView<T>: View where T: View{
    @GestureState private var dragState = DragState.none
    @State private var position = CGSize.zero
    
    var content: () -> T
    
    var body: some View {
        content()
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translaion.width, y: position.height + dragState.translaion.height)
            .gesture(
                LongPressGesture(minimumDuration: 0.5)
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: { (value, state, transaction) in
                        switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .dragging(translation: drag?.translation ?? .zero)
                            default:
                                break
                        }
                    })
                    .onEnded{ (value) in
                        guard case .second(true, let drag?) = value else {return}
                        self.position.height += drag.translation.height
                        self.position.width += drag.translation.width
                    }
            )
    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView(){
            Text("🚀")
            //Image(systemName: "paperclip.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.purple)
        }
    }
}


enum DragState {
    case none
    case pressing
    case dragging(translation: CGSize)
    
    var translaion: CGSize{
        switch self {
        case .none, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .none:
            return false
        }
    }
}
