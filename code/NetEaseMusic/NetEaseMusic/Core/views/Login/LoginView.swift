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
                Text("login Message")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
