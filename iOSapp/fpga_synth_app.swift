//
//  ContentView.swift
//  fpga_synth_app
//
//  Created by ono on 2020/10/26.
//

import SwiftUI
import Socket

class Client :ObservableObject{
    let bufferSize = 1024
    var listenSocket: Socket? = nil

    init() {
    }

    deinit {
        listenSocket?.close()
    }

    func start(server:String,port:Int) throws {
        listenSocket?.close()
        let socket = try Socket.create()
        listenSocket = socket
        try socket.connect(to: server, port: Int32(port))
      }
    func send(msg: String){
        do {
            var dataRead = Data(capacity: bufferSize)
            try listenSocket?.write(from: msg+"                                        ")
            try listenSocket?.read(into: &dataRead)
        } catch let error {
          print("Error: \(error)")
        }
    }
}


struct ContentView: View {
    @StateObject var client = Client()
    @State private var g: Float = 1
    var body: some View {
        NavigationView{
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    NavigationLink(
                        destination: CONNECT(client:client)){
                           HStack {
                                Text("CONNECT")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                }
                HStack(alignment: .center) {
                    NavigationLink(
                        destination: OSCALL(client:client)){
                           HStack {
                                Text("OSCALL")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: CHORD(client:client)){
                           HStack {
                                Text("CHORD")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: DEMO(client:client)){
                           HStack {
                                Text("DEMO")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                }
                HStack(alignment: .center) {
                    NavigationLink(
                        destination: OSC1(client:client)){
                           HStack {
                                Text("OSC1")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: OSC2(client:client)){
                           HStack {
                                Text("OSC2")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: OSC3(client:client)){
                           HStack {
                                Text("OSC3")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: OSC4(client:client)){
                           HStack {
                                Text("OSC4")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                }
                .padding()
                HStack(alignment: .center) {
                    NavigationLink(
                        destination: OSC5(client:client)){
                           HStack {
                                Text("OSC5")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: OSC6(client:client)){
                           HStack {
                                Text("OSC6")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: OSC7(client:client)){
                           HStack {
                                Text("OSC7")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: OSC8(client:client)){
                           HStack {
                                Text("OSC8")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                }
                .padding()
                HStack(alignment: .center) {
                    NavigationLink(
                        destination: SINE1(client:client)){
                           HStack {
                                Text("SINE1")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: SINE2(client:client)){
                           HStack {
                                Text("SINE2")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: LPF(client:client)){
                           HStack {
                                Text("LPF")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    NavigationLink(
                        destination: HPF(client:client)){
                           HStack {
                                Text("HPF")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                }
                .padding()
                HStack(alignment: .center) {
                    NavigationLink(
                        destination: VCA(client:client)){
                           HStack {
                                Text("VCA")
                                    .fontWeight(.semibold)
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                        }
                    HStack {
                        Button(action: {
                            client.send(msg:"176 0")
                        }) {
                                   HStack {
                                    Text("BYPS")
                                        .fontWeight(.semibold)
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(40)
                        }
                    }
                    HStack {
                        Button(action: {
                            client.send(msg:"176 1")
                        }) {
                                   HStack {
                                    Text("LPSS")
                                        .fontWeight(.semibold)
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(40)
                        }
                    }
                    HStack {
                        Button(action: {
                            client.send(msg:"176 2")
                        }) {
                                   HStack {
                                    Text("HPSS")
                                        .fontWeight(.semibold)
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.red)
                                .cornerRadius(40)
                        }
                    }
                }
                .padding()
                HStack(alignment: .center) {
                    Button(action: {
                        client.send(msg:"P")
                    }) {
                           HStack {
                                Text("P")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                    }
                    Button(action: {
                        client.send(msg:"0 1")
                        client.send(msg:"1 0")
                        client.send(msg:"2 57")
                        client.send(msg:"3 32768")
                        client.send(msg:"4 0")
                        client.send(msg:"5 0")
                        client.send(msg:"6 0")
                        client.send(msg:"7 0")
                        client.send(msg:"8 0")
                        client.send(msg:"9 0")
                        client.send(msg:"10 57")
                        client.send(msg:"11 32768")
                        client.send(msg:"12 0")
                        client.send(msg:"13 0")
                        client.send(msg:"14 0")
                        client.send(msg:"15 0")
                        client.send(msg:"16 0")
                        client.send(msg:"17 0")
                        client.send(msg:"18 57")
                        client.send(msg:"19 32768")
                        client.send(msg:"20 0")
                        client.send(msg:"21 0")
                        client.send(msg:"22 0")
                        client.send(msg:"23 0")
                        client.send(msg:"24 0")
                        client.send(msg:"25 0")
                        client.send(msg:"26 57")
                        client.send(msg:"27 32768")
                        client.send(msg:"28 0")
                        client.send(msg:"29 0")
                        client.send(msg:"30 0")
                        client.send(msg:"31 0")

                        client.send(msg:"32 0")
                        client.send(msg:"33 0")
                        client.send(msg:"34 57")
                        client.send(msg:"35 32768")
                        client.send(msg:"36 0")
                        client.send(msg:"37 0")
                        client.send(msg:"38 0")
                        client.send(msg:"39 0")
                        client.send(msg:"40 0")
                        client.send(msg:"41 0")
                        client.send(msg:"42 0")
                        client.send(msg:"43 0")
                        client.send(msg:"44 0")
                        client.send(msg:"45 0")
                        client.send(msg:"46 0")
                        client.send(msg:"47 0")

                        client.send(msg:"48 0")
                        client.send(msg:"49 0")
                        client.send(msg:"50 57")
                        client.send(msg:"51 32768")
                        client.send(msg:"52 0")
                        client.send(msg:"53 0")
                        client.send(msg:"54 0")
                        client.send(msg:"55 0")
                        client.send(msg:"56 0")
                        client.send(msg:"57 0")
                        client.send(msg:"58 0")
                        client.send(msg:"59 0")
                        client.send(msg:"60 0")
                        client.send(msg:"61 0")
                        client.send(msg:"62 0")
                        client.send(msg:"63 0")

                        client.send(msg:"64 0")
                        client.send(msg:"65 0")
                        client.send(msg:"66 57")
                        client.send(msg:"67 32768")
                        client.send(msg:"68 0")
                        client.send(msg:"69 0")
                        client.send(msg:"70 0")
                        client.send(msg:"71 0")
                        client.send(msg:"72 0")
                        client.send(msg:"73 0")
                        client.send(msg:"74 0")
                        client.send(msg:"75 0")
                        client.send(msg:"76 0")
                        client.send(msg:"77 0")
                        client.send(msg:"78 0")
                        client.send(msg:"79 0")

                        client.send(msg:"80 0")
                        client.send(msg:"81 0")
                        client.send(msg:"82 57")
                        client.send(msg:"83 32768")
                        client.send(msg:"84 0")
                        client.send(msg:"85 0")
                        client.send(msg:"86 0")
                        client.send(msg:"87 0")
                        client.send(msg:"88 0")
                        client.send(msg:"89 0")
                        client.send(msg:"90 0")
                        client.send(msg:"91 0")
                        client.send(msg:"92 0")
                        client.send(msg:"93 0")
                        client.send(msg:"94 0")
                        client.send(msg:"95 0")

                        client.send(msg:"96 0")
                        client.send(msg:"97 57")
                        client.send(msg:"98 0")
                        client.send(msg:"99 0")
                        client.send(msg:"100 0")
                        client.send(msg:"101 0")
                        client.send(msg:"102 0")
                        client.send(msg:"103 0")
                        client.send(msg:"104 0")
                        client.send(msg:"105 0")

                        client.send(msg:"112 0")
                        client.send(msg:"113 57")
                        client.send(msg:"114 0")
                        client.send(msg:"115 0")
                        client.send(msg:"116 0")
                        client.send(msg:"117 0")
                        client.send(msg:"118 0")
                        client.send(msg:"119 0")
                        client.send(msg:"120 0")
                        client.send(msg:"121 0")

                        client.send(msg:"128 0")
                        client.send(msg:"129 255")
                        client.send(msg:"130 128")
                        client.send(msg:"131 0")
                        client.send(msg:"132 0")
                        client.send(msg:"133 255")
                        client.send(msg:"134 0")
                        client.send(msg:"135 0")
                        client.send(msg:"136 0")

                        client.send(msg:"144 0")
                        client.send(msg:"145 255")
                        client.send(msg:"146 128")
                        client.send(msg:"147 0")
                        client.send(msg:"148 0")
                        client.send(msg:"149 255")
                        client.send(msg:"150 0")
                        client.send(msg:"151 0")
                        client.send(msg:"152 0")

                        client.send(msg:"160 0")
                        client.send(msg:"161 255")
                        client.send(msg:"162 128")
                        client.send(msg:"163 0")
                        client.send(msg:"164 0")
                        client.send(msg:"165 255")
                        client.send(msg:"166 0")
                        client.send(msg:"167 0")
                        client.send(msg:"168 0")

                        client.send(msg:"176 0")
                    }) {
                           HStack {
                                Text("RESET")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(.white)
                            .background(Color.red)
                            .cornerRadius(40)
                    }
                    Slider(value: $g,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { bool in
                            if bool {
                                client.send(msg:"g 1")
                            }else{
                                client.send(msg:"g 2")
                            }})
                        .padding()
                }
                .padding()

            }
        }
    }
}

struct CONNECT: View {
    @ObservedObject var client :Client
    @State private var wifi: String = "192.168.0.6"
    @State private var tether: String = "172.20.10.8"
    @State private var addr: Double = 0
    var body: some View {
        VStack{
            Text("CONNECT")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    do {
                        try client.start(server:"192.168.0.6",port:58276)
                        wifi = "Connected"
                    } catch let error {
                      print("Error: \(error)")
                    }
                }) {
                        HStack {
                            Text(wifi)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Button(action: {
                    do {
                        try client.start(server:tether,port:58276)
                        tether = "Connected"
                    } catch let error {
                      print("Error: \(error)")
                    }
                }) {
                        HStack {
                            Text(tether)
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Slider(value: $addr,
                       in: 0...30,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            tether = "172.20.10."+(String(Int(addr)))
                        }else{
                            tether = "172.20.10."+(String(Int(addr)))
                 }})
            }
        }
    }
}


struct DEMO: View {
    @ObservedObject var client :Client
    @State private var bpm: Double = 0
    var body: some View {
        VStack{
            Text("DEMO")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"d 0")
                    client.send(msg:"d "+String(Int(bpm)))
                }) {
                        HStack {
                            Text("PLAY")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"d 0")
                }) {
                        HStack {
                            Text("STOP")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("BPM \(Int(self.bpm))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $bpm,
                       in: 1...300,
                       step : 1
                )
            }
        }
    }
}


struct CHORD: View {
    @ObservedObject var client :Client
    @State private var chord: String = "0 "
    @State private var g: Float = 1
    var body: some View {
        VStack{
            Text("CHORD PLAY")
                .fontWeight(.semibold)
                .font(.title)
            HStack{
                Text("    ")
                    .fontWeight(.semibold)
                    .font(.title)
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"E "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"G "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Text("    ")
                    .fontWeight(.semibold)
                    .font(.title)
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"J "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"L "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"B "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Text("    ")
                    .fontWeight(.semibold)
                    .font(.title)
            }
            HStack{
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"D "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"F "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"H "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"I "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"K "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"A "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
                Slider(value: $g,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { bool in
                        if bool {
                            client.send(msg:"C "+chord)
                            client.send(msg:"g 1")
                        }else{
                            client.send(msg:"g 2")
                        }})
            }
            HStack {
                Button(action: {
                    chord = "0 "
                }) {
                        HStack {
                            Text("Maj7")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                .padding()
                Button(action: {
                    chord = "1 "
                }) {
                        HStack {
                            Text("-7")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                .padding()
            }
            HStack {
                Button(action: {
                    chord = "2 "
                }) {
                        HStack {
                            Text("alt7")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                .padding()
                Button(action: {
                    chord = "3 "
                }) {
                        HStack {
                            Text("7sus4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                .padding()
            }
        }
    }
}


struct OSCALL: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var spread: Float = 0
    @State private var duty: Float = 0
    @State private var fmwidth: Float = 0
    var body: some View {
        VStack{
            Text("OSCALL")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"0 1")
                    client.send(msg:"8 1")
                    client.send(msg:"16 1")
                    client.send(msg:"24 1")
                    client.send(msg:"32 1")
                    client.send(msg:"48 1")
                    client.send(msg:"64 1")
                    client.send(msg:"80 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
                Button(action: {
                    client.send(msg:"0 0")
                    client.send(msg:"8 0")
                    client.send(msg:"16 0")
                    client.send(msg:"24 0")
                    client.send(msg:"32 0")
                    client.send(msg:"48 0")
                    client.send(msg:"64 0")
                    client.send(msg:"80 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("WAVE FORM")
                .fontWeight(.semibold)
            HStack {
                Button(action: {
                    client.send(msg:"1 0")
                    client.send(msg:"9 0")
                    client.send(msg:"17 0")
                    client.send(msg:"25 0")
                    client.send(msg:"33 0")
                    client.send(msg:"49 0")
                    client.send(msg:"65 0")
                    client.send(msg:"81 0")
                }) {
                        HStack {
                            Text("SAW")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"1 1")
                    client.send(msg:"9 1")
                    client.send(msg:"17 1")
                    client.send(msg:"25 1")
                    client.send(msg:"33 1")
                    client.send(msg:"49 1")
                    client.send(msg:"65 1")
                    client.send(msg:"81 1")
                }) {
                        HStack {
                            Text("SQU")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"1 2")
                    client.send(msg:"9 2")
                    client.send(msg:"17 2")
                    client.send(msg:"25 2")
                    client.send(msg:"33 2")
                    client.send(msg:"49 2")
                    client.send(msg:"65 2")
                    client.send(msg:"81 2")
                }) {
                        HStack {
                            Text("TRI")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"1 3")
                    client.send(msg:"9 3")
                    client.send(msg:"17 3")
                    client.send(msg:"25 3")
                    client.send(msg:"33 3")
                    client.send(msg:"49 3")
                    client.send(msg:"65 3")
                    client.send(msg:"81 3")
                }) {
                        HStack {
                            Text("NOISE")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"2 "+String(Int(frequency)))
                        client.send(msg:"10 "+String(Int(frequency)))
                        client.send(msg:"18 "+String(Int(frequency)))
                        client.send(msg:"26 "+String(Int(frequency)))
                        client.send(msg:"34 "+String(Int(frequency)))
                        client.send(msg:"50 "+String(Int(frequency)))
                        client.send(msg:"66 "+String(Int(frequency)))
                        client.send(msg:"82 "+String(Int(frequency)))
                       }
                )
            }
            HStack {

                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"2 "+String(Int(frequency)))
                        client.send(msg:"10 "+String(Int(frequency)))
                        client.send(msg:"18 "+String(Int(frequency)))
                        client.send(msg:"26 "+String(Int(frequency)))
                        client.send(msg:"34 "+String(Int(frequency)))
                        client.send(msg:"50 "+String(Int(frequency)))
                        client.send(msg:"66 "+String(Int(frequency)))
                        client.send(msg:"82 "+String(Int(frequency)))
                       }
                )
            }
            Text("DUTY \(Int(self.duty))")
                .fontWeight(.semibold)
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...65536,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"3 "+String(Int(duty)))
                        client.send(msg:"11 "+String(Int(duty)))
                        client.send(msg:"19 "+String(Int(duty)))
                        client.send(msg:"27 "+String(Int(duty)))
                        client.send(msg:"35 "+String(Int(duty)))
                        client.send(msg:"51 "+String(Int(duty)))
                        client.send(msg:"67 "+String(Int(duty)))
                        client.send(msg:"83 "+String(Int(duty)))
                       }
                )
            }
        }
        VStack {
            HStack {
                Text("VOICE")
                    .fontWeight(.semibold)
                Button(action: {
                    client.send(msg:"4 0")
                    client.send(msg:"12 0")
                    client.send(msg:"20 0")
                    client.send(msg:"28 0")
                    client.send(msg:"36 0")
                    client.send(msg:"52 0")
                    client.send(msg:"68 0")
                    client.send(msg:"84 0")
                }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"4 1")
                    client.send(msg:"12 1")
                    client.send(msg:"20 1")
                    client.send(msg:"28 1")
                    client.send(msg:"36 1")
                    client.send(msg:"52 1")
                    client.send(msg:"68 1")
                    client.send(msg:"84 1")
                }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"4 2")
                    client.send(msg:"12 2")
                    client.send(msg:"20 2")
                    client.send(msg:"28 2")
                    client.send(msg:"36 2")
                    client.send(msg:"52 2")
                    client.send(msg:"68 2")
                    client.send(msg:"84 2")
                }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"4 3")
                    client.send(msg:"12 3")
                    client.send(msg:"20 3")
                    client.send(msg:"28 3")
                    client.send(msg:"36 3")
                    client.send(msg:"52 3")
                    client.send(msg:"68 3")
                    client.send(msg:"84 3")
                }) {
                        HStack {
                            Text("8")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("SPREAD \(Int(self.spread))")
                    .fontWeight(.semibold)
                Slider(value: $spread,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"5 "+String(Int(spread)))
                        client.send(msg:"13 "+String(Int(spread)))
                        client.send(msg:"21 "+String(Int(spread)))
                        client.send(msg:"29 "+String(Int(spread)))
                        client.send(msg:"37 "+String(Int(spread)))
                        client.send(msg:"53 "+String(Int(spread)))
                        client.send(msg:"69 "+String(Int(spread)))
                        client.send(msg:"85 "+String(Int(spread)))
                       }
                )
            }
            HStack {
                Text("FM WIDTH \(Int(self.fmwidth))")
                    .fontWeight(.semibold)
                Slider(value: $fmwidth,
                       in: 0...31,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"7 "+String(Int(fmwidth)))
                        client.send(msg:"15 "+String(Int(fmwidth)))
                        client.send(msg:"23 "+String(Int(fmwidth)))
                        client.send(msg:"31 "+String(Int(fmwidth)))
                        client.send(msg:"39 "+String(Int(fmwidth)))
                        client.send(msg:"55 "+String(Int(fmwidth)))
                        client.send(msg:"71 "+String(Int(fmwidth)))
                        client.send(msg:"87 "+String(Int(fmwidth)))
                       }
                )
            }
        }
    }
}


struct OSC1: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var spread: Float = 0
    @State private var duty: Float = 0
    @State private var fmwidth: Float = 0
    var body: some View {
        VStack{
            Text("OSC1")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"0 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"0 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("WAVE FORM")
                .fontWeight(.semibold)
            HStack {
                Button(action: {
                    client.send(msg:"1 0")
                }) {
                        HStack {
                            Text("SAW")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"1 1")
                }) {
                        HStack {
                            Text("SQU")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"1 2")
                }) {
                        HStack {
                            Text("TRI")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"1 3")
                }) {
                        HStack {
                            Text("NOISE")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"2 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"2 "+String(Int(frequency)))}
                )
            }
            Text("DUTY \(Int(self.duty))")
                .fontWeight(.semibold)
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...65536,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"3 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("VOICE")
                    .fontWeight(.semibold)
                Button(action: {
                    client.send(msg:"4 0")
                }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"4 1")
                }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"4 2")
                }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"4 3")
                }) {
                        HStack {
                            Text("8")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
            }
            HStack {
                Text("SPREAD \(Int(self.spread))")
                    .fontWeight(.semibold)
                Slider(value: $spread,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"5 "+String(Int(spread)))}
                )
            }
            HStack {
                Text("FM WIDTH \(Int(self.fmwidth))")
                    .fontWeight(.semibold)
                Slider(value: $fmwidth,
                       in: 0...31,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"7 "+String(Int(fmwidth)))}
                )
            }
        }
    }
}


struct OSC2: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var spread: Float = 0
    @State private var duty: Float = 0
    @State private var fmwidth: Float = 0
    var body: some View {
        VStack{
            Text("OSC2")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"8 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"8 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("WAVE FORM")
                .fontWeight(.semibold)
            HStack {
                Button(action: {
                    client.send(msg:"9 0")
                }) {
                        HStack {
                            Text("SAW")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"9 1")
                }) {
                        HStack {
                            Text("SQU")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"9 2")
                }) {
                        HStack {
                            Text("TRI")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"9 3")
                }) {
                        HStack {
                            Text("NOISE")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"10 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"2 "+String(Int(frequency)))}
                )
            }
            Text("DUTY \(Int(self.duty))")
                .fontWeight(.semibold)
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...65536,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"11 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("VOICE")
                    .fontWeight(.semibold)
                Button(action: {
                    client.send(msg:"12 0")
                }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
                Button(action: {
                    client.send(msg:"12 1")
                }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"12 2")
                }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
                Button(action: {
                    client.send(msg:"12 3")
                }) {
                        HStack {
                            Text("8")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("SPREAD \(Int(self.spread))")
                    .fontWeight(.semibold)
                Slider(value: $spread,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"13 "+String(Int(spread)))}
                )
            }
            HStack {
                Text("FM WIDTH \(Int(self.fmwidth))")
                    .fontWeight(.semibold)
                Slider(value: $fmwidth,
                       in: 0...31,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"15 "+String(Int(fmwidth)))}
                )
            }
        }
    }
}


