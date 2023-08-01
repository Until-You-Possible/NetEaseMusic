//
//  BannerSlideViewModel.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/7/30.
//

import Foundation
import SwiftUI
import SwiftyJSON



class BannerSlideViewModle: ObservableObject {
    
    var dataRequestModel = DataRequestViewModel()
    @Published var isLoading      : Bool = true
    @Published var error          : Error?
    @Published var bannerAllData  : JSON?
    
    init() {
        self.getBannerData()
    }
    
    func getBannerData() {
        let url = "https://arthur-music-api.vercel.app/banner?type=2"
        dataRequestModel.fetchData(url: url) { ( data, error, isLoading) in
            print("Error:\(String(describing: error?.localizedDescription))")
            self.isLoading = isLoading 
            self.error = error
            self.bannerAllData = data
        }
    }
}
