using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.Time.Gregorian;
using Toybox.AntPlus as AntPlus;
using Toybox.ActivityMonitor;
using Toybox.System;


class watch_faceView extends Ui.WatchFace {

    var VERT_OFFSET  = 5;
    var TIME_X = 80;
    var TIME_Y = 72+VERT_OFFSET;
    var DATE_X = 109;
    var DATE_Y = 30+VERT_OFFSET;
    var BAT_X = 89;
    var BAT_Y = 179+VERT_OFFSET;
    var HR_X = 27;
    var HR_Y = 145+VERT_OFFSET;
    var STEPS_X = 45;
    var STEPS_Y = 145+VERT_OFFSET;



	var x1_array = [109.00,120.39,131.66,142.68,153.33,163.50,173.07,181.94,190.00,197.18,203.40,208.58,212.67,215.62,217.40,218.00,217.40,215.62,212.67,208.58,203.40,197.18,190.00,181.94,173.07,163.50,153.33,142.68,131.66,120.39,109.00,97.61,86.34,75.32,64.67,54.50,44.93,36.06,28.00,20.82,14.60,9.42,5.33,2.38,0.60,0.00,0.60,2.38,5.33,9.42,14.60,20.82,28.00,36.06,44.93,54.50,64.67,75.32,86.34,97.61,109.00];
	var x2_array = [114.70,126.05,137.21,148.06,158.48,168.37,177.60,186.07,193.71,200.42,206.12,210.76,214.29,216.66,217.85,217.85,216.66,214.29,210.76,206.12,200.42,193.71,186.07,177.60,168.37,158.48,148.06,137.21,126.05,114.70,103.30,91.95,80.79,69.94,59.52,49.63,40.40,31.93,24.29,17.58,11.88,7.24,3.71,1.34,0.15,0.15,1.34,3.71,7.24,11.88,17.58,24.29,31.93,40.40,49.63,59.52,69.94,80.79,91.95,103.30,114.70];
	var x3_array = [114.34,124.96,135.40,145.55,155.31,164.55,173.19,181.12,188.27,194.54,199.88,204.23,207.52,209.74,210.86,210.86,209.74,207.52,204.23,199.88,194.54,188.27,181.12,173.19,164.55,155.31,145.55,135.40,124.96,114.34,103.66,93.04,82.60,72.45,62.69,53.45,44.81,36.88,29.73,23.46,18.12,13.77,10.48,8.26,7.14,7.14,8.26,10.48,13.77,18.12,23.46,29.73,36.88,44.81,53.45,62.69,72.45,82.60,93.04,103.66,114.34];
	var x4_array = [109.00,119.66,130.21,140.52,150.49,160.00,168.95,177.25,184.80,191.52,197.33,202.18,206.01,208.77,210.44,211.00,210.44,208.77,206.01,202.18,197.33,191.52,184.80,177.25,168.95,160.00,150.49,140.52,130.21,119.66,109.00,98.34,87.79,77.48,67.51,58.00,49.05,40.75,33.20,26.48,20.67,15.82,11.99,9.23,7.56,7.00,7.56,9.23,11.99,15.82,20.67,26.48,33.20,40.75,49.05,58.00,67.51,77.48,87.79,98.34,109.00];
	var y1_array = [0.00,0.60,2.38,5.33,9.42,14.60,20.82,28.00,36.06,44.93,54.50,64.67,75.32,86.34,97.61,109.00,120.39,131.66,142.68,153.33,163.50,173.07,181.94,190.00,197.18,203.40,208.58,212.67,215.62,217.40,218.00,217.40,215.62,212.67,208.58,203.40,197.18,190.00,181.94,173.07,163.50,153.33,142.68,131.66,120.39,109.00,97.61,86.34,75.32,64.67,54.50,44.93,36.06,28.00,20.82,14.60,9.42,5.33,2.38,0.60,0.00];
	var y2_array = [0.15,1.34,3.71,7.24,11.88,17.58,24.29,31.93,40.40,49.63,59.52,69.94,80.79,91.95,103.30,114.70,126.05,137.21,148.06,158.48,168.37,177.60,186.07,193.71,200.42,206.12,210.76,214.29,216.66,217.85,217.85,216.66,214.29,210.76,206.12,200.42,193.71,186.07,177.60,168.37,158.48,148.06,137.21,126.05,114.70,103.30,91.95,80.79,69.94,59.52,49.63,40.40,31.93,24.29,17.58,11.88,7.24,3.71,1.34,0.15,0.15];
	var y3_array = [7.14,8.26,10.48,13.77,18.12,23.46,29.73,36.88,44.81,53.45,62.69,72.45,82.60,93.04,103.66,114.34,124.96,135.40,145.55,155.31,164.55,173.19,181.12,188.27,194.54,199.88,204.23,207.52,209.74,210.86,210.86,209.74,207.52,204.23,199.88,194.54,188.27,181.12,173.19,164.55,155.31,145.55,135.40,124.96,114.34,103.66,93.04,82.60,72.45,62.69,53.45,44.81,36.88,29.73,23.46,18.12,13.77,10.48,8.26,7.14,7.14];
	var y4_array = [7.00,7.56,9.23,11.99,15.82,20.67,26.48,33.20,40.75,49.05,58.00,67.51,77.48,87.79,98.34,109.00,119.66,130.21,140.52,150.49,160.00,168.95,177.25,184.80,191.52,197.33,202.18,206.01,208.77,210.44,211.00,210.44,208.77,206.01,202.18,197.33,191.52,184.80,177.25,168.95,160.00,150.49,140.52,130.21,119.66,109.00,98.34,87.79,77.48,67.51,58.00,49.05,40.75,33.20,26.48,20.67,15.82,11.99,9.23,7.56,7.00];


