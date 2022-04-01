
import Foundation

protocol BooksManagerDelegate {
    func didUpdateBooks(_ booksManager: BooksManager, book: BookModel)
    func didFailWithError(error: Error)
}

struct BooksManager {
    
    let booksURL = "https://www.googleapis.com/books/v1/volumes?key=AIzaSyDrSGFI-Xix8vqXcw60xTlIG28wWTAnPvU"
    
    var delegate: BooksManagerDelegate?
    
    func fetchBooks(bookName: String) {
        let urlString = "\(booksURL)&q=\(bookName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        //1. Crear una URL
        if let url = URL(string: urlString) {
            
            //2. Crear una URLSession
            let session = URLSession(configuration: .default)
            
            //3. Darle una tarea a la sesión
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let book = self.parseJSON(bookData: safeData) {
                        self.delegate?.didUpdateBooks(self, book: book)
                    }
                }
            }
            
            //4. Iniciar la tarea
            task.resume()
        }
    }
    
    func parseJSON(bookData: Data) -> BookModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(BookData.self, from: bookData)
            let title = decodedData.items[0].volumeInfo.title
            let description = decodedData.items[0].volumeInfo.description
            let author = decodedData.items[0].volumeInfo.authors
            let categories = decodedData.items[0].volumeInfo.categories
            let publisher = decodedData.items[0].volumeInfo.publisher
            let pages = decodedData.items[0].volumeInfo.pageCount
            let imageString = decodedData.items[0].volumeInfo.imageLinks?.thumbnail
            print(title)
            print(description)
            print(author)
            print(categories)
            print(publisher)
            print(pages)
            print(imageString)
            
            let book = BookModel(bookName: title, bookDescription: description, bookAuthor: author, bookCategory: categories)

            return book

        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
