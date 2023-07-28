//
//  BannerSlideView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/3/3.
//

import SwiftUI

struct BannerSlideView: View {
    
    @State private var currentPage = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var isAutoScrolling = true
    // 示例图片名称数组
    let imageNames = ["https://p1.music.126.net/GW6DbEFpmUQ4IZLWARO-RA==/109951168769739666.jpg?imageView&quality=89", "https://p1.music.126.net/tyXgxJdsg9_qlOAmt1KUhQ==/109951168769746278.jpg?imageView&quality=89", "https://p1.music.126.net/tjSpBG-iM5-jfh6czGL2Hw==/109951168769729502.jpg?imageView&quality=89", "https://p1.music.126.net/CDhlKso5n5tq23qIAGjiQQ==/109951168770370358.jpg?imageView&quality=89"]
    
    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<imageNames.count, id: \.self) { index in
                AsyncImage(url: URL(string: imageNames[index])) { image in
                    image
                        .resizable()
                        .frame(width: 370)
                        .scaledToFit()
                        .cornerRadius(10)
                } placeholder: {
                    // Placeholder image while loading
                    Color.gray
                }
            }
        }
        .frame(width: .infinity, height: 160)
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
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

struct BannerSlideView_Previews: PreviewProvider {
    static var previews: some View {
        BannerSlideView()
    }
}
