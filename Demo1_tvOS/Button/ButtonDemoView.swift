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

                                Text("图片 card")
                                    .padding(.bottom)
                            }
                        }
                    )
                    .buttonStyle(.card)
                
                
                Button(
                        action: { },
                        label: {
                            VStack {
                                Text("Title card")
                            }
                            .frame(width: 300, height: 100)
                            .background(Color.green)
                        }
                    )
                .frame(width: 300, height: 100)
                    .buttonStyle(.card)
              
              CustomCardButtonTV()
              
              CustomButtonTV()
            }
            
            HStack {
                Button(
                        action: { },
                        label: {
                            VStack {
                                Text("bordered")
                            }
                            .frame(height: 125)
                            .background(Color.green)
                        }
                    )
                    .buttonStyle(.bordered)
                
                Button(
                        action: { },
                        label: {
                            VStack {
                                Text("borderedProminent")
                            }
                            .frame(height: 125)
                            .background(Color.green)
                        }
                    )
                    .buttonStyle(.borderedProminent)
                
                Button(
                        action: { },
                        label: {
                            VStack {
                                Text("plain")
                            }
                            .frame(height: 125)
                            .background(Color.green)
                        }
                    )
                    .buttonStyle(.plain)
                
                PosterViewButton()
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
          
          HStack {
            Button(action: {
              
            }, label: {
              VStack {
                Text("AAAAA")
                  .foregroundColor(.blue)
              }
              .background(.red)
            })
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(.red)
            
            Button {
              
            } label: {
              VStack {
                Text("AAAAA")
                  .foregroundColor(.blue)
              }
              .background(.red)
              
            }
            .buttonStyle(CustomButtonStyleTV())
            

          }
            
        }
        

    }
}

struct ButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemoView()
    }
}



struct CustomButtonStyleTV: ButtonStyle {
   func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.red)
            .border(Color.clear, width: 0)
            .scaleEffect(configuration.isPressed ? (1 / 1.15) : 1)

   }
}