struct OSC3: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var spread: Float = 0
    @State private var duty: Float = 0
    @State private var fmwidth: Float = 0
    var body: some View {
        VStack{
            Text("OSC3")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"16 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
                Button(action: {
                    client.send(msg:"16 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("WAVE FORM")
                .fontWeight(.semibold)
            HStack {
                Button(action: {
                    client.send(msg:"17 0")
                }) {
                        HStack {
                            Text("SAW")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"17 1")
                }) {
                        HStack {
                            Text("SQU")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"17 2")
                }) {
                        HStack {
                            Text("TRI")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"17 3")
                }) {
                        HStack {
                            Text("NOISE")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {

                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"18 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"18 "+String(Int(frequency)))}
                )
            }
            Text("DUTY \(Int(self.duty))")
                .fontWeight(.semibold)
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...65536,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"19 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("VOICE")
                    .fontWeight(.semibold)
                Button(action: {
                    client.send(msg:"20 0")
                }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"20 1")
                }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"20 2")
                }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"20 3")
                }) {
                        HStack {
                            Text("8")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("SPREAD \(Int(self.spread))")
                    .fontWeight(.semibold)
                Slider(value: $spread,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"21 "+String(Int(spread)))}
                )
            }
            HStack {
                Text("FM WIDTH \(Int(self.fmwidth))")
                    .fontWeight(.semibold)
                Slider(value: $fmwidth,
                       in: 0...31,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"23 "+String(Int(fmwidth)))}
                )
            }
        }
    }
}


