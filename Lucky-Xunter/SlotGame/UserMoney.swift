
import Foundation

struct UserMoney {
    private let defaults = UserDefaults.standard
    
    func setupUserMoney(){
        defaults.set(500, forKey: "userMoney")
    }
    
    func setMax() {
        if let retrievedValue = UserDefaults.standard.object(forKey: "userMoneyMax") as? Int {
            if getUserMoney() > retrievedValue {
                UserDefaults.standard.set(getUserMoney(), forKey: "userMoneyMax")
            }
        } else {
            UserDefaults.standard.set(getUserMoney(), forKey: "userMoneyMax")
        }
    }
    
    func getMax() -> Int {
        if let retrievedValue = UserDefaults.standard.object(forKey: "userMoneyMax") as? Int {
           return retrievedValue
        } else {
            return 0
        }
    }
    
    func setUserMoney(value: Int){
        defaults.set(value, forKey: "userMoney")
        setMax()
    }
    
    func getUserMoney() -> Int {
        defaults.integer(forKey: "userMoney")
    }
}
