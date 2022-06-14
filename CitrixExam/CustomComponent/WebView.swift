//
//
//  Created by Swapnil Tilkari on 13/06/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    @Binding var url : String
    let webView = WKWebView()
    
    func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
        let request = URLRequest(url: URL(string: url)!)
        webView.load(request)
        return webView
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        return
    }
    
}


