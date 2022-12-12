//
//  LoginView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/5.
//

import SwiftUI
import SwiftUIFontIcon

struct LoginView: View {
    
//    private var loginViewModel: LoginViewModel
    
    // private var viewModel = LoginViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var checked = false
    @State var showTipsMessage = false
    @State var confirmationDialog = false
    @State var navigationPrivacy = false
    
    // differrnet login type icon
    
    // MARK: implement the gradient for background from top to bottom
    var gradient: Gradient {
        let stops: [Gradient.Stop] = [
            .init(color: Color(hex: "#4a4540"), location: 0.2),
            .init(color: Color(hex: "#262325"), location: 0.6)
        ]
        return Gradient(stops: stops)
    }
    
    var body: some View {
        
        VStack {
            // MARK: header tip messsage (dynamically)
            VStack {
                VStack {
                    // 这里是个布局小技巧 占满一整行 避免每次设置width，
                    HStack { Spacer() }
                    Text("新用户登陆得")
                        .foregroundStyle(Color(hex: "#f1d5cd"))
                        .font(.system(size: 22, weight: .bold))
                    Text("黑胶会员周卡")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundColor(Color(hex: "#f1d5cd"))
                    HStack {
                        Image(systemName: "tray.and.arrow.down.fill")
                            .foregroundStyle(Color(hex: "#f1d5cd"))
                        Text("付费免费听歌")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(Color(hex: "#f1d5cd"))
                    }
                    .padding([.top])
                }
                .frame(height: 260)
                .background(LinearGradient(gradient: gradient, startPoint:
                        .top, endPoint: .bottom))
                .overlay(alignment: .topLeading) {
                    Button {
                        // MARK: close the login page
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .padding()
                    .foregroundStyle(.white)
                }
            }
            // MARK: login message (including: button/tips/discleamis/agreements/polices)
            VStack {
                HStack(alignment: .top) {
                    VStack() {
                        Text("138 · · · · 1234")
                            .font(.system(size: 24))
                        Text("中国移动提供认证服务")
                            .font(.system(size: 12))
                            .foregroundColor(.gray)
                            .tracking(2)
                    }
                    NavigationLink(destination: LoginWithNumber().navigationBarHidden(true),
                                   label: {
                        Image(systemName: "arrow.left.arrow.right")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: "#ababab"))
                            .frame(width: 26, height: 26)
                            .background(Color(hex: "#f0f0f0"))
                            .clipShape(Circle())
                    })

                }
                .padding([.top], 110)
                .padding([.leading], 26)
                
                // MARK: main button of login
                Button {
                    // use phone number to login directly
                    print("login with phone")
                } label: {
                    Text("一键登录")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .frame(width: 320, height: 50)
                        .background(Color(hex: "#e75549"))
                        .clipShape(Capsule())
                }
                .overlay {
                    Text("推荐")
                        .font(.system(size: 10))
                        .frame(width: 30, height: 16)
                        .foregroundColor(.white)
                        .background(.gray).opacity(0.8)
                        .clipShape(Capsule())
                        .padding([.leading], 120)
                }
                // some tip message about provision
                VStack(alignment: .center) {
                        HStack {
                            Toggle("", isOn: $checked)
                                .toggleStyle(CheckboxStyle())
                            Text("我已阅读并同意")
                            NavigationLink {
                                ServiceRulesView()
                            } label: {
                                Text("《服务条款》")
                            }
                            NavigationLink {
                                PrivacyView()
                            } label: {
                                Text("《隐私政策》")
                            }
                        }
                        NavigationLink {
                            MobileAgreementRules()
                        } label: {
                            Text("《中国移动认证服务协议》")
                        }
                }
                .padding(.top)
                .font(.caption)
                
            }
            Spacer()
            // MARK: other login ways
            HStack {
                Button {
                    
                } label: {
                    Image("LoginTypeWechat")
                        .resizable()
                        .frame(width: 24,height: 24)
                        .padding()
                        .overlay {
                            Circle()
                                .stroke(Color(hex: "#e75549"))
                                .frame(width: 40, height: 40)
                        }
                }
                Button {
                    
                } label: {
                    Image("loginTypeQQ")
                        .resizable()
                        .frame(width: 24,height: 24)
                        .padding()
                        .overlay {
                            Circle()
                                .stroke(Color(hex: "#e75549"))
                                .frame(width: 40, height: 40)
                        }
                }
                Button {
                    
                } label: {
                    Image(systemName: "apple.logo")
                        .font(.system(size: 24))
                        .frame(width: 24,height: 24)
                        .padding()
                        .overlay {
                            Circle()
                                .stroke(Color(hex: "#e75549"))
                                .frame(width: 40, height: 40)
                        }
                }
                Button {
                    
                } label: {
                    Image("LoginTypeWeibo")
                        .resizable()
                        .frame(width: 24,height: 24)
                        .padding()
                        .overlay {
                            Circle()
                                .stroke(Color(hex: "#e75549"))
                                .frame(width: 40, height: 40)
                        }
                }
            }
            
            HStack {
                Button {
                    self.confirmationDialog = true
                } label: {
                    Text("登陆遇到问题")
                        .foregroundColor(.gray)
                }
                .confirmationDialog("", isPresented: $confirmationDialog) {
                    Button("手机号已更换") {}
                    Button("忘记密码") {}
                    Button("找回原账号") {}
                    Button("其他问题") {}
                    
                }
//                .sheet(isPresented: $showTipsMessage) {
//                    VStack {
//                         Image(systemName: "smiley")
//                             .resizable()
//                             .scaledToFit()
//                             .frame(height: 68)
//
//                         Text("I'm modal sheet with multiple sizes!")
//                             .padding(.top)
//                     }
//                    .presentationDetents([.height(200)])
//                }
            }

        }
    }
}

struct CheckboxStyle: ToggleStyle {

    func makeBody(configuration: Self.Configuration) -> some View {

        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "")
                .resizable()
                .frame(width: 16, height: 16)
                .overlay {
                    Circle()
                        .stroke(Color(hex: "#e75549"))
                }
                .foregroundColor(configuration.isOn ? Color(hex: "#e75549") : .gray)
                configuration.label
        }
        .onTapGesture { configuration.isOn.toggle() }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
