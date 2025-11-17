//: [Previous](@previous)

import Foundation

//Exemplo sem typealias

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

//Exemplo com typealias

typealias DuckProtocol = Flyable & Swimmable & Eatable

class Pato: DuckProtocol {
    func fly() {
        print("Pato voando")
    }
    
    func swim() {
        print("Pato nadando")
    }
    
    func eat() {
        print("Pato comendo")
    }
    
    func performShow(with creature: Flyable & Swimmable) {
        creature.fly()
        creature.swim()
    }
}


