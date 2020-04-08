------------------------------------------------------------------------------
--  Copyright (c) 2018 by Paul Scherrer Institute, Switzerland
--  All rights reserved.
--  Authors: Oliver Bruendler
------------------------------------------------------------------------------

------------------------------------------------------------
-- Testbench generated by TbGen.py
------------------------------------------------------------
-- see Library/Python/TbGenerator

------------------------------------------------------------
-- Libraries
------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library work;
use work.psi_common_math_pkg.all;
use work.psi_common_logic_pkg.all;
use work.psi_tb_compare_pkg.all;
use work.psi_tb_txt_util.all;

------------------------------------------------------------
-- Entity Declaration
------------------------------------------------------------
entity psi_common_wconv_n2xn_tb is
end entity;

------------------------------------------------------------
-- Architecture
------------------------------------------------------------
architecture sim of psi_common_wconv_n2xn_tb is
  -- *** Fixed Generics ***
  constant InWidth_g  : natural := 4;
  constant OutWidth_g : natural := 16;

  -- *** Not Assigned Generics (default values) ***

  -- *** TB Control ***
  signal TbRunning            : boolean                  := True;
  signal NextCase             : integer                  := -1;
  signal ProcessDone          : std_logic_vector(0 to 1) := (others => '0');
  constant AllProcessesDone_c : std_logic_vector(0 to 1) := (others => '1');
  constant TbProcNr_stim_c    : integer                  := 0;
  constant TbProcNr_check_c   : integer                  := 1;

  -- *** DUT Signals ***
  signal Clk     : std_logic                                 := '0';
  signal Rst     : std_logic                                 := '1';
  signal InVld   : std_logic                                 := '0';
  signal InRdy   : std_logic                                 := '0';
  signal InLast  : std_logic                                 := '0';
  signal InData  : std_logic_vector(InWidth_g - 1 downto 0)  := (others => '0');
  signal OutVld  : std_logic                                 := '0';
  signal OutRdy  : std_logic                                 := '0';
  signal OutData : std_logic_vector(OutWidth_g - 1 downto 0) := (others => '0');
  signal OutLast : std_logic                                 := '0';
  signal OutWe   : std_logic_vector(3 downto 0)              := (others => '0');

  -- user stuff --
  signal done     : boolean := False;
  signal testcase : integer := -1;

  procedure CheckOutput(StartValue : in integer) is
    variable RecNibble_v : integer;
    variable ExpNibble_v : integer;
  begin
    for i in 0 to 3 loop
      RecNibble_v := to_integer(unsigned(OutData((i + 1) * 4 - 1 downto i * 4)));
      ExpNibble_v := StartValue + i;
      assert RecNibble_v = ExpNibble_v report "###ERROR###: received wrong single value serialization, exp " & to_string(ExpNibble_v) & ", rec " & to_string(RecNibble_v) severity error;
    end loop;
  end procedure;

