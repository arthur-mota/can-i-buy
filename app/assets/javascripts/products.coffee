# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.processCustomValue = (productId) ->
  customValueSlider = document.getElementById('customValueRange' + productId)
  buttonAdd = document.getElementById('addCustomValue' + productId)
  buttonRemove = document.getElementById('removeCustomValue' + productId)
  currentProgress = parseInt(buttonAdd.getAttribute('data-current-progress'))

  customizeButtons = (product, valueSlider) ->
    customizeAddButton product, valueSlider
    customizeRemoveButton product, valueSlider
    return

  customizeAddButton = (product, valueSlider) ->
    newProgress = setNewProgress('add')
    buttonAdd.innerHTML = 'Add $' + valueSlider
    buttonAdd.href = product + '?progress=' + newProgress
    return

  customizeRemoveButton = (product, valueSlider) ->
    newProgress = setNewProgress('remove')
    buttonRemove.innerHTML = 'Remove $' + valueSlider
    buttonRemove.href = product + '?progress=' + newProgress
    return

  setNewProgress = (operation) ->
    valueSlider = parseInt(customValueSlider.value)
    if operation == 'add'
      currentProgress + valueSlider
    else
      currentProgress - valueSlider

  customValueSlider.oninput = ->
    valueSlider = @value
    customizeButtons productId, valueSlider
    return

  return

window.check_last_updated = ->
  last_updated = document.getElementById('lastUpdatedElement')
  if last_updated
    product_id = last_updated.innerHTML
    collapse_id = 'collapse' + product_id
    collapse = document.getElementById(collapse_id)
    collapse.classList.add 'show'
    window.location.href = '#accordion' + product_id
  return

window.expand = (id) ->
  elements = ec_set_elements(id)
  if !elements[1].classList.contains('show')
    elements[0].click()
  return

window.collapse = (id) ->
  elements = ec_set_elements(id)
  if elements[1].classList.contains('show')
    elements[0].click()
  return

ec_set_elements = (id) ->
  collapse_toggler_id = 'collapseToggler' + id
  collapse_toggler = document.getElementById(collapse_toggler_id)
  collapsed_element_id = 'collapse' + id
  collapsed_element = document.getElementById(collapsed_element_id)
  [
    collapse_toggler
    collapsed_element
  ]
