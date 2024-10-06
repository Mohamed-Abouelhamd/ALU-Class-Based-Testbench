class monitor;

virtual intf vif;
mailbox mon_mbx = new();
packet pk = new();
event sent;

task monitor_packet(); 
	forever begin
		@(posedge vif.clk);
		#1step;
		pk.A_r   = vif.A;
		pk.B_r   = vif.B;
		pk.Sel_r = vif.Sel;
		pk.Y     = vif.Y;
		pk.C     = vif.C;
		mon_mbx.put(pk);
		-> sent;
		$display("[%0t] [Monitor] A = %0h, B = %0h, Sel = %0h, Y = %0h, C = %0h", $time, pk.A_r, pk.B_r, pk.Sel_r, pk.Y, pk.C);
	end
endtask

endclass