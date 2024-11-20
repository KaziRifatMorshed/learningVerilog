`include "Lab_Test5.v"
module t_Lab_Test5;
 	//reg FA, FB;
 	reg t_clock,t_reset;
 	wire [1:0] state;
 	
	Lab_Test5 P ( FA, FB, t_clock,t_reset);
	assign state = {FA,FB};
	
	initial 
		begin
		   $dumpfile("t_Lab_Test5.vcd");
	       $dumpvars(0, t_Lab_Test5);
		end
	initial #150 $finish;
     
      initial 
	  begin           
	      t_reset = 0;
	  	  #5 t_reset = 1;
	  	  #5 t_reset = 0;
	  	  t_clock = 0;	      
	      repeat (28)
	        #5 t_clock = ~t_clock; 
       end
endmodule