struct OSC4: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var spread: Float = 0
    @State private var duty: Float = 0
    @State private var fmwidth: Float = 0
    var body: some View {
        VStack{
            Text("OSC4")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"24 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"24 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
            }
            Text("WAVE FORM")
                .fontWeight(.semibold)
            HStack {
                Button(action: {
                    client.send(msg:"25 0")
                }) {
                        HStack {
                            Text("SAW")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"25 1")
                }) {
                        HStack {
                            Text("SQU")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"25 2")
                }) {
                        HStack {
                            Text("TRI")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
                Button(action: {
                    client.send(msg:"25 3")
                }) {
                        HStack {
                            Text("NOISE")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"26 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"26 "+String(Int(frequency)))}
                )
            }
            Text("DUTY \(Int(self.duty))")
                .fontWeight(.semibold)
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...65536,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"27 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("VOICE")
                    .fontWeight(.semibold)
                Button(action: {
                    client.send(msg:"28 0")
                }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"28 1")
                }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"28 2")
                }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"28 3")
                }) {
                        HStack {
                            Text("8")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("SPREAD \(Int(self.spread))")
                    .fontWeight(.semibold)
                Slider(value: $spread,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"29 "+String(Int(spread)))}
                )
            }
            HStack {
                Text("FM WIDTH \(Int(self.fmwidth))")
                    .fontWeight(.semibold)
                Slider(value: $fmwidth,
                       in: 0...31,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"31 "+String(Int(fmwidth)))}
                )
            }
        }
    }
}


