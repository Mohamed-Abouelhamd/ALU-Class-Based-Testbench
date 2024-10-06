class scoreboard;

mailbox scb_mbx = new();
packet pk = new();
event ack;

task run(); 
	forever begin
		@(ack);
		scb_mbx.get(pk);
		case(pk.Sel_r)
			2'b00: begin
				if({pk.C,pk.Y} == pk.A_r + pk.B_r)
					$display("[%0t] [Scoreboard] Correct Packet",$time);
				else 
					$display("[%0t] [Scoreboard] Wrong Packet",$time);
			end
			2'b01: begin
				if({pk.C,pk.Y} <= {1'b0, pk.A_r} + {1'b0, (~pk.B_r + 8'd1)})
					$display("[%0t] [Scoreboard] Correct Packet",$time);
				else 
					$display("[%0t] [Scoreboard] Wrong Packet",$time);
			end
			2'b10: begin
				if({pk.C,pk.Y} == {1'b0, pk.A_r & pk.B_r})
					$display("[%0t] [Scoreboard] Correct Packet",$time);
				else 
					$display("[%0t] [Scoreboard] Wrong Packet",$time);
			end
			2'b11: begin
				if({pk.C,pk.Y} == {1'b0, pk.A_r | pk.B_r})
					$display("[%0t] [Scoreboard] Correct Packet",$time);
				else 
					$display("[%0t] [Scoreboard] Wrong Packet",$time);
			end
		endcase
	end
endtask

endclass
