//
//  BodCaseView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon


struct CategoryEntry {
    var name: String
}

let CategoryEngtryList = [
    CategoryEntry(name: "我的播客"),
    CategoryEntry(name: "全部分类"),
    CategoryEntry(name: "排行榜"),
    CategoryEntry(name: "宝藏播客"),
    CategoryEntry(name: "助眠解压"),
    CategoryEntry(name: "广播电台")
]


struct BodCastView: View {
    
    @ObservedObject var viewModel = EntrySlideViewModel()
    @State var isShowSideMenu = false
    @State var messageCount: Int = 0
    
    var body: some View {
        
        VStack () {
            
            //MARK: search areas
            
            NavigationLink {
                SearchCenterView()
            } label: {
                HStack () {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                    Text("搜索区域")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .frame(width: 360, height: 40)
                .background(Color(hex: "#f2f3f6"))
                .cornerRadius(40)
            }
            
            // MARK: some entry list
            ScrollView (.horizontal) {
                HStack () {
                    ForEach(CategoryEngtryList, id: \.name) { list in
                        HStack () {
                            /*@START_MENU_TOKEN@*/Text(list.name)/*@END_MENU_TOKEN@*/
                        }
                        .padding(10)
                        .cornerRadius(6)
                        .border(Color(.systemGray5), width: 1)
                    }
                }
            }
            .padding(.leading)
            .padding(.top, 20)
            .padding(.bottom, 20)
            
            
            // MARK: radio area
            VStack () {
                Text("电台区域(难点 重点")
            }
            .frame(width: UIScreen.main.bounds.width, height: 200)
            .border(.gray, width: 1)
            
            // MARK: some recommendations list
            VStack () {
                Text("部分推荐内容，可以复用首页的推荐组建")
            }
            
            Spacer()
        }
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
