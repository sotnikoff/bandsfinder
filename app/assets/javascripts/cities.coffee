$ ->
  countryTag = $('#country')
  regionTag = $('#region')
  cityTag = $('#city')

  console.log(countryTag)

  appendCountry = (country) -> countryTag.append("<option value='#{country.id}'>#{country.title}</option>")
  appendRegion = (region) -> regionTag.append("<option value='#{region.id}'>#{region.title}</option>")
  appendCity = (city) -> cityTag.append("<option value='#{city.id}'>#{city.title}</option>")

  if countryTag.length == 0 || regionTag .length == 0 || cityTag.length == 0
    return null

  getCountries = (tagValue) ->
    countryTag.html('')
    axios.get('/countries.json')
      .then((response) ->
        appendCountry(country) for country in response.data
        if tagValue == undefined
          tagValue = countryTag.val()
        getRegions(tagValue)
    )

  getRegions = (countryID) ->
    regionTag.html('')
    axios.get("/regions/#{countryID}.json")
      .then((response) ->
        appendRegion(region) for region in response.data
        value = regionTag.val()
        getCities(value)
    )

  getCities = (cityID) ->
    cityTag.html('')
    axios.get("/cities/#{cityID}.json")
      .then((response) ->
        appendCity(city) for city in response.data
    )

  if $('#skip_city_load_').val() != 'true'
    getCountries()

  countryTag.on('change', (e) -> getRegions(e.target.value))
  regionTag.on('change', (e) -> getCities(e.target.value))
