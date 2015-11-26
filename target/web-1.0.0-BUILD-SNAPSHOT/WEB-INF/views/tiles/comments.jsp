
<div class="container">

	<form role="form" class="form-horizontal">
		<div class="form-group">
			<label class="col-sm-1" for="inputEmail1">Name</label>
			<div class="col-sm-5">
				<input class="form-control" id="name1" placeholder="name"
					type="text">
			</div>
		</div>
		<div class="form-group" id="email_form" >
			<label class="col-sm-1" for="email">Email</label>
			<div class="col-sm-5">
				<input class="form-control" id="email1" placeholder="email"
					type="email">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-12" for="TextArea">Comments (max 250 chars)</label>
			<div class="col-sm-6">
				<textarea maxlength='250' class="form-control" id="TextArea"></textarea>
			</div>
		</div>

		<div class="form-group" id= "comment-form">
			<div class="col-sm-6">
				<button type="submit" id= "onSubmit" class="btn btn-info pull-right">Submit</button>
			</div>
		</div>
	</form>
	
	<script type="text/javascript">
	
			$('#onSubmit').click(function(e) {
				//Check if email is empty
				if ($('#name1').val === "") {
					alert('Name Cannot be empty');
					return false;
				}
				if ($('#email1').val === "") {
					alert('Name Cannot be empty');
					return false;
				}
				
				//Check if Name is empty

			});


	</script>

</div>