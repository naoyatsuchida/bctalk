$(document).on('turbolinks:load', function(){


  // const timer = 6000    // ミリ秒で間隔の時間を指定
  // window.addEventListener('load',function(){
  //   setInterval('location.reload()',timer);
  //   console.log('更新')
  // });

  function buildHTML(message) {
    let img = message.user_image ? `${ message.user_image }` : "/images/log/bctalk.png";
    let content = message.content ? `${ message.content }` : "";
    let id = $('.current_user_name').val();

    function leftright(){if (id==message.user_id) {
      return  right = "right";
    } else {
      return  left = "left";

    }}
    
   
    let html = `<div class="message" data-message-id=` + message.id + `>` +
                  `<div class="${leftright()}">
                    <div class="${leftright()}__message">
                      <div img src="${img}"></div>
                      
                      <span class="${leftright()}__message__content">
                          ${content}
                        </span>
                      </div>
                      <div class="${leftright()}__title">
                        <div class="${leftright()}__title__name">`
                          + message.user_name +
                        `</div>
                        <div class="${leftright()}__title__date">
                          ${message.date}
                        </div>
                      </div>
                    </div>
                  </div>
                  <br>`
return html;



  }


  $('#new_message').on('submit', function(e){
    function scrollBottom(){
      var target = $('.message').last();
      var position = target.offset().top + $('.messages').scrollTop();
      $('.messages').animate({
        scrollTop: position
      }, 300, 'swing');
    }
    e.preventDefault();
    var message = new FormData(this); //フォームに入力した値を取得しています。
    var url = (window.location.href) + '/messages';
    $.ajax({  
      url: url,
      type: 'POST',
      data: message,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $('#message_content').val(''); //input内のメッセージを消しています。
      scrollBottom();
    })
    .fail(function(){
      alert('エラーが発生したためメッセージは送信できませんでした。');
    })
    .always(function(){
      $('.input__submit').prop('disabled', false);//ここで解除している
    })
  })
});