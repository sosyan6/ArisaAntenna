class SLibrary
{
	// General variable

	int objX = 0;
	int objY = 0;
	int objWidth = width;
	int objHeight = height;
	int objMode = CORNER;
	int objCorner[] = { 0, 0, 0, 0 };
	color objColor = #FFFFFF;
	boolean objFlag = false;

	// Label variable

	int labelAlign = LEFT;
	int labelVAlign = TOP;
	color labelColor = #000000;
	float labelSize = 10;
	String labelText = "";
	PImage labelIcon;

	// Button variable

	color hoverColor = #DDDDDD;
	int transparency = 255;
	boolean isHover = false;
	boolean isHold = false;
	boolean isClicked = false;
	int clickedButton;

	// TextField variable

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
		objCorner[0] = r;
		objCorner[1] = r;
		objCorner[2] = r;
		objCorner[3] = r;

		return( this );
	}

	SLibrary setCorner( int r1, int r2 )
	{
		objCorner[0] = r1;
		objCorner[1] = r1;
		objCorner[2] = r2;
		objCorner[3] = r2;

		return( this );
	}

	SLibrary setCorner( int r1, int r2, int r3, int r4 )
	{
		objCorner[0] = r1;
		objCorner[1] = r2;
		objCorner[2] = r3;
		objCorner[3] = r4;

		return( this );
	}

	SLibrary setColor( color c )
	{
		objColor = c;

		return( this );
	}

	SLibrary switchFlag()
	{
		objFlag = !objFlag;

		return( this );
	}

	SLibrary switchFlag( boolean b )
	{
		objFlag = b;

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

	SLibrary setLabelColor( color c )
	{
		labelColor = c;

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

	SLibrary setHoverColor( color c, int a )
	{
		hoverColor = c;
		transparency = a;

		return( this );
	}

	// Draw method
	
	SLibrary drawBox()
	{
		fill( objColor );
		rectMode( objMode );
		rect( objX, objY, objWidth, objHeight, objCorner[0], objCorner[1], objCorner[2], objCorner[3] );

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

		isHold = false;
		if( isHover ){
			fill( hoverColor, transparency );
			if( mousePressed ){
				isHold = true;
			}
			cursor( HAND );
		}else{
			fill( objColor );
			cursor( ARROW );
		}

		rectMode( objMode );
		rect( objX, objY, objWidth, objHeight, objCorner[0], objCorner[1], objCorner[2], objCorner[3] );

		return( this );
	}

	SLibrary drawTextField()
	{
		fill( objColor );
		rectMode( objMode );
		rect( objX, objY, objWidth, objHeight, objCorner[0], objCorner[1], objCorner[2], objCorner[3] );

		textAlign( labelAlign, labelVAlign );
		fill( labelColor );
		textSize( labelSize );
		text( labelText, objX, objY );

		return( this );
	}
}