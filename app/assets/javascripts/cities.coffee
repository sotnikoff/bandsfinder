$ ->
  countryTag = $('#country')
  regionTag = $('#region')
  cityTag = $('#city')

  console.log(countryTag)

  appendCountry = (country) -> countryTag.append("<option value='#{country.id}'>#{country.title}</option>")
  appendRegion = (region) -> regionTag.append("<option value='#{region.id}'>#{region.title}</option>")
  appendCity = (city) -> cityTag.append("<option value='#{city.id}'>#{city.title}</option>")

  if countryTag.length == 0
    return null

  axios.get('/countries.json')
    .then((response) ->
      appendCountry(country) for country in response.data
      value = countryTag.val()
      axios.get("/regions/#{value}.json")
        .then((response) ->
          appendRegion(region) for region in response.data
          value = countryTag.val()
          axios.get("/cities/#{value}.json")
            .then((response) ->
              appendCity(city) for city in response.data
          )
      )
  )
