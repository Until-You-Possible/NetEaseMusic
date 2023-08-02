//
//  EntrySlideView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/3/3.
//

import SwiftUI
import SwiftUIFontIcon

struct EntryType: Identifiable, Hashable {
    var id = UUID()
    var code: SwiftUIFontIcon.MaterialIconCode
    var text: String
}

struct EntrySlideView: View {
    
    @State private var currentPage = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var isAutoScrolling = true
    
    let entryList: [EntryType] = [
        EntryType(code: .today, text: "每日推荐"),
        EntryType(code: .radio, text: "私人漫游"),
        EntryType(code: .polymer, text: "歌单"),
        EntryType(code: .playlist_add_check, text: "排行榜"),
        EntryType(code: .tv, text: "直播")
    ]
    
    var body: some View {
        
        TabView(selection: $currentPage) {
            ForEach(0..<2, id: \.self) { index in
                HStack () {
                    
                    ForEach(entryList.indices, id: \.self) { index in
                        let entry = entryList[index]
                        if index != 0 && index != 5 {
                            Spacer()
                                .frame(width: 30)
                        }
                        VStack (spacing: 10) {
                            FontIcon.text(.materialIcon(code: entry.code), fontsize: 30, color: .red)
                            Text(entry.text)
                                .font(.system(size: 12))

                        }
                    }
                }
            }
        }
        .frame(width: .infinity, height: 80)
        .tabViewStyle(.page(indexDisplayMode: .never))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
        .onReceive(timer) { _ in
            let newIndex = (currentPage + 1) % 2
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
