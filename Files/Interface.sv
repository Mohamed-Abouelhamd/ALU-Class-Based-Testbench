interface intf (input bit clk);
// Inputs
logic [7:0] A, B;
logic [1:0] Sel;
logic rst;
// Outputs
logic [7:0] Y;
logic C;
endinterface 