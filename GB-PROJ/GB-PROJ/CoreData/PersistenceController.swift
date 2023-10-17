import CoreData
import Foundation

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
    
    init() {
           container = NSPersistentContainer(name: "GB_PROJ")
           container.loadPersistentStores { (storeDescription, error) in
               if let error = error {
                   fatalError("Ошибка при инициализации хранилища данных: \(error)")
               }
           }
       }
}
