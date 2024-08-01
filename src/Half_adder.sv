module half_adder ( input_1,input_2,sum,carry);

input wire input_1;
input wire input_2;
output reg sum;
output reg carry;

always_comb 
begin 
    sum = input_1 ^ input_2;
    carry = input_1 & input_2;  
end  
endmodule
