//
//  DayRecommendSongViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import Foundation
import SwiftyJSON

class DayRecommendSongViewModel: ObservableObject {
    
    @Published var offset           : CGFloat = 0
    @Published var daySongsData     : JSON?
    @Published var dayListData      : JSON?
    @Published var recommendReasons : JSON?
    
    init () {
        self.getDayRecommendSongData()
    }
    
    func getDayRecommendSongData () {
        if let data = FileLoader.readLocalFile(filename: "RecommendSongs") {
            self.daySongsData     = FileLoader.loadJson(data: data)
            self.dayListData      = daySongsData?["data"]["dailySongs"]
            self.recommendReasons = daySongsData?["data"]["recommendReasons"]
        }
    }
    
}

