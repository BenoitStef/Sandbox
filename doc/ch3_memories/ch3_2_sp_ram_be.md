<img align="right" src="../psi_logo.png">

***

# psi\_common\_sp\_ram\_be

- VHDL source: [psi_common_sp_ram_be.vhd](../../hdl/psi_common_sp_ram_be.vhd)
- Testbench: [psi_common_sp_ram_be_tb.vhd](../../testbench/psi_common_sp_ram_be_tb/psi_common_sp_ram_be_tb.vhd)

### Description

This component implements a single port RAM with byte enables. The RAM
is described in a way that it utilizes RAM resources (Block-RAM and
Distributed-RAM) available in FPGAs with commonly used tools.

The RAM is a synchronous RAM, so data is available at the read port one
clock cycle after applying the address.

The RAM behavior (read-before-write or write-before-read) can be
selected. This allows efficiently implementing RAMs for different
technologies (some technologies implement one, some the other behavior).

### Generics
Generics        | description
----------------|--------
**Depth\_g**    | Depth of the memory
**Width\_g**    | Width of the memory in bits (must be a multiple of 8)
**Behavior\_g** | **"RBW"** Read-before-write implementation, **"WBR"** Write-before-read implementation

### Interfaces

  Signal                 | Direction  | Width                |  Description
  -----------------------| -----------|----------------------| --------------------------------------------------
  Clk                    | Input      | 1                    |  Clock
  Addr                   | Input      | ceil(log2(Depth\_g)) |  Access address
  Wr                     | Input       |1                    |  Write enable (active high)
  Be                     | Input      | Width\_g/8           |  Byte enables (Be\[0\] corresponds do Din\[7:0\])
  Din                    | Input      | Width\_g             |  Write data
  Dout                   | Output     | Width\_g             |  Read data

***
Back: [index](../psi_common_index.md) **|** Next: [Memories | tdp ram](../ch3_memories/ch3_3_tdp_ram.md)
