`include "Packet.sv"
`include "Generator.sv" 
`include "Driver.sv"
`include "Monitor.sv"
`include "Scoreboard.sv"
`include "Environment.sv"
`include "Interface.sv"
module Top;

bit clk;
intf i (clk);
environment env = new();

ALU dut (
  		.Y(i.Y),
  		.C(i.C),
		.A(i.A), 
		.B(i.B),
		.Sel(i.Sel),
		.clk(clk), 
  		.rst(i.rst)
);

always #20 clk = ~clk;


initial begin
    clk = 0;
    i.rst = 0;
    #5;
    i.rst = 1;
end  

initial begin
	env._vif = i;
	env.run();
end

initial  begin 
      $dumpfile("dump.vcd");
      $dumpvars;
  end
  
endmodule 