library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.opa_pkg.all;
use work.opa_isa_base_pkg.all;
use work.opa_functions_pkg.all;
use work.opa_components_pkg.all;

entity opa_predict is
  generic(
    g_config : t_opa_config;
    g_target : t_opa_target);
  port(
    clk_i           : in  std_logic;
    rst_n_i         : in  std_logic;
    
    -- Deliver our prediction
    icache_stall_i  : in  std_logic;
    icache_pc_o     : out std_logic_vector(f_opa_adr_wide(g_config)-1 downto c_op_align);
    decode_hit_o    : out std_logic;
    decode_jump_o   : out std_logic_vector(f_opa_decoders(g_config)-1 downto 0);
    
    -- Push a return stack entry
    decode_push_i   : in  std_logic;
    decode_ret_i    : in  std_logic_vector(f_opa_adr_wide(g_config)-1 downto c_op_align);
    
    -- Fixup PC to new target
    decode_fault_i  : in  std_logic;
    decode_return_i : in  std_logic;
    decode_jump_i   : in  std_logic_vector(f_opa_decoders(g_config)-1 downto 0);
    decode_source_i : in  std_logic_vector(f_opa_adr_wide(g_config)-1 downto c_op_align);
    decode_target_i : in  std_logic_vector(f_opa_adr_wide(g_config)-1 downto c_op_align));
end opa_predict;

architecture rtl of opa_predict is

  constant c_adr_wide  : natural := f_opa_adr_wide(g_config);
  constant c_num_fetch : natural := f_opa_num_fetch(g_config);
  
  constant c_fetch_adr : unsigned(c_adr_wide-1 downto 0) := to_unsigned(c_num_fetch, c_adr_wide);
  constant c_increment : unsigned(c_adr_wide-1 downto c_op_align) := c_fetch_adr(c_adr_wide-1 downto c_op_align);
  constant c_mask      : unsigned(c_adr_wide-1 downto c_op_align) := not (c_increment - 1);

  signal r_pc : unsigned(c_adr_wide-1 downto c_op_align) := c_increment;
  signal s_pc : unsigned(c_adr_wide-1 downto c_op_align);

begin

  -- World's simplest branch predictor!
  s_pc <= (r_pc + c_increment) and c_mask when decode_fault_i='0' else unsigned(decode_target_i);
  
  main : process(clk_i, rst_n_i) is
  begin
    if rst_n_i = '0' then
      r_pc          <= c_increment;
      decode_jump_o <= (others => '0');
      decode_hit_o  <= '0';
    elsif rising_edge(clk_i) then
      if icache_stall_i = '0' then
        r_pc          <= s_pc(r_pc'range);
        decode_jump_o <= (others => '0');
        decode_hit_o  <= '0';
      end if;
    end if;
  end process;
  
  icache_pc_o   <= std_logic_vector(s_pc);

end rtl;
