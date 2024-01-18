//
//  WebView.swift
//  Marvel App
//
//  Created by Momcilo Bogunovic on 14.01.24.
//

import SwiftUI
import WebKit
struct WebView: UIViewRepresentable {
    
    var url: URL
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        view.load(URLRequest(url: url))
        
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}


