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
                
                ForEach(0..<80) { index in
                    Text("xxx")
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
