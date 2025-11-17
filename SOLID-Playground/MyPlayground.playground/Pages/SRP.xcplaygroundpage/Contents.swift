import Foundation
import SwiftUI

//🧩 Desafio – Single Responsibility Principle (SRP)
//Problema:
//Você tem uma classe Report que:
//1.    Gera relatórios de vendas
//2.    Salva o relatório no disco
//3.    E envia por e-mail

//class Report {
//    func generateReport() {
//        print("Gerando relatório de vendas...")
//    }
//    
//    func saveToFile() {
//        print("Salvando relatório no disco...")
//    }
//
//    func sendEmail() {
//        print("Enviando relatório por e-mail...")
//    }
//}

class Report {
    func generateReport() -> String {
        print("Gerando relatótio")
        return "Relatório completo"
    }
}

class SaveReport {
    func saveToFile(_ content: String) {
        print("Salvando relatótio: \(content)")
    }
}

class SendReport {
    func sendEmail(_ content: String) {
        print("Enviando relatório por email: \(content)")
    }
}

let report = Report()

let content = report.generateReport()

let saver = SaveReport()
saver.saveToFile(content)

let sender = SendReport()
sender.sendEmail(content)

//Isso mostra como as classes podem colaborar sem ficarem acopladas, o que é justamente o objetivo do SRP
