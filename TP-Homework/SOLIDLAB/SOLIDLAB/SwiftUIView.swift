//
//  SwiftUIView.swift
//  SOLIDLAB
//
//  Created by Ethan Allgaier on 10/28/25.



// Single Responsibility = Each struct/class has one purpose. True
//
// Open/Closed = You can add new processors or loggers without changing old code. true
//
// Liskov = Any processor or logger can replace another and still work. true
//
// Interface Segregation = Each protocol has only what’s needed (no bloated interfaces). true
//
// Dependency Inversion =



protocol User {
    func saveUser(username: String)
}
// Single responsibilty
// Class has one function

class Admin: User {
    func saveUser(username: String) {
        print("User saved")
    }
}


protocol PaymentMethod {
    func proccess(amount: Double)
}

// Interface Segregation
// Instead of adding Refundable to PaymentMethod, make it in a seperate protocol so its less clunky

protocol Refundable {
    func refund(amount: Double )
}
class CreditPayment: PaymentMethod, Refundable {
    func refund(amount: Double) {
        print("Refunded")
    }
    func proccess(amount: Double) {
        print("Credit")
    }
}


class DebitPayment: PaymentMethod, Refundable {
    func refund(amount: Double) {
        print("Refunded")
    }
    func proccess(amount: Double) {
        print("Debit")
    }
}

// I am able to add more payments methods without changing other parts of code.
// Open / Closed Princable

class ApplePayment: PaymentMethod, Refundable {
    func refund(amount: Double) {
        print("Refunded")
    }
    
    func proccess(amount: Double) {
        print("Apple Pay")
    }
}

//Liskov - This class depends on PaymentMethod. I am able to change ApplePayment or DebitPayment and it will still work.
class PaymentProccesor {
    private let paymentProccesor: PaymentMethod
    
    init(paymentProccesor: PaymentMethod) {
        self.paymentProccesor = paymentProccesor
    }
    func makePayment(amount: Double) {
        paymentProccesor.proccess(amount: amount)
    }
    
}

// This class relys on PaymentProccesor and Refudable. I am able to change things without causing promblems.
// Dependency Inversion
class Transaction {
    let proccessor: PaymentProccesor
    let refund: Refundable
    
    init(proccessor: PaymentProccesor, refund: Refundable) {
        self.proccessor = proccessor
        self.refund = refund
    }
    
    func performPurchase(amount: Double) {
        proccessor.makePayment(amount: amount)
    }
    func refundPurchase(amount: Double) {
        refund.refund(amount: amount)
    }
}
