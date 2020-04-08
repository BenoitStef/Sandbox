<img align="right" src="../psi_logo.png">

***
# psi\_common\_tdp\_ram\_be

- VHDL source: [psi_common_tdp_ram_be.vhd](../../hdl/psi_common_tdp_ram_be.vhd)
- Testbench: [psi_common_tdp_ram_be_tb.vhd](../../testbench/psi_common_tdp_ram_be_tb/psi_common_tdp_ram_be_tb.vhd)

### Description

Same as [3.3](ch3_3_tdp_ram.md) psi\_common\_tdp\_ram but with byte-enables. A byte is only
written if *WrX* is set and the corresponding *BeX* bit is set too.

### Generics

Generics        | Description
----------------|--------------------
**Depth\_g**    | Depth of the memory
**Width\_g**    | Width of the memory, must be a multiple of 8
**Behavior\_g** | **"RBW"** Read-before-write implementation, **"WBR"** Write-before-read implementation

### Interfaces

Signal                  |Direction   |Width                 |Description
----------------------- |----------- |----------------------|-----------------------------------
Clk                     |Input       |1                     |Clock
ClkA                    |Input       |1                     |Port A clock
BeA                     |Input       |Width\_g/8            |Port A byte enables
AddrA                   |Input       |ceil(log2(Depth\_g))  |Port A address
WrA                     |Input       |1                     |Port A write enable (active high)
DinA                    |Input       |Width\_g              |Port A write data
DoutA                   |Output      |Width\_g              |Port A read data
ClkB                    |Input       |1                     |Port B clock
BeB                     |Input       |Width\_g/8            |Port B byte enables
AddrB                   |Input       |ceil(log2(Depth\_g))  |Port B address
WrB                     |Input       |1                     |Port B write enable (active high)
DinB                    |Input       |Width\_g              |Port B write data
DoutB                   |Output      |Width\_g              |Port B read data

### Constraints

Same as [3.3](ch3_3_tdp_ram.md) psi\_common\_tdp\_ram

***

Back: [index](../psi_common_index.md) **|** Next: [Fifos | Async fifo](../ch4_fifos/ch4_1_async_fifo.md)