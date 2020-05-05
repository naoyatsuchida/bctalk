//動的カテゴリボックスの実装
$(document).on('turbolinks:load', ()=> {
  $('#Industry-form').on('change', function(){
   
    let parentValue = document.getElementById("Industry-form").value;
    
    if (parentValue != "選択してください"){
      $.ajax({
        url: '/user/searchin',
        type: "GET",
        data: {
          industry_id: parentValue// 親ボックスの値をparent_idという変数にする。
          
      },
      dataType: 'json'
      //json形式を指定
      
    })
    .done(function(data){ 
      $('#in-form').remove();
      
      function childrenselect(data) {
      
      let opt1 = data.map(x=> `<option value="${x.id}">${x.name}</option>`)
        let opt = opt1.join('');
        
        let tako = `<option value="">選択してください</option>
        ${opt}`;
        let h = `<select name="user[industry_id]" id="in-form" selected>${tako} </select>`; //colection_selectのとこ
        return h
      }
      var html = childrenselect(data);
      $('#InId').append(html);
    })
    .fail(function(XMLHttpRequest, textStatus, errorThrown) {
      alert('error!!!');
      console.log("XMLHttpRequest : " + XMLHttpRequest.status);
      console.log("textStatus     : " + textStatus);
      console.log("errorThrown    : " + errorThrown.message);
      
    }); 
  }else{
    $('#in-form').remove();
  
  }
  });


  $('#Occupation-form').on('change', function(){
    let parentValue = document.getElementById("Occupation-form").value;
    
    if (parentValue != "選択してください"){
      $.ajax({
        url: '/user/searchoc',
        type: "GET",
        data: {
        occupation_id: parentValue// 親ボックスの値をparent_idという変数にする。
          
      },
      dataType: 'json'
      //json形式を指定
      
    })
    .done(function(data){ 
      $('#oc-form').remove();
      function childrenselect(data) {
      console.log(data)
      
      let opt1 = data.map(x=> `<option value="${x.id}">${x.name}</option>`)
        let opt = opt1.join('');
      
        let tako = `<option value="">選択してください</option>
        ${opt}`;
       
        let h = `<select name="user[occupation_id]" id="oc-form" selected>${tako} </select>`; //colection_selectのとこ
        return h
      }
      
      var html = childrenselect(data);
      console.log(html)
      $('#OcId').append(html);
    })
    .fail(function(XMLHttpRequest, textStatus, errorThrown) {
      alert('error!!!');
      console.log("XMLHttpRequest : " + XMLHttpRequest.status);
      console.log("textStatus     : " + textStatus);
      console.log("errorThrown    : " + errorThrown.message);
      
    }); 
  }else{
    $('#oc-form').remove();
  
  }
  });
})