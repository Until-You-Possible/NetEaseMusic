//
//  DayRecommendSongViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import Foundation
import SwiftyJSON

class DayRecommendSongViewModel: ObservableObject {
    
    @Published var offset: CGFloat = 0
    @Published var daySongs: JSON?
    
    init () {
        self.getDayRecommendSongData()
    }
    
    func getDayRecommendSongData () {
        if let data = FileLoader.readLocalFile(filename: "RecommendSource") {
//            let daySongs = FileLoader.loadJson(data: data)
            print("data", data)
        }
    }
    
}

