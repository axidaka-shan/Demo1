//
//  ButtonDemoView.swift
//  Demo1_tvOS
//
//  Created by visit146 on 2023/5/17.
//  Copyright © 2023 deng. All rights reserved.
//

import SwiftUI

struct ButtonDemoView: View {
    var body: some View {
        VStack {
            
            HStack {
                Button(
                        action: { },
                        label: {
                            VStack {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 125)
                                    .clipped()

                                Text("card111")
                                    .padding(.bottom)
                            }
                        }
                    )
                    .buttonStyle(.card)
                
                Button(
                        action: { },
                        label: {
                            VStack {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 125)
                                    .clipped()

                                Text("card22")
                                    .padding(.bottom)
                            }
                        }
                    )
                    .buttonStyle(.card)
                
                Button(
                        action: { },
                        label: {
                            VStack {
                                Text("card3333")
                            }
                            .frame(width: 100, height: 125)
                            .background(Color.green)
                        }
                    )
                    .buttonStyle(.card)
            }
            
            HStack {
                Button(
                        action: { },
                        label: {
                            VStack {
                                Text("bordered44")
                            }
                            .frame(width: 100, height: 125)
                            .background(Color.green)
                        }
                    )
                    .buttonStyle(.bordered)
                
                Button(
                        action: { },
                        label: {
                            VStack {
                                Text("borderedProminent555")
                            }
                            .frame(width: 100, height: 125)
                            .background(Color.green)
                        }
                    )
                    .buttonStyle(.borderedProminent)
                
                Button(
                        action: { },
                        label: {
                            VStack {
                                Text("plain666")
                            }
                            .frame(width: 100, height: 125)
                            .background(Color.green)
                        }
                    )
                    .buttonStyle(.plain)
                
                PosterView()
            }
            
            HStack {
                Button(
                    action: { },
                    label: {
                        Text("Button")
                            .background(Color.green)

                    }
                )
                .frame(width: 300, height: 100)
                .background(Color.orange)
                
                Button(
                        action: { },
                        label: {
                            Image(systemName: "play")
                        }
                    )
                    .clipShape(Circle())
                
                RoundButton()

            }
            
        }
        

    }
}

struct ButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemoView()
    }
}

struct PosterView: View {
    @FocusState var isFocused

    var body: some View {
        Button(
            action: { },
            label: {
                VStack(spacing: 4) {
                    Image(systemName: "bolt.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 125)
                        .clipped()
                        .shadow(radius: 18, x: 0, y: isFocused ? 50 : 0)

                    Text("Title")
                        .foregroundColor(isFocused ? .white : .black)

                }
            }
        )
        .focused($isFocused)
        .buttonStyle(PressHandlingStyle())
        .scaleEffect(isFocused ? 1.2 : 1)
        .animation(.easeOut(duration: isFocused ? 0.12 : 0.35), value: isFocused)
    }
}

// We use this button style to handle `isPressed` state of the component.
struct PressHandlingStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? (1 / 1.15) : 1)
    }
}
