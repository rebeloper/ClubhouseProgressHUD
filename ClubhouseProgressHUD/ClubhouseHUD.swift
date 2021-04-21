//
//  ClubhouseHUD.swift
//  ClubhouseProgressHUD
//
//  Created by Alex Nagy on 21.04.2021.
//

import SwiftUI

struct ClubhouseHUD: View {
    
    let timer = Timer.publish(every: 0.15, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    @State private var isOn = [true, false, false]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(isOn[0] ? .black : Color(.systemGray5))
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(isOn[1] ? .black : Color(.systemGray5))
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(isOn[2] ? .black : Color(.systemGray5))
                Spacer()
            }
            Spacer()
        }
        .opacity(0.7)
        .onReceive(timer) { (_) in
            counter += 1
            
            if counter >= 3 {
                counter = 0
            }
            
            let remainder = counter % 3
            
            switch remainder {
            case 0:
                isOn = [true, false, false]
            case 1:
                isOn = [false, true, false]
            case 2:
                isOn = [false, false, true]
            default:
                fatalError()
            }
        }
        .onDisappear {
            timer.upstream.connect().cancel()
        }
    }
}

struct ClubhouseHUD_Previews: PreviewProvider {
    static var previews: some View {
        ClubhouseHUD()
    }
}

extension View {
    func embedInClubhouseHUD(isActive: Binding<Bool>) -> some View {
        ZStack {
            self.disabled(isActive.wrappedValue)
            if isActive.wrappedValue {
                Color.black.opacity(0.1).ignoresSafeArea()
                ClubhouseHUD()
            }
        }
    }
}
