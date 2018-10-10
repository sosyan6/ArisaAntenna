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
	smooth( 2 );
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
	.setBounds( width / 2, height / 2, 150, 150 )
	.setColor( #55CC55 )
	.setCorner( 150 )
	.setMode( CENTER )
	.setHoverColor( #33AA33 )
	.setText( "Button2" )
	.setAlign( CENTER, CENTER )
	.setSize( 16 )
	;

	lbl1 = new SLibrary()
	.setPosition( 0, 0 )
	.setSize( 32 )
	.setLabelColor( #FF0000 )
	.setText( "texxxxxxxxxxxxxxxxxxt" )
	.setAlign( LEFT, TOP )
	;
}

void draw()
{
	background( 51 );
	mainBox.drawBox();
	btn2.drawButton().drawLabel();
	lbl1.drawLabel();
}

boolean flag = false;
void mouseClicked()
{
	if( btn2.isHover ){
		if( flag ){
			btn2.setColor( #55CC55 ).setHoverColor( #33AA33 );
		}else{
			btn2.setColor( #FF0000 ).setHoverColor( #BB0000 );
		}
		flag = !flag;
		println( btn2.hoverColor );
	}
}