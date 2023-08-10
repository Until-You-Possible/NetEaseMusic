//
//  DayRecommendSong.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI
import SwiftUIFontIcon

struct DayRecommendSongView: View {
    
    @StateObject var dayRecommendSongViewModel  = DayRecommendSongViewModel()

    var body: some View {
        ScrollView {
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                // Mark: top image (change size when scrolling)
                GeometryReader { reader -> AnyView in
                    let offset = reader.frame(in: .global).minY
                    if -offset >= 0 {
                        DispatchQueue.main.async {
                            self.dayRecommendSongViewModel.offset = offset
                        }
                    }
                    
                    return AnyView (
                        VStack(spacing: 0) {
                                Image("topSky")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: UIScreen.main.bounds.width, height: 350 + (offset > 0 ? offset : 0))
                                    .cornerRadius(2)
                                    .offset(y: (offset > 0 ? -offset : 0))
                        }
                        .frame(height: 350)
                    )

                }
                .frame(height: 350)

                Section (header: SectionHeaderView()) {
                    //MARK: list content
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
                                                .layoutPriority(1)
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
                                                .lineLimit(1)
                                            }
                                        }
                                        
                                    }
                                }
                                Spacer()
                                HStack {
                                    FontIcon.text(.materialIcon(code: .play_circle_outline),
                                                  fontsize: 26, color: .gray)
                                    FontIcon.text(.materialIcon(code: .more_vert), fontsize: 26, color: .gray)
                                }

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
//        .overlay(
//            Color.white
//                .frame(height: 100),
//            alignment: .top
//        )
    }
}



struct DayRecommendSong_Previews: PreviewProvider {
    static var previews: some View {
        DayRecommendSongView()
    }
}
