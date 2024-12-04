//
//  Network.swift
//  ApiDataInTableViewPracticeNewsFeed
//
//  Created by Srikanth Kyatham on 12/3/24.
//
import Foundation

class Network: @unchecked Sendable {
    static let sharedInstance = Network()
    private init() {}
    func getData(from url: String, completion: @escaping (NewsFeed?) -> Void) {
        guard let url = URL(string: url) else {
        print("Invalid URL")
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url), completionHandler:  { data, response, error in
            guard let data, error == nil else {
                print("Error: \(error!.localizedDescription)")
                completion(nil)
                return
            }
            do {
                let recievedData = try JSONDecoder().decode(NewsFeed.self, from: data)
                print(recievedData)
                completion(recievedData)
            } catch {
                print("Unaable to decode the JSON data to NewsFeed")
                completion(nil)
            }
        }).resume()
        
    }
    
}
