//
//  TextViewDemoView.swift
//  Demo1
//
//  Created by axidaka on 2023/3/24.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct TextViewDemoView: View {
  
  @State private var text = "333 I agree to the <a href%3d'http://global.nba.com/terms-of-use/?showNav=false&showFooter=false'>Terms and Conditions</a> and <a href%3d'http://www.wnba.com/basics/privacy_policy.html'>Privacy Policy</a>"

  
    var body: some View {
      
      VStack {
        Spacer().frame(height: 10)
        
        HTMLTextView(htmlString: "111 I agree to the <a href%3d'http://global.nba.com/terms-of-use/?showNav=false&showFooter=false'>Terms and Conditions</a> and <a href%3d'http://www.wnba.com/basics/privacy_policy.html'>Privacy Policy</a>", textColor: nil, textFont: nil, linkColor: nil, linkFont: nil)
//          .frame(minHeight: 20, idealHeight: 100)
        
        Spacer().frame(height: 30)
        
        HTMLTextView(htmlString: "222 I agree to the I agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theI agree to theglobal.nb", textColor: nil, textFont: nil, linkColor: nil, linkFont: nil)
//          .frame(width: 200, height: 100)
          .padding(.horizontal, 20)
        
        Spacer().frame(height: 30)
        
        NormalTextView(text: $text)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.gray) // 设置背景颜色
            .foregroundColor(Color.white) // 设置文本颜色

        Spacer().frame(height: 30)

      }
      .padding(.horizontal, 20)

    }
}

struct TextViewDemoView_Previews: PreviewProvider {
    static var previews: some View {
      TextViewDemoView()
    }
}
