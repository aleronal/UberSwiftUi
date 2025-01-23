//
//  MapViewActionBottom.swift
//  UberSwiftUi
//
//  Created by Alejandro Rodriguez on 03/08/2024.
//

import SwiftUI

struct MapViewActionBottom: View {
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel
    
    var body: some View {
        Button {
            withAnimation(.spring()){
                actionForState(mapState)
            }
        } label: {
            Image(systemName: imageNameForState(mapState))
                .font(.title2)
                .foregroundColor(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 6)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    func actionForState(_ state: MapViewState){
        switch state {
        case .noInput:
            print("No input")
        case .searchingForLocation:
            mapState = .noInput
        case .locationSelected, .polylineAdded:
            mapState = .noInput
            viewModel.selectedUberLocation = nil
        }
    }
    
    func imageNameForState(_ state: MapViewState) -> String{
        switch state {
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation,.locationSelected:
            return "arrow.left"
        default:
            return "line.3.horizontal"
        }
    
    }
}

#Preview {
    MapViewActionBottom(mapState: .constant(.noInput))
}