struct OSC5: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var spread: Float = 0
    @State private var duty: Float = 0
    @State private var fmwidth: Float = 0
    @State private var fm1: Float = 0
    @State private var fm2: Float = 0
    @State private var fm3: Float = 0
    @State private var fm4: Float = 0
    @State private var fm5: Float = 0
    @State private var fm6: Float = 0
    @State private var fm7: Float = 0
    @State private var fm8: Float = 0
    var body: some View {
        VStack{
            Text("OSC5")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"32 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
                Button(action: {
                    client.send(msg:"32 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("WAVE FORM")
                .fontWeight(.semibold)
            HStack {
                Button(action: {
                    client.send(msg:"33 0")
                }) {
                        HStack {
                            Text("SAW")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"33 1")
                }) {
                        HStack {
                            Text("SQU")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"33 2")
                }) {
                        HStack {
                            Text("TRI")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"33 3")
                }) {
                        HStack {
                            Text("NOISE")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {

                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"34 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"34 "+String(Int(frequency)))}
                )
            }
            Text("DUTY \(Int(self.duty))")
                .fontWeight(.semibold)
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...65536,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"35 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("VOICE")
                    .fontWeight(.semibold)
                Button(action: {
                    client.send(msg:"36 0")
                }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"36 1")
                }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"36 2")
                }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"36 3")
                }) {
                        HStack {
                            Text("8")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("SPREAD \(Int(self.spread))")
                    .fontWeight(.semibold)
                Slider(value: $spread,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"37 "+String(Int(spread)))}
                )
            }
            HStack {
                Text("FM WIDTH \(Int(self.fmwidth))")
                    .fontWeight(.semibold)
                Slider(value: $fmwidth,
                       in: 0...31,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"39 "+String(Int(fmwidth)))}
                )
            }
            HStack {
                HStack {
                    Text("FM1 \(Int(self.fm1))")
                        .fontWeight(.semibold)
                    Slider(value: $fm1,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"40 "+String(Int(fm1)))}
                    )
                }
                HStack {
                    Text("FM2 \(Int(self.fm2))")
                        .fontWeight(.semibold)
                    Slider(value: $fm2,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"41 "+String(Int(fm2)))}
                    )
                }
                HStack {
                    Text("FM3 \(Int(self.fm3))")
                        .fontWeight(.semibold)
                    Slider(value: $fm3,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"42 "+String(Int(fm3)))}
                    )
                }
                HStack {
                    Text("FM4 \(Int(self.fm4))")
                        .fontWeight(.semibold)
                    Slider(value: $fm4,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"43 "+String(Int(fm4)))}
                    )
                }
            }
            HStack {
                HStack {
                    Text("FM5 \(Int(self.fm5))")
                        .fontWeight(.semibold)
                    Slider(value: $fm5,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"44 "+String(Int(fm5)))}
                    )
                }
                HStack {
                    Text("FM6 \(Int(self.fm6))")
                        .fontWeight(.semibold)
                    Slider(value: $fm6,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"45 "+String(Int(fm6)))}
                    )
                }
                HStack {
                    Text("FM7 \(Int(self.fm7))")
                        .fontWeight(.semibold)
                    Slider(value: $fm7,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"46 "+String(Int(fm7)))}
                    )
                }
                HStack {
                    Text("FM8 \(Int(self.fm8))")
                        .fontWeight(.semibold)
                    Slider(value: $fm8,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"47 "+String(Int(fm8)))}
                    )
                }
            }
        }
    }
}


