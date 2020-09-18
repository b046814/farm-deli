document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById("image-list")
  
  const createImageHTML = (blob) => {
    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', blob);
    blobImage.setAttribute('style', 'width: 20%;')
    blobImage.setAttribute('style', 'height: 100px;')
    ImageList.appendChild(blobImage);
  };

    document.getElementById('farm-image1').addEventListener('change', function(e){
      const file1 = e.target.files[0];
      const blob1 = window.URL.createObjectURL(file1);

      createImageHTML(blob1);
    })

    document.getElementById('farm-image2').addEventListener('change', function(e){
      const file2 = e.target.files[0];
      const blob2 = window.URL.createObjectURL(file2);
  
      createImageHTML(blob2);
    })

    document.getElementById('farm-image3').addEventListener('change', function(e){
      const file3 = e.target.files[0];
      const blob3 = window.URL.createObjectURL(file3);
    
      createImageHTML(blob3);
    })

    document.getElementById('farm-image4').addEventListener('change', function(e){
      const file4 = e.target.files[0];
      const blob4 = window.URL.createObjectURL(file4);
      
            createImageHTML(blob4);
    })
})