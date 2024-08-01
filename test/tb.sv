module Signed_Multiplier_TB;

// Testbench signals
logic signed [15:0] A, B;
logic signed [31:0] P;
logic signed [31:0] exp;

// Instantiate the Signed_Multiplier module
Signed_Multiplier UUT (
    .A(A),
    .B(B),
    .P(P)
);

// Test procedure
initial begin
  for(int i=0;i<200;i++)begin 
   A = $random % 65536;
   B = $random % 65536;
   exp = A*B;
   #1;
   if (exp != P)begin
    $display("Failed");end
   else begin
    $display("Pass");end
  
    $display("A = %0d, B = %0d, P = %0d", A, B, P);
  end

    $finish;
end

endmodule

