//
//  DetailsView.swift
//  CitrixExam
//
//  Created by Swapnil Tilkari on 14/06/22.
//

import SwiftUI

struct DetailsView: View {
    
    @Binding var url : String
    @Binding var title : String
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack(alignment:.leading,spacing: 0) {
            
            CustomNavBar(navBarTitle: title, leftBarAction: {
                presentation.wrappedValue.dismiss()
            }, ShowLeftBarButton: true)
            
            WebView(url: $url)
        }
        .navigationBarHidden(true)
    }
}

