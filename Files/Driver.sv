class driver;

virtual intf vif;
mailbox drv_mbx = new();
packet seq = new();
event received;

task drive_packet();
	forever begin
		drv_mbx.get(seq);
 		vif.A <= seq.A_r;
 		vif.B <= seq.B_r;
 		vif.Sel <= seq.Sel_r;
		$display("[%0t] [Driver] A = %0h, B = %0h, Sel = %0h", $time, seq.A_r, seq.B_r, seq.Sel_r);
      	@(negedge vif.clk);
		-> received;
	end
endtask

endclass