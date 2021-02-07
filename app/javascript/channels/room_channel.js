import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // const chatmessagesContainer = document.getElementById("chatroom__messages__box");

    // chatmessagesContainer.append(data.foo);

    $("#chatroom__messages__box").append(data.foo);
  }
});
