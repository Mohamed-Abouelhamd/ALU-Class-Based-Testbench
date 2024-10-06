class environment;

virtual intf _vif; 
generator gen = new(); 
driver drv = new(); 
monitor mon = new(); 
scoreboard scb = new(); 

task run();
    gen.ack = drv.received; 
    drv.drv_mbx = gen.gen_mbx;
	scb.scb_mbx = mon.mon_mbx;
	scb.ack = mon.sent;
  	drv.vif = _vif;
	mon.vif = _vif;
    fork
        begin
            gen.generate_packet();
        end
        begin
            drv.drive_packet();
        end
        begin
            mon.monitor_packet();
        end
		begin
            scb.run();
        end	
    join_any
    $finish;
endtask

endclass
