module led_driver (
	input wire clk,       // такт, нужен 50 мгц
   input wire rst_n,     // сброс инв
   input wire [1:0] mode,// Номер режима от FSM (0, 1, 2)
   output reg [3:0] leds // Выход со светодиодами
);

	reg [24:0] slow_counter; 

	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) begin
			slow_counter <= 0;
         leds <= 4'b0000;
		end else begin
			slow_counter <= slow_counter +1;
			
			case(mode)
				2'b00: begin//бегущий огонь
					leds <= 4'b0001 << slow_counter[21:20];
				end
		
				2'b01: begin //(мигание всех)
					leds<= {4{slow_counter[21]}};//пробуем
				end
				2'b10: begin//статика шахматная
					leds<= 4'b0101;
				end
				
				
				
			endcase
		end
	end
	
endmodule 