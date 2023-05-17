//
//  CustomButton.swift
//  Demo1_tvOS
//
//  Created by axidaka on 2023/5/9.
//  Copyright © 2023 shan. All rights reserved.
//

import SwiftUI

struct CustomButton: View {
    var body: some View {
        Button(action: {
            // Do something when the button is pressed
        }) {
            Text("Button")
        }
        .buttonStyle(CustomButtonStyle())
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton()
    }
}


struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? .red : .blue)
            .background(configuration.isPressed ? Color.yellow : Color.white)
    }
}
