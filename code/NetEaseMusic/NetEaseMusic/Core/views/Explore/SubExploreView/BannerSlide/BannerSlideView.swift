//
//  BannerSlideView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/3/3.
//

import SwiftUI

struct BannerSlideView: View {
    
    @ObservedObject var bannerSlideViewModel = BannerSlideViewModle()
    @State private var currentPage = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var isAutoScrolling = true

    var body: some View {
        if let banners = bannerSlideViewModel.bannerAllData?["banners"].array {
            TabView(selection: $currentPage) {
                ForEach(0..<banners.count, id: \.self) { index in
                    let banner = banners[index]
                    if let picURLString = banner["pic"].string,
                       let picURL = URL(string: picURLString) {
                        AsyncImage(url: picURL) { image in
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
            }
            .frame(width: .infinity, height: 160)
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .onReceive(timer) { _ in
                if isAutoScrolling {
                    let newIndex = (currentPage + 1) % banners.count
                    withAnimation {
                        currentPage = newIndex
                    }
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
        } else {
            // 当没有数据时，显示默认的视图（例如一张默认图片或者加载指示器）
            Color.gray
                .frame(width: 370, height: 160)
        }
    }
}



struct BannerSlideView_Previews: PreviewProvider {
    static var previews: some View {
        BannerSlideView()
    }
}
