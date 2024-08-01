module Signed_Multiplier (
    input wire [15:0] A, B,
    output wire [31:0] P
);

//intermediate wires
wire [15:0] c [15:0];
wire [15:0] sum [15:0];
wire c_lh,sum_lh;
// Partial products
logic [15:0] pp [15:0]; 
genvar i,j;
generate
   for(i = 0; i < 16; i = i + 1) begin 
      for(j = 0; j < 16; j = j + 1) begin 
         if (i == 15 && j == 15)
            assign pp[i][j] = A[i] & B[j];
         else if (i == 15)
            assign pp[i][j] = ~(A[i] & B[j]);
         else if (j == 15)
            assign pp[i][j] = ~(A[i] & B[j]);
         else
            assign pp[i][j] = A[j] & B[i];
      end
   end
endgenerate



generate
            
// level 1 output

half_adder HA_1( .input_1(pp[0][1]),.input_2(pp[1][0]),.sum(sum[0][0]),.carry(c[0][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L1( .input_1(pp[0][i+2]),.input_2(pp[1][i+1]),.cin(c[0][i]),.cout(c[0][i+1]),.sum(sum[0][i+1]));
    end
full_adder FA_L1_last( .input_1(1'd1),.input_2(pp[1][15]),.cin(c[0][14]),.cout(c[0][15]),.sum(sum[0][15]));

// level 2 output

half_adder HA_2( .input_1(sum[0][1]),.input_2(pp[2][0]),.sum(sum[1][0]),.carry(c[1][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L2( .input_1(sum[0][i+2]),.input_2(pp[2][i+1]),.cin(c[1][i]),.cout(c[1][i+1]),.sum(sum[1][i+1]));
   end
full_adder FA_L2_last( .input_1(c[0][15]),.input_2(pp[2][15]),.cin(c[1][14]),.cout(c[1][15]),.sum(sum[1][15]));


//level 3 output
half_adder HA_3( .input_1(sum[1][1]),.input_2(pp[3][0]),.sum(sum[2][0]),.carry(c[2][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L3( .input_1(sum[1][i+2]),.input_2(pp[3][i+1]),.cin(c[2][i]),.cout(c[2][i+1]),.sum(sum[2][i+1]));
   end
full_adder FA_L3_last( .input_1(c[1][15]),.input_2(pp[3][15]),.cin(c[2][14]),.cout(c[2][15]),.sum(sum[2][15]));

//level 4 output
half_adder HA_4( .input_1(sum[2][1]),.input_2(pp[4][0]),.sum(sum[3][0]),.carry(c[3][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L4( .input_1(sum[2][i+2]),.input_2(pp[4][i+1]),.cin(c[3][i]),.cout(c[3][i+1]),.sum(sum[3][i+1]));
   end
full_adder FA_L4_last( .input_1(c[2][15]),.input_2(pp[4][15]),.cin(c[3][14]),.cout(c[3][15]),.sum(sum[3][15]));
    
//level 5 output
half_adder HA_5( .input_1(sum[3][1]),.input_2(pp[5][0]),.sum(sum[4][0]),.carry(c[4][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L5( .input_1(sum[3][i+2]),.input_2(pp[5][i+1]),.cin(c[4][i]),.cout(c[4][i+1]),.sum(sum[4][i+1]));
   end
full_adder FA_L5_last( .input_1(c[3][15]),.input_2(pp[5][15]),.cin(c[4][14]),.cout(c[4][15]),.sum(sum[4][15]));

//level 6 output
half_adder HA_6( .input_1(sum[4][1]),.input_2(pp[6][0]),.sum(sum[5][0]),.carry(c[5][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L6( .input_1(sum[4][i+2]),.input_2(pp[6][i+1]),.cin(c[5][i]),.cout(c[5][i+1]),.sum(sum[5][i+1]));
   end
full_adder FA_L6_last( .input_1(c[4][15]),.input_2(pp[6][15]),.cin(c[5][14]),.cout(c[5][15]),.sum(sum[5][15]));

//level 7 output
half_adder HA_7( .input_1(sum[5][1]),.input_2(pp[7][0]),.sum(sum[6][0]),.carry(c[6][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L7( .input_1(sum[5][i+2]),.input_2(pp[7][i+1]),.cin(c[6][i]),.cout(c[6][i+1]),.sum(sum[6][i+1]));
   end
full_adder FA_L7_last( .input_1(c[5][15]),.input_2(pp[7][15]),.cin(c[6][14]),.cout(c[6][15]),.sum(sum[6][15]));

//level 8 output
half_adder HA_8( .input_1(sum[6][1]),.input_2(pp[8][0]),.sum(sum[7][0]),.carry(c[7][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L8( .input_1(sum[6][i+2]),.input_2(pp[8][i+1]),.cin(c[7][i]),.cout(c[7][i+1]),.sum(sum[7][i+1]));
   end
full_adder FA_L8_last( .input_1(c[6][15]),.input_2(pp[8][15]),.cin(c[7][14]),.cout(c[7][15]),.sum(sum[7][15]));

//level 9 output
half_adder HA_9( .input_1(sum[7][1]),.input_2(pp[9][0]),.sum(sum[8][0]),.carry(c[8][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L9( .input_1(sum[7][i+2]),.input_2(pp[9][i+1]),.cin(c[8][i]),.cout(c[8][i+1]),.sum(sum[8][i+1]));
   end
full_adder FA_L9_last( .input_1(c[7][15]),.input_2(pp[9][15]),.cin(c[8][14]),.cout(c[8][15]),.sum(sum[8][15]));

//level 10 output
half_adder HA_10( .input_1(sum[8][1]),.input_2(pp[10][0]),.sum(sum[9][0]),.carry(c[9][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L10( .input_1(sum[8][i+2]),.input_2(pp[10][i+1]),.cin(c[9][i]),.cout(c[9][i+1]),.sum(sum[9][i+1]));
   end
full_adder FA_L10_last( .input_1(c[8][15]),.input_2(pp[10][15]),.cin(c[9][14]),.cout(c[9][15]),.sum(sum[9][15]));


//level 11 output
half_adder HA_11( .input_1(sum[9][1]),.input_2(pp[11][0]),.sum(sum[10][0]),.carry(c[10][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L11( .input_1(sum[9][i+2]),.input_2(pp[11][i+1]),.cin(c[10][i]),.cout(c[10][i+1]),.sum(sum[10][i+1]));
   end
full_adder FA_L11_last( .input_1(c[9][15]),.input_2(pp[11][15]),.cin(c[10][14]),.cout(c[10][15]),.sum(sum[10][15]));


//level 12 output
half_adder HA_12( .input_1(sum[10][1]),.input_2(pp[12][0]),.sum(sum[11][0]),.carry(c[11][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L12( .input_1(sum[10][i+2]),.input_2(pp[12][i+1]),.cin(c[11][i]),.cout(c[11][i+1]),.sum(sum[11][i+1]));
   end
full_adder FA_L12_last( .input_1(c[10][15]),.input_2(pp[12][15]),.cin(c[11][14]),.cout(c[11][15]),.sum(sum[11][15]));

//level 13 output
half_adder HA_13( .input_1(sum[11][1]),.input_2(pp[13][0]),.sum(sum[12][0]),.carry(c[12][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L13( .input_1(sum[11][i+2]),.input_2(pp[13][i+1]),.cin(c[12][i]),.cout(c[12][i+1]),.sum(sum[12][i+1]));
   end
full_adder FA_L13_last( .input_1(c[11][15]),.input_2(pp[13][15]),.cin(c[12][14]),.cout(c[12][15]),.sum(sum[12][15]));

//level 14 output
half_adder HA_14( .input_1(sum[12][1]),.input_2(pp[14][0]),.sum(sum[13][0]),.carry(c[13][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L14( .input_1(sum[12][i+2]),.input_2(pp[14][i+1]),.cin(c[13][i]),.cout(c[13][i+1]),.sum(sum[13][i+1]));
   end
full_adder FA_L14_last( .input_1(c[12][15]),.input_2(pp[14][15]),.cin(c[13][14]),.cout(c[13][15]),.sum(sum[13][15]));

//level 15 output
half_adder HA_15( .input_1(sum[13][1]),.input_2(pp[15][0]),.sum(sum[14][0]),.carry(c[14][0]));
   for(i=0;i<14;i++)begin
      full_adder FA_L15( .input_1(sum[13][i+2]),.input_2(pp[15][i+1]),.cin(c[14][i]),.cout(c[14][i+1]),.sum(sum[14][i+1]));
   end
full_adder FA_last( .input_1(c[13][15]),.input_2(pp[15][15]),.cin(c[14][14]),.cout(c[14][15]),.sum(sum[14][15]));

//last half adder
half_adder HA_last( .input_1(1'd1),.input_2(c[14][15]),.sum(sum_lh),.carry(c_lh));

endgenerate

//now concatinating all the product bits

assign P =  { sum_lh,sum[14][15], sum[14][14], sum[14][13], sum[14][12],sum[14][11], sum[14][10], 
              sum[14][9], sum[14][8], sum[14][7], sum[14][6], sum[14][5], sum[14][4], sum[14][3], 
              sum[14][2], sum[14][1],  sum[14][0],
              sum[13][0], sum[12][0], sum[11][0],sum[10][0], sum[9][0], sum[8][0], sum[7][0],
              sum[6][0], sum[5][0],sum[4][0],sum[3][0],sum[2][0],sum[1][0],sum[0][0],pp[0][0]};

endmodule