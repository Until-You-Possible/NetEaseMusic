//
//  SearchCenterView.swift
//  NetEaseMusic
//
//  Created by Ray on 2023/8/15.
//

import SwiftUI
import SwiftUIFontIcon

struct SearchCenterView: View {
    
    @State private var inputSearch: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        FontIcon.text(.materialIcon(code: .arrow_back),
                                      fontsize: 28, color: .black)
                    }
                    Spacer()
                    VStack {
                        TextField("请输入搜索内容", text: $inputSearch)
                            .frame(width: 240, height: 30)
                    }
                    .padding(.leading, 10) // Add padding to create the border
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 1) // Set border color and width
                    )
                    Spacer()
                    Button {
                        if inputSearch.isEmpty {
                            print("调用默认搜索接口")
                        } else {
                            print("携带参数调用搜索接口")
                        }
                    } label: {
                        Text("搜索")
                            .foregroundColor(Color.black)
                    }
                    .buttonStyle(PlainButtonStyle())

                }
                .padding(.horizontal)
                
                //MARK: different entry
                HStack () {
                    HStack(spacing: 1) {
                        FontIcon.text(.materialIcon(code: .person),
                                      fontsize: 24, color: .red)
                        Text("歌手")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    HStack(spacing: 1) {
                        FontIcon.text(.materialIcon(code: .speaker),
                                      fontsize: 24, color: .red)
                        Text("曲风")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    HStack(spacing: 1) {
                        FontIcon.text(.materialIcon(code: .stars),
                                      fontsize: 24, color: .red)
                        Text("专区")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                    Spacer()
                    HStack(spacing: 1) {
                        FontIcon.text(.materialIcon(code: .mic),
                                      fontsize: 24, color: .red)
                        Text("识曲")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                //MARK: searched history
                VStack () {
                    HStack () {
                        Text("搜索历史")
                            .font(.system(size: 14))
                        Spacer()
                        Button {
                            print("删除历史")
                        } label: {
                            FontIcon.text(.materialIcon(code: .delete),
                                          fontsize: 18, color: .gray)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                
                
                
                Spacer()
            }
            .background(Color(.systemGray5))
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationBarHidden(true)
        
    }
}

struct SearchCenterView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCenterView()
    }
}
