//
//  AllListenView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/13.
//

import SwiftUI
import SwiftUIFontIcon

struct AllListenView: View {
    
    @ObservedObject var listtenDataModel = AllListenViewModel()
    @State private var currentPage = 0
    
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack (spacing: -1) {
                if let titleName = listtenDataModel.listenData?["uiElement"]["subTitle"]["title"].string {
                    Text(titleName)
                        .font(.system(size: 16))
                }
                FontIcon.text(.materialIcon(code: .chevron_right), fontsize: 26)
                Spacer()
            }
            .padding(.horizontal)
            
            //MARK: content list
            TabView (selection: $currentPage) {
                if let wrapList = listtenDataModel.listenData?["creatives"].arrayValue {
                    ForEach (0..<wrapList.count, id: \.self) { index in
                        let outCurrent = wrapList[index]
                        VStack () {
                            if let innerResources = outCurrent["resources"].array {
                                ForEach (innerResources, id: \.dictionaryValue["resourceId"]?.stringValue) { innerCurrent in
                                    HStack () {
                                        AsyncImage(url: URL(string: innerCurrent["uiElement"]["image"]["imageUrl"].stringValue)) { image in
                                            image
                                                .resizable()
                                                .frame(width: 80, height: 80)
                                                .cornerRadius(4)
                                        } placeholder: {
                                            ProgressView()
                                                .frame(width: 80, height: 80)
                                        }
                                        VStack(alignment: .leading) {
                                            Text(innerCurrent["uiElement"]["mainTitle"]["title"].stringValue)
                                                .fontWeight(.bold)
                                            
                                            HStack() {
                                                Text(innerCurrent["uiElement"]["subTitle"]["title"].stringValue)
                                                    .font(.system(size: 10))
                                                    .frame(height: 14)
                                                    .padding([.leading, .trailing], 4)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.red)
                                                    .background(.regularMaterial)
                                                    .cornerRadius(4)
                                                    .layoutPriority(1)
                                                if let songInfos = innerCurrent["resourceExtInfo"]["artists"].array {
                                                    ForEach (songInfos.indices, id: \.self) { songIndex in
                                                        let songCurrent = songInfos[songIndex]
                                                        HStack (spacing: 4) {
                                                            Text(songCurrent["name"].stringValue)
                                                                .font(.system(size: 10))
                                                                .foregroundColor(.gray)
                                                            if songIndex != songInfos.count - 1 {
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
                                        FontIcon.text(.materialIcon(code: .play_circle_outline),
                                                      fontsize: 26, color: .gray)
                                    }
                                    .padding(.horizontal)
                                }
                            }

                        }
                        .frame(width: UIScreen.main.bounds.width)
                    }
                }

            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            .frame(width: UIScreen.main.bounds.width, height: 240)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            
        }
        .padding(.top, 24)
    }
}

struct AllListenView_Previews: PreviewProvider {
    static var previews: some View {
        AllListenView()
    }
}
