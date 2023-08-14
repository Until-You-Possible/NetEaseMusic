//
//  AlllListenViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/13.
//

import Foundation

import SwiftyJSON


class AllListenViewModel: ObservableObject {
    
    @Published var listenData: JSON?
    
    init () {
        self.getListenSongList()
    }
    
    func getListenSongList() {
        if let data = FileLoader.readLocalFile(filename: "AppMainPageInfo") {
            let loadData =  FileLoader.loadJson(data: data)
            if let allBlocks = loadData["data"]["blocks"].array {
                for obj in allBlocks  {
                    if obj["blockCode"].stringValue == "HOMEPAGE_BLOCK_STYLE_RCMD" {
                        listenData = obj
                    }
                }
            }

        }
    }
}
