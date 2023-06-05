//
//  ShapeDemoView.swift
//  Demo1
//
//  Created by visit on 2023/5/28.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct ShapeDemoView: View {
    var body: some View {
      ZStack {

        Rectangle()
        .fill(Color.blue)
        .ignoresSafeArea()

        VStack {

          Circle()
          .stroke(Color.black, lineWidth: 2)
          .frame(width: 44, height: 44)

          Text("Meng To").bold()

          Capsule()
          .foregroundColor(Color.green)
          .frame(height: 44)
          .overlay(Text("Sign up"))

        }
        .padding()
        .frame(width: 300, height: 200)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))

      }
    }
}

struct ShapeDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeDemoView()
    }
}
