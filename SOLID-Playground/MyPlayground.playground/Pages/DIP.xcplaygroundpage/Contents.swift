
import Foundation
//Desafio – Dependency Inversion Principle

//Você está criando um app de zoológico que precisa mostrar como cada animal se move.

/*
 class Lion {
     func move() -> String {
        return "O leão anda"
     }
 }
 
 class Zoo {
     let lion = Lion()
     
     func showMovement() {
        print(lion.move())
     }
 }
 
 let zoo = Zoo()
 zoo.showMovement()
 */

//Zoo depende diretamente de Lion.
//Se quisermos adicionar outros animais (Elephant, Penguin) ou trocar o Lion por outro tipo de leão, temos que modificar a classe Zoo.

protocol Animal {
    func move() -> String
}

class Lion: Animal {
    func move() -> String {
        return "Leao movendo"
    }
}

class Elephant: Animal {
    func move() -> String {
        return "Elefante movendo"
    }
}

class Zoo {
    let animal: Animal
    
    init(animal: Animal) {
        self.animal = animal
    }
    
    func move() {
        print(animal.move())
    }
}

let lion = Zoo(animal: Lion())
lion.move()

let elefante = Zoo(animal: Elephant())
elefante.move()
