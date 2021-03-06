#' @title Generate a deck of cards
#'
#' @param decks how many decks do you want?
#' @param new specifies a brand new unshuffled deck or number of decks
#'
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#'
#' @export


deck <- function(decks = 1, new = FALSE){

  if(new){
    Response <- GET(url = paste0('http://deckofcardsapi.com/api/deck/new/?deck_count=', decks))
  } else {
    Response <- GET(url = paste0('http://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=', decks))
  }

  result <- fromJSON(content(Response, as = 'text'))

  if(!result$success){
    stop(result$error)
  } else{
    return(result)
  }

}
