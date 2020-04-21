$(document).on('turbolinks:load', ()=>{
  const image = (i)=>{
    const html = `<label for="post_images${i}">
                    <i class="fa fa-image icon"></i>
                    <input id="post_images${i}" class="js-file" type="file" name="post[images_attributes][${i}][src]">
                  </label>`;
    return html;
  }

  let file = [1,2,3,4,5,6,7,8,9,10];

  $('.new_post__image__box').on('change', '.js-file', function(e){
    $('.image_icon').append(image(file[0]));
    file.shift();
    file.push(file[file.length - 1 ] + 1)

  });

  $('#image_box').on('click', 'js-remove', function(){
    console.log( '削除')
    $(this).parent().remove();
    if ($('js-file').length == 0) $('.image-box').append(image(file[0]));
  })
})