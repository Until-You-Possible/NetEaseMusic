//
//  DayRecommendSong.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI
import SwiftUIFontIcon

struct DayRecommendSongView: View {
    
    @ObservedObject var dayRecommendSongViewModel  = DayRecommendSongViewModel()

    var body: some View {
    
        ScrollView {

            LazyVStack {
                HStack {
                    Text("好的")
                }
                GeometryReader { reader -> AnyView in
                    let offset = reader.frame(in: .global).minY
//                    if -offset >= 0 {
//                        DispatchQueue.main.async {
//                            self.dayRecommendSongViewModel.offset = offset
//                        }
//                    }
                    
                    AnyView (
                        VStack(spacing: 0) {
                            Image("topSky")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                                .offset(y: (offset > 0 ? -offset : 0))
                        }
                            .frame(height: 250)
                        
                    )
                    
                }
                .frame(height: 200)
                
                Spacer()
                HStack {
                    FontIcon.text(.materialIcon(code: .play_circle_filled), fontsize: 26, color: Color.red)
                    Text("全部播放")
                        .fontWeight(.bold)
                    Spacer()
                    HStack {
                        FontIcon.text(.materialIcon(code: .update), fontsize: 26);
                        Spacer()
                            .frame(width: 30)
                        FontIcon.text(.materialIcon(code: .subject), fontsize: 26)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                .padding(.bottom)
                
                if let dayList = dayRecommendSongViewModel.dayListData?.array {
                    ForEach(dayList.indices, id: \.self) { index in
                        let current = dayList[index]
                        HStack () {
                            let picURL = URL(string: current["al"]["picUrl"].stringValue)
                            AsyncImage(url: picURL) { image in
                                image
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(4)
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 40, height: 40)
                            }
                            VStack (alignment: .leading, spacing: 5) {
                                Text(current["al"]["name"].stringValue)
                                    .fontWeight(.bold)
                                
                                HStack (spacing: 4) {
                                    
                                    if !current["recommendReason"].stringValue.isEmpty {
                                        Text(current["recommendReason"].stringValue)
                                            .font(.system(size: 10))
                                            .frame(height: 14)
                                            .padding([.leading, .trailing], 4)
                                            .fontWeight(.bold)
                                            .foregroundColor(.red)
                                            .background(.regularMaterial)
                                            .cornerRadius(4)
                                    }
                                    
                                    // 循环 AR (array) 里的name,也有可能不存在
                                    if let getAuthorInfoArray = current["ar"].array {
                                        ForEach (getAuthorInfoArray.indices, id: \.self) { index in
                                            let current_Inner_item = getAuthorInfoArray[index]
                                            HStack (spacing: 4) {
                                                Text(current_Inner_item["name"].stringValue)
                                                    .font(.system(size: 10))
                                                    .foregroundColor(.gray)
                                                if index != getAuthorInfoArray.count - 1 {
                                                    Text("/")
                                                        .font(.system(size: 10))
                                                        .foregroundColor(.gray)
                                                }
                                            }
                                        }
                                    }
                                    
                                }
                            }
                            Spacer()
                            FontIcon.text(.materialIcon(code: .more_vert), fontsize: 26, color: .gray)
                        }
                        .padding(.horizontal)
                        .padding([.bottom])
                    }
                } else {
                    Text("暂无数据")
                }

            }
        }
    }
}



struct DayRecommendSong_Previews: PreviewProvider {
    static var previews: some View {
        DayRecommendSongView()
    }
}
