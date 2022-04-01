//
//  APIDataManager.swift
//  MyLibraryProject
//
//  Created by Adriana Limon on 3/11/22.
//

import Foundation

/*struct InfoBooks: Decodable{
    let items: [Items]
}

struct Items: Decodable{
    let id : String
    let volumeInfo: DataInfo
}

struct DataInfo: Decodable{
    let title: String
    let authors: [String]
    let publishDate: String
    let description: String
    let categories: [String]
    let imageLinks: Thumbnails
}


struct Thumbnails: Decodable{
    let smallThumbnail: String
    let thumbnail: String
} */

/* final class APIClient{
    func loadData(completionBlock: @escaping (InfoBooks) -> ()) {
    guard let url = URL(string:"https://www.googleapis.com/books/v1/volumes?q=harry+potter&key=AIzaSyDrSGFI-Xix8vqXcw60xTlIG28wWTAnPvU") else {
        return
    }
    
    URLSession.shared.dataTask(with:url) { data, response, error in
    guard let data = data else {return}
    if let decodedData = try? JSONDecoder().decode(InfoBooks.self, from:data){
        DispatchQueue.main.async{
            print(decodedData)
        }
    }
    } .resume()
}
}
/*final class APIClient {
    func getSlackConversations(completionBlock: @escaping (InfoBooks) -> ()) {
        let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=harry+potter&key=AIzaSyDrSGFI-Xix8vqXcw60xTlIG28wWTAnPvU")!
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            let dataModel = try! JSONDecoder().decode(InfoBooks.self, from: data!)
            completionBlock(dataModel)
        }
        task.resume()
    }
}

let apiClient = APIClient()
apiClient.getSlackConversations {
    print("DataModel \($0)")
}*/



/*struct DataManager {
    //var delegate: DataManagerDelegate?
    let boooksURL = "https://www.googleapis.com/books/v1/volumes"
    let apikey = "&key=AIzaSyDrSGFI-Xix8vqXcw60xTlIG28wWTAnPvU"
    
    //MARK: - func
    func fetchData(bookName: String){
        let urlString = "\(boooksURL)?q=\(bookName)\(apikey)"
        Request(urlString: urlString)
    }
    
    //MARK: - Request urlString
    func Request(urlString: String) {
        //1.URl
       if  let url = URL(string: urlString) {
        //2.Create a URLSesion
        let session = URLSession(configuration: .default)
        
           let task = session.dataTask(with: url) {(data, response, error) in
               if error != nil {
                  //if you get an error, go to the delegate
                  // delegate?.didFailWithError(error: error!)
                  // return
           }
               //if there is no error the data is safe
               if let safeData = data {
                   if let books = self.parseJSON( safeData) {
                      // delegate?.didUpdateWeather(self, weather: weather)
                       
                   }
                   
                   
               }
           }
        task.resume()
    }
 }
}

func parseJSON(_ InfoBooks: Data) {
    let decoder = JSONDecoder()
    do {
        let decodedData = try decoder.decode(InfoBooks.self, from: InfoBooks)
        let id = decodedData.weather[0].id
        let temp = decodedData.main.temp
        let name = decodedData.name
        let idCity = decodedData.id
        
        let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp, id: idCity)
        print(weather.conditionName)
     
       
        print(decodedData.id)
        //
        print(decodedData.name)
        print(weather.temperatureString)
        return weather
        
       
        
    } catch {
        delegate?.didFailWithError(error: error)
        return nil
    }
    
}*/
 */
