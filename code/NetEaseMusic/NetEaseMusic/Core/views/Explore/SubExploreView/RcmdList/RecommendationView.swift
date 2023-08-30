//
//  RecommendationView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/3/3.
//

import SwiftUI
import SwiftUIFontIcon


struct RecommendationView: View {
    
    @ObservedObject var rcmdSong = RecommendationViewModel()

    
    var body: some View {
        VStack () {
            HStack (spacing: -1) {
                if let title = rcmdSong.rcmdData?["uiElement"]["subTitle"]["title"].stringValue {
                    Text(title)
                }

                FontIcon.text(.materialIcon(code: .chevron_right), fontsize: 26)
                Spacer()
                
            }
            if let listData = rcmdSong.rcmdData?["creatives"].arrayValue {
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(listData, id: \.dictionaryValue["creativeId"]?.intValue) { current in
                            let currentResources = current["resources"]
                            RcmdCardView(resourcesArray: currentResources.array ?? [])
                        }

                    }
                }
            }
            else {
                ProgressView()
            }
        }
        .onAppear() {
            rcmdSong.getRcmdSongList()
        }
        .padding(.horizontal)

    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
