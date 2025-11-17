//: [Previous](@previous)

import Foundation

protocol teste1 {
    var seila: String {get}
    func falar()
}

extension teste1{
    func falar(){
        print("teste 1")
    }
}

struct teste3: teste1{
    var seila: String = ""
    
}
