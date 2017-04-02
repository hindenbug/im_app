App.messages = App.cable.subscriptions.create('ImChannel', {
  received: function(data) {
    console.log("dasdasdasd")
    var icon_div = "<span class='message-dialect-icon " + data['dialect_icon'] + "'/>";

    var elem = "<p><span class='text-muted'>[" + data["timestamp"] + "]</span> " + "<strong>" + data["username"] + "</strong> : " + data["message"] + icon_div + "</p>"

    $('#msg-body').val('');
    $('#messages').append(elem);
  },
});
