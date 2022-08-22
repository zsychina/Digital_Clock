library verilog;
use verilog.vl_types.all;
entity TOP_vlg_check_tst is
    port(
        clock_out       : in     vl_logic;
        data_out        : in     vl_logic_vector(7 downto 0);
        hour_ge_r       : in     vl_logic_vector(3 downto 0);
        hour_shi_r      : in     vl_logic_vector(3 downto 0);
        min_ge_r        : in     vl_logic_vector(3 downto 0);
        min_shi_r       : in     vl_logic_vector(3 downto 0);
        sec_ge_r        : in     vl_logic_vector(3 downto 0);
        sec_shi_r       : in     vl_logic_vector(3 downto 0);
        \select\        : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end TOP_vlg_check_tst;