struct OSC6: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var spread: Float = 0
    @State private var duty: Float = 0
    @State private var fmwidth: Float = 0
    @State private var fm1: Float = 0
    @State private var fm2: Float = 0
    @State private var fm3: Float = 0
    @State private var fm4: Float = 0
    @State private var fm5: Float = 0
    @State private var fm6: Float = 0
    @State private var fm7: Float = 0
    @State private var fm8: Float = 0
    var body: some View {
        VStack{
            Text("OSC6")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"48 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"48 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("WAVE FORM")
                .fontWeight(.semibold)
            HStack {
                Button(action: {
                    client.send(msg:"49 0")
                }) {
                        HStack {
                            Text("SAW")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"49 1")
                }) {
                        HStack {
                            Text("SQU")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"49 2")
                }) {
                        HStack {
                            Text("TRI")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"49 3")
                }) {
                        HStack {
                            Text("NOISE")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"50 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"50 "+String(Int(frequency)))}
                )
            }
            Text("DUTY \(Int(self.duty))")
                .fontWeight(.semibold)
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...65536,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"51 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("VOICE")
                    .fontWeight(.semibold)
                Button(action: {
                    client.send(msg:"52 0")
                }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"52 1")
                }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"52 2")
                }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"52 3")
                }) {
                        HStack {
                            Text("8")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("SPREAD \(Int(self.spread))")
                    .fontWeight(.semibold)
                Slider(value: $spread,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"53 "+String(Int(spread)))}
                )
            }
            HStack {
                Text("FM WIDTH \(Int(self.fmwidth))")
                    .fontWeight(.semibold)
                Slider(value: $fmwidth,
                       in: 0...31,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"55 "+String(Int(fmwidth)))}
                )
            }
            HStack {
                HStack {
                    Text("FM1 \(Int(self.fm1))")
                        .fontWeight(.semibold)
                    Slider(value: $fm1,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"56 "+String(Int(fm1)))}
                    )
                }
                HStack {
                    Text("FM2 \(Int(self.fm2))")
                        .fontWeight(.semibold)
                    Slider(value: $fm2,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"57 "+String(Int(fm2)))}
                    )
                }
                HStack {
                    Text("FM3 \(Int(self.fm3))")
                        .fontWeight(.semibold)
                    Slider(value: $fm3,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"58 "+String(Int(fm3)))}
                    )
                }
                HStack {
                    Text("FM4 \(Int(self.fm4))")
                        .fontWeight(.semibold)
                    Slider(value: $fm4,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"59 "+String(Int(fm4)))}
                    )
                }
            }
            HStack {
                HStack {
                    Text("FM5 \(Int(self.fm5))")
                        .fontWeight(.semibold)
                    Slider(value: $fm5,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"60 "+String(Int(fm5)))}
                    )
                }
                HStack {
                    Text("FM6 \(Int(self.fm6))")
                        .fontWeight(.semibold)
                    Slider(value: $fm6,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"61 "+String(Int(fm6)))}
                    )
                }
                HStack {
                    Text("FM7 \(Int(self.fm7))")
                        .fontWeight(.semibold)
                    Slider(value: $fm7,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"62 "+String(Int(fm7)))}
                    )
                }
                HStack {
                    Text("FM8 \(Int(self.fm8))")
                        .fontWeight(.semibold)
                    Slider(value: $fm8,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"63 "+String(Int(fm8)))}
                    )
                }
            }
        }
    }
}


