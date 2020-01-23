//
//  3.swift
//  SketchVSXcode WatchKit Extension
//
//  Created by Antonella Cirma on 21/01/2020.
//  Copyright © 2020 Antonella Cirma. All rights reserved.
//

import SwiftUI

struct ContentView3: View {
    @State var show1 = false
    @State var show2 = false
    @State var show3 = false
    @State var color1:Color = Color.red
    @State var color2:Color = Color.green
    @State var color3:Color = Color.red
    var i: Double = 0
    var body: some View {
        
        VStack() {
            Spacer()
            Spacer()
            Spacer()
            HStack(){
                Spacer()
                ZStack(){
                    Image("frecce4")
                    Circle()
                        .trim(from:0.0 , to:1)
                        
                        .stroke(color1, style: StrokeStyle(lineWidth: CGFloat(integerLiteral: 8), lineCap: .round, lineJoin: .round))
                        .zIndex(0)
                        .frame(width:75,  height: 75)
                    Circle()
                        .trim(from: show1 ? 0.0: 0.99 , to:1)
                        .stroke( Color.black , style: StrokeStyle(lineWidth: 10, lineCap:.butt , lineJoin: .round))
                        // animazione vera e proprio
                        
                        .rotationEffect(.degrees(90))
                        .rotation3DEffect(Angle(degrees: 180), axis: (x:1,y:0,z:0))
                        .animation(.easeOut(duration: 5))
                        .onTapGesture {
                            //gestione  colori
                            
                            self.show1.toggle()
                            if(self.show1){
                                self.color1 = Color.red
                                
                                print("rosso")
                            }else{
                                self.color1 = Color.green
                                print("verde")
                            }
                    }
                    .zIndex(2000000)
                        
                    .frame(width:CGFloat(integerLiteral: 75), height: CGFloat(integerLiteral: 75))
                    
                }
                Spacer()
                Spacer()
                
                ZStack(){
                    Image("frecce2")
                    Circle()
                        .trim(from:0.0 , to:1)
                        
                        .stroke(color2, style: StrokeStyle(lineWidth: CGFloat(integerLiteral: 8), lineCap: .round, lineJoin: .round))
                        .zIndex(0)
                        .frame(width: 75, height: 75)
                    Circle()
                        .trim(from: show2 ? 0.0: 0.99 , to:1)
                        .stroke( Color.black , style: StrokeStyle(lineWidth: 10, lineCap:.butt , lineJoin: .round))
                        // animazione vera e proprio
                        .rotationEffect(.degrees(90))
                        .rotation3DEffect(Angle(degrees: 180), axis: (x:1,y:0,z:0))
                        .animation(.easeOut(duration: 5))
                        .onTapGesture {
                            //gestione  colori
                            
                            self.show2.toggle()
                            if(self.show2){
                                self.color2 = Color.red
                                
                                print("rosso")
                            }else{
                                self.color2 = Color.green
                                print("verde")
                            }
                    }
                    .zIndex(2000000)
                        
                    .frame(width:CGFloat(integerLiteral: 75), height: CGFloat(integerLiteral: 75))
                }
                Spacer()
            }
            Spacer()
            Spacer()
            HStack() {
                Spacer()
                ZStack(){
                    Image("frecce2")
                        .frame(width: 0.0)
                    Circle()
                        .trim(from:0.0 , to:1)
                        
                        .stroke(color3, style: StrokeStyle(lineWidth: CGFloat(integerLiteral: 8), lineCap: .round, lineJoin: .round))
                        .zIndex(0)
                        .frame(width:75,  height: 75)
                    Circle()
                        .trim(from: show3 ? 0.0: 0.99 , to:1)
                        .stroke( Color.black , style: StrokeStyle(lineWidth: 10, lineCap:.butt , lineJoin: .round))
                        // animazione vera e proprio
                        .rotationEffect(.degrees(90))
                        .rotation3DEffect(Angle(degrees: 180), axis: (x:1,y:0,z:0))
                        .animation(.easeOut(duration: 5))
                        .onTapGesture {
                            //gestione  colori
                            
                            self.show3.toggle()
                            if(self.show3){
                                self.color3 = Color.red
                                
                                print("rosso")
                            }else{
                                self.color3 = Color.green
                                print("verde")
                            }
                    }
                    .zIndex(2000000)
                        
                    .frame(width:CGFloat(integerLiteral: 75), height: CGFloat(integerLiteral: 75))
                }
                Spacer()
                Spacer()
                
                ZStack(){
                    
                    Circle()
                        .trim(from:0.0 , to:1)
                        
                        .stroke(Color.black, style: StrokeStyle(lineWidth: CGFloat(integerLiteral: 8), lineCap: .round, lineJoin: .round))
                        .zIndex(0)
                        .frame(width:75,  height: 75)
                        
                        .padding(.vertical)
                        .frame(width: 79.0, height: 75.0)
                    Text("250 m")
                        .font(.system(size: 28))
                }
            }
            Spacer()
        }
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
