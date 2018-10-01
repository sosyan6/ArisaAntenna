// import processing.net.*;
SLibrary mainBox;
SLibrary btn2;
SLibrary lbl1;

void setup()
{
	size( 854, 480 );
	surface.setResizable( true );
	surface.setTitle( "ありさアンテナ" );
	// surface.setIcon( loadImage( "./arisa.png" ) );

	noStroke();

	init();
}

void init()
{
	mainBox = new SLibrary()
	.setBounds( width / 2, height / 2, 500, 300 )
	.setColor( #FFFFFF )
	.setCorner( 20 )
	.setMode( CENTER )
	;

	btn2 = new SLibrary()
	.setBounds( width / 2, height / 2, 300, 150 )
	.setColor( #55CC55 )
	.setCorner( 10 )
	.setMode( CENTER )
	.setHoverColor( #33AA33 )
	;

	lbl1 = new SLibrary()
	.setPosition( width / 2, height / 2 )
	.setSize( 16 )
	.setText( "texxxxxxxxxxxxxxxxxxt" )
	.setAlign( CENTER, CENTER )
	;
}

void draw()
{
	background( #333333 );
	mainBox.setPosition( width / 2, height / 2 ).drawBox();
	btn2.setPosition( width / 2, height / 2 ).drawButton();
	lbl1.setPosition( width / 2, height / 2 ).drawLabel();
}

class SLibrary
{
	// General variable

	int objX = 0;
	int objY = 0;
	int objWidth = width;
	int objHeight = height;
	int objMode = CORNER;
	int objCorner = 0;
	color objColor = #FFFFFF;

	// Label variable

	int labelAlign = LEFT;
	int labelVAlign = TOP;
	color labelColor = #000000;
	float labelSize = 10;
	String labelText = "";
	PImage labelIcon;

	// Button variable

	color hoverColor = #DDDDDD;
	boolean isHover = false;
	boolean isClicked = false;

	// General method

	SLibrary setPosition( int x, int y )
	{
		objX = x;
		objY = y;

		return( this );
	}

	SLibrary setSize( int w, int h )
	{
		objWidth = w;
		objHeight = h;

		return( this );
	}

	SLibrary setBounds( int x, int y, int w, int h )
	{
		objX = x;
		objY = y;
		objWidth = w;
		objHeight = h;

		return( this );
	}

	SLibrary setMode( int m )
	{
		objMode = m;

		return( this );
	}

	SLibrary setCorner( int r )
	{
		objCorner = r;

		return( this );
	}

	SLibrary setColor( color c )
	{
		objColor = c;

		return( this );
	}

	// Label method

	SLibrary setAlign( int a, int v )
	{
		labelAlign = a;
		labelVAlign = v;

		return( this );
	}

	SLibrary setSize( float s )
	{
		labelSize = s;

		return( this );
	}

	SLibrary setText( String s )
	{
		labelText = s;

		return( this );
	}

	SLibrary setIcon( PImage i )
	{
		labelIcon = i;

		return( this );
	}

	// Button method

	SLibrary setHoverColor( color c )
	{
		hoverColor = c;

		return( this );
	}

	// Draw method
	
	SLibrary drawBox()
	{
		fill( objColor );
		rectMode( objMode );
		rect( objX, objY, objWidth, objHeight, objCorner );

		return( this );
	}

	SLibrary drawLabel()
	{
		textAlign( labelAlign, labelVAlign );
		fill( labelColor );
		textSize( labelSize );
		text( labelText, objX, objY );

		return( this );
	}

	SLibrary drawButton()
	{
		if( objMode == CORNER &&
			mouseX > objX &&
			mouseY > objY &&
			mouseX < objX + objWidth &&
			mouseY < objY + objHeight ||

			objMode == CENTER &&
			mouseX > objX - objWidth / 2 &&
			mouseY > objY - objHeight / 2 &&
			mouseX < objX + objWidth / 2 &&
			mouseY < objY + objHeight / 2
		){
			isHover = true;
		}else{
			isHover = false;
		}

		isClicked = false;
		if( isHover ){
			fill( hoverColor );
			if( mousePressed ){
				isClicked = true;
			}
		}else{
			fill( objColor );
		}

		rectMode( objMode );
		rect( objX, objY, objWidth, objHeight, objCorner );

		return( this );
	}
}