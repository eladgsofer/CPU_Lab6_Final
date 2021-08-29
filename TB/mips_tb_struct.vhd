-- VHDL Entity MIPS.MIPS_tb.symbol
--
-- Created:
--          by - kolaman.UNKNOWN (KOLAMAN-PC)
--          at - 09:22:45 17/02/2013
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2011.1 (Build 18)
--


ENTITY MIPS_tb IS
-- Declarations

END MIPS_tb ;

--
-- VHDL Architecture MIPS.MIPS_tb.struct
--
-- Created:
--          by - kolaman.UNKNOWN (KOLAMAN-PC)
--          at - 09:22:45 17/02/2013
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2011.1 (Build 18)
--
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

LIBRARY work;

ARCHITECTURE struct OF MIPS_tb IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALU_result_out  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL Branch_out      : STD_LOGIC;
   SIGNAL Instruction_out : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL Memwrite_out    : STD_LOGIC;
   SIGNAL PC              : STD_LOGIC_VECTOR( 9 DOWNTO 0 );
   SIGNAL Regwrite_out    : STD_LOGIC;
   SIGNAL Zero_out        : STD_LOGIC;
   SIGNAL clock           : STD_LOGIC;
   SIGNAL read_data_1_out : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL read_data_2_out : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL reset           : STD_LOGIC;
   SIGNAL write_data_out  : STD_LOGIC_VECTOR( 31 DOWNTO 0 );
   SIGNAL SW  : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
   SIGNAL LEDG  : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
   SIGNAL LEDR  : STD_LOGIC_VECTOR( 7 DOWNTO 0 );
   SIGNAL HEX0  : STD_LOGIC_VECTOR( 6 DOWNTO 0 );
   SIGNAL HEX1  : STD_LOGIC_VECTOR( 6 DOWNTO 0 );
   SIGNAL HEX2  : STD_LOGIC_VECTOR( 6 DOWNTO 0 );
   SIGNAL HEX3  : STD_LOGIC_VECTOR( 6 DOWNTO 0 );
   SIGNAL pushButtons : STD_LOGIC_VECTOR (3 DOWNTO 0);
   SIGNAL mw_U_2pulse : std_logic_vector(2 DOWNTO 0);
   SIGNAL UART_TXD,UART_RXD :STD_LOGIC;
   -- Component Declarations
COMPONENT MIPS IS
    GENERIC (BUS_W : INTEGER := 10; ADD_BUS: INTEGER :=8; QUARTUS : INTEGER := 0); -- QUARTUS MODE = 12; 10 | MODELSIM = 10; 8
        --GENERIC (BUS_W : INTEGER := 8; ADD_BUS: INTEGER :=8; QUARTUS : INTEGER := 0); -- QUARTUS MODE = 12; 10 | MODELSIM = 10; 8
    PORT(clock                  : IN    STD_LOGIC; 
        -- Output important signals to pins for easy display in Simulator
        PC                              : OUT STD_LOGIC_VECTOR( 9 DOWNTO 0 );
        ALU_result_out, read_data_1_out : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        read_data_2_out, write_data_out : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        Instruction_out                 : OUT STD_LOGIC_VECTOR( 31 DOWNTO 0 );
        Branch_out, Zero_out            : OUT STD_LOGIC;
        Memwrite_out,Regwrite_out       : OUT STD_LOGIC;
        LEDG, LEDR                      : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
        HEX0, HEX1, HEX2, HEX3          : OUT STD_LOGIC_VECTOR (6 DOWNTO 0);
        SW                              : IN  STD_LOGIC_VECTOR (7 DOWNTO 0);
        UART_TXD                        : OUT STD_LOGIC;
        UART_RXD                        : IN  STD_LOGIC;
        pushButtons						: IN  STD_LOGIC_VECTOR (3 DOWNTO 0));
END     COMPONENT;
	
   COMPONENT MIPS_tester
   PORT (
      ALU_result_out  : IN     STD_LOGIC_VECTOR ( 31 DOWNTO 0 );
      Branch_out      : IN     STD_LOGIC ;
      Instruction_out : IN     STD_LOGIC_VECTOR ( 31 DOWNTO 0 );
      Memwrite_out    : IN     STD_LOGIC ;
      PC              : IN     STD_LOGIC_VECTOR ( 9 DOWNTO 0 );
      Regwrite_out    : IN     STD_LOGIC ;
      Zero_out        : IN     STD_LOGIC ;
      read_data_1_out : IN     STD_LOGIC_VECTOR ( 31 DOWNTO 0 );
      read_data_2_out : IN     STD_LOGIC_VECTOR ( 31 DOWNTO 0 );
      write_data_out  : IN     STD_LOGIC_VECTOR ( 31 DOWNTO 0 );
      clock           : OUT    STD_LOGIC ;
      reset           : OUT    STD_LOGIC 
   );
   END COMPONENT;
   
   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : MIPS USE ENTITY work.mips;
   FOR ALL : MIPS_tester USE ENTITY work.mips_tester;
   -- pragma synthesis_on


BEGIN
	SW <= "00000001";
   -- Instance port mappings.
   U_0 : MIPS
      PORT MAP (
         
         clock           => clock,
         PC              => PC,
         ALU_result_out  => ALU_result_out,
         read_data_1_out => read_data_1_out,
         read_data_2_out => read_data_2_out,
         write_data_out  => write_data_out,
         Instruction_out => Instruction_out,
         Branch_out      => Branch_out,
         Zero_out        => Zero_out,
         Memwrite_out    => Memwrite_out,
         Regwrite_out    => Regwrite_out,
		 SW => SW,
         LEDG => LEDG,
         LEDR  => LEDR,
         HEX0 => HEX0,
         HEX1      => HEX1,
         HEX2        => HEX2,
         HEX3    => HEX3,
         UART_TXD => UART_TXD,
         UART_RXD => UART_RXD,
         pushButtons =>  pushButtons
      );
   U_1 : MIPS_tester
      PORT MAP (
         ALU_result_out  => ALU_result_out,
         Branch_out      => Branch_out,
         Instruction_out => Instruction_out,
         Memwrite_out    => Memwrite_out,
         PC              => PC,
         Regwrite_out    => Regwrite_out,
         Zero_out        => Zero_out,
         read_data_1_out => read_data_1_out,
         read_data_2_out => read_data_2_out,
         write_data_out  => write_data_out,
         clock           => clock,
         reset           => pushButtons(0)
      );
 
   pushButtons(3 DOWNTO 1) <= mw_U_2pulse;
   u_2pulse_proc: PROCESS
   BEGIN

         mw_U_2pulse <="111";
		    wait for 2000 ns;
		    mw_U_2pulse <="110";
		    wait for 2000 ns;
		    mw_U_2pulse <="111";
		    wait; 
      WAIT;
   END PROCESS u_2pulse_proc;
END struct;

