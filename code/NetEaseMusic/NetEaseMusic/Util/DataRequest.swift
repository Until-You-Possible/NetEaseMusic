//
//  DataRequest.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/6.
//

import Foundation
import SwiftUI
import SwiftyJSON


class DataRequestViewModel: ObservableObject {
    
    @Published var responseData: JSON? // Response data will be stored here
    @Published var isLoading = false // To track loading state
    @Published var error: Error? // To track any errors during the request

    func fetchData(url: String, completion:  @escaping(JSON?, Error?, Bool) -> Void) {
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
                let responseData = try JSON(data: data)
                DispatchQueue.main.async {
                    self.isLoading = false
                    completion(responseData, nil, false)
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    completion(nil, error, false)
                }
            }
        }.resume() // Start the data task
    }
}
