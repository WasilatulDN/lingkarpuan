{% extends "layouts/base.volt" %}

{% block custom_header %}
	<!-- BEGIN PAGE LEVEL CUSTOM STYLES -->
	<link rel="stylesheet" type="text/css" href="{{url('plugins/table/datatable/datatables.css')}}">
	<link rel="stylesheet" type="text/css" href="{{url('assets/css/forms/theme-checkbox-radio.css')}}">
	<link rel="stylesheet" type="text/css" href="{{url('plugins/table/datatable/dt-global_style.css')}}">
	<link rel="stylesheet" type="text/css" href="{{url('plugins/table/datatable/custom_dt_custom.css')}}">
	<link rel="stylesheet" type="text/css" href="{{url('assets/css/apps/mailing-chat.css')}}">
	<style>
		video {
			width: 300px;
			height: 300px;
			object-fit: cover;
			border: 1px solid;
		}
	</style>
	<!-- END PAGE LEVEL CUSTOM STYLES -->
{% endblock %}

{% block title %}Ruang Konsultasi
{% endblock %}

{% block content_title %}Ruang Konsultasi
{% endblock %}

{% block content %}
	<div class="chat-section layout-top-spacing">
		<div style="display: flex;align-items: center;justify-content: center;">

			<div style="padding: 10px">
				<p>video saya</p>
				<video id="my_video"></video>
			</div>

			<div style="padding: 10px">
        {% if (user['role'] == 1) %}
          <p>video {{konsultan.nama}}</p>
        {% else %}
          <p>video {{puan.nama}}</p>
        {% endif %}

				<video id="other_video"></video>
			</div>

		</div>
		<div class="row">

			<div class="col-xl-12 col-lg-12 col-md-12">

				<div class="chat-system">
					<div class="chat-box" style="height: calc(100vh - 250px);">

						<div class="chat-box-inner" style="height: 100%;">
							<div class="chat-meta-user chat-active">
								<div class="current-chat-user-name">
									<span>
                  {% if (user['role'] == 1) %}
										<span class="name">{{konsultan.nama}}</span>
                  {% else %}
                    <span class="name">{{puan.nama}}</span>
                  {% endif %}
									</span>
								</div>
                <div class="chat-action-btn align-self-center">
                  <svg onclick="startVideo()" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-video video-call-screen"><polygon points="23 7 16 12 23 17 23 7"></polygon><rect x="1" y="5" width="15" height="14" rx="2" ry="2"></rect></svg>
              </div>
							</div>
							<div class="chat-conversation-box ps">
								<div id="chat-conversation-box-scroll" class="chat-conversation-box-scroll">
									<div id="active_chat" class="chat active-chat">
									</div>
								</div>
								<div class="ps__rail-x" style="left: 0px; bottom: 0px;">
									<div class="ps__thumb-x" tabindex="0" style="left: 0px; width: 0px;"></div>
								</div>
								<div class="ps__rail-y" style="top: 0px; right: 0px;">
									<div class="ps__thumb-y" tabindex="0" style="top: 0px; height: 0px;"></div>
								</div>
							</div>
							<div class="chat-footer chat-active">
								<div class="chat-input">
									<form id="form" class="chat-form" action="javascript:void(0);">
										<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewbox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square">
											<path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
										</svg>
										<input type="text" class="mail-write-box form-control" autocomplete="off" id='input' placeholder="Message">
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
{% endblock %}
{% block custom_script %}
    <script src="https://cdn.socket.io/3.1.3/socket.io.min.js" integrity="sha384-cPwlPLvBTa3sKAgddT6krw0cJat7egBga3DJepJyrLl4Q9/5WLra3rrnMcyTyOnh" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/peerjs@1.3.1/dist/peerjs.min.js"></script>
    <script>
    let ID = "";
    var socket = io('https://chat.lingkarpuan.com');
    const userName = "{{user['nama']}}";
    const room = "{{kode}}";
    const id = "{{user['id']}}";
    const lawan_id = "{{lawan_id}}";
    var messages = document.getElementById('active_chat');
    var form = document.getElementById('form');
    var input = document.getElementById('input');
    var openVideo = false;

    socket.emit("join room", {username : userName, roomName : room});
    
    const myPeer = new Peer(id, {
      host: 'chat.lingkarpuan.com',
      port: '443',
      secure: true,
      path: '/video',
      config: {'iceServers': [
        { url: 'stun:chat.lingkarpuan.com:3478' },
        { url: 'turn:chat.lingkarpuan.com:3478', credential: '12345', username: 'lingkarpuan' }
      ]}
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
      var item = document.createElement('div');
      if (msg.msg.user == userName) {
        item.className = 'bubble me';
      } else {
        item.className = 'bubble you';
      }
      item.textContent = msg.msg.value;
      messages.appendChild(item);
      window.scrollTo(0, document.body.scrollHeight);
    });
    
    function startVideo(){
      const videoGrid = document.getElementById('video-grid');
      const myVideo = document.getElementById('my_video');
      openVideo = true;
      myVideo.muted = true;
      navigator.mediaDevices.getUserMedia({
        video: true,
        audio: true
      }).then(stream => {
        addVideoStream(myVideo, stream);
        connectToNewUser(lawan_id, stream);

        socket.on('join room', function(msg) {
          connectToNewUser(lawan_id, stream);
        });
      })
    }

    myPeer.on('call', call => {
      call.answer();
      const video = document.getElementById('other_video');
      call.on('stream', userVideoStream => {
        addVideoStream(video, userVideoStream);
      })
    })

    myPeer.on('open', id => {
      socket.emit("join room", {username : userName , roomName : room, id : id });
    })

    function connectToNewUser(userId, stream) {
      const call = myPeer.call(userId, stream);
    }

    function addVideoStream(video, stream) {
      video.srcObject = stream;
      video.addEventListener('loadedmetadata', () => {
        video.play();
      })
    }
  </script>
{% endblock %}
