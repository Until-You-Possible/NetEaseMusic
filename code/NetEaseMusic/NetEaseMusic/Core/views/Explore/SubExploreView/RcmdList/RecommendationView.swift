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
                            VStack () {
                                HStack () {
                                    AsyncImage(url: URL(string: current["uiElement"]["image"]["imageUrl"].stringValue)) { image in
                                        image
                                            .resizable()
                                            .frame(width: 140, height: 140)
                                            .cornerRadius(10)
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 140, height: 140)
                                    }
                                }
                                .overlay (
                                    FontIcon.text(.materialIcon(code: .play_circle_filled),
                                                  fontsize: 26, color: Color.gray)
                                    .offset(x: -10, y: -10),
                                    alignment: .bottomTrailing
                                )
                                .overlay (
                                    HStack {
                                        Text("456万")
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 12))
                                            .offset(
                                                x: -10,
                                                y: 10
                                            )
                                    },
                                    alignment: .topTrailing
                                )
                                
                                Text(current["uiElement"]["mainTitle"]["title"].stringValue)
                                    .font(.system(size: 12))
                                    .lineLimit(2)
                            }
                            .frame(width: 140)
                        }

                    }

                }
            }
            else {
                ProgressView()
                    .frame(height: 140)
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
