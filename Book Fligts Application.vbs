'Open Application
SystemUtil.Run "C:\Program Files (x86)\HP\Unified Functional Testing\samples\Flights Application\FlightsGUI.exe"

'Login Application
WpfWindow("HPE MyFlight Sample Applicatio").WpfEdit("agentName").Set "John"
WpfWindow("HPE MyFlight Sample Applicatio").WpfEdit("password").SetSecure "5aa136de34d4a0abbaa9"
WpfWindow("HPE MyFlight Sample Applicatio").WpfButton("OK").Click

'Flight Finder
	'Sample Flight from Los Angeles to Sydney, Business Class, 1x Ticket
WpfWindow("HPE MyFlight Sample Applicatio").WpfComboBox("fromCity").Select DataTable("fromCity", dtGlobalSheet)
WpfWindow("HPE MyFlight Sample Applicatio").WpfComboBox("toCity").Select DataTable("toCity", dtGlobalSheet)
WpfWindow("HPE MyFlight Sample Applicatio").WpfCalendar("datePicker").SetDate "19/03/2018"
WpfWindow("HPE MyFlight Sample Applicatio").WpfComboBox("Class").Select "Business"
WpfWindow("HPE MyFlight Sample Applicatio").WpfComboBox("numOfTickets").Select "1"
WpfWindow("HPE MyFlight Sample Applicatio").WpfButton("FIND FLIGHTS").Click

'Seelect Flight
WpfWindow("HPE MyFlight Sample Applicatio").WpfTable("flightsDataGrid").SelectCell "1", "1"
WpfWindow("HPE MyFlight Sample Applicatio").WpfButton("SELECT FLIGHT").Click

'Flight Confirmation
WpfWindow("HPE MyFlight Sample Applicatio").WpfEdit("passengerName").Set "John Smith"
WpfWindow("HPE MyFlight Sample Applicatio").WpfButton("ORDER").Click
WpfWindow("HPE MyFlight Sample Applicatio").WpfProgressBar("progBar").WaitProperty "value", "100"