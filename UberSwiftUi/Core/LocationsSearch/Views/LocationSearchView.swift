//
//  LocationSearchView.swift
//  UberSwiftUi
//
//  Created by Alejandro Rodriguez on 03/08/2024.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var viewModel: LocationSearchViewModel

    var body: some View {
        VStack{
            //Header View
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                
                VStack{
                    TextField("Current location", text: $startLocationText)
                        .padding(.leading, 5)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(7)
                        .padding(.trailing)
                        
                    TextField("Where to", text: $viewModel.queryFragment)
                        .padding(.leading, 5)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .cornerRadius(7)
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .padding(.top, 64)
            
            Divider()
                .padding(.vertical)
            
            // ListView
            ScrollView{
                VStack(alignment: .leading){
                    ForEach(viewModel.results, id: \.self) { result in
                        LocationSearchResultsCell(title: result.title, subtitle: result.subtitle)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    viewModel.selectLocation(result)
                                    mapState = .locationSelected
                                }
                            }
                    }
                }
            }
        }
        .background(Color.theme.backgroudColor)
        .background(.white)
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
}
