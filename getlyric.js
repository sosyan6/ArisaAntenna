const { google } = require( 'googleapis' );
const customsearch = google.customsearch( 'v1' );

async function hoge(){
	const res = await customsearch.cse.list( {
		cx: '013248310813509807142:prs6wavqojw',
		auth: 'AIzaSyBReyjNQE7HU-jyXE7I4pUReo44vH7DboA',
		q: 'Cut.Cut.Cut.'
	} );
	console.log( res.data.items[0].link );
}

hoge();