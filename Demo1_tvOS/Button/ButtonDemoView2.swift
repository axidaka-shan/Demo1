//
//  ButtonDemoView2.swift
//  Demo1_tvOS
//
//  Created by visit on 2023/5/26.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct ButtonDemoView2: View {
    var body: some View {
      VStack(spacing: 30) {
        CustomCardButtonTV(text: "Custom Card", style: .card)
        CustomCardButtonTV(text: "Custom default", style: .automatic)
        CustomCardButtonTV(text: "Custom plain", style: .plain)
        CustomCardButtonTV(text: "Custom bordered", style: .bordered)
        CustomCardButtonTV(text: "Custom borderedProminent", style: .borderedProminent)

        CustomButtonTV(text: "CustomButtonTV")

      }
      .padding()
    }
}

struct ButtonDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemoView2()
    }
}
