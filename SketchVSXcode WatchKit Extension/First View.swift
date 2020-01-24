//
//  ContentView.swift
//  SketchVSXcode WatchKit Extension
//
//  Created by Antonella Cirma on 20/01/2020.
//  Copyright © 2020 Antonella Cirma. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var color1:Color = Color.black
    @State var color2:Color = Color(red:1.0 , green:0 , blue: 0, opacity: 0.4);   var i: Double = 0
    var body: some View {
        
        VStack {
            ZStack {
                Text("250 m")
                    .font(.system(.largeTitle, design: .rounded))
                
                
                Circle()
                    .trim(from:0.0 , to:1)
                    .stroke(color1, style: StrokeStyle(lineWidth: CGFloat(integerLiteral: 10), lineCap: .round, lineJoin: .round))
                    .zIndex(0)
                    .frame(width:150, height: 150)
                
                
                
                Circle()
                    .trim(from: show ? 0.0: 0.99 , to: 1)
                    .stroke( Color.black , style: StrokeStyle(lineWidth: 10, lineCap:.butt , lineJoin: .round))
                    // animazione vera e proprio
                    .rotationEffect(.degrees(90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x:1,y:0,z:0))
                    .animation(.easeOut(duration: 5))
                    .onAppear(perform: Actions)
                .zIndex(2000000)
                    
                .frame(width:CGFloat(integerLiteral: 150), height: CGFloat(integerLiteral: 150))
            }
        }
        
    }
    
    func Actions(){
        GETdata()
        Timer.scheduledTimer(withTimeInterval: 7, repeats: true){ _ in
            self.GETdata()
        }
    }
    
    func GETdata(){
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: OperationQueue.main)
        let endpoint = "https://io.adafruit.com/api/v2/Giovygio97/feeds/traffic-light-single/data?limit=1"
        let safeURLString = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let endpointURL = URL(string: safeURLString!) else {
            print("The URL is invalid")
            return
        }
        
        var request = URLRequest(url: endpointURL)
        request.httpMethod = "GET"
        
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            guard let jsonData = data else {
                print("The payload is invalid")
                return
            }
            let decoder = JSON(jsonData)
            print("Decoded.")
            self.GetColor(d: decoder)
        }
        dataTask.resume()
        print("Finished")
    }
    
    func GetColor(d: JSON){
        self.show.toggle()
//        if(self.show){
            if(d[0]["value"].string! == "0"){
                self.color1 = Color.red
                self.color2 = Color(red:1.0 , green:0 , blue: 0, opacity: 0.7)
                print("rosso")
            }else if (d[0]["value"].string! == "1"){
                self.color1 = Color.green
                self.color2 = Color(red:0 , green:1 , blue: 0, opacity: 0.7)
                print("verde")
            }
//        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

