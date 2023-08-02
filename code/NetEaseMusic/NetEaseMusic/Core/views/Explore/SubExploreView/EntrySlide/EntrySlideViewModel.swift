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
    @Published var entryList: JSON?
    
    init () {
        self.getEntrySlide()
    }
    
    func getEntrySlide() {
        let url = "https://arthur-music-api.vercel.app/homepage/dragon/ball"
        dataRequestModel.fetchData(url: url) { (data, error, isLoading) in
            self.entryList = data
        }
    }
}
