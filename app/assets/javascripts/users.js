//動的カテゴリボックスの実装
$(document).on('turbolinks:load', ()=> {
  $('#Industry-form').on('change', function(){
    let parentValue = document.getElementById("Industry-form").value;
    
    if (parentValue != "選択してください"){
      $.ajax({
        url: '/user/search',
        type: "GET",
        data: {
          parent_id: parentValue// 親ボックスの値をparent_idという変数にする。
          
      },
      dataType: 'json'
      //json形式を指定
      
    })
    .done(function(data){ 
      $('#child-form').remove();
      console.log(data)
      function childrenselect(data) {
      
      let opt1 = data.map(x=> `<option value="${x.id}">${x.name}</option>`)
        let opt = opt1.join('');
        
        let tako = `<option value="">選択してください</option>
        ${opt}`;
        let h = `<select name="" id="child-form" selected>${tako} </select>`; //colection_selectのとこ
        return h
      }
      var html = childrenselect(data);
      $('#formId').append(html);
    })
    .fail(function(XMLHttpRequest, textStatus, errorThrown) {
      alert('error!!!');
      console.log("XMLHttpRequest : " + XMLHttpRequest.status);
      console.log("textStatus     : " + textStatus);
      console.log("errorThrown    : " + errorThrown.message);
      
    }); 
  }else{
    $('#child-form').remove();
  
  }
  });
})