//
//
//  Created by Swapnil Tilkari on 14/06/22.
//

import SwiftUI

public struct CustomNavBar: View {
    
    var navBarTitle: String = ""
    var navBarBackIcon: String = "NavBarBackIcon"
    var navBarBackIconWidth: CGFloat = 16
    var navBarBackIconHeight: CGFloat = 18
    var navBarHeight: Double = 64
    var ShowLeftBarButton: Bool = false
    var leftBarAction : (() -> Void)?
    
    public init(navBarTitle: String = "", leftBarAction : @escaping (() -> Void) = {},ShowLeftBarButton: Bool = false) {
        
        self.navBarTitle = navBarTitle
        self.leftBarAction = leftBarAction
        self.ShowLeftBarButton = ShowLeftBarButton
    }
    
    public var body: some View {
        
        VStack {
            Spacer()
            ZStack {
                if ShowLeftBarButton {
                    HStack(alignment: .bottom) {
                        Button {
                            if let LeftBarAction = leftBarAction {
                                LeftBarAction()
                            }
                        } label: {
                            Image(navBarBackIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: navBarBackIconWidth, height: navBarBackIconHeight)
                        }
                        Spacer()
                    }
                    .padding([.leading, .trailing], 18)
                    .padding(.bottom, 12)
                }
                
                VStack {
                    Text(navBarTitle)
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(1)
                }
                .padding([.leading, .trailing], 40)
                .padding(.bottom, 12)
            }
            Spacer()
        }
        .frame(maxWidth:.infinity)
        .frame(height: navBarHeight)
        .background(Color(red: 0.22, green: 0.325, blue: 0.604))
        
    }
}


