module Settings
    #====================================================================================
    #=============================== Tip Cards Settings =================================
    #====================================================================================
    
        #--------------------------------------------------------------------------------
        #  Set the default background for tip cards.
        #  The files are located in Graphics/Pictures/Tip Cards
        #--------------------------------------------------------------------------------	
        TIP_CARDS_DEFAULT_BG            = "bg"

        #--------------------------------------------------------------------------------
        #  If set to true, if only one group is shown when calling pbRevisitTipCardsGrouped,
        #  the group header will still appear. Otherwise, the header won't appear.
        #--------------------------------------------------------------------------------	
        TIP_CARDS_SINGLE_GROUP_SHOW_HEADER = false

        #--------------------------------------------------------------------------------
        #  If set to true, when the player uses the SPECIAL control, a list of all
        #  groups available to view will appear for the player to jump to one.
        #--------------------------------------------------------------------------------	
        TIP_CARDS_GROUP_LIST = true

        #--------------------------------------------------------------------------------
        #  Set the default text colors
        #--------------------------------------------------------------------------------	
        TIP_CARDS_TEXT_MAIN_COLOR       = Color.new(16, 24, 32)# Color.new(80, 80, 88)
        TIP_CARDS_TEXT_SHADOW_COLOR     = Color.new(16, 24, 32, 60)#Color.new(160, 160, 168)

        #--------------------------------------------------------------------------------
        #  Set the sound effect to play when showing, dismissing, and switching tip cards.
        #  For TIP_CARDS_SWITCH_SE, set to nil to use the default cursor sound effect.
        #--------------------------------------------------------------------------------	
        TIP_CARDS_SHOW_SE               = "GUI menu open"
        TIP_CARDS_DISMISS_SE            = "GUI menu close"
        TIP_CARDS_SWITCH_SE             = nil

        #--------------------------------------------------------------------------------
        #  Define your tips in this hash. The :EXAMPLE describes what some of the 
        #  parameters do.
        #--------------------------------------------------------------------------------	
        TIP_CARDS_CONFIGURATION = {
            :CONTROLS0 => { # ID of the tip
                    # Required Settings
                    :Title => _INTL("Controls help"),
                    :Text => _INTL("<c2=0999367C><b>F1</b></c2> opens the Key Bindings window. Controllers are supported.\n\nThe <c2=0999367C><b>Q</b></c2> or <c2=0999367C><b>ALT keys</b></c2> speed up the game.\n\nPress <c2=0999367C><b>AltGr + Enter</b></c2> to enter fullscreen."),
                    # Optional Settings
                    # :Image => "example", # An image located in Graphics/Pictures/Tip Cards/Images
                    # :ImagePosition => :Top, # Set to :Top, :Bottom, :Left, or :Right.
                        # If not defined, it will place wider images to :Top, and taller images to :Left.
                    :Background => "bg", # A replacement background image located in Graphics/Pictures/Tip Cards
                    # :YAdjustment => 0, # Adjust the vertical spacing of the tip's text (in pixels)
                    # :HideRevisit => true # Set to true if you don't want the player to see the tip again when revisiting seen tips.
            },
            :DUNGEON0 => {
                :Title => _INTL("Climbing up Destiny Tower"),
                :Text => _INTL("Search for items and gold, and catch any Pokémon you encounter! Make your way up the tower by finding the staircase.\n\nPress the <c2=0999367C><b>Q</b></c2> key to change the size for the map layout."),
                :Background => "bg",
            },
            :DUNGEON1 => {
                :Title => _INTL("Midway Bosses"),
                :Text => _INTL("You'll face a stronger than usual Pokémon every X5th floor. These Pokémon have perfect IVs and can't be caught until you've defeated them."),
                :Background => "bg",
            },
            :DUNGEON2 => {
                :Title => _INTL("Prepping against strong Trainers!"),
                :Text => _INTL("Talk to Uxie, Mesprit, and Azelf to browse useful items, access your PC Boxes, heal your team, and more! You can even talk to Arceus... if you really want to."),
                :Background => "bg",
            },
            :POKEMONTIP0 => {
                :Title => _INTL("Pokémon Data"),
                :Text => _INTL("Press the <c2=0999367C><b>USE</b></c2> button to view extra info such as the Pokédex entry, EV stats, or the move reminder."),
                :Background => "bg",
            },
            :POKEMONTIP1 => {
                :Title => _INTL("Alpaca god powers"),
                :Text => _INTL("Ask Arceus to change its type to match any Plate in your Bag! This will boost its moves and make catching Pokémon of that type easier."),
                :Background => "bg",
            },
        }

        TIP_CARDS_GROUPS = {
            :CONTROLS => {
                :Title => _INTL("Controls Help"),
                :Tips => [:CONTROLS0]
            },
            :DUNGEONTIPS => {
                :Title => _INTL("Dungeon Tips"),
                :Tips => [:DUNGEON0, :DUNGEON1, :DUNGEON2]
            },
            :POKEMONTIPS => {
                :Title => _INTL("Pokémon Tips"),
                :Tips => [:POKEMONTIP0, :POKEMONTIP1]
            }
        }

end