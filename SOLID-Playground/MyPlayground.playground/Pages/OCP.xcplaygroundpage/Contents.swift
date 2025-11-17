//: [Previous](@previous)

import Foundation
//Desafio – Open/Closed Principle (OCP)
// Você está criando um sistema simples de descontos para um app de e-commerce.

//class DiscountManager {
//func calculate(price: Double, type: String) -> Double {
//    if type == "silver" {
//        return price * 0.9
//    } else if type == "gold" {
//        return price * 0.8
//    } else if type == "platinum" {
//        return price * 0.7
//    } else {
//        return price
//    }Prob=le
//}
//}

//Toda vez que surge um novo tipo de desconto, você precisa editar a classe DiscountManager — o que viola o OCP.


protocol Discount {
    func apply(to price: Double) -> Double
}

class GoldDiscount: Discount {
    func apply(to price: Double) -> Double {
        return price * 0.9
    }
}

class PlatinumDiscount: Discount {
    func apply(to price: Double) -> Double {
        return price * 0.8
    }
}

class DiscountManager {
    func calculate(price: Double, discount: Discount) -> Double {
        return discount.apply(to: price)
    }
}

let manager = DiscountManager()
let goldPrice = manager.calculate(price: 10, discount: GoldDiscount())

let platinumPrice = manager.calculate(price: 10, discount: PlatinumDiscount())

print("Gold: \(goldPrice)")
print("Platinum: \(platinumPrice)")

