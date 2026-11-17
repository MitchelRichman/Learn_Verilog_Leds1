module top_module(   //входы выходы
	input wire clk,
	input wire rst_n,
	input wire mode_btn,
	output reg [3:0] leds
);

	wire w_pulse;
	wire [1:0] w_state;


	//debounce
	debounce u_debounce(
		.clk(clk),
		.rst_n(rst_n),
		.btn_raw(mode_btn),
		.btn_clean(),
		.pulse(w_pulse)
		
	);
	//FSM конечный автомат


endmodule
//LED LOGIC - логика светодоидов 




