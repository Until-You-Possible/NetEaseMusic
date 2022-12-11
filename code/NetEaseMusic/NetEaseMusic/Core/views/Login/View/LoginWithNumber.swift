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
    @State var initilizeAreaCode = "86"
    
    var viewModel = LoginWithNumberViewModel()
    

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
