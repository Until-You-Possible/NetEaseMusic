//
//  RecommendationView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/3/3.
//

import SwiftUI
import SwiftUIFontIcon

struct RecommandationType: Identifiable  {

    var id = UUID()
    var imageURL: String
    var infoText: String
    
}

let url1 : String  = "https://p2.music.126.net/6_34Jf5YfizBLptYV8-h0g==/3397490930328962.jpg?param=140y140"
let url2 : String  = "https://p2.music.126.net/kZb9DO4vykqiYEx0HHx86w==/109951163065542645.jpg?param=140y140"
let url3 : String  = "https://p2.music.126.net/Jd43MfiwfYJYqDoDuKGsCA==/109951168297273562.jpg?param=140y140"

struct RecommendationView: View {

    
    // MARK: 在swift中 不能在属性初始话中使用其他实例成员。这里可以使用lazy来实现
    let recommendationList: [RecommandationType] = [
        RecommandationType(imageURL: url1, infoText: "民族风情 ｜ 万物生息凝结成东方的彩霞和云朵"),
        RecommandationType(imageURL: url2, infoText: "「80、90后回忆杀」曾经的你是否也会回忆起昨天"),
        RecommandationType(imageURL: url3, infoText: "8090后记忆")
    ]
    
    var body: some View {
        VStack () {
            HStack (spacing: -1) {
                Text("推荐歌单")
                FontIcon.text(.materialIcon(code: .chevron_right), fontsize: 26)
                Spacer()
                
            }
            ScrollView (.horizontal) {
                HStack {
                    ForEach(recommendationList) { current in
                        VStack () {
                            HStack () {
                                AsyncImage(url: URL(string: current.imageURL))
                                    .frame(width: 140, height: 140)
                                    .cornerRadius(10)
                            }
                            Text(current.infoText)
                                .font(.system(size: 12))
                                .lineLimit(2)
                        }
                        .frame(width: 140)
                    }

                }

            }
        }

    }
}

struct RecommendationView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationView()
    }
}
