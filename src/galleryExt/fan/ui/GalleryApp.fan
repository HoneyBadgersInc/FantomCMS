using audioExt
using dom
using fui
using fwt
using gfx
using util
using webfwt

@Js
class GalleryApp : App {
  ContentPane contentPane := ContentPane()
  
  new make() : super() {
    content = BorderPane {
      it.bg = Gradient.fromStr("0% 50%, 100% 50%, #f00 0.1, #00f 0.9", true)
      EdgePane {
        left = ConstraintPane {
          it.minw = it.maxw = 100
          GridPane {
            it.halignPane = Halign.center
            it.valignPane = Valign.center
            Button { text = "prev" },           
          },
        }
        center = BorderPane {
          it.border = Border.fromStr( "3 solid #000000 30" )
          it.insets = Insets( 10, 16 )
          it.bg = Color.purple
          //numCols = 50
          //me := it
          //50.times { me.add( Label { it.image = a } ) }
          GridPane {
            it.halignPane = Halign.center
            it.valignPane = Valign.center
            contentPane,
          },
        }
        right = ConstraintPane {
          it.minw = it.maxw = 100
          GridPane {
            it.halignPane = Halign.center
            it.valignPane = Valign.center
            Button { text = "next" },                  
          },
        }
      },
    }
    relayout
  }
  
  override Void onSaveState( State state ) {

  }
  
  override Void onLoadState( State state ) {
    uri := Win.cur.uri
    uri = uri.pathOnly.relTo( Fui.cur.appUri( name ) ) + ( "?" + ( uri.queryStr ?: "" ) ).toUri
    contentPane.content = null
    switch ( uri[0..0] ) {
      case `files/`:
        uri = uri[1..-1]
        switch ( uri.ext ) {
          case "png":
          case "gif":
          case "jpg":
          case "jpeg":
            contentPane.content = Label { it.image = Image(Main.resolve("fui://api/image/$uri".toUri)) }
          case "mp3":
            contentPane.content = AudioPlayer("fui://api/audio/$uri".toUri)
        }
      case ``:
        // What happens when you go to /app/gallery/
        // Maybe grid view?
    }
    contentPane.relayout
  }
}