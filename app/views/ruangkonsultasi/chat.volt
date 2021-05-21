<!DOCTYPE html>
<html>
  <head>
    <title>Socket.IO chat</title>
    <style>
      body { margin: 0; padding-bottom: 3rem; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif; }

      #form { background: rgba(0, 0, 0, 0.15); padding: 0.25rem; position: fixed; bottom: 0; left: 0; right: 0; display: flex; height: 3rem; box-sizing: border-box; backdrop-filter: blur(10px); }
      #input { border: none; padding: 0 1rem; flex-grow: 1; border-radius: 2rem; margin: 0.25rem; }
      #input:focus { outline: none; }
      #form > button { background: #333; border: none; padding: 0 1rem; margin: 0.25rem; border-radius: 3px; outline: none; color: #fff; }

      #messages { list-style-type: none; margin: 0; padding: 0; }
      #messages > li { padding: 0.5rem 1rem; }
      #messages > li:nth-child(odd) { background: #efefef; }

      #video-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, 300px);
        grid-auto-rows: 300px;
      }
    
      video {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    </style>
  </head>
  <body>
    <div style='max-height:50vh'>
      <button type="button" onclick="startVideo()"> Masuk Video </button>
       <div id="video-grid">
         <video id="my_video"></video>
         <video id="other_video"></video>
       </div>
    </div>
    <div style='max-height:50vh'>
      <ul id="messages"></ul>
      <form id="form" action="">
        <input id="input" autocomplete="off" /><button>Send</button>
      </form>
    </div>
    <script src="https://cdn.socket.io/3.1.3/socket.io.min.js" integrity="sha384-cPwlPLvBTa3sKAgddT6krw0cJat7egBga3DJepJyrLl4Q9/5WLra3rrnMcyTyOnh" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/peerjs@1.3.1/dist/peerjs.min.js"></script>

    <script>
      let ID = "";
      var socket = io('http://localhost:3000/', { transports : ['websocket'] });
      const userName = "{{user['nama']}}";
      const room = "{{kode}}";
      const id = "{{user['id']}}";
      const lawan_id = "{{lawan_id}}";
      var messages = document.getElementById('messages');
      var form = document.getElementById('form');
      var input = document.getElementById('input');

      socket.emit("join room", {username : userName, roomName : room});
      
      const myPeer = new Peer(id, {
        host: '/',
        port: '3001'
      })

      form.addEventListener('submit', function(e) {
        e.preventDefault();
        if (input.value) {
          socket.emit('chat', {
          value: input.value,
          user: userName,
          room: room,})
          input.value = '';
        }
      });

      socket.on('chat', function(msg) {
        console.log(msg);
        var item = document.createElement('li');
        item.textContent = msg.msg.user +" : "+ msg.msg.value;
        messages.appendChild(item);
        window.scrollTo(0, document.body.scrollHeight);
      });
      

      function startVideo(){
        const videoGrid = document.getElementById('video-grid')
        const myVideo = document.getElementById('my_video')
        myVideo.muted = true
        navigator.mediaDevices.getUserMedia({
          video: true,
          audio: true
        }).then(stream => {
          addVideoStream(myVideo, stream)
          connectToNewUser(lawan_id, stream)
        })
      }

      myPeer.on('call', call => {
        console.log('call triggered');
        call.answer()
        const video = document.getElementById('other_video')
        call.on('stream', userVideoStream => {
          addVideoStream(video, userVideoStream)
        })
      })

      myPeer.on('open', id => {
        console.log('open');
        socket.emit("join room", {username : userName , roomName : room, id : id });
      })

      function connectToNewUser(userId, stream) {
        const call = myPeer.call(userId, stream)
      }

      function addVideoStream(video, stream) {
        video.srcObject = stream
        video.addEventListener('loadedmetadata', () => {
          video.play()
        })
      }
    </script>
  </body>
</html>