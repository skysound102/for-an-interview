import UIKit


class Wallet {
    static let shared = Wallet()
   private var balance = 0
    
    private init () { }
    func addBalance (_ sum: Int) {
        self.balance += sum
    }
    
    func minusBalance(_ sum: Int) -> Int {
        
        guard self.balance > sum else {
            return 0
        }
        
        self.balance -= sum
        
        return balance
    }
    
    func getBalance () {
        print(balance)
    }
    
}


var ashan = Wallet.shared
ashan.addBalance(500)
ashan.minusBalance(50)
var work = Wallet.shared
work.addBalance(50000000)




class Shop {
    var bots : String
    init(prefix: String) {
        self.bots = " \(prefix)"
    }
}


var shop = Shop(prefix: "d")
shop.bots
