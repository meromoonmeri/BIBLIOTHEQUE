######################################################################################################
#                                    Comandos con colores                                            #
#                                        Autor : Bezier                                              #
#                                         Idea : Felidaex                                            #
#                                                                                                    #
# Este script amplia la clase Window_CommandPokemon, que muestra un panel con una lista de comandos, #
# y permite pintar cada comando con colores personalizados.                                          #
#                                                                                                    #
# El formato de un comando coloreado puede ser el siguiente:                                         #
# commands=[]                                                                                        #
# commands[0]="Texto" # Un comando con solo texto, como siempre                                      #
# commands[1]=["Texto"] # Array de 1 elemento. Lo pinta con COMMAND_BASECOLOR y COMMAND_SHADOWCOLOR  #
# commands[2]=["Texto", Color1] # Pinta el texto con el Color1 de base y sombra COMMAND_SHADOWCOLOR  #
# commands[3]=["Texto", Color1, Color2] # Pinta el texto con Color1 de base y Color2 de sombra       #
######################################################################################################
 
COMMAND_BASECOLOR = Color.new(0,80,160)
COMMAND_SHADOWCOLOR = Color.new(128,192,240)
 
class Window_CommandPokemon
  alias wcpinitialize initialize
  def initialize(commands,width=nil)
    @colorKey = []
    for i in 0...commands.length
      if commands[i].is_a?(Array)
        if commands[i].length >= 2 && commands[i][1].is_a?(Color)
          @colorKey[i] = [commands[i][1]]
          if commands[i].length == 3
            @colorKey[i] << commands[i][2] 
          else
            @colorKey[i] << COMMAND_SHADOWCOLOR
          end
        else
          @colorKey[i] = [COMMAND_BASECOLOR, COMMAND_SHADOWCOLOR]
        end
        commands[i] = commands[i][0]
      end
    end
    wcpinitialize(commands,width)
  end
  
  def drawItem(index,count,rect)
    pbSetSystemFont(self.contents) if @starting
    rect = drawCursor(index,rect)
    base = self.baseColor
    shadow = self.shadowColor
    if @colorKey[index]
      base = @colorKey[index][0]
      shadow = @colorKey[index][1] if @colorKey[index].length == 2
    end
    pbDrawShadowText(self.contents,rect.x,rect.y + (self.contents.text_offset_y || 0),rect.width,rect.height,@commands[index],base,shadow)
  end
end