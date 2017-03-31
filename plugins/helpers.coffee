
module.exports = (env, callback) ->
  getReviews = (contents) ->
    # helper that returns a list of articles found in *contents*
    # note that each article is assumed to have its own directory in the articles directory
    reviews = contents['reviews']._.directories.map (item) -> item.index
    # skip articles that does not have a template associated
    reviews = reviews.filter (item) -> item.template isnt 'none'
    # sort article by date
    reviews.sort (a, b) -> b.date - a.date
    return reviews


  # add the article helper to the environment so we can use it later
  env.helpers.getReviews = getReviews

  # tell the plugin manager we are done
  callback()