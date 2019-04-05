from PyInquirer import prompt, Separator

# File designed to check if PyInquirer works correctly

widget = [
	{
		'type':'list',
		'name':'ok',
		'message':'Does PyInquirer work',
		'choices':['Yes','Indeed','I think so',
		Separator('<Below more enthusiasm>'),
		'It seems amazing !', 'Beautiful', 'Woa', ':-)']
	}
]

result = prompt(widget)
print('Your answer is')
print(result["ok"])

