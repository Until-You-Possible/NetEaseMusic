//
//  LoginWithNumber.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/10.
//

import SwiftUI

struct LoginWithNumber: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State var currentPhoneNumber = "12309870909";
    @State var showAllDistrictsInfo = false
    @State var initilizeAreaCode = "86"
    // phone: current page is phone number page
    // code: current page is the page which need to input the phone code
    // password: current page is the which need to login with user's password
    @State var currentPageState = "code"
    @State var countDown = 10
    @State var phoneCode01 = "0"
    
    var viewModel = LoginWithNumberViewModel()

    var body: some View {
        NavigationView {
            
            VStack(alignment: .leading) {
                
                
                //MARK: input the phone number
                if currentPageState == "phone" {
                    VStack(alignment: .leading) {
                        Text("登陆体验更多精彩")
                            .font(.system(size: 20, weight: .bold))
                        Text("未注册手机号登陆后自动创建账号")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                            .padding(.top, -5)
                            .padding(.bottom, 20)
                        HStack {
                            Button {
                               // show the all contries and district
                                self.showAllDistrictsInfo = true
                            } label: {
                                HStack(alignment: .center) {
                                    Text("+\(initilizeAreaCode)")
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
                                    ZStack(alignment: .trailing) {
                                        ScrollView {
                                            LazyVStack(alignment: .leading) {
                                                    ForEach(viewModel.dataDict.keys.sorted(by: <), id: \.self) { key in
                                                        Section(header: Text(key)) {
                                                            Divider()
                                                            ForEach(viewModel.dataDict[key] ?? [], id: \.country_code) { innerItem in
                                                                HStack(alignment: .center) {
                                                                    Text(innerItem.chinese_name)
                                                                    Spacer()
                                                                    Text("+\(innerItem.phone_code)")
                                                                        .foregroundColor(.gray)
                                                                }
                                                                // to fix the issue that gesture(onTapGesture) is invalidation when clicking the white space
                                                                .modifier(ExpandAreaTap())
                                                                .onTapGesture {
                                                                    self.initilizeAreaCode = innerItem.phone_code
                                                                    self.showAllDistrictsInfo = false
                                                                }
                                                                Divider()
                                                            }
                                                            .padding([.trailing], 28)
                                                        }
                                                    }
                                                }
                                        }
                                        .navigationViewStyle(.stack)
                                        // MARK: right side list of letters
                                        VStack {
                                            ForEach(viewModel.alphabets, id: \.self) { letter in
                                                Text(letter)
                                                    .font(.system(size: 14))
                                                    .onTapGesture() {
                                                        print("letter", letter)
                                                    }
                                            }
                                        }
                                    }
                                    Spacer()
                                }
                                .padding([.leading, .top, .bottom])
                                .padding([.trailing], 8)
                            }
                            
                            TextField("输入手机号", text: $currentPhoneNumber)
                                .keyboardType(.numberPad)
                        }
                        .overlay(alignment: .trailing) {
                            if self.currentPhoneNumber.count > 0 {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                                    .onTapGesture {
                                        self.currentPhoneNumber = "";
                                    }
                            }

                        }
                        Divider()
                            .padding(.bottom, 40)
                        
                        Button {
                            print("bool", currentPhoneNumber.isEmpty)
                            if currentPhoneNumber.count == 11 {
                                self.currentPageState = "code"
                            }
                        } label: {
                            Text("下一步")
                                .foregroundColor(.white)
                                .frame(width: 350, height: 40)
                                .background(self.currentPhoneNumber.count > 0 ? Color(hex: "#e75549") :
                                   Color(hex: "#f0f0f0")
                                )
                                .clipShape(Capsule())
                        }
                    }
                    .padding([.top], 40)
                    .padding([.leading, .trailing], 20)
                }
                
                // MARK: input the phone code
                if currentPageState == "code" {
                    VStack(alignment: .leading) {
                        HStack { Spacer() }
                        Text("请输入验证码")
                            .font(.system(size: 20, weight: .bold))
                        HStack {
                            Text("已发送至+\(initilizeAreaCode)")
                            Text(currentPhoneNumber)
                            Image(systemName: "pencil")
                            Spacer()
                            Button {
                                if self.countDown == 0 {
                                    self.countDown = 10
                                }
                            } label: {
                                if self.countDown != 0 {
                                    Text("重新发送\(self.countDown)S")
                                    //这里直接将Timer作为发送者every是每隔一秒
                                    .onReceive(Timer.publish(every: 1, on: .main, in: .common)
                                        .autoconnect(), perform: { _ in
                                        //不等于零每隔一秒减一
                                        if self.countDown != 0 {
                                            self.countDown -= 1
                                        }
                                    })
                                } else {
                                    Text("获取验证码")
                                        .onTapGesture {
                                            print("dd")
                                        }
                                }

                            }
                        }
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.top, -5)
                        .padding(.bottom, 20)

                    }
                    .padding([.top], 40)
                    .padding([.leading, .trailing], 20)
                    
                    // input the phone code
                    HStack(alignment: .center) {
                        Spacer()
                        TextField("code", text: $phoneCode01)
                            .frame(width: 60, height: 60, alignment: .center)
                            .border(.gray, width: 1)
                        TextField("code", text: $phoneCode01)
                            .frame(width: 60, height: 60)
                            .border(.gray, width: 1)
                        TextField("code", text: $phoneCode01)
                            .frame(width: 60, height: 60)
                            .border(.gray, width: 1)
                        TextField("code", text: $phoneCode01)
                            .frame(width: 60, height: 60)
                            .border(.gray, width: 1)
                        Spacer()
                    }
                    
                }
                
                if currentPageState ==  "password" {
                    VStack(alignment: .leading){
                        HStack {
                            Spacer()
                        }
                        Text("password page")
                    }
                    .padding([.top], 40)
                    .padding([.leading, .trailing], 20)
                }
                Spacer()
                
                
            }
            .navigationTitle("手机号登陆")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        LoginView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                    }

                }
                if currentPageState == "code" {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            InputPasswordView()
                        } label: {
                            Text("密码登陆")
                                .font(.system(size: 16))
                                .frame(width: 100, height: 26)
                                .foregroundColor(.black)
                                .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 0.75))
                        }

                    }
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


private struct ExpandAreaTap: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.clear)
                .contentShape(Rectangle())
            content
        }
    }
}

extension View {
    func expandTap(tap: @escaping () -> Void) -> some View {
        modifier(ExpandAreaTap()).onTapGesture(perform: tap)
    }
}
