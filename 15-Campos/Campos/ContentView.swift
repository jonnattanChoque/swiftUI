//
//  ContentView.swift
//  Campos
//
//  Created by MacBook Retina on 24/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @ObservedObject private var regisVM = RegistrationViewModel()
    
    var body: some View {
        VStack {
            Text("Crear una cuenta").font(.system(.largeTitle, design: .rounded)).padding(.bottom, 20)
            
            SingleFormView(isProtected: false, fieldName: "Nombre de ususario", fieldValue: $regisVM.username)
            ValidationFormView(
                iconName: regisVM.usernameLengthValid ? "checkmark.circle" : "xmark.circle",
                iconColor: regisVM.usernameLengthValid ? Color.green : Color.red,
                formText: "minimo 6 caracteres",
                conditionChecked: regisVM.usernameLengthValid
            )
            
            SingleFormView(isProtected: true, fieldName: "Contraseña", fieldValue: $password)
            VStack{
                ValidationFormView(
                    iconName: regisVM.passwordLengthValid ? "checkmark.circle" : "xmark.circle",
                    iconColor: regisVM.passwordLengthValid ? Color.green : Color.red,
                    formText: "minimo 8 caracteres",
                    conditionChecked: regisVM.passwordLengthValid
                )
                ValidationFormView(
                    iconName: regisVM.passwordCapitalLetter ? "checkmark.circle" : "xmark.circle",
                    iconColor: regisVM.passwordCapitalLetter ? Color.green : Color.red,
                    formText: "Una mayuscula y minuscula",
                    conditionChecked: regisVM.passwordCapitalLetter
                )
            }
            
            SingleFormView(isProtected: true, fieldName: "Confirmar contraseña", fieldValue: $confirmPassword)
            ValidationFormView(
                iconName: regisVM.passwordsMatch ? "checkmark.circle" : "xmark.circle",
                iconColor: regisVM.passwordsMatch ? Color.green : Color.red,
                formText: "Las contraseñas deben coincidir",
                conditionChecked: regisVM.passwordsMatch
            )
            
            Button(action: {
                
            }, label: {
                Text("Registrarse")
                    .font(.system(.title, design: .rounded))
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(8)
            })
            
            HStack{
                Text("¿Ya tienes cuenta?").font(.system(.body, design: .rounded)).bold()
                Button(action: {
                    
                }, label: {
                    Text("Entrar ahora").font(.system(.headline))
                })
            }.padding()
            
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SingleFormView: View {
    var isProtected = false
    var fieldName = ""
    @Binding var fieldValue : String
    
    var body: some View {
        VStack{
            if isProtected{
                SecureField(fieldName, text: $fieldValue).font(.system(size: 18, weight: .bold, design: .rounded)).padding(.horizontal)
            }else{
                TextField(fieldName, text: $fieldValue).font(.system(size: 18, weight: .bold, design: .rounded)).padding(.horizontal)
            }
            Divider().frame(height: 1).background(Color.gray).padding(.horizontal)
        }
    }
}

struct ValidationFormView: View {
    var iconName = "xmark.circle"
    var iconColor = Color(red: 0.9, green: 0.5, blue: 0.5)
    var formText = ""
    var conditionChecked = false
    
    var body: some View{
        HStack(alignment: .center){
            Image(systemName: iconName).foregroundColor(iconColor)
            Text(formText).font(.system(.body, design: .rounded)).foregroundColor(.gray).strikethrough(conditionChecked)
            Spacer()
        }.padding()
    }
}
