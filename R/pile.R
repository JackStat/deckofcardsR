#' @title Place cards in a pile
#'
#' @param cards a vector of the cards to place in the pile
#' @param deck_id identifier for deck
#' @param pile_name the name of the pile to create (defaults to \code{discard})
#'
#' @importFrom httr GET
#' @importFrom httr content
#' @importFrom jsonlite fromJSON
#'
#' @export

pile <- function(cards, deck_id = 'new', pile_name = 'discard'){

  Cards <- paste(cards, collapse = ',')

  Response <- GET(url = paste0('http://deckofcardsapi.com/api/deck/', deck_id, '/pile/', pile_name, '/add/?cards=', Cards))

  result <- fromJSON(content(Response, as = 'text'))

  if(!result$success){
    stop(result$error)
  } else{
    return(result)
  }

}


