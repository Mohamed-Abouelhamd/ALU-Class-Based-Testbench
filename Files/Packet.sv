class packet;
rand logic [7:0] A_r, B_r;
rand logic [1:0] Sel_r;
logic [7:0] Y;
logic C;
constraint range_constraint {
B_r [3:0] inside {[0:12]};
B_r [7:4] inside {[3:15]};

A_r dist {
	[0:99]   := 30,
	[100:199] := 60,
	[200:255] := 10
};
}
endclass