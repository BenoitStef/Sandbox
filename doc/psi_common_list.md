<img align="right" src="psi_logo.png">

***

### Memory components

Component available                     | Source                                                      | Description
----------------------------------------|-------------------------------------------------------------|:-------------------------------------------:
Simple dual port RAM 										| [psi_common_sdp_ram.vhd](../hdl/psi_common_sdp_ram.vhd)	 		 	| [link](ch3_memories/ch3_1_sdp_ram.md)  
Simple dual port RAM with byte enable  	| [psi_common_sp_ram_be.vhd](../hdl/psi_common_sp_ram_be.vhd)    | [link](ch3_memories/ch3_2_sp_ram_be.md)  
True Dual port RAM  										| [psi_common_tdp_ram.vhd](../hdl/psi_common_tdp_ram.vhd)	  		| [link](ch3_memories/ch3_3_tdp_ram.md)    
True dual port RAM with byte enable  		| [psi_common_tdp_ram_be.vhd](../hdl/psi_common_tdp_ram_be.vhd)	| [link](ch3_memories/ch3_4_tdp_ram_be.md)    

### FIFO components
Component available     | Source                                                      | Description
------------------------|-------------------------------------------------------------|:-------------------------------------------:
Asynchronous FIFO 			| [psi_common_async_fifo.vhd](../hdl/psi_common_async_fifo.vhd)	| [link](ch4_fifos/ch4_1_async_fifo.md)  
Synchronous FIFO  			| [psi_common_sync_fifo.vhd](../hdl/psi_common_sync_fifo.vhd)    | [link](ch4_fifos/ch4_2_sync_fifo.md)    


### Clock domain crossing (CDC) components
Component available     | Source                                                      | Description
------------------------|-------------------------------------------------------------|:-------------------------------------------:
Pulse clock crossing  (asynchronous pulse/vld transfer)	| [psi_common_pulse_cc.vhd](../hdl/psi_common_pulse_cc.vhd)   	  | [link](ch5_cc/ch5_1_pulse_cc.md)   
Simple clock crossing (asynchronous data value transfer) | [psi_common_pulse_cc.vhd](../hdl/psi_common_simple_cc.vhd)   	  | [link](ch5_cc/ch5_2_simple_cc.md)    
Status clock crossing (asynchronous slow changing value transfer) | [psi_common_status_cc.vhd](../hdl/psi_common_status_cc.vhd) | [link](ch5_cc/ch5_3_status_cc.md)  
Synchronous CDC with AXI-S handshaking from **Lower** clock to **Higher** multiple integer clock frequency  | [psi_common_sync_cc_n2xn.vhd](../hdl/psi_common_sync_cc_n2xn.vhd)  |  [link](ch5_cc/ch5_4_sync_cc_n2xn.md)  
Synchronous CDC with AXI-S handshaking from **Higher** clock to **lower** multiple integer clock frequency  | [psi_common_sync_cc_xn2n.vhd](../hdl/psi_common_sync_cc_xn2n.vhd)   |  [link](ch5_cc/ch5_5_sync_cc_xn2n.md)  
Bit CDC  | [psi_common_bit_cc.vhd](../../hdl/psi_common_bit_cc.vhd)   | [link](ch5_cc/ch5_6_bit_cc.md)  

##### Other components that can be used as cdc
- [psi_common_tdp_ram](ch3_memories/ch3_3_tdp_ram.md)
- [psi_common_async_fifo](ch4_fifos/ch4_1_async_fifo.md)

### Conversions components
Component available     | Source                                                      | Description
------------------------|-------------------------------------------------------------|:-------------------------------------------:
Data width conversion from a N-bits to a multiple N-bits 		| [psi_common_wconv_n2xn.vhd](../hdl/psi_common_wconv_n2xn.vhd)	| [link](ch7_conversions/ch7_2_wconv_n2xn.md)  
Data width conversion from a multiple N-bits to a N-bits  	| [psi_common_wconv_x2nn.vhd](../hdl/psi_common_wconv_xn2n.vhd)    | [link](ch7_conversions/ch7_2_wconv_xn2n.md)

### Time Division Multiplexing (TDM) data Handling components
Component available     | Source                                                      | Description
------------------------|-------------------------------------------------------------|:-------------------------------------------:
TDM data to parallel  	| [psi_common_tdm_par.vhd](../hdl/psi_common_tdm_par.vhd)   			|  [link](ch8_tdm_handling/ch8_2_tdm_par.md)
Parallel to TDM data  	| [psi_common_par_tdm.vhd](../hdl/psi_common_par_tdm.vhd)  				|  [link](ch8_tdm_handling/ch8_1_par.md)
TDM data to Parallel with configurable valid output channel number  |   [psi_common_tdm_par_cfg.vhd](../hdl/psi_common_tdm_par_cfg.vhd)  				|  [link](ch8_tdm_handling/ch8_3_tdm_par_cfg.md)  
TDM data multiplexer  | [psi_common_tdm_mux.vhd](../hdl/psi_common_tdm_mux.vhd)  | [link](ch8_tdm_handling/ch8_4_tdm_mux.md)  

### Arbiters
Package available   | 									Source                                    | Description
--------------------|-------------------------------------------------------------|:----------------------------------------:
Priority  | [psi_common_arb_priority.vhd](../hdl/psi_common_arb_priority.vhd)   | [link](ch9_arbiters/ch9_1_arb_priority.md)  
Round robin  | [psi_common_arb_round_robin.vhd](../hdl/psi_common_arb_round_robin.vhd)   | [link](ch9_arbiters/ch9_2_arb_round_robin.md)  

### Packages

Package available   | 									Source                                    | Description
--------------------|-------------------------------------------------------------|:----------------------------------------:
Math  							| [psi_common_math_pkg.vhd](../hdl/psi_common_math_pkg.vhd)	 	| [link](ch2_packages/ch2_packages.md)  
array 							| [psi_common_array_pkg.vhd](../hdl/psi_common_array_pkg.vhd) | [link](ch2_packages/ch2_packages.md)  
logic								| [psi_common_logic_pkg.vhd](../hdl/psi_common_logic_pkg.vhd)	| [link](ch2_packages/ch2_packages.md)     
axi 							  | [psi_common_axi_pkg.vhd](../hdl/psi_common_axi_pkg.vhd)			| [link](ch2_packages/ch2_packages.md)
