#' @title Draw a card from a deck
#'
#' @param cards How many cards do you want to draw
#' @param deck_id which deck do you want to use (defaults to \code{new})
#' @param pile_name the name of the pile to draw from (defaults to \code{discard})
#'
#' @importFrom httr GET
#' @importFrom jsonlite fromJSON
#'
#' @export


draw_from_pile <- function(cards, deck_id = 'new', pile_name = 'discard'){

  Cards <- paste(cards, collapse = ',')

  Response <- GET(url = paste0(
    'http://deckofcardsapi.com/api/deck/'
    , deck_id
    , '/pile/'
    , pile_name
    , '/draw/?count='
    , cards =
    ))

  result <- fromJSON(content(Response, as = 'text'))

  if(!result$success){
    stop(result$error)
  } else{
    return(result)
  }
}
