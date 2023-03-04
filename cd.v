module cd(input wire clk, reset, s_inc, s_inm, we3, wez, input wire [2:0] op_alu, output wire z, output wire [5:0] opcode);
//Camino de datos de instrucciones de un solo ciclo
    wire [15:0] inst;
    wire [9:0] dir_pc, salida_sum_pc, salida_mux_pc;
    wire [9:0] in_sum_10b = 10'b0000000001;
    wire [7:0] rd1, rd2, y, cte, wd3;
    // wire [3:0] ra1, ra2, wa3;
    wire zalu;

    alu alu_mc(rd1, rd2, op_alu, y, zalu);
    ffd ffz(clk, reset, zalu, wez, z);
    mux2 #(8) mux_alu(y, inst[11:4], s_inm, wd3);
    regfile banco(clk, we3, inst[11:8], inst[7:4], inst[3:0], wd3, rd1, rd2);
    memprog memoria(clk, dir_pc, inst);
    assign opcode = inst[15:10];
    mux2 #(10) mux_pc(inst[9:0], salida_sum_pc, s_inc, salida_mux_pc);
    registro #(10) pc(clk, reset, salida_mux_pc, dir_pc);
    sum sum_pc(in_sum_10b, dir_pc, salida_sum_pc);
endmodule