    var customFont=null;
    var consolasFont = null;
    var aphontFont =null;
   	var aphontFontMed =null;
    var pies_bmp =null;
    var freq_bmp =null;
    var heartRate = null;
    var bat1_bmp = null;
    var bat2_bmp = null;
    var bat3_bmp = null;
    var bat4_bmp = null;
    var gps_bmp = null;
    var blue_bmp = null;
     

    function initialize() {
        WatchFace.initialize();
    }

    function onSensor(sensorInfo) {
        heartRate = sensorInfo.heartRate;
    }

    // Load your resources here
    function onLayout(dc)
     {
       	customFont =  Ui.loadResource( Rez.Fonts.customFont );
       	aphontFont =  Ui.loadResource( Rez.Fonts.TaphontFont);
	    aphontFontMed =  Ui.loadResource( Rez.Fonts.TaphontFont_med);
        consolasFont =  Ui.loadResource( Rez.Fonts.consolasFont);
        pies_bmp =  Ui.loadResource( Rez.Drawables.pies);
        freq_bmp =  Ui.loadResource( Rez.Drawables.freq);
       
        bat1_bmp =  Ui.loadResource( Rez.Drawables.bat1);
        bat2_bmp =  Ui.loadResource( Rez.Drawables.bat2);
        bat3_bmp =  Ui.loadResource( Rez.Drawables.bat3);
        bat4_bmp =  Ui.loadResource( Rez.Drawables.bat4);
       
	    gps_bmp =  Ui.loadResource( Rez.Drawables.gps);
        blue_bmp =  Ui.loadResource( Rez.Drawables.bluetooth);
       
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

	
    // Update the view
    function onUpdate(dc) 
    {
        var ALTO_MEDIOS = 109;
        
      	dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
        dc.clear();
         
	   	ShowBmp(dc);
        ShowCurrentTime(dc);
        ShowDate(dc);
        ShowBatteryStatus(dc);
        ShowHeartRate(dc);
        ShowSteps(dc);
    
    	ShowLines(dc);
    	ShowSeconds(dc);
    	ShowGpsBlueTooth(dc);
    	
    }
    
    function ShowSeconds(dc)
    {
    
    	dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
    	
    	var clockTime = Sys.getClockTime();
        var saltos_totales = clockTime.min;
        
     	for (var i = 0; i<= saltos_totales; i++)
		{
			var x1 = x1_array[i];
	    	var y1 = y1_array[i];
	    	
	    	var x2 = x2_array[i];
	    	var y2 = y2_array[i];
	    	
	    	var x3 = x3_array[i];
	    	var y3 = y3_array[i];
	    	
	    	var x4 = x4_array[i];
	    	var y4 = y4_array[i];
	   
    
	    	var p1 = [[x1,y1], [x2,y2], [x3,y3], [x4,y4]];
			dc.fillPolygon(p1);
	    }
    }
    
    
    
    
    function ShowSecondsMath(dc)
    {
    
    	dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
    	
    	var radio_externo = 109;
		var radio_interno = 102;
		var centro = 109;
		var avance = 3;


		var clockTime = Sys.getClockTime();
        var saltos_totales = clockTime.sec;
        
        var saltos = 0;
        //System.print("saltos: " + saltos);
        //System.print("saltos_totales: " + saltos_totales);
        
		//se repite 45 veces => 8*45=360
		for (var i = 270; i< 270+362; i = i+ 6)
		{
	    	var x1 = radio_externo*Math.cos(i*Math.PI/180) + centro;
	    	var y1 = radio_externo*Math.sin(i*Math.PI/180) + centro;
	   
	    	var x2 = radio_externo*Math.cos((i+avance)*Math.PI/180) + centro;
	    	var y2 = radio_externo*Math.sin((i+avance)*Math.PI/180) + centro;
	   
	    	var x4 = radio_interno*Math.cos(i*Math.PI/180) + centro;
	    	var y4 = radio_interno*Math.sin(i*Math.PI/180) + centro;
	   
	    	var x3 = radio_interno*Math.cos((i+avance)*Math.PI/180) + centro;
	    	var y3 = radio_interno*Math.sin((i+avance)*Math.PI/180) + centro;
	    
	    	var p1 = [[x1,y1], [x2,y2], [x3,y3], [x4,y4]];
			dc.fillPolygon(p1);
			
			saltos++;
			if(saltos == saltos_totales)
			{
				return;
			}			
		}
    }
    
    function ShowBmp(dc)
    {
    	dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_BLACK);
    	dc.fillCircle(dc.getWidth()/2, dc.getHeight()/2, dc.getWidth()/2-10);
    }
    
    
    function ShowCircles(dc)
    {
    	dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_GREEN);
    
