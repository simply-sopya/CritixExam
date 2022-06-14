//
//  MostPopularViewCell.swift
//  CitrixExam
//
//  Created by Swapnil Tilkari on 13/06/22.
//

import SwiftUI

struct MostPopularViewCell: View {
    
    @Binding var data : Article
    
    var body: some View {
        
        VStack(alignment:.leading,spacing: 8) {
            
            CustomAsyncImage(url: $data.media[0].mediaMetadata[1].url)
                .frame(maxWidth:.infinity)
                .frame(height: 200)
            
            VStack(alignment:.leading,spacing: 8){
                
                HStack {
                    Text(data.published_date)
                        .font(.system(size: 12))
                        .fontWeight(.light)
                    
                    Spacer()
                    
                    Text(data.source)
                        .font(.system(size: 12))
                        .fontWeight(.light)
                }
                
                Text(data.title)
                    .font(.system(size: 18))
                    .fontWeight(.heavy)
                
                Text(data.abstract)
                    .font(.system(size: 14))
                    .fontWeight(.light)
            }
            .padding(16)
            
        }
        .background(Color.white)
        .cornerRadius(16)
        .padding(.horizontal,16)
        
        
    }
}


