//
//  RcmdCardView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/29.
//


import SwiftUI
import SwiftUIFontIcon

struct RcmdCardView: View {
    // imaged的url
    // 宽高
    // 文字
    // 播放量
    var cardImgURL  : String
    var cardWidth   : CGFloat?
    var cardHeight  : CGFloat?
    var bottomText  : String
    var playedCount : String
    
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack () {
                AsyncImage(url: URL(string: cardImgURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                } placeholder: {
                    ProgressView()
                        .frame(width: 140, height: 140)
                        .border(.gray, width: 1)
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
                    Text(playedCount)
                        .foregroundColor(Color.white)
                        .font(.system(size: 12))
                        .offset(
                            x: -10,
                            y: 10
                        )
                },
                alignment: .topTrailing
            )
            
            Text(bottomText)
                .frame(width: cardWidth)
                .font(.system(size: 12))
                .lineLimit(2)
        }
        .frame(width: (cardWidth != nil) ? cardWidth : UIScreen.main.bounds.width)
    }
}

struct RcmdCardView_Previews: PreviewProvider {
    static var previews: some View {
        RcmdCardView(cardImgURL: "", cardWidth: 140, cardHeight: 140, bottomText: "", playedCount: "")
    }
}
