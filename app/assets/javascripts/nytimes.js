console.log('nytimes.js running')

var baseURL = "http://api.nytimes.com/svc/topstories/v1/home.json";
  var apiKey = "?api-key=0c446e47b3a7f6ed45dbc12101701c5a:13:71271148";

function getResults() {

  $.ajax({
    url: baseURL + apiKey,
    dataType: 'json',
    success: 
    renderResults
  });
};

function renderResults(data) {
	function makeResult(result){
		var $nytimes = $('.nytimes');
		var $byline = $('<h2>').text("Byline: " + result.byline);
		$nytimes.append($byline);
		return $byline;
	};
	var $results = $("#results");
	$results.html('');
	if (data["results"]) {
		var results = data["results"];
		console.log(parseArticle(result))
	}
}

function parseArticle(article){
	return {
	byline: article["byline"]
	}
	getResults();
}

