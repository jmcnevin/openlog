import {Socket} from "phoenix"

let messagesContainer = $("#messages")
let socket = new Socket("/ws")

let LogViewer = {
  scrollContainer() {
    messagesContainer.scrollTop(messagesContainer.prop("scrollHeight"))
  },
  appendMessage(payload) {
    var $newEl = $(`<div class="message"><div class="message-timestamp">${payload.occurred_at}</div>${payload.body}</div>`)
    messagesContainer.append($newEl)
    this.scrollContainer()
  },
  start(log_id) {
    socket.connect()

    var chan = socket.chan(`logs:${log_id}`, {})

    chan.on("new_msg", payload => {
      this.appendMessage(payload)
    })

    chan.join().receive("ok", chan => {
      console.log("Log connected.")
    })

    this.scrollContainer()
  }
}

if (messagesContainer.length) {
  LogViewer.start(messagesContainer.data("log-id"));
}
