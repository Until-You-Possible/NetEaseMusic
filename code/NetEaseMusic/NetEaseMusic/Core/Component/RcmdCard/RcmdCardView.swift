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
    
    @State private var currentSection = 0
    @State private var bottomTextArray: [String] = []
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
                            createAsyncImage(url: coverImageURL)
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
                        ForEach(0..<resourcesArray.count, id:  \.self) { index in
                            let item = resourcesArray[index]
                            let coverImageURL = item["uiElement"]["image"]["imageUrl"].stringValue
                            HStack () {
                                createAsyncImage(url: coverImageURL, rotation: -90)
                            }
                            .tag(index)
                        }
                    }
                    .frame(width: 140, height: 140)
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .tabViewStyle(PageTabViewStyle())
                    .rotationEffect(.degrees(90))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                    .cornerRadius(10)
                    .onAppear() {
                        if (currentSection == 0) {
                            currentBottomText = resourcesArray[0]["uiElement"]["mainTitle"]["title"].stringValue
                        }
                    }
                    .onChange(of: currentSection) { newSection in
                        if newSection >= 0 && newSection < resourcesArray.count {
                            currentBottomText = resourcesArray[newSection]["uiElement"]["mainTitle"]["title"].stringValue
                        }
                    }
                    .onReceive(timer) { _ in
                        if isAutoScrolling {
                            let newIndex = (currentSection + 1) % 3
                            print("new index ", newIndex)
                            withAnimation {
                                currentSection = newIndex
                            }
                        }
                    }
                    
                    Text(currentBottomText)
                        .frame(width: 140)
                        .font(.system(size: 12))
                        .lineLimit(2)
                }
            }
            
            
        }
    }
    
    private func createAsyncImage(url: String, rotation: Double = 0) ->some View {
        AsyncImage(url: URL(string: url)) { image in
            image
                .resizable()
                .rotationEffect(.degrees(rotation))
                .frame(width: 140, height: 140)
                .cornerRadius(10)

        } placeholder: {
            ProgressView()
                .frame(width: 140, height: 140)
                .border(.gray, width: 1)
        }
    }
}

struct RcmdCardView_Previews: PreviewProvider {
    static var previews: some View {
        RcmdCardView(resourcesArray: [])
    }
}