begin
  ------------------------------------------------------------
  -- DUT Instantiation
  ------------------------------------------------------------
  i_dut : entity work.psi_common_wconv_n2xn
    generic map(
      InWidth_g  => InWidth_g,
      OutWidth_g => OutWidth_g
    )
    port map(
      Clk     => Clk,
      Rst     => Rst,
      InVld   => InVld,
      InRdy   => InRdy,
      InData  => InData,
      InLast  => InLast,
      OutVld  => OutVld,
      OutRdy  => OutRdy,
      OutData => OutData,
      OutLast => OutLast,
      OutWe   => OutWe
    );

  ------------------------------------------------------------
  -- Testbench Control !DO NOT EDIT!
  ------------------------------------------------------------
  p_tb_control : process
  begin
    wait until Rst = '0';
    wait until ProcessDone = AllProcessesDone_c;
    TbRunning <= false;
    wait;
  end process;

  ------------------------------------------------------------
  -- Clocks !DO NOT EDIT!
  ------------------------------------------------------------
  p_clock_Clk : process
    constant Frequency_c : real := real(100e6);
  begin
    while TbRunning loop
      wait for 0.5 * (1 sec) / Frequency_c;
      Clk <= not Clk;
    end loop;
    wait;
  end process;

  ------------------------------------------------------------
  -- Resets
  ------------------------------------------------------------
  p_rst_Rst : process
  begin
    wait for 1 us;
    -- Wait for two clk edges to ensure reset is active for at least one edge
    wait until rising_edge(Clk);
    wait until rising_edge(Clk);
    Rst <= '0';
    wait;
  end process;

  ------------------------------------------------------------
  -- Processes
  ------------------------------------------------------------
  -- *** stim ***
  p_stim : process
  begin
    -- start of process !DO NOT EDIT
    wait until Rst = '0';

    -- Test Single Serialization
    print(">> Single Serialization");
    testcase <= 0;
    wait until rising_edge(Clk);
    for del in 0 to 3 loop
      for i in 0 to 3 loop
        InData <= std_logic_vector(to_unsigned(i + del * 2, 4));
        InVld  <= '1';
        wait until rising_edge(Clk);
        for j in 0 to del - 1 loop
          InVld <= '0';
          wait until rising_edge(Clk);
        end loop;
      end loop;
      InVld <= '0';
      wait until rising_edge(Clk);
      wait until rising_edge(Clk);
      wait until rising_edge(Clk);
      wait until rising_edge(Clk);
    end loop;
    if done /= true then
      wait until done = true;
    end if;

    -- Test Streaming Serialization
    print(">> Streaming Serialization");
    testcase <= 1;
    wait until rising_edge(Clk);
    for del in 0 to 3 loop
      for i in 0 to 3 * 4 - 1 loop
        InData <= std_logic_vector(to_unsigned(i + del, 4));
        InVld  <= '1';
        wait until rising_edge(Clk);
        for j in 0 to del - 1 loop
          InVld <= '0';
          wait until rising_edge(Clk);
        end loop;
      end loop;
      InVld <= '0';
      wait until rising_edge(Clk);
      wait until rising_edge(Clk);
      wait until rising_edge(Clk);
      wait until rising_edge(Clk);
    end loop;
    if done /= true then
      wait until done = true;
    end if;

    -- Test Back Pressure
    print(">> Back Pressure");
    testcase <= 2;
    wait until rising_edge(Clk);
    for del in 0 to 3 loop
      for i in 0 to 3 * 4 - 1 loop
        InData <= std_logic_vector(to_unsigned(i + del, 4));
        InVld  <= '1';
        wait until rising_edge(Clk) and InRdy = '1';
        for j in 0 to del - 1 loop
          InVld <= '0';
          wait until rising_edge(Clk);
        end loop;
      end loop;
      InVld <= '0';
      wait until rising_edge(Clk);
      wait until rising_edge(Clk);
      wait until rising_edge(Clk);
      wait until rising_edge(Clk);
    end loop;
    if done /= true then
      wait until done = true;
    end if;

    -- Test Last Assertion
    print(">> Last Assertion");
    testcase <= 3;
    for del in 0 to 3 loop
      for size in 1 to 4 loop
        for byte in 0 to size - 1 loop
          InData <= std_logic_vector(to_unsigned(size * 2 + byte + del, 4));
          InVld  <= '1';
          if byte = size - 1 then
            InLast <= '1';
          else
            InLast <= '0';
          end if;
          wait until rising_edge(Clk) and InRdy = '1';
          for j in 0 to del - 1 loop
            InVld <= '0';
            wait until rising_edge(Clk);
          end loop;
        end loop;
        InVld <= '0';
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
      end loop;
    end loop;
    if done /= true then
      wait until done = true;
    end if;

    -- Test Last Assertion with back pressure
    print(">> Last Assertion with back pressure");
    testcase <= 4;
    for size in 1 to 4 loop
      for byte in 0 to size - 1 loop
        InData <= std_logic_vector(to_unsigned(size * 2 + byte, 4));
        InVld  <= '1';
        if byte = size - 1 then
          InLast <= '1';
        else
          InLast <= '0';
        end if;
        wait until rising_edge(Clk) and InRdy = '1';
      end loop;
      InVld <= '0';
    end loop;
    if done /= true then
      wait until done = true;
    end if;

    -- Test Last back-to-back
    print(">> Last Assertion back-to-back");
    testcase <= 5;
    for byte in 0 to 15 loop
      InData <= std_logic_vector(to_unsigned(byte, 4));
      InVld  <= '1';
      InLast <= '1';
      wait until rising_edge(Clk) and InRdy = '1';
    end loop;
    InVld    <= '0';
    if done /= true then
      wait until done = true;
    end if;

    -- Frames
    print(">> Frames ");
    testcase <= 6;
    for size in 5 to 12 loop
      for byte in 0 to size - 1 loop
        InData <= std_logic_vector(to_unsigned(byte, 4));
        InVld  <= '1';
        if byte = size - 1 then
          InLast <= '1';
        else
          InLast <= '0';
        end if;
        wait until rising_edge(Clk) and InRdy = '1';
      end loop;
    end loop;
    InVld    <= '0';
    if done /= true then
      wait until done = true;
    end if;

    -- end of process !DO NOT EDIT!
    ProcessDone(TbProcNr_stim_c) <= '1';
    wait;
  end process;

  -- *** check ***
  p_check : process
  begin
    -- start of process !DO NOT EDIT
    wait until Rst = '0';

    -- Test Single Serialization
    wait until testcase = 0;
    done   <= False;
    OutRdy <= '1';
    for del in 0 to 3 loop
      wait until rising_edge(Clk) and OutVld = '1';
      assert OutLast = '0' report "###ERROR###: OutLast asserted wrongly" severity error;
      assert OutWe = "1111" report "###ERROR###: OutWe not 0xF" severity error;
      CheckOutput(del * 2);
      wait until rising_edge(Clk);
      assert OutVld = '0' report "###ERROR###: OutVld did not go low" severity error;
    end loop;
    done   <= True;

    -- Test Streaming Serialization
    wait until testcase = 1;
    done   <= False;
    OutRdy <= '1';
    for del in 0 to 3 loop
      for word in 0 to 2 loop
        wait until rising_edge(Clk) and OutVld = '1';
        assert OutLast = '0' report "###ERROR###: OutLast asserted wrongly" severity error;
        assert OutWe = "1111" report "###ERROR###: OutWe not 0xF" severity error;
        CheckOutput(del + word * 4);
      end loop;
      wait until rising_edge(Clk);
      assert OutVld = '0' report "###ERROR###: OutVld did not go low" severity error;
    end loop;
    done   <= True;

    -- Test Back Pressure
    wait until testcase = 2;
    done   <= False;
    OutRdy <= '0';
    for del in 0 to 3 loop
      for word in 0 to 2 loop
        wait until rising_edge(Clk) and OutVld = '1';
        for i in 0 to 9 loop
          wait until rising_edge(Clk);
        end loop;
        OutRdy <= '1';
        assert OutLast = '0' report "###ERROR###: OutLast asserted wrongly" severity error;
        assert OutWe = "1111" report "###ERROR###: OutWe not 0xF" severity error;
        CheckOutput(del + word * 4);
        wait until rising_edge(Clk);
        OutRdy <= '0';
      end loop;
      wait until rising_edge(Clk);
    end loop;
    done   <= True;

    -- Test Last Assertion
    wait until testcase = 3;
    done   <= False;
    OutRdy <= '1';
    for del in 0 to 3 loop
      for size in 1 to 4 loop
        wait until rising_edge(Clk) and OutVld = '1';
        StdlCompare(1, OutLast, "Last not asserted");
        for byte in 0 to size - 1 loop
          StdlvCompareInt(size * 2 + byte + del, OutData((byte + 1) * 4 - 1 downto byte * 4), "Wrong Data", false);
          StdlCompare(1, OutWe(byte), "OutWe not asserted");
        end loop;
        for byte in size to 3 loop
          StdlCompare(0, OutWe(byte), "OutWe not de-asserted");
        end loop;
      end loop;
    end loop;
    done   <= True;

    -- Test Last Assertion with back pressure
    wait until testcase = 4;
    done   <= False;
    OutRdy <= '0';
    for size in 1 to 4 loop
      for i in 0 to 20 loop
        wait until rising_edge(Clk);
      end loop;
      OutRdy <= '1';
      wait until rising_edge(Clk) and OutVld = '1';
      OutRdy <= '0';
      StdlCompare(1, OutLast, "Last not asserted");
      for byte in 0 to size - 1 loop
        StdlvCompareInt(size * 2 + byte, OutData((byte + 1) * 4 - 1 downto byte * 4), "Wrong Data", false);
        StdlCompare(1, OutWe(byte), "OutWe not asserted");
      end loop;
      for byte in size to 3 loop
        StdlCompare(0, OutWe(byte), "OutWe not de-asserted");
      end loop;
    end loop;
    done   <= True;

    -- Test Last back-to-back
    wait until testcase = 5;
    done   <= False;
    OutRdy <= '0';
    for byte in 0 to 15 loop
      -- Back pressure for bytes 8-15
      if byte >= 8 then
        for i in 0 to 20 loop
          wait until rising_edge(Clk);
        end loop;
      end if;
      -- Test
      OutRdy <= '1';
      wait until rising_edge(Clk) and OutVld = '1';
      OutRdy <= '0';
      StdlCompare(1, OutLast, "Last not asserted");
      StdlvCompareInt(byte, OutData(3 downto 0), "Wrong Data", false);
      StdlvCompareStdlv("0001", OutWe, "Wrong OutWe");
    end loop;
    done   <= True;

    -- Frames
    wait until testcase = 6;
    done   <= False;
    OutRdy <= '1';
    for size in 5 to 12 loop
      for byte in 0 to size - 1 loop
        -- wait for data word every 4 bytes
        if byte mod 4 = 0 then
          wait until rising_edge(Clk) and OutVld = '1';
        end if;
        -- Check data
        StdlvCompareInt(byte, OutData((byte mod 4 + 1) * 4 - 1 downto (byte mod 4) * 4), "Wrong Data", false);
        StdlCompare(1, OutWe(byte mod 4), "OutWe not asserted");
        if byte / 4 = (size - 1) / 4 then
          StdlCompare(1, OutLast, "Last not asserted");
        else
          StdlCompare(0, OutLast, "Last asserted wrongly");
        end if;
      end loop;
    end loop;
    done   <= True;

    -- end of process !DO NOT EDIT!
    ProcessDone(TbProcNr_check_c) <= '1';
    wait;
  end process;

end;
