module cpu(input wire clk, reset);
//Procesador sin memoria de datos de un solo ciclo
    wire s_inc, s_inm, we3, wez, z;
    wire [2:0] op_alu;
    wire [5:0] opcode; 
    cd camino(clk, reset, s_inc, s_inm, we3, wez, op_alu, z, opcode);
    uc unidad_control(opcode, z, s_inc, s_inm, we3, wez, op_alu);
endmodule
