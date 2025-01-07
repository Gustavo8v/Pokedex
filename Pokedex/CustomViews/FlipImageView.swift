import SwiftUI

struct FlipImageView: View {
    
    let frontURL: String
    let shinyURL: String
    
    @State private var isFlipped = false
    @State private var rotationAngle = 0.0
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "rectangle.landscape.rotate")
                        .resizable()
                        .frame(width: 30, height: 25)
                        .foregroundColor(.blue)
                }
                Spacer()
            }
            if !isFlipped {
                AsynPokemonImage(urlPokemon: frontURL)
                    .rotation3DEffect(
                        Angle(degrees: rotationAngle),
                        axis: (x: 0, y: 1, z: 0)
                    )
            } else {
                AsynPokemonImage(urlPokemon: shinyURL)
                    .rotation3DEffect(
                        Angle(degrees: rotationAngle),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
        }
        .onTapGesture {
            flipImage()
        }
    }

    private func flipImage() {
        withAnimation(.easeInOut(duration: 0.6)) {
            rotationAngle += 180
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isFlipped.toggle()
        }
    }
}

#Preview {
    FlipImageView(frontURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
                  shinyURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/1.png")
}
