//
//  InputPasswordView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/12.
//

import SwiftUI

struct InputPasswordView: View {
    
    @State var currentPassword = ""
    @State var isShowAlert = false
    
    var body: some View {
            VStack {
                VStack {
                    TextField("请输入账号密码", text: $currentPassword)
                    Divider()
                }
                .padding([.leading, .trailing], 20)
                .padding(.top, 40)
                Button {
                    // login with passoword
                } label: {
                    Text("立即登陆")
                        .foregroundColor(.white)
                        .frame(width: 350, height: 40)
                        .background(Color(hex: "#e75549"))
                        .clipShape(Capsule())
                        .onTapGesture {
                            if self.currentPassword.isEmpty {
                                self.isShowAlert = true
                            }
                        }
                }
                .padding(.top, 40)
                .alert("密码不能为空", isPresented: $isShowAlert) {
                    Button("ok", role: .cancel) {}
                }
                Button {
                    // forget the password
                } label: {
                    HStack(alignment: .center) {
                        Text("忘记密码")
                            .foregroundColor(.gray)
                        Image(systemName: "arrow.right")
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 40)
                    .padding(.leading)

                }
                Spacer()
            }
            .navigationTitle("账号密码登陆")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink {
                        LoginWithNumber()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.black)
                    }
                }
            }
    }
}

struct InputPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        InputPasswordView()
    }
}
