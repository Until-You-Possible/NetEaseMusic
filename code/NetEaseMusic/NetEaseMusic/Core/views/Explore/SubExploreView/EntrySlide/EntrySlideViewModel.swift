//
//  EntrySlideViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/2.
//

import Foundation
import SwiftyJSON

struct MenuItem: Identifiable {
    var id: Int
    var name: String
    var iconUrl: String
    var url: String
    var skinSupport: Bool
    var homepageMode: String
    var resourceState: String?
}

class EntrySlideViewModel: ObservableObject {
    
    @Published var dataRequestModel = DataRequestViewModel()
    @Published var isLoading     : Bool = true
    @Published var error         : Error?
    @Published var calculatePage : Int = 0
    @Published var entryData     : JSON?
    
    init () {
        self.getEntrySlide()
    }
    
    func getEntrySlide() {
        let url = "https://arthur-music-api.vercel.app/homepage/dragon/ball"
        dataRequestModel.fetchData(url: url) { (data, error, isLoading) in
            if let data = data {
                self.calculatePage = Int(ceil(Double(data["data"].count) / Double(5)))
                // 转换接口数据
                self.entryData = data
            }
            self.isLoading = isLoading
            self.error = error
            
        }
        
        func getTodayDate() -> Int {
            let today = Date()
            let calendar = Calendar.current
            let day = calendar.component(.day, from: today)
            return day
        }
         
        func splitArrayIntoChunks<T>(array: [T], chunkSize: Int) -> [[T]] {
            var resultArray: [[T]] = []
            for i in stride(from: 0, to: array.count, by: chunkSize) {
                let endIndex = min(i + chunkSize, array.count)
                let chunk = Array(array[i..<endIndex])
                resultArray.append(chunk)
            }
            return resultArray
        }
        
        func splitArrayByChunks<T>(array: [T], chunkSize: Int) -> [[T]] {
            var resultArray: [[T]] = []
            var currentSubArray: [T] = []
            for value in array {
                if currentSubArray.count == 5 {
                    resultArray.append(currentSubArray)
                    currentSubArray = []
                }
                currentSubArray.append(value)
            }

            // 添加最后一个子数组（可能不足5个元素）
            if !currentSubArray.isEmpty {
                resultArray.append(currentSubArray)
            }
            return resultArray
        }
    }
}
