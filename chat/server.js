const app = require('express')();
const cors = require("cors");
const server = require('http').createServer(app);
const port = process.env.PORT || 3000;
const io = require('socket.io')(server);

app.use(cors());

server.listen(3000, () => {
  console.log(`Server running at http://127.0.0.1:${port}/`);
});

let thisRoom = "";
io.on('connection', (socket) => {

  socket.on("join room", (data) => {
    console.log('in room');

    thisRoom = data.roomName;
    console.log(data);
    socket.join(thisRoom);
    io.in(thisRoom).emit("join room");
  });

  socket.on('chat', (msg) => {
    console.log(msg);
    thisRoom = msg.room;
    console.log(thisRoom);
    io.in(thisRoom).emit("chat", { msg: msg, id: socket.id });
  });
});

