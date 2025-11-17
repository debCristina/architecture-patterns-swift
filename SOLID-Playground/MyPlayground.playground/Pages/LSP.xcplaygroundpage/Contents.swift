//: [Previous](@previous)

import Foundation

//Desafio – Liskov Substitution Principle (LSP)
//Você está criando um sistema que modela aves.
//Um colega escreveu esse código:

/*class Bird {
    func fly() {
        print("Voando...")
    }
}

class Penguin: Bird {
    override func fly() {
        fatalError("Pinguins não voam!")
    }
}

func makeBirdFly(_ bird: Bird) {
    bird.fly()
}

makeBirdFly(Penguin())
*/

// Problema:
//me ajude
//Refatore o código para respeitar o Liskov Substitution Principle:
//Subclasses (ou tipos que implementam um protocolo) devem sempre poder substituir o tipo base sem causar comportamento incorreto.

protocol Bird {
    func move() -> String
}

protocol FlyingBird: Bird {
    func fly() -> String
}

class Penguim: Bird {
    func move() -> String {
        return "Pinguim Movendo"
    }
}

class Eagle: FlyingBird {
    func fly() -> String {
        return "Eagle Voando"
    }
    
    func move() -> String {
        return "Eagle Movendo"
    }
}

let penguim = Penguim()
penguim.move()

let eagle = Eagle()
eagle.fly()
eagle.move()
