if Items.find().count() == 0
	console.dir 'Beginning seed'
	i = 1
	while i < 1001
		title = 'Title ' + i
		comment = 'Adipiscing arcu massa placerat nunc? Hac risus, hac placerat nunc magna vel! Vel cursus, etiam scelerisque dapibus habitasse, eu! Vut? Mauris penatibus quis, duis rhoncus, velit magna enim pid et ac, placerat diam nec ut ridiculus a, nisi amet.'
		Items.insert
			title: title
			comment: comment
		i++
else
	console.dir 'No need to seed'


Meteor.publish 'getItems', (limit) ->
  if limit > Items.find().count()
    limit = 0
  Items.find {}, limit: limit
