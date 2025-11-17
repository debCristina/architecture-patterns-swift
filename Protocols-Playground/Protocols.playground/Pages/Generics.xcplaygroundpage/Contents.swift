//: [Previous](@previous)

import Foundation

protocol Descritivel {
    var descricao: String { get}
    func mostrarDescricao<T: Descritivel>(_ item: T)
}

extension Descritivel {
    func mostrarDescricao<T: Descritivel>(_ item: T) {
        print("Descritivel: \(item.descricao)")
    }
}

struct Pessoa: Descritivel {
    var nome: String
    var descricao: String { "Pessoa chamada \(nome)" }
}

let p = Pessoa(nome: "Joao")

p.mostrarDescricao(p)


//protocol Alternavel {
//    mutating func alternar()
//}
//
//enum Interruptor: Alternavel {
//    case ligado, desligado
//    
//    mutating func alternar() {
//        switch self {
//        case .ligado:
//            self = .desligado
//        case .desligado:
//            self = .ligado
//        }
//    }
//}
//
//var lampada = Interruptor.desligado
//lampada.alternar()
//print(lampada)


