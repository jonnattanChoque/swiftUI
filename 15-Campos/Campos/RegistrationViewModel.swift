//
//  RegistrationViewModel.swift
//  Campos
//
//  Created by MacBook Retina on 24/11/20.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject{
    @Published var username = ""
    @Published var password: String = ""
    @Published var confirmPassword = ""
    
    @Published var usernameLengthValid = false
    @Published var passwordLengthValid = false
    @Published var passwordCapitalLetter = false
    @Published var passwordsMatch = false
    
    private var cancellableObjects: Set<AnyCancellable> = []
    
    init() {
        $username.receive(on: RunLoop.main).map{ username in
            return username.count >= 6
        }.assign(to: \.usernameLengthValid, on: self).store(in: &cancellableObjects)
        
        $password.receive(on: RunLoop.main).map{ password in
            return password.count >= 8
        }.assign(to: \.passwordLengthValid, on: self).store(in: &cancellableObjects)
        
        $password.receive(on: RunLoop.main).map{ pass in
            let patternA = "[A-Z]"
            if let _ = pass.range(of: patternA, options: .regularExpression){
                return true
            } else {
                return false
            }
        }.assign(to: \.passwordCapitalLetter, on: self).store(in: &cancellableObjects)
        
        Publishers.CombineLatest($password, $confirmPassword).receive(on: RunLoop.main).map{ (pass, confirmPass) in
            return !pass.isEmpty && (pass == confirmPass)
        }.assign(to: \.passwordsMatch, on: self).store(in: &cancellableObjects)
    }
}
