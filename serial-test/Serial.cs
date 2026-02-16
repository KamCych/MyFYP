using Godot;

using Godot.Collections;
using System;
using System.IO.Ports;

public partial class Serial : Control
{
	SerialPort serialPort;
	Label label;
	bool sw = true;
	
	private Dictionary<string, string> compStats;
	
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
			
			label.Text = "json " + compStats["jack1"];
			//if (message["jack1"] == "active") 
			//{
				//serialPort.WriteLine("Godot: jack1 is indeed active");
			//}
			//sw = false;
		}
	}
}
