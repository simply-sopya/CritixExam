
//
//  Created by Swapnil Tilkari on 13/06/22.
//

import SwiftUI

struct CustomAsyncImage: View {
    
    @Binding var url : String
    
    var body: some View {
        
        AsyncImage(url: URL(string:url)) { Image in
            Image.resizable()
        } placeholder: {
            ProgressView()
        }
        
    }
    
}

struct CustomAsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomAsyncImage(url: .constant( "https://static01.nyt.com/images/2022/06/12/us/politics/12jan6-hearings-howtowatch-1/merlin_199870083_1775b0e3-e7c1-4493-86b2-d886afdad67a-mediumThreeByTwo440.jpg"))
    }
}
