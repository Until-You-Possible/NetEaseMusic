//
//  LoginWithNumber.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/10.
//

import SwiftUI

struct LoginWithNumber: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var currentPhoneNumber = "";
    @State var showAllDistrictsInfo = false
    
    init() {
        if let data = FileLoader.readLocalFile("Districts"){
            let rawWeather = FileLoader.loadJson(data)
            print("rawWeather = \(rawWeather)")
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {

                VStack(alignment: .leading) {
                    Text("登陆体验更多精彩")
                        .font(.system(size: 20, weight: .bold))
                    Text("未注册手机号登陆后自动创建账号")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .padding(.top, -5)
                    HStack {
                        Button {
                           // show the all contries and district
                            self.showAllDistrictsInfo = true
                        } label: {
                            HStack(alignment: .center) {
                                Text("+86")
                                    .foregroundColor(.black)
                                Image(systemName: "arrowtriangle.down.fill")
                                    .font(.system(size: 10))
                                    .foregroundColor(.black)
                                    .padding([.leading], -4)
                            }
                        }
                        .sheet(isPresented: $showAllDistrictsInfo) {
                            VStack(alignment: .leading) {
                                HStack() {
                                    Button() {
                                        self.showAllDistrictsInfo = false
                                    } label: {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.black)
                                    }
                                    Text("选择国家和地区")
                                        .padding(.leading, 96)
                                    Spacer()
                                }
                                // countries and districts
                                ScrollView {
                                    Text("dddd")
                                }
                                
                                Spacer()
                            }
                            .padding()
                        }
                        
                        TextField("输入手机号", text: $currentPhoneNumber)
                    }
                    .padding(.top)
                    Divider()
                    Button {
                        // login with phone number
                    } label: {
                        Text("下一步")
                    }
                }
                .padding([.top], 40)
                .padding(.leading, 20)
                
                
                Spacer()
                
                
            }
            .navigationTitle("手机号登陆")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image(systemName: "xmark")
                        .onTapGesture {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("密码登陆")
                }
            }
        }
        
        

    }
}

struct LoginWithNumber_Previews: PreviewProvider {
    static var previews: some View {
        LoginWithNumber()
    }
}
