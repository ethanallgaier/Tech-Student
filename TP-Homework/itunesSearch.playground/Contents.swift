import Foundation






extension Data {
    func prettyPrintedJSONString() {
        guard
            let jsonObject = try? JSONSerialization.jsonObject(with: self, options: []),
            let jsonData = try? JSONSerialization.data(
                withJSONObject: jsonObject,
                options: [.prettyPrinted]
            ),
            let prettyJSONString = String(data: jsonData, encoding: .utf8)
        else {
            print("Failed to read JSON Object.")
            return
        }
        
        print(prettyJSONString)
    }
}
//this is a debugging tool — helps you see the JSON you got from the web clearly, before you start decoding it.
//makes it look pretty instead of messy





//Codable means it can encode to or decode from JSON automatically
//Its Decodable + Encodable
struct StoreItem: Codable {
    var name: String
    var artist: String
    var description: String

    
    //This links swift property names to JSON keys
    enum CodingKeys: String, CodingKey {
//Swift property↓  JSON key ↓
        case name = "trackName"
        case artist = "artistName"
        case description
    }

    enum AdditionalKeys: String, CodingKey {
        case longDescription
    }
    
//This checks if description is a JSON key if not it looks for longDescription, if neither is there will return empty string
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decode(String.self, forKey: .name)
        artist = try values.decode(String.self, forKey: .artist)
        if let description = try? values.decode(String.self, forKey: .description) {
            self.description = description
        } else {
            let additional = try decoder.container(keyedBy: AdditionalKeys.self)
            description = (try? additional.decode(String.self, forKey: .longDescription)) ?? ""
        }
    }
}


struct SearchResults: Codable {
    var results: [StoreItem]
}
enum StoreItemError: Error, LocalizedError {
    case itemsNotFound
}


func fetchItems(matching query: [String: String]) async throws -> [StoreItem] {
    var url = URL(string: "https://itunes.apple.com/search")!
    //making a URL object from a string.! force unwraps
    
    var URLcomponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
    // Wraps my url into URLComponents for easy modification or addin stuff
    
    URLcomponents.queryItems = query.map { URLQueryItem(name: $0.key, value: $0.value) }
    url = URLcomponents.url!
    //Adds your query to the URL. turning it into // h ttps://itunes.apple.com/search ?term=Radiohead&media=music&limit=5
    
    
    //data: the bytes downloaded (in your case, JSON).
    //response: info about the HTTP request (status code, headers, etc.).
    let (data, response) = try await URLSession.shared.data(from: URLcomponents.url!)
    //This is asking iTunes for some data
    print(data.prettyPrintedJSONString())
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw StoreItemError.itemsNotFound
            //This checks to see if i got some data, if not runs a error
    }
    let decoder = JSONDecoder()
    let searchResponse = try decoder.decode(SearchResults.self, from: data)
    //decodes my search results
    
    
    return searchResponse.results
}



let query = [
    "term": "Radiohead",
    //search word
    "media": "music",
    //Type: music, movie, etc
    "limit": "5"
    //amount of results
]
//basically my search


Task {
    do {
        let storeItems = try await fetchItems(matching: query)
        
        storeItems.forEach { item in
            print("""
                Name: \(item.name)
                Artist: \(item.artist)
                Description: \(item.description)
                
                """)
        }
    } catch {
        print(error)
    }
}








