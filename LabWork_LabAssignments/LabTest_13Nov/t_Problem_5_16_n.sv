`include "Problem_5_16_n.sv"
module t_Problem_5_16_n;
 	reg t_x_in, t_clock, t_reset;
 	wire [1:0] state;
 	
	Problem_5_16_n P ( FA, FB, t_x_in, t_clock, t_reset);
	assign state = {FA,FB};
	
	initial 
		begin
		   $dumpfile("t_Problem_5_16_n.vcd");
	       $dumpvars(0, t_Problem_5_16_n);
		end
	initial #150 $finish;
   
	initial 
	  begin 
	  	  t_reset = 1;
	      repeat (2)
	        #5 t_reset = ~t_reset;  
      end
     
      initial 
	  begin 
	  	  t_clock = 0;	      
	      repeat (28)
	        #5 t_clock = ~t_clock; 
      end
	
	initial 
	 begin
 		t_x_in = 0;
		#10 t_x_in = 1;
		repeat (3)
		   #30 t_x_in = ~t_x_in;
	end
endmodule