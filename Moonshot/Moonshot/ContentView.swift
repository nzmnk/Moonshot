//
//  ContentView.swift
//  Moonshot
//
//  Created by Никита Зименко on 15.05.2021.
//

import SwiftUI

struct ContentView: View {
    
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json") // Decoding JSON
    let missions: [Mission] = Bundle.main.decode("missions.json") // Decoding JSON
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    
                    Image(mission.image)
                        .resizable()
                        .scaledToFit() // Lifehack how to set aspect ratio
                        .frame(width: 44, height: 44)
//                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                        Text(mission.formattedLaunchDate)
                   }
                }
            }
            .navigationBarTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
