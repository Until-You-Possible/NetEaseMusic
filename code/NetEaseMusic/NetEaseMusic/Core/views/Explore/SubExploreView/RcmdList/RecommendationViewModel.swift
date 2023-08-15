//
//  RecommendationViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/13.
//

import Foundation

import SwiftyJSON


class RecommendationViewModel: ObservableObject {
    
    @Published var rcmdData: JSON?
    
    init () {
        // self.getRcmdSongList()
    }
    
    func getRcmdSongList() {
        if let data = FileLoader.readLocalFile(filename: "AppMainPageInfo") {
            let loadData =  FileLoader.loadJson(data: data)
            if let allBlocks = loadData["data"]["blocks"].array {
                for obj in allBlocks  {
                    if obj["blockCode"].stringValue == "HOMEPAGE_BLOCK_PLAYLIST_RCMD" {
                        rcmdData = obj
                    }
                }
            }

        }
    }
}