struct OSC7: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var spread: Float = 0
    @State private var duty: Float = 0
    @State private var fmwidth: Float = 0
    @State private var fm1: Float = 0
    @State private var fm2: Float = 0
    @State private var fm3: Float = 0
    @State private var fm4: Float = 0
    @State private var fm5: Float = 0
    @State private var fm6: Float = 0
    @State private var fm7: Float = 0
    @State private var fm8: Float = 0
    var body: some View {
        VStack{
            Text("OSC7")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"64 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"64 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("WAVE FORM")
                .fontWeight(.semibold)
            HStack {
                Button(action: {
                    client.send(msg:"65 0")
                }) {
                        HStack {
                            Text("SAW")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"65 1")
                }) {
                        HStack {
                            Text("SQU")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"65 2")
                }) {
                        HStack {
                            Text("TRI")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"65 3")
                }) {
                        HStack {
                            Text("NOISE")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"66 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"66 "+String(Int(frequency)))}
                )
            }
            Text("DUTY \(Int(self.duty))")
                .fontWeight(.semibold)
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...65536,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"67 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("VOICE")
                    .fontWeight(.semibold)
                Button(action: {
                    client.send(msg:"68 0")
                }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"68 1")
                }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"68 2")
                }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"68 3")
                }) {
                        HStack {
                            Text("8")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("SPREAD \(Int(self.spread))")
                    .fontWeight(.semibold)
                Slider(value: $spread,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"69 "+String(Int(spread)))}
                )
            }
            HStack {
                Text("FM WIDTH \(Int(self.fmwidth))")
                    .fontWeight(.semibold)
                Slider(value: $fmwidth,
                       in: 0...31,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"71 "+String(Int(fmwidth)))}
                )
            }
            HStack {
                HStack {
                    Text("FM1 \(Int(self.fm1))")
                        .fontWeight(.semibold)
                    Slider(value: $fm1,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"72 "+String(Int(fm1)))}
                    )
                }
                HStack {
                    Text("FM2 \(Int(self.fm2))")
                        .fontWeight(.semibold)
                    Slider(value: $fm2,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"73 "+String(Int(fm2)))}
                    )
                }
                HStack {
                    Text("FM3 \(Int(self.fm3))")
                        .fontWeight(.semibold)
                    Slider(value: $fm3,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"74 "+String(Int(fm3)))}
                    )
                }
                HStack {
                    Text("FM4 \(Int(self.fm4))")
                        .fontWeight(.semibold)
                    Slider(value: $fm4,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"75 "+String(Int(fm4)))}
                    )
                }
            }
            HStack {
                HStack {
                    Text("FM5 \(Int(self.fm5))")
                        .fontWeight(.semibold)
                    Slider(value: $fm5,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"76 "+String(Int(fm5)))}
                    )
                }
                HStack {
                    Text("FM6 \(Int(self.fm6))")
                        .fontWeight(.semibold)
                    Slider(value: $fm6,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"77 "+String(Int(fm6)))}
                    )
                }
                HStack {
                    Text("FM7 \(Int(self.fm7))")
                        .fontWeight(.semibold)
                    Slider(value: $fm7,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"78 "+String(Int(fm7)))}
                    )
                }
                HStack {
                    Text("FM8 \(Int(self.fm8))")
                        .fontWeight(.semibold)
                    Slider(value: $fm8,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"79 "+String(Int(fm8)))}
                    )
                }
            }
        }
    }
}


struct OSC8: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var spread: Float = 0
    @State private var duty: Float = 0
    @State private var fmwidth: Float = 0
    @State private var fm1: Float = 0
    @State private var fm2: Float = 0
    @State private var fm3: Float = 0
    @State private var fm4: Float = 0
    @State private var fm5: Float = 0
    @State private var fm6: Float = 0
    @State private var fm7: Float = 0
    @State private var fm8: Float = 0
    var body: some View {
        VStack{
            Text("OSC8")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"80 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"80 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
            }
            Text("WAVE FORM")
                .fontWeight(.semibold)
            HStack {
                Button(action: {
                    client.send(msg:"81 0")
                }) {
                        HStack {
                            Text("SAW")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"81 1")
                }) {
                        HStack {
                            Text("SQU")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
                Button(action: {
                    client.send(msg:"81 2")
                }) {
                        HStack {
                            Text("TRI")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"81 3")
                }) {
                        HStack {
                            Text("NOISE")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"82 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"82 "+String(Int(frequency)))}
                )
            }
            Text("DUTY \(Int(self.duty))")
                .fontWeight(.semibold)
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...65536,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"83 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("VOICE")
                    .fontWeight(.semibold)
                Button(action: {
                    client.send(msg:"84 0")
                }) {
                        HStack {
                            Text("1")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"84 1")
                }) {
                        HStack {
                            Text("2")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"84 2")
                }) {
                        HStack {
                            Text("4")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
                Button(action: {
                    client.send(msg:"84 3")
                }) {
                        HStack {
                            Text("8")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("SPREAD \(Int(self.spread))")
                    .fontWeight(.semibold)
                Slider(value: $spread,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"85 "+String(Int(spread)))}
                )
            }
            HStack {
                Text("FM WIDTH \(Int(self.fmwidth))")
                    .fontWeight(.semibold)
                Slider(value: $fmwidth,
                       in: 0...31,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"87 "+String(Int(fmwidth)))}
                )
            }
            HStack {
                HStack {
                    Text("FM1 \(Int(self.fm1))")
                        .fontWeight(.semibold)
                    Slider(value: $fm1,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"88 "+String(Int(fm1)))}
                    )
                }
                HStack {
                    Text("FM2 \(Int(self.fm2))")
                        .fontWeight(.semibold)
                    Slider(value: $fm2,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"89 "+String(Int(fm2)))}
                    )
                }
                HStack {
                    Text("FM3 \(Int(self.fm3))")
                        .fontWeight(.semibold)
                    Slider(value: $fm3,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"90 "+String(Int(fm3)))}
                    )
                }
                HStack {
                    Text("FM4 \(Int(self.fm4))")
                        .fontWeight(.semibold)
                    Slider(value: $fm4,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"91 "+String(Int(fm4)))}
                    )
                }
            }
            HStack {
                HStack {
                    Text("FM5 \(Int(self.fm5))")
                        .fontWeight(.semibold)
                    Slider(value: $fm5,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"92 "+String(Int(fm5)))}
                    )
                }
                HStack {
                    Text("FM6 \(Int(self.fm6))")
                        .fontWeight(.semibold)
                    Slider(value: $fm6,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"93 "+String(Int(fm6)))}
                    )
                }
                HStack {
                    Text("FM7 \(Int(self.fm7))")
                        .fontWeight(.semibold)
                    Slider(value: $fm7,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"94 "+String(Int(fm7)))}
                    )
                }
                HStack {
                    Text("FM8 \(Int(self.fm8))")
                        .fontWeight(.semibold)
                    Slider(value: $fm8,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"95 "+String(Int(fm8)))}
                    )
                }
            }
        }
    }
}


