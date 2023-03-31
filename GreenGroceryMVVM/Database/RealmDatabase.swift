import Foundation
import RealmSwift

class RealmDatabase {
    static let shared: RealmDatabase = RealmDatabase()
    private init() { }
}

extension RealmDatabase: CartDB {
    func updateCart(using cartItem: CartItem) -> Bool {
        do {
            let realm = try! Realm()
            
            try realm.write {
                realm.add(RealmCartItem(cartItem: cartItem), update: .all)
            }
            
        } catch  {
            print("Smth went wrong with \(error)")
            return false
        }
        return true
    }
}
