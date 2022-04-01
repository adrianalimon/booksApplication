
import Foundation

struct BookData: Codable {
    let totalItems: Int
    let items: [Items]
}
    
struct Items: Codable {
    let id: String
    let selfLink: String
    let volumeInfo: DataInfo
}
        
struct DataInfo: Codable {
    let title: String
    let pageCount: Int
    let description: String?
    let publisher: String?
    let authors: [String]?
    let categories: [String]?
    let imageLinks: Images?
}
            
struct Images: Codable {
    let thumbnail: String?
}