struct SINE1: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var fm1: Float = 0
    @State private var fm2: Float = 0
    @State private var fm3: Float = 0
    @State private var fm4: Float = 0
    @State private var fm5: Float = 0
    @State private var fm6: Float = 0
    @State private var fm7: Float = 0
    @State private var fm8: Float = 0
    var body: some View {
        VStack{
            Text("SINE1")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"96 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"96 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"97 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"97 "+String(Int(frequency)))}
                )
            }
        }
        VStack {
            HStack {
                HStack {
                    Text("FM1 \(Int(self.fm1))")
                        .fontWeight(.semibold)
                    Slider(value: $fm1,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"98 "+String(Int(fm1)))}
                    )
                }
                HStack {
                    Text("FM2 \(Int(self.fm2))")
                        .fontWeight(.semibold)
                    Slider(value: $fm2,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"99 "+String(Int(fm2)))}
                    )
                }
                HStack {
                    Text("FM3 \(Int(self.fm3))")
                        .fontWeight(.semibold)
                    Slider(value: $fm3,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"100 "+String(Int(fm3)))}
                    )
                }
                HStack {
                    Text("FM4 \(Int(self.fm4))")
                        .fontWeight(.semibold)
                    Slider(value: $fm4,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"101 "+String(Int(fm4)))}
                    )
                }
            }
            HStack {
                HStack {
                    Text("FM5 \(Int(self.fm5))")
                        .fontWeight(.semibold)
                    Slider(value: $fm5,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"102 "+String(Int(fm5)))}
                    )
                }
                HStack {
                    Text("FM6 \(Int(self.fm6))")
                        .fontWeight(.semibold)
                    Slider(value: $fm6,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"103 "+String(Int(fm6)))}
                    )
                }
                HStack {
                    Text("FM7 \(Int(self.fm7))")
                        .fontWeight(.semibold)
                    Slider(value: $fm7,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"104 "+String(Int(fm7)))}
                    )
                }
                HStack {
                    Text("FM8 \(Int(self.fm8))")
                        .fontWeight(.semibold)
                    Slider(value: $fm8,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"105 "+String(Int(fm8)))}
                    )
                }
            }
        }
    }
}


struct SINE2: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var fm1: Float = 0
    @State private var fm2: Float = 0
    @State private var fm3: Float = 0
    @State private var fm4: Float = 0
    @State private var fm5: Float = 0
    @State private var fm6: Float = 0
    @State private var fm7: Float = 0
    @State private var fm8: Float = 0
    var body: some View {
        VStack{
            Text("SINE1")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"112 1")
                }) {
                        HStack {
                            Text("ON")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"112 0")
                }) {
                        HStack {
                            Text("OFF")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"113 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"113 "+String(Int(frequency)))}
                )
            }
        }
        VStack {
            HStack {
                HStack {
                    Text("FM1 \(Int(self.fm1))")
                        .fontWeight(.semibold)
                    Slider(value: $fm1,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"114 "+String(Int(fm1)))}
                    )
                }
                HStack {
                    Text("FM2 \(Int(self.fm2))")
                        .fontWeight(.semibold)
                    Slider(value: $fm2,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"115 "+String(Int(fm2)))}
                    )
                }
                HStack {
                    Text("FM3 \(Int(self.fm3))")
                        .fontWeight(.semibold)
                    Slider(value: $fm3,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"116 "+String(Int(fm3)))}
                    )
                }
                HStack {
                    Text("FM4 \(Int(self.fm4))")
                        .fontWeight(.semibold)
                    Slider(value: $fm4,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"117 "+String(Int(fm4)))}
                    )
                }
            }
            HStack {
                HStack {
                    Text("FM5 \(Int(self.fm5))")
                        .fontWeight(.semibold)
                    Slider(value: $fm5,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"118 "+String(Int(fm5)))}
                    )
                }
                HStack {
                    Text("FM6 \(Int(self.fm6))")
                        .fontWeight(.semibold)
                    Slider(value: $fm6,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"119 "+String(Int(fm6)))}
                    )
                }
                HStack {
                    Text("FM7 \(Int(self.fm7))")
                        .fontWeight(.semibold)
                    Slider(value: $fm7,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"120 "+String(Int(fm7)))}
                    )
                }
                HStack {
                    Text("FM8 \(Int(self.fm8))")
                        .fontWeight(.semibold)
                    Slider(value: $fm8,
                           in: 0...1,
                           step : 1,
                           onEditingChanged: { _ in
                            client.send(msg:"121 "+String(Int(fm8)))}
                    )
                }
            }
        }
    }
}


struct VCA: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var fixed: Float = 0
    @State private var duty: Float = 0
    @State private var attack: Float = 0
    @State private var decay: Float = 0
    @State private var sustain: Float = 0
    @State private var release: Float = 0
    @State private var reverse: Float = 0
    @State private var g: Float = 1
    @State private var lfo: Float = 1
    var body: some View {
        VStack{
            Text("VCA")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"128 0")
                }) {
                        HStack {
                            Text("FIXED")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"128 1")
                }) {
                        HStack {
                            Text("ENV")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"128 2")
                }) {
                        HStack {
                            Text("LFO")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"128 3")
                }) {
                        HStack {
                            Text("E+L")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("FIXED \(Int(self.fixed))")
                    .fontWeight(.semibold)
                Slider(value: $fixed,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"129 "+String(Int(fixed)))}
                )
            }
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"130 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("ATTACK ")
                    .fontWeight(.semibold)
                Slider(value: $attack,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"131 "+String(Int(attack)))}
                )
            }
            HStack {
                Text("DECAY ")
                    .fontWeight(.semibold)
                Slider(value: $decay,
                       in: 0...5000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"132 "+String(Int(decay)))}
                )

            }
            HStack {
                Text("SUSTAIN ")
                    .fontWeight(.semibold)
                Slider(value: $sustain,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"133 "+String(Int(sustain)))}
                )

            }
            HStack {
                Text("RELEASE ")
                    .fontWeight(.semibold)
                Slider(value: $release,
                       in: 0...5000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"134 "+String(Int(release)))}
                )

            }
            HStack {
                Text("REVERSE \(Int(self.reverse))")
                    .fontWeight(.semibold)
                Slider(value: $reverse,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"135 "+String(Int(reverse)))}
                )
            }
            HStack {
                Text("LFO OSC6-SINE? ")
                    .fontWeight(.semibold)
                Slider(value: $lfo,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"137 "+String(Int(lfo)))}
                )
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"136 "+String(Int(frequency)))}
                )

            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"136 "+String(Int(frequency)))}
                )
            }
            Slider(value: $g,
                   in: 0...1,
                   step : 1,
                   onEditingChanged: { bool in
                    if bool {
                        client.send(msg:"g 1")
                    }else{
                        client.send(msg:"g 2")
                    }})
        }
    }
}


