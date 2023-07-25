//
//  BodCaseView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI


struct BodCastView: View {
//
//    private let codeLength = 4 // 短信验证码的长度
////    @State private var code: String = "2468"
//    @State private var codes: [String] = ["1", "2", "3", "4"]
//    @FocusState private var focusedField: Int? // Track the focused input box
//
//    var body: some View {
//        HStack(spacing: 16) {
//            ForEach(0..<codeLength, id: \.self) { index in
//                TextField("", text: $codes[index])
//                    .font(.title)
//                    .frame(width: 40, height: 40)
//                    .multilineTextAlignment(.center)
//                    .textFieldStyle(RoundedBorderTextFieldStyle())
//                    .keyboardType(.numberPad)
//                    .focused($focusedField, equals: index) // Set focus on the input box with the same index
//            }
//        }
//        .padding()
//    }
    @State private var currentPage = 0
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var isAutoScrolling = true

    var body: some View {
        TabView(selection: $currentPage) {
            ForEach(0..<imageNames.count, id: \.self) { index in
                AsyncImage(url: URL(string: imageNames[index])) { image in
                    image
                        .resizable()
                        .frame(width: 400, height: 300)
                        .scaledToFit()
                } placeholder: {
                    // Placeholder image while loading
                    Color.black
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
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
    // 示例图片名称数组
    let imageNames = ["https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b00e0e5a0369461994f78c183b2123ca~tplv-k3u1fbpfcp-watermark.image?", "https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b00e0e5a0369461994f78c183b2123ca~tplv-k3u1fbpfcp-watermark.image?", "https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b00e0e5a0369461994f78c183b2123ca~tplv-k3u1fbpfcp-watermark.image?", "https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/b00e0e5a0369461994f78c183b2123ca~tplv-k3u1fbpfcp-watermark.image?"]
    
}





struct BodCaseView_Previews: PreviewProvider {
    static var previews: some View {
        BodCastView()
    }
}
