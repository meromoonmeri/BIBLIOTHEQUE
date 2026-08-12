class ShowStarterPokemon
    def initialize(pokemon)
        @viewport = Viewport.new(0, 0, Graphics.width, Graphics.height)
        @viewport.z = 99999
        @sprites = {}
        @sprites["background"] = IconSprite.new(0, 0, @viewport)
        @sprites["background"].setBitmap("Graphics/UI/starterBG")
        @sprites["pokemon"] = PokemonSprite.new(@viewport)
        @sprites["pokemon"].setOffset(PictureOrigin::CENTER)
        @sprites["pokemon"].setPokemonBitmap(pokemon, false)
        @sprites["pokemon"].x = Graphics.width / 2
        @sprites["pokemon"].y = (Graphics.height - 64) / 2
        @sprites["helpwindow"] = Window_AdvancedTextPokemon.newWithSize(
        "", 0, Graphics.height - 64, Graphics.width, 64, @viewport
        )
        GameData::Species.play_cry_from_species(pokemon.species, pokemon.form)
        text = _INTL("Ah, {1}. The {2} Pokémon...", GameData::Species.get(pokemon.species).name, GameData::Species.get_species_form(pokemon.species, pokemon.form).category)
        @sprites["helpwindow"].text = text
        main_loop
    end

    def main_loop
        loop do
            @sprites["pokemon"].update
            Graphics.update
            Input.update
            break if Input.trigger?(Input::USE) || Input.trigger?(Input::BACK)
        end
        exit
    end

    def exit
        pbDisposeSpriteHash(@sprites)
        @viewport.dispose
    end
end