//
//  RcmdCardView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/29.
//


import SwiftUI
import SwiftUIFontIcon
import SwiftyJSON

struct RcmdCardView: View {
    
    @State var currentSection: Int = 0
    
    var resourcesArray: [JSON]
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var isAutoScrolling = true
    @State private var currentBottomText = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            
            if resourcesArray.count == 1 {
                ForEach(resourcesArray, id:  \.dictionaryValue["resourceId"]?.intValue) { item in
                    let bottomTextTitle = item["uiElement"]["mainTitle"]["title"].stringValue
                    let coverImageURL = item["uiElement"]["image"]["imageUrl"].stringValue
                    VStack () {
                        HStack () {
                            AsyncImage(url: URL(string: coverImageURL)) { image in
                                image
                                    .resizable()
                                    .frame(width: 140, height: 140)
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
                                Text("23w")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 12))
                                    .offset(
                                        x: -10,
                                        y: 10
                                    )
                            },
                            alignment: .topTrailing
                        )
                        
                        Text(bottomTextTitle)
                            .frame(width: 140)
                            .font(.system(size: 12))
                            .lineLimit(2)
                    }
                }
            }
            
            if resourcesArray.count > 1 {
                VStack () {
                    TabView (selection: $currentSection) {
                        ForEach(resourcesArray, id:  \.dictionaryValue["resourceId"]?.intValue) { item in
                            let currentBottomText = item["uiElement"]["mainTitle"]["title"].stringValue
                            let coverImageURL = item["uiElement"]["image"]["imageUrl"].stringValue
                            HStack () {
                                AsyncImage(url: URL(string: coverImageURL)) { image in
                                    image
                                        .resizable()
                                        .rotationEffect(.degrees(-90))
                                        .frame(width: 140, height: 140)
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
                                    Text("23w")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 12))
                                        .offset(
                                            x: -10,
                                            y: 10
                                        )
                                },
                                alignment: .topTrailing
                            )
                        }
                    }
                    .frame(width: 140, height: 140)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .rotationEffect(.degrees(90))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                    .background(.red)
//                    .onReceive(timer) { _ in
//                        let currentResourcesArray = resourcesArray // Save the current value
//                        if isAutoScrolling {
//                            let newIndex = (currentSection + 1) % 3
//                            print("new index ", newIndex)
//                            withAnimation {
//                                currentSection = newIndex
//                            }
//                        }
//                    }
                    
                    Text("这里是一些文字这里是一些文字这里是一些文字这里是一些文字")
                        .frame(width: 140)
                        .font(.system(size: 12))
                        .lineLimit(2)
                }
            }
        }
    }
}

struct RcmdCardView_Previews: PreviewProvider {
    static var previews: some View {
        RcmdCardView(resourcesArray: [])
    }
}
