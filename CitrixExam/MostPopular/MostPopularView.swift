//
//  MostPopularView.swift
//  CitrixExam
//
//  Created by Swapnil Tilkari on 13/06/22.
//

import SwiftUI

struct MostPopularView: View {
    
    @StateObject var MostPopularData = MostPopularViewModel.shared
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 0 ) {
                CustomNavBar(navBarTitle: "NY Home", leftBarAction: {
                    
                }, ShowLeftBarButton: false)
                if MostPopularData.getMostPopularDataAPIStatus != .success {
                    VStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width)
                }else{
                    ScrollView() {
                        VStack(spacing: 16) {
                            ForEach($MostPopularData.data.articles,id:\.self) {  item in
                                NavigationLink {
                                    DetailsView(url: item.url, title: item.title)
                                } label: {
                                    MostPopularViewCell(data: item)
                                }
                                .buttonStyle(.plain)
                                
                                
                            }
                        }
                        .padding(.vertical, 16)
                    }
                    
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                MostPopularData.getMostPopularData()
            }
            .background(Color(red: 0.898, green: 0.898, blue: 0.898))
        }
        
        
    }
}

struct MostPopularView_Previews: PreviewProvider {
    static var previews: some View {
        MostPopularView()
    }
}
