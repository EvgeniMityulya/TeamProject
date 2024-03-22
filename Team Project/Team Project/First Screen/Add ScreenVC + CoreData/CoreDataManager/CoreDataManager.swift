import CoreData
import UIKit.UIApplication

//MARK: - ERROR
enum CoreDataError: Error {
    case error(String)
}

//MARK: - COREDATA MANAGER
final class CoreDataManager {
    static let instance = CoreDataManager()
    private init() { }
    
    //MARK: - SAVE
    func saveUser(name: String , country: String , currency: String , image: UIImage) -> Result<Void, CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(name, forKey: "name")
        user.setValue(country, forKey: "country")
        user.setValue(currency, forKey: "currency")
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            user.setValue(imageData, forKey: "image")
        }
        
        do {
            try managedContext.save()
        } catch {
            return .failure(.error("Could not save. \(error)"))
        }
        
        return .success(())
    }
    
    //MARK: - GET
    func getUsers() -> Result<[User] , CoreDataError> {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return .failure(.error("AppDelegate not found"))
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        
        let users: [User]
        
        do {
            let objects = try managedContext.fetch(fetchRequest)
            guard let fetchedUsers = objects as? [User] else {
                return .failure(.error("Could not cast as [User]"))
            }
            users = fetchedUsers
        } catch {
            return .failure(.error("Could not fetch \(error)"))
        }
        
        return .success(users)
    }
}
