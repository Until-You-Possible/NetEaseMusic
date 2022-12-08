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
    
    private var viewModel = LoginViewModel()
    
    @State var checked = false
    
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
                    Button {
                        // action for change the login of way
                    } label: {
                        Image(systemName: "arrow.left.arrow.right")
                            .font(.system(size: 12))
                            .foregroundColor(Color(hex: "#ababab"))
                            .frame(width: 26, height: 26)
                            .background(Color(hex: "#f0f0f0"))
                            .clipShape(Circle())
                    }
                }
                .padding([.top], 110)
                .padding([.leading], 26)
                
                // MARK: main button of login
                Button {
                    // use phone number to login directly
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
                        Button {
                            // service button action
                        } label: {
                            Text("《服务条款》")
                        }
                        Button {
                            // service button action
                        } label: {
                            Text("《隐私政策》")
                        }
                    }
                    Button {
                        // service button action
                    } label: {
                        Text("《中国移动认证服务协议》")
                    }
                    .padding(-6)
                    
                    
                }
                .padding(.top)
                .font(.caption)
                
            }
            // MARK: other login ways
            VStack {
                Text("other login ways")
            }
            Spacer()
            HStack {
                Button {
                    
                } label: {
                    Text("登陆遇到问题")
                        .foregroundColor(.gray)
                }
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
