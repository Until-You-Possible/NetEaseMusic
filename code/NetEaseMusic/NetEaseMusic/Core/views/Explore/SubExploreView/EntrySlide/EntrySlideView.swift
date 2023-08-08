//
//  EntrySlideView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/3/3.
//

import SwiftUI
import SwiftUIFontIcon
import Kingfisher

struct EntryType: Identifiable, Hashable {
    var id = UUID()
    var code: SwiftUIFontIcon.MaterialIconCode
    var text: String
}


struct EntrySlideView: View {
    
    @ObservedObject var entrySildeViewModel = EntrySlideViewModel()
    @State private var currentPage = 0
    private let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var isAutoScrolling = true
    
    var body: some View {
        
        if let entryChunkArray = entrySildeViewModel.entryData?["data"].array {
            let slicedArrayPrefix = entryChunkArray.prefix(5)
            let slicedArraySuffix = entryChunkArray.suffix(5)
            let twoDArray = [slicedArrayPrefix, slicedArraySuffix]
            TabView(selection: $currentPage) {
                ForEach(twoDArray.indices, id: \.self) { index in
                    let current = twoDArray[index]
                    HStack {
                        ForEach(current.indices, id: \.self) { innerIndex in
                            let innerCurrent = current[innerIndex]
                            let currentID = current[innerIndex]["id"]
                            VStack () {
                                HStack {
                                    AsyncImage(url: URL(string: innerCurrent["iconUrl"].stringValue)) { image in
                                               image
                                                   .resizable()
                                                   .colorMultiply(.red)
                                                   .frame(width: 60, height: 60)
                                                   .scaledToFit()
                                                   .overlay {
                                                       Group {
                                                           if currentID == -1 {
                                                               Text("8")
                                                                   .foregroundColor(.white)
                                                                   .font(.system(size: 14))
                                                                   .offset(x: 0, y: 2)
//                                                               Text("Today's Date: \(entrySildeViewModel.getTodayDate())")
                                                           }
                                                       }
                                                   }

                                           } placeholder: {
                                               // Placeholder 视图
                                               ProgressView()
                                           }
                                }

                                Text(innerCurrent["name"].stringValue)
                                    .font(.system(size: 12))
                            }
                        }
                    }
                }
            }
            .frame(width: .infinity, height: 120)
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
        } else {
            ProgressView()
        }

        
    
    }
}

struct EntrySlideView_Previews: PreviewProvider {
    static var previews: some View {
        EntrySlideView()
    }
}
