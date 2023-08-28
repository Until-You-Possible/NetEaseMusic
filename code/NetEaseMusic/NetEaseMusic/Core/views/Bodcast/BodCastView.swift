//
//  BodCaseView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon


struct BodCastView: View {
    
    @ObservedObject var viewModel = EntrySlideViewModel()
    @State var isShowSideMenu = false
    @State var messageCount: Int = 0
    
    var body: some View {
        
        VStack () {
            
            //MARK: search areas
            HStack () {
                Text("搜索区域")
            }
            
            // MARK: some entry list
            HStack () {
                Text("部分入口区域")
            }
            
            // MARK: radio area
            VStack () {
                Text("电台区域(难点 重点")
            }
            
            // MARK: some recommendations list
            VStack () {
                Text("部分推荐内容，可以复用首页的推荐组建")
            }
            
            
        }
        .background(.gray)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                MenuButtonView()
            }
            ToolbarItem(placement: .principal) {
                HStack () {
                    Text("滚动标题区域")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "plus")
                    .background(.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .onTapGesture {
                        print("plus clicked")
                    }
            }
        }
    }
}





struct BodCaseView_Previews: PreviewProvider {
    static var previews: some View {
        BodCastView()
    }
}
