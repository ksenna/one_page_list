$ ->
  $(document).ready ->
    $("#modal").hide()
    $(".showmodal").click ->
      $("#modal").show()
      return

    return

  $("form").on "ajax:complete", (event, data, status, xhr) ->
    color = $.parseJSON(data.responseText)
    name = color.name
    $("#colorList").append "<li>" + name + "</li>"
    $("#modal-one").toggle "modal"
    return

  $("form").on "ajax:complete", (event, data, status, xhr) ->
    color = $.parseJSON(data.responseText)
    color_li = document.getElementById(data.id)
    name = color.name
    $("#color_li").replace "<li>" + name + "</li>"
    return

  $("#deleteColor").click ->
    color_li = $(this).parent()
    id = $(this).attr("id")
    color_id = $(this).attr("data-color-id")
    
    #			type: "POST"
    
    #			data: {"_method":"delete"},
    $.ajax(
      url: "/color/" + color_id
      type: "DELETE"
      dataType: "JSON"
    ).success (json) ->
      console.log "Color Deleted"
      return

    return

  return
