const { google } 	= require( 'googleapis' );
const customsearch 	= google.customsearch( 'v1' );
const jsdom 		= require( 'jsdom' );
const { JSDOM } 	= jsdom;

async function hoge( keyword ){
	const res = await customsearch.cse.list( {
		cx: '013248310813509807142:prs6wavqojw',
		auth: 'AIzaSyBReyjNQE7HU-jyXE7I4pUReo44vH7DboA',
		q: keyword + ' アイドルマスター'
	} );
	JSDOM.fromURL( res.data.items[0].link ).then( ( dom ) => {
		var lyric = String( dom.window.document.getElementById( 'kashi_area' ).innerHTML ).replace( /<br>/g, '\n' );
		console.log( lyric );
	} ).catch( console.error );
}

hoge( '永遠の花' );