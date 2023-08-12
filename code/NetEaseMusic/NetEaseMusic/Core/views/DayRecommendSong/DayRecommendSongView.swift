//
//  DayRecommendSong.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/9.
//

import SwiftUI
import SwiftUIFontIcon

struct DayRecommendSongView: View {
    
    @State private var currentOffset: CGFloat = 0
    @StateObject var dayRecommendSongViewModel  = DayRecommendSongViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                        // Mark: top image (change size when scrolling)
                        ZStack (alignment: .bottomLeading) {
                            GeometryReader { reader -> AnyView in
                                let offset = reader.frame(in: .global).minY
                                if -offset >= 0 {
                                    DispatchQueue.main.async {
                                        self.dayRecommendSongViewModel.offset = -offset
                                    }
                                }
                                return AnyView (
                                    VStack(spacing: 0) {
                                            Image("sky_resized")
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: UIScreen.main.bounds.width, height: 250 + (offset > 0 ? offset : 0))
                                                .cornerRadius(2)
                                                .offset(y: (offset > 0 ? -offset : 0))
                                    }
                                )

                            }
                            VStack (alignment: .leading, spacing: 0) {
                                HStack (alignment: .lastTextBaseline) {
                                    Text("\(BaseTools.getCurrentDay())")
                                        .foregroundColor(.white)
                                        .font(.system(size: 40))
                                        .fontWeight(.bold)
                                    Text("/")
                                        .foregroundColor(.white)
                                    let currentMonth = BaseTools.getCurrentMonth()
                                    let formattedMonth = currentMonth < 10 ? "0\(currentMonth)" : "\(currentMonth)"
                                    Text(formattedMonth)
                                        .foregroundColor(.white)

                                }
                                HStack (spacing: 0) {
                                    Text("查看今日运势")
                                        .foregroundColor(.white)
                                        .font(.system(size: 14))
                                    FontIcon.text(.materialIcon(code: .chevron_right),
                                                  fontsize: 26, color: .white)
                                    Spacer()
                                    ZStack () {
                                        Color.gray
                                            .opacity(0.6)
                                            .frame(width: 100, height: 30)
                                            .cornerRadius(20)
                                        Text("历史日推")
                                            .foregroundColor(.white)
                                            .font(.system(size: 14))
                                    }
                                }
                                .padding(.trailing, 20)

                            }
                            .padding([.leading, .bottom], 20)

                        }
                        .onPreferenceChange(OffsetPreferenceKey.self) { newOffset in
                            let scrollOffset = newOffset
                            self.currentOffset = scrollOffset
                        }
                        
                        .frame(height: 250)
                        
                        //MARK: list content (including section)
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
            }
            
            .overlay(
                Color.white
                       .frame(height: UIApplication.shared.connectedScenes
                                           .compactMap { $0 as? UIWindowScene }
                                           .first?.windows.first?.safeAreaInsets.top)
                       .ignoresSafeArea(.all, edges: .top)
                       .opacity(dayRecommendSongViewModel.offset > 200 ? 1 : 0),
                   alignment: .top
            )
            .environmentObject(dayRecommendSongViewModel)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .onPreferenceChange(OffsetPreferenceKey.self) { _ in
            updateNavBarAppearance()
        }
        .toolbar {
            // 在导航栏中添加一个按钮
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    // 在此处添加按钮的操作
                }) {
                    FontIcon.text(.materialIcon(code: .arrow_back),
                                  fontsize: 28, color: .white)
                }
            }
            // MARK: center control buttons
            ToolbarItem(placement: .principal) {
                    ZStack () {
                        Color.gray
                            .opacity(0.6)
                            .frame(width: 160, height: 30)
                            .cornerRadius(20)
                        HStack (spacing: 26) {
                            Text("默认推荐")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                            Text("风格推荐")
                                .foregroundColor(.white)
                                .font(.system(size: 12))
                        }
                    }

                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // 在此处添加按钮的操作
                }) {
                    FontIcon.text(.materialIcon(code: .more_vert),
                                  fontsize: 28, color: .white)
                }
            }
        }
        
    }
    private func updateNavBarAppearance() {
        print("updateNavBarAppearance")
        print("currentOffset", currentOffset)
        let navBarAppearance = UINavigationBarAppearance()
            
        if currentOffset > 100 {
            print("currentOffset", currentOffset)
                navBarAppearance.backgroundImage = UIImage(named: "sky_resized")
            }
            
            UINavigationBar.appearance().standardAppearance = navBarAppearance
            UINavigationBar.appearance().compactAppearance = navBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        }
}

struct OffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}


struct DayRecommendSong_Previews: PreviewProvider {
    static var previews: some View {
        DayRecommendSongView()
    }
}
