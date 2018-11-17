## -*- coding: utf-8 -*-
<%doc>
  Context:
    pic_type (str): Type of picture, either 'dog', 'human' or 'error'
    img_content (str): base64 encoded image to be displayed to the user
    timestamp (str): Timestamp to be displayed at the bottom of the output
    breed (str): The breed that was predicted to display to the user
</%doc>

<% 
  if pic_type == 'dog' or pic_type == 'human':
    color = 'bg-success'
  else:
    color = 'bg-danger'
%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <title>Dog breed detector</title>
  </head>
  <body>
    <div class="card text-center bg-light mb-3" style="width: 400px;">
        <div class="card-body text-white ${color}">
          % if pic_type == 'dog':
            <h2 class="card-title">Yo Dawg!</h2>
          % elif pic_type == 'human':
            <h2 class="card-title">Hey human!</h2>
          % else:
            <h2 class="card-title">Uh oh!</h2>
          % endif
        </div>
        <img class="card-img-bottom rounded mx-auto d-block" style="max-width: 224px; max-height:224px; height:auto; width:auto;"  src="data:image/image;base64,${img_content | u}" alt="Submitted Image">
        <div class="card-body">
          % if pic_type == 'dog':
            <h4>This dog looks like a <b>${breed | h}</b></h4>
            <p>Woof woof!</p>
          % elif pic_type == 'human':
            <h4>You look like the breed <b>${breed | h}</b></h4>
            <p>You dog, you!</p>
          % else:
            <h4>We didn't see any humans or dogs in this photo 😢</h4>
            <p>Please try uploading a photo where the face of a human or a dog is clearly visible</p>
          % endif
            <p class="card-text"><small class="text-muted">${timestamp | h}</small></p>
        </div>
    </div>
  </body>
</html>