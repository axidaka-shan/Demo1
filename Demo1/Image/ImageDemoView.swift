//
//  ImageDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/24.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct ImageDemoView: View {
    var body: some View {
      
      VStack {
        Spacer()

        NetworkImage(url: URL(string: "https://example.com/image.jpg")!)

        Spacer()
        
        NetworkImage(url: URL(string: "https://neulion-a.akamaihd.net/nlmobile/wnba/logos/ATL_50.png?v=11.0511")!)
          .frame(width: 50, height: 50)
        
        Spacer()

        if #available(iOS 15.0, *) {
          AsyncImage(url: URL(string: "https://neulion-a.akamaihd.net/nlmobile/wnba/logos/ATL_50.png?v=11.0511")) { image in
            image.resizable(resizingMode: .tile)
          } placeholder: {
            Color.green
              .frame(width: 50, height: 50)
          }
          .frame(width: 50, height: 50)

          
          Spacer()

//          AsyncImage(url: URL(string: "https://neulion-a.akamaihd.net/nlmobile/wnba/logos/ATL_50.png?v=11.0511"))
//
//          Spacer()

        } else {
          // Fallback on earlier versions
        }
      }
    }
}

struct ImageDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ImageDemoView()
    }
}
