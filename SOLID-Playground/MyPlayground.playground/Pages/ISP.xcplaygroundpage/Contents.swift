//: [Previous](@previous)

import Foundation

import Foundation
// Desafio – Interface Segregation Principle (ISP)

// Atualmente, existe um protocolo grande chamado AnimalActions que define várias ações,
// mas nem todos os animais fazem tudo isso.
/*
 protocol AnimalActions {
 func eat()
 func fly()
 func swim()
 }
 */

// O problema: as classes são obrigadas a implementar métodos que não fazem sentido para elas.



protocol Eatable {
    func eat()
}

protocol Swimmable {
    func swim()
}

protocol Flyable {
    func fly()
}

class Bird: Flyable, Eatable {
    func fly() {
        print("Passaro voando")
    }
    
    func eat() {
        print("Passaro comendo")
    }
}
