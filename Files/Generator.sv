class generator;
 
mailbox gen_mbx = new();
packet seq = new();
event ack;

task generate_packet();
		for (int i = 0; i<20; i++) begin
			void'(seq.randomize());
			gen_mbx.put(seq);
			$display("[%0t] [Generator] A = %0h, B = %0h, Sel = %0h", $time, seq.A_r, seq.B_r, seq.Sel_r);
			@(ack);
		end
endtask

endclass