/*
Copyright (C) 2023 Ryan Robertson <rrobertson@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

interface axil_if #(parameter DATA_WIDTH    = 32,
                    parameter ADDRESS_WIDTH = 32) (
   logic clock, 
   logic reset_n
);

  logic [ADDRESS_WIDTH-1:0]  araddr;
  logic [2:0]                arprot;
  logic                      arready;
  logic                      arvalid;
  logic [ADDRESS_WIDTH-1:0]  awaddr;
  logic [2:0]                awprot;
  logic                      awready;
  logic                      awvalid;
  logic                      bready;
  logic [1:0]                bresp;
  logic                      bvalid;
  logic [DATA_WIDTH-1:0]     rdata;
  logic                      rready;
  logic [1:0]                rresp;
  logic                      rvalid;
  logic [DATA_WIDTH-1:0]     wdata;
  logic                      wready;
  logic [(DATA_WIDTH/8)-1:0] wstrb;
  logic                      wvalid;

  modport main (
    input  clock,
    input  reset_n,
    output araddr,
    output arprot,
    input  arready,
    output arvalid,
    output awaddr,
    output awprot,
    input  awready,
    output awvalid,
    output bready,
    input  bresp,
    input  bvalid,
    input  rdata,
    output rready,
    input  rresp,
    input  rvalid,
    output wdata,
    input  wready,
    output wstrb,
    output wvalid
  );

  modport peripheral (
    input  clock,
    input  reset_n,
    input  araddr,
    input  arprot,
    output arready,
    input  arvalid,
    input  awaddr,
    input  awprot,
    output awready,
    input  awvalid,
    input  bready,
    output bresp,
    output bvalid,
    output rdata,
    input  rready,
    output rresp,
    output rvalid,
    input  wdata,
    output wready,
    input  wstrb,
    input  wvalid
  );

endinterface