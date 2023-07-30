//
//  DataRequest.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/6.
//

import Foundation
import SwiftUI


class DataRequestViewModel<T: Decodable>: ObservableObject {
    
    @Published var responseData: T? // Response data will be stored here
    @Published var isLoading = false // To track loading state
    @Published var error: Error? // To track any errors during the request

    func fetchData(url: String, completion:  @escaping(T?, Error?, Bool) -> Void) {
        // Set isLoading to true before making the request
        
        isLoading = true
        // Create a URL object from the given string
        guard let url = URL(string: url) else {
            isLoading = false
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]), false)
            return
        }
        
        // Create a URLSession and a data task
        URLSession.shared.dataTask(with: url) { data, response, error in
            // Ensure there is no error and the response status code is successful (e.g., 200 OK)
            guard let data = data, let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    self.isLoading = false
                    completion(nil, error, false)
                }
                return
            }

            // Parse the data into JSON using JSONSerialization
            do {
                let decoder = JSONDecoder()
                let responseData = try decoder.decode(T.self, from: data)
                print("qqq", data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    print("dataRequest file", responseData)
                    completion(responseData, nil, false)
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    print("xxxxxx", error)
                    completion(nil, error, false)
                }
            }
        }.resume() // Start the data task
    }
}
