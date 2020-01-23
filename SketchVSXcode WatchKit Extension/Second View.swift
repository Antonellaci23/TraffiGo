    //
    //  Second View.swift
    //  SketchVSXcode WatchKit Extension
    //
    //  Created by Antonella Cirma on 21/01/2020.
    //  Copyright © 2020 Antonella Cirma. All rights reserved.
    //
    
    import SwiftUI
    
    struct ContentView2: View {
        @State var show1 = false
        @State var show2 = false
        @State var color1:Color = Color.red
        @State var color2:Color = Color.green
        var i: Double = 0
        var body: some View {
            VStack(){
                Spacer()
                HStack(){
                    ZStack(){
                        Image("frecce4")
                        
                        Circle()
                            .trim(from:0.0 , to:1)
                            
                            .stroke(color1, style: StrokeStyle(lineWidth: CGFloat(integerLiteral: 10), lineCap: .round, lineJoin: .round))
                            .zIndex(0)
                            .frame(width:75, height: 75)
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
                    
                    ZStack(){
                        Image("frecce2")
                        Circle()
                            .trim(from:0.0 , to:1)
                            
                            .stroke(color2, style: StrokeStyle(lineWidth: CGFloat(integerLiteral: 10), lineCap: .round, lineJoin: .round))
                            .zIndex(0)
                            .frame(width:75, height: 75)
                        Circle()
                            .trim(from: show2 ? 0.0: 0.99 , to:1)
                            .stroke( Color.black , style: StrokeStyle(lineWidth: 10, lineCap:.butt , lineJoin: .round))
                            // animazione vera e proprio
                            .rotationEffect(.degrees(90))
                            .rotation3DEffect(Angle(degrees: 180), axis: (x:1,y:0,z:0))
                            .animation(.easeOut(duration: 5))
                            .onTapGesture {
                                //gestione  colori
                                print("2")
                                
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
                    
                }
                Spacer()
                
                Text("250 m")
                    .font(.system(.largeTitle, design: .rounded))
            }
        }
    }
    
    
    
    struct ContentView2_Previews: PreviewProvider {
        static var previews: some View {
            ContentView2()
        }
    }
    
    
