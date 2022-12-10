//
//  PrivacyView.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/10.
//

import SwiftUI
import WebKit

struct PrivacyView: View {
    var body: some View {
        WebViewPage(url: URL(string: "https://st.music.163.com/official-terms/privacy")!)
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyView()
    }
}





struct WebView: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
