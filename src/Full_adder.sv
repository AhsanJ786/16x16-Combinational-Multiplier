module full_adder (input_1,input_2,cin,cout,sum);

input wire input_1,input_2,cin;
output reg sum,cout;

always_comb begin 
    sum =input_1 ^ input_2 ^ cin;
    cout = (input_1 & input_2) | (input_2 & cin) | (cin & input_1);

end
    
endmodule