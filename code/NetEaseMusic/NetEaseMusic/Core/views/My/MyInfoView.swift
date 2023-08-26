//
//  MyInfoView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/17.
//

import SwiftUI
import SwiftUIFontIcon

struct InfoEntryType {
    let icon: String
    var text: String
}

struct MyInfoView: View {
    
    @State var currentFocus: Int = 3
    @State var isLogin: Bool = false
    @State var currentSection: Int = 1
    
    let staticEntryList = [
        InfoEntryType(icon: "play.circle.fill", text: "最近播放"),
        InfoEntryType(icon: "square.and.arrow.down.fill", text: "本地下载"),
        InfoEntryType(icon: "opticaldiscdrive.fill", text: "云盘"),
        InfoEntryType(icon: "square.and.arrow.up.circle.fill", text: "已购"),
        InfoEntryType(icon: "teddybear.fill", text: "我的好友"),
        InfoEntryType(icon: "graduationcap.circle.fill", text: "收藏和赞"),
        InfoEntryType(icon: "livephoto", text: "我的播客"),
        InfoEntryType(icon: "figure.mind.and.body", text: "交友")
    ]
    
    var body: some View {
        ScrollView {
            VStack  {
                VStack () {
                    
                    //MARK: personal infomation
                    VStack (spacing: 10) {
                        if isLogin {
                            
                            HStack() {
                                Text("小南")
                                    .font(.system(size: 24))
                                    .fontWeight(.bold)
                                Text("Arthur")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                Text("VIP")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color.gray )
                            }
                            .padding(.top, 60)
                            HStack () {
                                Text("\(currentFocus)  关注")
                                Text("\(currentFocus)  粉丝")
                                Text("LV.7")
                            }
                            .padding(.bottom, 30)
                        } else {
                            Text("立即登录")
                                .font(.system(size: 20))
                                .onTapGesture {
                                    print("立即登录")
                                }
                                .padding(.top)
                        }
                    }
                    .frame(width: 350, height: 160)
                    .background(.white)
                    .cornerRadius(20)
                    .overlay {
                        HStack () {
                            if !isLogin {
                                FontIcon.text(.materialIcon(code: .account_circle),
                                              fontsize: 100, color: .gray)
                            } else {
                                Image("topSky")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(50)
                                
                            }
                            
                        }
                        .frame(width: 100, height: 100)
                        .overlay(
                            RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .offset(x: 0, y: -80)
                        .shadow(color: Color.gray, radius: 5, x: 0, y: 3)
                    }
                    .padding(.bottom, 16)
                    
                    //MARK: some entry
                    VStack () {
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 60))]) {
                            ForEach(staticEntryList, id: \.icon) { list in
                                VStack(spacing: 8) {
                                    Image(systemName: list.icon)
                                        .foregroundColor(.red)
                                        .font(.system(size: 30))
                                        .frame(width: 36, height: 36)
                                    Text(list.text)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                }
                            }
                        }
                        
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .background(.white)
                    .cornerRadius(20)
                    
                    // MARK: personal songs and collcet
                    VStack () {
                        LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                            
                            Section(header: HeaderTabView()) {
                                
                                VStack (alignment: .leading) {
                                    HStack () {
                                        Text("创建歌单")
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                        Spacer()
                                        HStack {
                                            Image(systemName: "plus")
                                                .foregroundColor(.gray)
                                            Spacer()
                                                .frame(width: 20)
                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding()
                                    HStack () {
                                        Image(systemName: "square.and.arrow.up.on.square.fill")
                                            .font(.system(size: 40))
                                            .foregroundColor(.gray)
                                        Text("一键导入外部音乐")
                                            .foregroundColor(.gray)
                                    }
                                    .padding(.bottom, 30)
                                    .padding(.leading, 20)
                                    
                                }
                                .background(.white)
                                .cornerRadius(20)
                                Spacer()
                                    .frame(height: 30)
                                VStack (alignment: .leading) {
                                    HStack () {
                                        Text("收藏歌单")
                                            .font(.system(size: 14))
                                            .foregroundColor(.gray)
                                        Spacer()
                                        HStack {                                            Image(systemName: "ellipsis")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .padding()
                                    if isLogin {
                                        
                                    } else {
                                        HStack () {
                                            Spacer()
                                            Text("暂无收藏歌单")
                                                .foregroundColor(.gray)
                                            Spacer()
                                        }
                                        .padding(.bottom, 30)
                                        .padding(.leading, 20)
                                    }
                                    
                                }
                                .background(.white)
                                .cornerRadius(20)
                                
                            }
                            
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 60)
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .background(Color(.systemGray5))
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                FontIcon.text(.materialIcon(code: .menu), fontsize: 26)
                
            }
            ToolbarItem(placement: .principal) {
                HStack (spacing: 0) {
                    HStack(spacing: 0) {
                        FontIcon.text(.materialIcon(code: .add), fontsize: 18)
                        Spacer()
                            .frame(width: 4)
                        Text("添加状态")
                            .font(.system(size: 14))
                    }
                }
                
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
            }
        }
    }
    
}
struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
