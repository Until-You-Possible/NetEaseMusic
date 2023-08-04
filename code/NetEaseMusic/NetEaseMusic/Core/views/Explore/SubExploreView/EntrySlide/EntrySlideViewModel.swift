//
//  EntrySlideViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/2.
//

import Foundation
import SwiftyJSON



class EntrySlideViewModel: ObservableObject {
     
    @Published var dataRequestModel = DataRequestViewModel()
    @Published var entryData     : JSON?
    @Published var isLoading     : Bool = true
    @Published var error         : Error?
    @Published var calculatePage : Int = 0
    @Published var entryArray    : [[Any]] = []
    
    init () {
        self.getEntrySlide()
    }
    
    func getEntrySlide() {
        let url = "https://arthur-music-api.vercel.app/homepage/dragon/ball"
        dataRequestModel.fetchData(url: url) { (data, error, isLoading) in
            if let data = data {
                self.entryData = data
                self.calculatePage = Int(ceil(Double(data["data"].count ) / Double(5)))
                // 转换接口数据
                let entryArray = self.splitArrayIntoChunks(data["data"].array ?? [], chunkSize: 5)
                print("entryArray", type(of: entryArray))
            }
            self.isLoading = isLoading
            self.error = error
        }
    }

    func splitArrayIntoChunks<T>(_ array: [T], chunkSize: Int) -> [[T]] {
        var resultArray: [[T]] = []
        for i in stride(from: 0, to: array.count, by: chunkSize) {
            let endIndex = min(i + chunkSize, array.count)
            let chunk = Array(array[i..<endIndex])
            resultArray.append(chunk)
        }
        return resultArray
    }
}
