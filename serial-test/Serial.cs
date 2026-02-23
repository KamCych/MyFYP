using Godot;

using Godot.Collections;
using System;
using System.IO.Ports;

public partial class Serial : Control
{
	SerialPort serialPort;
	Label label;
	bool sw = true;
	string action = "net";
	string jack1 = "inactive";
	string jack2 = "inactive";
	string jack3 = "inactive";
	string jack4 = "inactive";
	string jack5 = "inactive";
	string jack6 = "inactive";
	
	public Dictionary<string, string> compStats;
	
	public override void _Ready() 
	{
		serialPort = new SerialPort();
		serialPort.PortName = "COM3";
		serialPort.Open();
		
		label = GetNode<Label>("Label");
		label.Text = "Ur mom";
	}
		
	public override void _Process(double delta) 
	{
		if (!serialPort.IsOpen) return;

		string message = serialPort.ReadLine();
		//GD.Print(message);
		
		//label.Text = message;
		if (true) {
			//var jsonObj = Json.Parse(message).Result;
			//Json jsonLoader = new Json();
			//var data = jsonLoader.Parse(message);
			//GD.Print(data);
			//GD.Print(jsonObj);
			Json JSON = new Json();
			var error = JSON.Parse(message); // Parsing
			if (error == Error.Ok) 
			{
				compStats = JSON.Data.AsGodotDictionary<string, string>(); // Convert JSON String to Dictionary
			}
			
			GD.Print(compStats["jack1"]);
			if (compStats["jack1"] == "active") {jack1 = "active";}
			else {jack1="inactive";}
			
			if (compStats["jack2"] == "active") {jack2 = "active";}
			else {jack2="inactive";}
			
			if (compStats["jack3"] == "active") {jack3 = "active";}
			else {jack3="inactive";}
			
			if (compStats["jack4"] == "active") {jack4 = "active";}
			else {jack4="inactive";}
			
			if (compStats["jack5"] == "active") {jack5 = "active";}
			else {jack5="inactive";}
			
			if (compStats["jack6"] == "active") {jack6 = "active";}
			else {jack6="inactive";}
			
			label.Text = "json " + compStats["jack1"];
			GD.Print("Knob action: " + compStats["knob"]);
			float knobInfo = float.Parse(compStats["knob"]);
			if (knobInfo < 0.3) { action = "net"; }
			else if (knobInfo > 0.3 && knobInfo < 0.6) { action = "phone"; }
			else if (knobInfo > 0.6) { action = "disconnect"; }
			//if (message["jack1"] == "active") 
			//{
				//serialPort.WriteLine("Godot: jack1 is indeed active");
			//}
			//sw = false;
		}
	}
}
