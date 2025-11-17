//: [Previous](@previous)

import Foundation

protocol ItemStoring {
    associatedtype ItemType
    
    var items: [ItemType] {get set}
    
    mutating func add(item: ItemType)
}

extension ItemStoring {
    mutating func add(item: ItemType) {
        items.append(item)
    }
}

struct NameDatabase: ItemStoring {
    var items = [String]()
}


struct Caixa<T, Y> {
    var item: T
    var item2: Y
}

let caixaDeInt = Caixa<Int, String>(item: 42, item2: "tste")

