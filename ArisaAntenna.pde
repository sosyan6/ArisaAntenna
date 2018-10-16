// import processing.net.*;
SLibrary field;

enum Scene
{
	SETUP,
	CHAT
};

Scene scene;

void setup()
{
	size( 854, 480 );
	surface.setResizable( true );
	surface.setTitle( "ありさアンテナ" );
	smooth( 2 );
	noStroke();

	scene = Scene.CHAT;

	field = new SLibrary()
	.setBounds( 10, height - 50, width - 20, 40 )
	.setCorner( 10 )
	.setColor( #222222 )
	.setLabelColor( #FFFFFF )
	.setSize( 16 )
	.setText( "Tesssssssssssst" )
	;
}

void draw()
{
	// background( 51 );
	switch( scene ){
		case SETUP:

			break;
		case CHAT:
				field.drawTextField();
			break;
	}
}