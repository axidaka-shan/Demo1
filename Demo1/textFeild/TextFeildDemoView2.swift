//
//  TextFeildDemoView2.swift
//  Demo1
//
//  Created by visit146 on 2023/5/19.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

@available(iOS 15.0, *)
struct TextFeildDemoView2: View {
    @State private var username: String = ""
    @FocusState private var emailFieldIsFocused: Bool

    var body: some View {
        VStack {
            Button("Hide Keyboard") {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .padding()
            
            TextField(
                "User name (email address)",
                text: $username
            )
            .focused($emailFieldIsFocused)
            .onSubmit {
                validate(name: username)
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .frame(height: 50)
            .border(.secondary)
            .padding()

            Text(username)
                .foregroundColor(emailFieldIsFocused ? .red : .blue)
        }
        .ignoresSafeArea(.keyboard)
    }

    func validate(name: String) {
        
    }
}

@available(iOS 15.0, *)
struct TextFeildDemoView2_Previews: PreviewProvider {
    static var previews: some View {
        TextFeildDemoView2()
    }
}
