//
//  WebViewPage.swift
//  NetEaseMusic
//
//  Created by Ray on 2022/12/10.
//

import Foundation
import SwiftUI
import WebKit

struct WebViewPage: UIViewRepresentable {
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ webView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

