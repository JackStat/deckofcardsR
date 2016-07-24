#' @title Draw a card from a deck
#'
#' @param cards How many cards do you want to draw
#' @param deck_id which deck do you want to use (defaults to \code{new})
#'
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#'
#' @export


draw <- function(cards = 5, deck_id = 'new'){

  Response <- GET(url = paste0('http://deckofcardsapi.com/api/deck/', deck_id, '/draw/?count=', cards))

  result <- fromJSON(content(Response, as = 'text'))

  if(!result$success){
    stop(result$error)
  } else{
    return(result)
  }
}
