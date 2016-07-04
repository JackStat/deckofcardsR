#' @title Shuffle a deck
#'
#' @param deck_id which deck do you want to use (defaults to \code{new})
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#'
#' @export


shuffle <- function(deck_id = 'new'){

  Response <- GET(url = paste0('http://deckofcardsapi.com/api/deck/', deck_id, '/shuffle/'))

  result <- fromJSON(content(Response, as = 'text'))

  if(!result$success){
    stop(result$error)
  } else{
    return(result)
  }
}
