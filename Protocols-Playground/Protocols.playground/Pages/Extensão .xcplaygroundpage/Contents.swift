//: [Previous](@previous)

import Foundation

protocol Danceable {
    func  dance ()
}

extension Danceable{
    func  dance () {
        print ( "Movimento de dança padrão" )
    }
}

struct  Dancer : Danceable {
}

let dancer =  Dancer ()
dancer.dance()
