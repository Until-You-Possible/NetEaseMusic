//
//  EntrySlideView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/3/3.
//

import SwiftUI
import SwiftUIFontIcon

struct EntrySlideView: View {
    @State private var currentPage = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var isAutoScrolling = true
    // 示例图片名称数组
    let imageNames = ["https://p1.music.126.net/GW6DbEFpmUQ4IZLWARO-RA==/109951168769739666.jpg?imageView&quality=89", "https://p1.music.126.net/tyXgxJdsg9_qlOAmt1KUhQ==/109951168769746278.jpg?imageView&quality=89"]
    
    var body: some View {
        
        TabView(selection: $currentPage) {
            ForEach(0..<imageNames.count, id: \.self) { index in
                HStack () {
                    VStack (spacing: 8) {
                        FontIcon.text(.materialIcon(code: .today), fontsize: 30, color: .red)
                        Text("每日推荐")
                            .font(.system(size: 12))
                    }
                    Spacer()
                        .frame(width: 30)
                    VStack (spacing: 8) {
                        FontIcon.text(.materialIcon(code: .radio), fontsize: 30, color: .red)
                        Text("私人漫游")
                            .font(.system(size: 12))
                    }
                    Spacer()
                        .frame(width: 30)
                    VStack (spacing: 8) {
                        FontIcon.text(.materialIcon(code: .polymer), fontsize: 30, color: .red)
                        Text("歌单")
                            .font(.system(size: 12))
                    }
                    Spacer()
                        .frame(width: 30)
                    VStack (spacing: 8) {
                        FontIcon.text(.materialIcon(code: .playlist_add_check), fontsize: 30, color: .red)
                        Text("排行榜")
                            .font(.system(size: 12))
                    }
                    Spacer()
                        .frame(width: 30)
                    VStack (spacing: 8) {
                        FontIcon.text(.materialIcon(code: .tv), fontsize: 30, color: .red)
                        Text("直播")
                            .font(.system(size: 12))
                    }
                }
            }
        }
        .frame(width: .infinity, height: 80)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onReceive(timer) { _ in
            let newIndex = (currentPage + 1) % imageNames.count
            withAnimation {
                currentPage = newIndex
            }
        }
        .gesture(
            DragGesture()
                .onChanged { _ in
                    // 用户手动滑动时暂停自动轮播
                    isAutoScrolling = false
                }
                .onEnded { _ in
                    // 用户停止滑动后继续自动轮播
                    isAutoScrolling = true
                }
        )
    }
}

struct EntrySlideView_Previews: PreviewProvider {
    static var previews: some View {
        EntrySlideView()
    }
}
