import SwiftUI
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    
    let context = PersistenceController.shared.container.viewContext
    
    private init() {
    }
    
    func createFilm(film: ViewFilm) {
        let newFilm = MovieCD(context: context)
        newFilm.name = film.name
        newFilm.descript = film.description
        newFilm.countries = film.countries
        newFilm.criticsRating = film.criticsRating
        newFilm.genres = film.genres
        newFilm.titleId = Int64(film.id!)
        newFilm.imdbRating = film.imdbEating
        newFilm.kpRating = film.kpRating
        newFilm.movieLength = Int16(film.movieLength)
        if let imageData = film.poster?.pngData() {
            newFilm.poster = imageData
        }
        
        do {
            // Сохранение изменений в Core Data
            try context.save()
        } catch {
            print("Ошибка при сохранении изображения: \(error)")
        }
        
    }
    func getFilms() -> [MovieCD] {
        do {
            let fetchRequest: NSFetchRequest<MovieCD> = MovieCD.fetchRequest()
            let movieCoreData = try context.fetch(fetchRequest)
            

            
            return movieCoreData
        } catch {
            print("Ошибка при получении списка фильмов: \(error)")
            return []
        }
    }

    func checkInStore(id: Int64) -> Bool {
        do {
            let fetchRequest: NSFetchRequest<MovieCD> = MovieCD.fetchRequest()
            let movieCoreData = try context.fetch(fetchRequest)

            return movieCoreData.contains(where: {$0.titleId == id})
        } catch {
            print("Ошибка при получении списка фильмов: \(error)")
            return false
        }
    }
    
    func deleteById(id: Int64) {
        do {
            let fetchRequest: NSFetchRequest<MovieCD> = MovieCD.fetchRequest()
            let movieCoreData = try context.fetch(fetchRequest)

            for movie in movieCoreData {
                if movie.titleId == id {
                    context.delete(movie)
                }
            }

            do {
                // Сохранение изменений в Core Data
                try context.save()
            } catch {
                print("Ошибка при сохранении изменения: \(error)")
            }
        } catch {
            print("Ошибка при получении списка фильмов: \(error)")
        }
    }

    
    func deletAll(){
        do {
            let fetchRequest: NSFetchRequest<MovieCD> = MovieCD.fetchRequest()
            var movieCoreData = try context.fetch(fetchRequest)

            for movie in movieCoreData {
                context.delete(movie)
            }
            do {
                // Сохранение изменений в Core Data
                try context.save()
            } catch {
                print("Ошибка при сохранении изображения: \(error)")
            }
        } catch {
            print("Ошибка при получении списка фильмов: \(error)")
        }
    }

}