     	dc.fillRectangle(dc.getWidth()-10, dc.getHeight()/2, 10, 10);
     	
     	dc.fillRectangle(0, dc.getHeight()/2, 10, 10);
    	
     	dc.fillRectangle(dc.getWidth()/2, 0, 10, 10);
     	
     	dc.fillRectangle(dc.getWidth()/2, dc.getHeight()-10, 10, 10);
    
     	dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_RED);
     	
      }
       
    function ShowLines(dc)
    {
    	dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
	    dc.drawLine(17, 72, 218-17, 72);
	    dc.drawLine(17, 144, 218-17, 144);
	    dc.drawLine(40, 180, 218-40, 180);
	    //dc.drawLine(109, 180, 109, 218-15);
	    
    }
    
    function ShowCurrentTime(dc)
    {
        
        var clockTime = Sys.getClockTime();
        var hour = clockTime.hour;
        if(!Sys.getDeviceSettings().is24Hour)
        {
        	hour = hour % 12;
        	if(hour == 0)
            {
        		hour=12;
        	}
        }
        
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
		var hora = Lang.format("$1$", [hour.format("%02d")]) + Lang.format(":$1$", [clockTime.min.format("%02d")]);
		dc.drawText(TIME_X+30, TIME_Y, aphontFont, hora, Gfx.TEXT_JUSTIFY_CENTER);
		//dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_BLACK);
        //dc.drawText(TIME_X+80, TIME_Y+13, aphontFontMed, Lang.format("$1$", [clockTime.sec.format("%02d")]), Gfx.TEXT_JUSTIFY_LEFT);
     }

	function getSpanishMonth(month)
    { 
	    switch(month)
	    {   
            case 1: return "ENE";
            case 2: return "FEB";
            case 3: return "MAR";
            case 4: return "ABR";
            case 5: return "MAY";
            case 6: return "JUN";
            case 7: return "JUL";
            case 8: return "AGO";
            case 9: return "SEP";
            case 10: return "OCT";
            case 11: return "NOV";
            case 12: return "DIC";
        }
    }

	function ShowDate(dc)
    {
      	var clockTime = Sys.getClockTime();
        var local_now = Time.now();
    	var today = Gregorian.info(local_now, Time.FORMAT_SHORT	);
	    var dateString = today.day + " " + getSpanishMonth(today.month) + ", " + today.year;
	    dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
	    dc.drawText(DATE_X, DATE_Y, dc.FONT_SYSTEM_SMALL, dateString,  Gfx.TEXT_JUSTIFY_CENTER);
    }


    function ShowBatteryStatus(dc)
    {
    
        var stats = Sys.getSystemStats();
        var pwr = stats.battery;
        var batStr = Lang.format( "$1$%", [ pwr.format( "%2d" ) ] );
        var color = Gfx.COLOR_WHITE;

 

	    dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_BLACK);
	    dc.drawText(BAT_X, BAT_Y-2, dc.FONT_SYSTEM_TINY, batStr,  Gfx.TEXT_JUSTIFY_LEFT);

        if(pwr <= 20)
        {
    		dc.drawBitmap(BAT_X-15 , BAT_Y+2, bat4_bmp);
        }
        else if(pwr > 20 && pwr <= 50)        
        {
    		dc.drawBitmap(BAT_X-15 , BAT_Y+2, bat3_bmp);
        }
        else if(pwr > 50 && pwr <= 80)
        {
        	dc.drawBitmap(BAT_X-15 , BAT_Y+2, bat2_bmp);
        }else
        {
        	dc.drawBitmap(BAT_X-15 , BAT_Y+2, bat1_bmp);
        }
    	
    }

    function ShowHeartRate(dc)
    {
    
        var hrIterator = ActivityMonitor.getHeartRateHistory(1, true); //pido dos
        var sample = hrIterator.next();
   
        if (sample.heartRate != ActivityMonitor.INVALID_HR_SAMPLE)    // check for invalid samples
        {
            var lastSampleTime = sample.when;
        }

        // get ActivityMonitor info
        // var info = ActivityMonitor.getInfo();
        //var steps = info.steps;
        //var calories = info.calories;

        var hrRate = sample.heartRate;
        var color = Gfx.COLOR_WHITE;
        
        //Supongo mi HR maximo = 180
        if(hrRate >= 162)
        {
            color = Gfx.COLOR_RED;
        }
        else if( hrRate < 162 && hrRate>= 144)        
        {
            color = Gfx.COLOR_ORANGE;
        }
        else if( hrRate < 144 && hrRate>= 126)        
        {
            color = Gfx.COLOR_RED;
        }else if( hrRate < 126 && hrRate>= 108)        
        {
            color = Gfx.COLOR_BLUE;
        }

        dc.setColor(color, Gfx.COLOR_BLACK);
        var hrText = hrRate + " BMP";
        dc.drawText(HR_X+25, HR_Y, dc.FONT_SYSTEM_TINY, hrText,  Gfx.TEXT_JUSTIFY_LEFT);
   		dc.drawBitmap(HR_X, HR_Y+5, freq_bmp);
     }

    function ShowSteps(dc)
    {
    
        var info = ActivityMonitor.getInfo();
        var steps = Lang.format("$1$", [info.steps.format("%04d")]);
       
       /*
        var color = Gfx.COLOR_RED;

        if(info.steps >=5000)
        {
            color = Gfx.COLOR_GREEN;
        }else if(info.steps < 5000  && info.steps >=2000) {
            color = Gfx.COLOR_BLUE;
        }
*/

		var color = Gfx.COLOR_WHITE;
        dc.setColor(color, Gfx.COLOR_BLACK);
        dc.drawText(STEPS_X+75, STEPS_Y, dc.FONT_SYSTEM_TINY, steps,  Gfx.TEXT_JUSTIFY_LEFT);
    	dc.drawBitmap(STEPS_X+117, STEPS_Y+3, pies_bmp);
    
     }

	function ShowGpsBlueTooth(dc)
	{
		var isBTConnected= Sys.getDeviceSettings().phoneConnected;
		if (isBTConnected == true)
		{
    		dc.drawBitmap(BAT_X+42 , BAT_Y+2, blue_bmp);
    	}
    	//dc.drawBitmap(BAT_X+58 , BAT_Y+2, gps_bmp);
	}





    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() {
    }

}
