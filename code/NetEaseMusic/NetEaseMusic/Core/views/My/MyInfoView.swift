//
//  MyInfoView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/17.
//

import SwiftUI
import SwiftUIFontIcon

struct InfoEntryType {
    var icon: SwiftUIFontIcon.MaterialIconCode
    var text: String
}





struct MyInfoView: View {
    
    @State var currentFocus: Int = 3
    @State var avatar: String = "topSky"
    let staticEntryList = [
        InfoEntryType(icon: .account_circle, text: "最近播放"),
        InfoEntryType(icon: .account_circle, text: "本地下载"),
        InfoEntryType(icon: .account_circle, text: "云盘"),
        InfoEntryType(icon: .account_circle, text: "已购"),
        InfoEntryType(icon: .account_circle, text: "我的好友"),
        InfoEntryType(icon: .account_circle, text: "收藏和赞"),
        InfoEntryType(icon: .account_circle, text: "我的播客"),
        InfoEntryType(icon: .account_circle, text: "交友")
    ]
    
    var body: some View {
        VStack  {
            VStack () {
                HStack (spacing: 0) {
                    FontIcon.text(.materialIcon(code: .menu), fontsize: 26)
                    Spacer()
                    HStack (spacing: 0) {
                        FontIcon.text(.materialIcon(code: .add), fontsize: 18)
                        Spacer()
                            .frame(width: 4)
                        Text("添加状态")
                            .font(.system(size: 14))
                    }
                    .frame(width: 100, height: 28)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.black)
                }
                .padding(.bottom, 60)
                
                //MARK: personal infomation
                VStack (spacing: 10) {
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
                }
                .frame(width: 350)
                .background(.white)
                .cornerRadius(20)
                .overlay {
                    HStack () {
                        if avatar.isEmpty {
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
                    .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                }
                .padding(.bottom, 30)
                
                //MARK: some entry
                
                VStack () {
                    HStack() {
                        VStack(spacing: 4) {
                            FontIcon.text(.materialIcon(code: .account_circle),
                                          fontsize: 40, color: .red)
                            Text("最近播放")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                        VStack(spacing: 4) {
                            FontIcon.text(.materialIcon(code: .account_circle),
                                          fontsize: 40, color: .red)
                            Text("最近播放")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                        VStack(spacing: 4) {
                            FontIcon.text(.materialIcon(code: .account_circle),
                                          fontsize: 40, color: .red)
                            Text("最近播放")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                        VStack(spacing: 4) {
                            FontIcon.text(.materialIcon(code: .account_circle),
                                          fontsize: 40, color: .red)
                            Text("最近播放")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        
                    }
                    .padding([.top, .bottom], 30)
                    HStack() {
                        VStack(spacing: 4) {
                            FontIcon.text(.materialIcon(code: .account_circle),
                                          fontsize: 40, color: .red)
                            Text("最近播放")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                        VStack(spacing: 4) {
                            FontIcon.text(.materialIcon(code: .account_circle),
                                          fontsize: 40, color: .red)
                            Text("最近播放")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                        VStack(spacing: 4) {
                            FontIcon.text(.materialIcon(code: .account_circle),
                                          fontsize: 40, color: .red)
                            Text("最近播放")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        Spacer()
                        VStack(spacing: 4) {
                            FontIcon.text(.materialIcon(code: .account_circle),
                                          fontsize: 40, color: .red)
                            Text("最近播放")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        
                    }
                    .padding([.bottom], 30)
                }
                .padding(.leading, 30)
                .padding(.trailing, 30)
                .background(.white)
                .cornerRadius(20)
                
                
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Color(.systemGray5))
    }
}

struct MyInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MyInfoView()
    }
}
