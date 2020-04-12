$(document).on('turbolinks:load', ()=> {
$('#parent-form').on('change', function(){
  let parentValue = document.getElementById("parent-form").value;
  
  if (parentValue != "選択してください"){
  $.ajax({
    url: '/products/search',
    type: "GET",
    data: {
      parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
    },
    dataType: 'json'
    //json形式を指定
    
  })
  .done(function(data){
    $('#child-form').remove();
    $('#grandchild-form').remove();
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
  .fail(function() {
    alert('error');
  }); 
}else{
  $('#child-form').remove();
  $('#grandchild-form').remove();
}
});




$(document).on('change','#child-form', function(){
  let parentValue = document.getElementById("child-form").value;
  if(parentValue != "選択してください"){
  $.ajax({
    url: '/products/search',
    type: "GET",
    data: {
      parent_id: parentValue // 親ボックスの値をparent_idという変数にする。
    },
    dataType: 'json'
    //json形式を指定
  })
  .done(function(data){
    if (data.length !=0){
      $('#grandchild-form').remove();
      
      function childrenselect(data) {
        
        let opt1 = data.map(x=> `<option value="${x.id}">${x.name}</option>`)
        let opt = opt1.join('');  
  
        let tako = `<option value="">選択してください</option>
        ${opt}`;
        let h = `<select name="product[category_id]" id="grandchild-form" selected>${tako} </select>`; //colection_selectのとこ
        return h
      }
      var html = childrenselect(data);
      $('#formId').append(html);
    }
    })
    .fail(function() {
      alert('error');
    })
  }else{
    $('#grandchild-form').remove();
  }
});
})