struct LPF: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var fixed: Float = 0
    @State private var duty: Float = 0
    @State private var attack: Float = 0
    @State private var decay: Float = 0
    @State private var sustain: Float = 0
    @State private var release: Float = 0
    @State private var reverse: Float = 0
    @State private var g: Float = 1
    @State private var lfo: Float = 1
    var body: some View {
        VStack{
            Text("LPF")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"144 0")
                }) {
                        HStack {
                            Text("FIXED")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"144 1")
                }) {
                        HStack {
                            Text("ENV")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)

                }
                Button(action: {
                    client.send(msg:"144 2")
                }) {
                        HStack {
                            Text("LFO")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"144 3")
                }) {
                        HStack {
                            Text("E+L")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("FIXED \(Int(self.fixed))")
                    .fontWeight(.semibold)
                Slider(value: $fixed,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"145 "+String(Int(fixed)))}
                )
            }
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"146 "+String(Int(duty)))}
                )
            }
        }
        VStack {
            HStack {
                Text("ATTACK ")
                    .fontWeight(.semibold)
                Slider(value: $attack,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"147 "+String(Int(attack)))}
                )
            }
            HStack {
                Text("DECAY ")
                    .fontWeight(.semibold)
                Slider(value: $decay,
                       in: 0...5000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"148 "+String(Int(decay)))}
                )
            }
            HStack {
                Text("SUSTAIN ")
                    .fontWeight(.semibold)
                Slider(value: $sustain,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"149 "+String(Int(sustain)))}
                )
            }
            HStack {
                Text("RELEASE ")
                    .fontWeight(.semibold)
                Slider(value: $release,
                       in: 0...5000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"150 "+String(Int(release)))}
                )
            }
            HStack {
                Text("REVERSE \(Int(self.reverse))")
                    .fontWeight(.semibold)
                Slider(value: $reverse,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"151 "+String(Int(reverse)))}
                )
            }
            HStack {
                Text("LFO OSC7-SINE? ")
                    .fontWeight(.semibold)
                Slider(value: $lfo,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"153 "+String(Int(lfo)))}
                )
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"152 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"152 "+String(Int(frequency)))}
                )
            }
            Slider(value: $g,
                   in: 0...1,
                   step : 1,
                   onEditingChanged: { bool in
                    if bool {
                        client.send(msg:"g 1")
                    }else{
                        client.send(msg:"g 2")
                    }})
        }
    }
}


struct HPF: View {
    @ObservedObject var client :Client
    @State private var frequency: Double = 0
    @State private var fixed: Float = 0
    @State private var duty: Float = 0
    @State private var attack: Float = 0
    @State private var decay: Float = 0
    @State private var sustain: Float = 0
    @State private var release: Float = 0
    @State private var reverse: Float = 0
    @State private var g: Float = 1
    @State private var lfo: Float = 1
    var body: some View {
        VStack{
            Text("HPF")
                .fontWeight(.semibold)
                .font(.title)
            HStack {
                Button(action: {
                    client.send(msg:"160 0")
                }) {
                        HStack {
                            Text("FIXED")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"160 1")
                }) {
                        HStack {
                            Text("ENV")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"160 2")
                }) {
                        HStack {
                            Text("LFO")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
                Button(action: {
                    client.send(msg:"160 3")
                }) {
                        HStack {
                            Text("E+L")
                                .fontWeight(.semibold)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                }
            }
            HStack {
                Text("FIXED \(Int(self.fixed))")
                    .fontWeight(.semibold)
                Slider(value: $fixed,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"161 "+String(Int(fixed)))}
                )

            }
            HStack {
                Text("DUTY \(Int(self.duty))")
                    .fontWeight(.semibold)
                Slider(value: $duty,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"162 "+String(Int(duty)))}
                )

            }

        }
        VStack {
            HStack {
                Text("ATTACK ")
                    .fontWeight(.semibold)
                Slider(value: $attack,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"163 "+String(Int(attack)))}
                )
            }
            HStack {
                Text("DECAY ")
                    .fontWeight(.semibold)
                Slider(value: $decay,
                       in: 0...5000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"164 "+String(Int(decay)))}
                )
            }
            HStack {
                Text("SUSTAIN ")
                    .fontWeight(.semibold)
                Slider(value: $sustain,
                       in: 0...255,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"165 "+String(Int(sustain)))}
                )
            }
            HStack {
                Text("RELEASE ")
                    .fontWeight(.semibold)
                Slider(value: $release,
                       in: 0...5000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"166 "+String(Int(release)))}
                )
            }
            HStack {
                Text("REVERSE \(Int(self.reverse))")
                    .fontWeight(.semibold)
                Slider(value: $reverse,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"167 "+String(Int(reverse)))}
                )
            }
            HStack {
                Text("LFO OSC9-SINE? ")
                    .fontWeight(.semibold)
                Slider(value: $lfo,
                       in: 0...1,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"169 "+String(Int(lfo)))}
                )
            }
            Text("FREQUENCY \(Int(self.frequency))")
                .fontWeight(.semibold)
            HStack {
                Slider(value: $frequency,
                       in: 0...108,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"168 "+String(Int(frequency)))}
                )
            }
            HStack {
                Slider(value: $frequency,
                       in: 109...1500000,
                       step : 1,
                       onEditingChanged: { _ in
                        client.send(msg:"168 "+String(Int(frequency)))}
                )
            }
            Slider(value: $g,
                   in: 0...1,
                   step : 1,
                   onEditingChanged: { bool in
                    if bool {
                        client.send(msg:"g 1")
                    }else{
                        client.send(msg:"g 2")
                    }})
        }
    }
}
