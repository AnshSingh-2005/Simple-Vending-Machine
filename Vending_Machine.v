module vending_machine(
  input clk,
  input rst,
  input[1:0] in, // 00=0rs, 01=5rs, 10=10rs
  output reg[1:0] change,
  output reg out
);

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

reg[1:0] c_state,n_state;

always @(posedge clk)
    begin
        if(rst==1)
          begin
            c_state=0;
            n_state=0;
            change=2'b00;
        end
        else
           c_state = n_state;

    case(c_state)
       S0: begin//state 0 = 0rs
         if(in==0)
           begin
             n_state=S0 ;
             out=0;
             change=2'b00;
           end
         else if(in==2'b01)
            begin
                n_state=S1;
                out=0;
                change=2'b00;
            end
         else if(in==2'b10)
            begin
                n_state=S2;
                out=0;
                change=2'b00;
            end
       end

        S1: begin//state 1 = 5rs
          if(in==0)
            begin
                n_state=S0;
                out=0;
                change=2'b01;
            end
          else if(in==2'b01)
            begin
                n_state=S2;
                out=0;
                change=2'b00;
            end
          else if(in==2'b10)
            begin
                n_state=S0;
                out=1;
                change=2'b00;
            end
        end
        S2: begin//state 2=10rs
          if(in==0)
            begin
                n_state=S0;
                out=0;
                change=2'b10;
            end

          else if(in==2'b01)
            begin
                n_state=S0;
                out=1;
                change=2'b00;
            end
          else if(in==2'b10)
            begin 
                n_state=S0;
                out=1;
                change=2'b01;
            end
        end
    endcase
    end
endmodule

