library verilog;
use verilog.vl_types.all;
entity TOP_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        clock_en        : in     vl_logic;
        clock_hour_ge   : in     vl_logic_vector(3 downto 0);
        clock_hour_shi  : in     vl_logic_vector(3 downto 0);
        clock_min_ge    : in     vl_logic_vector(3 downto 0);
        clock_min_shi   : in     vl_logic_vector(3 downto 0);
        rst_n           : in     vl_logic;
        set_time_finish : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end TOP_vlg_sample_tst;
