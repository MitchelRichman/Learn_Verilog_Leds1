module fsm_controller (
	input wire clk,       // такты
	input wire rst_n,     // сброс инверт
	input wire pulse,     // импульс от кнопки (щелчок)
	output reg [1:0] current_state // текущий режим (0,1 или 2)
);
	localparam MODE_RUNNER = 2'b00; // бегущий огонь
	localparam MODE_BLINK  = 2'b01; // мигание
	localparam MODE_STATIC = 2'b10; // статика шахматная 
	
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin //сброс
			current_state <= MODE_RUNNER; // 1 режим бегущего огня
		end else begin
			if (pulse) begin // когда пульс есть
				case (current_state)
					MODE_RUNNER: current_state <= MODE_BLINK;
					MODE_BLINK:  current_state <= MODE_STATIC;
					MODE_STATIC: current_state <= MODE_RUNNER;
					default:     current_state <= MODE_RUNNER;
            endcase
         end
				
      end
   end
	
endmodule
	
	