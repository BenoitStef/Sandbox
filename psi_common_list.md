<img align="right" src="doc/psi_logo.png">

***

### Memory components

Component available                     | Source                                                      | Description
----------------------------------------|-------------------------------------------------------------|:-------------------------------------------:
Simple dual port RAM 										| [psi_common_sdp_ram.vhd](hdl/psi_common_sdp_ram.vhd)	 		 	| [link](doc/ch3_memories/ch3_1_sdp_ram.md)  
Simple dual port RAM with byte enable  	| [psi_common_sp_ram_be.vhd](hdl/psi_common_sp_ram_be.vhd)    | [link](doc/ch3_memories/ch3_2_sp_ram_be.md)  
True Dual port RAM  										| [psi_common_tdp_ram.vhd](hdl/psi_common_tdp_ram.vhd)	  		| [link](doc/ch3_memories/ch3_3_tdp_ram.md)    
True dual port RAM with byte enable  		| [psi_common_tdp_ram_be.vhd](hdl/psi_common_tdp_ram_be.vhd)	| [link](doc/ch3_memories/ch3_4_tdp_ram_be.md)    

### FIFO components
Component available     | Source                                                      | Description
------------------------|-------------------------------------------------------------|:-------------------------------------------:
Asynchronous FIFO 			| [psi_common_async_fifo.vhd](hdl/psi_common_async_fifo.vhd)	| [link](doc/ch4_fifos/ch4_1_async_fifo.md)  
Synchronous FIFO  			| [psi_common_sync_fifo.vhd](hdl/psi_common_sync_fifo.vhd)    | [link](doc/ch4_fifos/ch4_2sync_fifo.md)    


### Clock domain crossing (CDC) components
Component available     | Source                                                      | Description
------------------------|-------------------------------------------------------------|:-------------------------------------------:
pulse clock crossing  (async pulse/vld trasnfer)	| [psi_common_pulse_cc.vhd](hdl/psi_common_pulse_cc.vhd)   	  | [link](doc/ch5_cc/ch5_1_pulse_cc.md)   
simple clock crossing (async data value transfer) | [psi_common_pulse_cc.vhd](hdl/psi_common_simple_cc.vhd)   	  | [link](doc/ch5_cc/ch5_2_simple_cc.md)    
  |   |  
### Packages

Package available   | 									Source                                    | Description
--------------------|-------------------------------------------------------------|:----------------------------------------:
Math  							| [psi_common_math_pkg.vhd](hdl/psi_common_math_pkg.vhd)	 		| [link](doc/ch2_packages/ch2_packages.md)  
array 							| [psi_common_array_pkg.vhd](hdl/psi_common_array_pkg.vhd)    | [link](doc/ch2_packages/ch2_packages.md)  
logic								| [psi_common_logic_pkg.vhd](hdl/psi_common_logic_pkg.vhd)	  | [link](doc/ch2_packages/ch2_packages.md)     
axi 							  | [psi_common_axi_pkg.vhd](hdl/psi_common_axi_pkg.vhd)				| [link](doc/ch2_packages/ch2_packages.md)
