/**
*********************************************************************************
** Name:	Ian Kollipara
** CDate:	2025-05-07
** UDate:       2025-05-07
** File: 	z80.v
** Purp:	The CPU of the Gameboy
**
** Doc:         Z80 Reference Material
** 	
**********************************************************************************
 */


module z80(
	   input wire	      clk_n, // Clock; Single-Phase MOS-level clk
	   input wire	      reset_n, // Reset interrupt enable ; clear prg_counter, I and R, interrupt status = 0; address and data in Z
	   input wire	      busrq_n, // Bus Request; Active Low; Higher Priority than NMI. Always recognized at end of cycle.
	   input wire	      wait_n, // wait ; wait until ready. Active while signal is active.
	   input wire	      int_n, // Interrupt. Honored at end of current instruction if IFF is enabled.
	   input wire	      nmi_n, // Non Maskable Interrupt; Higher priority than int_n; always recognized at end of current instruction. Forces CPU to start at location 4'h0066;
	   output wire	      m1_n, // Machine Cycle 1; Indicates (with mreq_n) in fetch cycle; with iorq_n, interrupt ack.
	   output wire	      mreq_n, // Memory Request; Address bus hold valid address
	   output wire	      iorq_n, // Input/Output Request; Lower half of addr bus contains valid address
	   output wire	      rd_n, // Indicates CPU Read
	   output wire	      wr_n, // Indicates CPU Write
	   output wire	      rfsh_n, // Refresh; With mreq_n, indicates the lower 7 of address bus can used to refresh system's dynamic memories
	   output wire	      halt_n, // CPU has entered HALT state and will only respond to interrupts. Continously executes NOPs
	   output wire	      busack_n, // Bus Ack; Active Low. Indicates that mreq_n, iorq_n, rd_n, and wr_n are in Z.
	   output wire [15:0] address,
	   input wire [7:0]   data_in,
	   output wire [7:0]  data_out
);
   // Instructions can take 3-6 cycles to complete

   reg [15:0]	 q_pc;
   wire [15:0]	 d_pc;

   reg [15:0]	 q_sp;
   wire [15:0]	 d_sp;

   reg [15:0]	 q_ix;
   wire [15:0]	 d_ix;

   reg [15:0]	 q_iy;
   wire [15:0]	 d_iy;

   reg [7:0]	 q_i;
   wire [7:0]	 d_i;

   reg [7:0]	 q_r;
   wire [7:0]	 d_r;

   reg [7:0]	 q_acc;
   wire [7:0]	 d_acc;

   reg [7:0]	 q_f;
   wire [7:0]	 d_f;

   reg [7:0]	 q_b;
   wire [7:0]	 d_b;

   reg [7:0]	 q_c;
   wire [7:0]	 d_c;

   reg [7:0]	 q_d;
   wire [7:0]	 d_d;

   reg [7:0]	 q_e;
   wire [7:0]	 d_e;

   reg [7:0]	 q_h;
   wire [7:0]	 d_h;

   reg [7:0]	 q_l;
   wire [7:0]	 d_l;

   localparam	 M1 = 2'b00;
   localparam	 M2 = 2'b01;
   localparam	 M3 = 2'b10;

   
endmodule; // z80

   
   
