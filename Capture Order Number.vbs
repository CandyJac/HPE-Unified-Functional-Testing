'Capture Order Number
Dim orderNo
orderNo = WpfWindow("HPE MyFlight Sample Applicatio").WpfObject("Order completed").GetROProperty("name")

Set regEx = New RegExp
regEx.pattern="\d+"
regEx.Global=True
Set obj = regEx.Execute(orderNo)

For i=0 to obj.count-1
	Msgbox obj.item(i)
Next