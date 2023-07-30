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
        Text("xx")
//        if let bannerData = bannerSlideViewModel.bannerListData?.banners {
//            TabView(selection: $currentPage) {
//                ForEach(bannerData) { banner in
//                    AsyncImage(url: URL(string: banner.pic)) { image in
//                        images
//                            .resizable()
//                            .frame(width: 370)
//                            .scaledToFit()
//                            .cornerRadius(10)
//                    } placeholder: {
//                        // Placeholder image while loading
//                        Color.gray
//                    }
//                }
//            }
//            .frame(width: .infinity, height: 160)
//            .tabViewStyle(PageTabViewStyle())
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
//            .onReceive(timer) { _ in
//                if isAutoScrolling {
//                    let newIndex = (currentPage + 1) % bannerData.count
//                    withAnimation {
//                        currentPage = newIndex
//                    }
//                }
//            }
//            .gesture(
//                DragGesture()
//                    .onChanged { _ in
//                        // 用户手动滑动时暂停自动轮播
//                        isAutoScrolling = false
//                    }
//                    .onEnded { _ in
//                        // 用户停止滑动后继续自动轮播
//                        isAutoScrolling = true
//                    }
//            )
//        } else {
//            // 当没有数据时，显示默认的视图（例如一张默认图片或者加载指示器）
//            Color.gray
//                .frame(width: 370, height: 160)
//        }
    }
}


struct BannerSlideView_Previews: PreviewProvider {
    static var previews: some View {
        BannerSlideView()
    }
}
