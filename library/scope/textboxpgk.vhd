--                                                                            --
-- Author(s):                                                                 --
--   Miguel Angel Sagreras                                                    --
--                                                                            --
-- Copyright (C) 2015                                                         --
--    Miguel Angel Sagreras                                                   --
--                                                                            --
-- This source file may be used and distributed without restriction provided  --
-- that this copyright statement is not removed from the file and that any    --
-- derivative work contains  the original copyright notice and the associated --
-- disclaimer.                                                                --
--                                                                            --
-- This source file is free software; you can redistribute it and/or modify   --
-- it under the terms of the GNU General Public License as published by the   --
-- Free Software Foundation, either version 3 of the License, or (at your     --
-- option) any later version.                                                 --
--                                                                            --
-- This source is distributed in the hope that it will be useful, but WITHOUT --
-- ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or      --
-- FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for   --
-- more details at http://www.gnu.org/licenses/.                              --
--                                                                            --

use std.textio.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

library hdl4fpga;
use hdl4fpga.std.all;
use hdl4fpga.scopeiopkg.all;

package textboxpkg is

	type style_keys   is (width, alignment, text_color, background_color);
	type style_t      is array (style_keys) of natural;
	type style_vector is array (natural range <>) of style_t;

	subtype alignment_t is natural;
	constant left_alignment   : natural := 0;
	constant right_alignment  : natural := 1;
	constant center_alignment : natural := 2;

	function alignment        (constant value  : natural) return style_vector; 
	function text_color       (constant value  : natural) return style_vector; 
	function background_color (constant value  : natural) return style_vector;
	function width            (constant value  : natural) return style_vector; 


	function styles           (constant values : style_vector) return style_t;

	constant tid_end  : natural := 0;
	constant tid_text : natural := 1;
	constant tid_div  : natural := 2;

	type tag is record 
		tid     : natural;
		style   : style_t;
		id      : string(1 to 16);
		content : string(1 to 16);
	end record;

	type tag_vector is array (natural range <>) of tag;

	constant domain : string := "hola";
	function div  (constant children : tag_vector;   constant style : style_t; constant id : string := "") return tag_vector;
	function text (constant content  : string := ""; constant style : style_t; constant id : string := "") return tag_vector;

end;

package body textboxpkg is

	function strfill (
		constant s    : string;
		constant size : natural;
		constant char : character := NUL)
		return string
	is
		variable retval : string(1 to size);
		variable j      : natural;
	begin
		j := 1;
		for i in s'range loop
			retval(j) := s(i);
			j := j + 1;
		end loop;
		while j < size loop
			retval(j) := char;
		end loop;
		return retval;
	end;

	procedure strcmp (
		variable sucess : inout boolean;
		variable index  : inout natural;
		constant key    : in    string;
		constant domain : in    string)
	is
	begin
		sucess := false;
		for i in key'range loop
			if index < domain'length then
				if key(i)/=domain(index) then
					return;
				else
					index := index + 1;
				end if;
			elsif key(i)=NUL then
				sucess := true;
				return;
			else
				return;
			end if;
		end loop;
		if index < domain'length then
			if domain(index)=NUL then
				sucess := true;
				return;
			else
				return;
			end if;
		else
			sucess := true;
			return;
		end if;
	end;

	function strstr(
		constant key    : string;
		constant domain : string)
		return natural is
		variable sucess : boolean;
		variable index  : natural;
		variable ref    : natural;
	begin
		ref   := 0;
		index := domain'left;
		while index < domain'right loop
			strcmp(sucess, index, key, domain);
			if sucess then
				return ref;
			end if;
			while domain(index) /= NUL loop
				index := index + 1;
			end loop;
			index := index + 1;
		end loop;
	end;

	function strlen (
		constant str : string)
		return natural
	is
		variable retval : natural;
	begin
		retval := 0;
		for i in str'range loop
			if str(i)=NUL then
				return retval;
			end if;
			retval := retval + 1;
		end loop;
		return str'length;
	end;

	function padding_left (
		constant length : natural;
		constant width  : natural;
		constant align  : alignment_t := left_alignment)
		return integer is
	begin
		return setif(
			align=right_alignment,   width-length, setif(
			align=center_alignment, (width-length)/2, 0));
	end;

	function padding_right (
		constant length : natural;
		constant width  : natural;
		constant align  : alignment_t := left_alignment)
		return integer is
	begin
		return setif(
			align=left_alignment,    width-length, setif(
			align=center_alignment, (width-length+1)/2, 0));
	end;

	function stralign (
		constant str   : string;
		constant width : natural;
		constant align : alignment_t)
		return string
	is
		constant blank    : character := ' ';
		constant at_left  : integer := padding_left (str 'length, width, align);
		constant at_right : integer := padding_right(str 'length, width, align);
		variable retval   : string(1 to width);
	begin
		for i in 1 to at_left loop
			retval(i) := blank;
		end loop;

		for i in at_left+1 to width-at_right loop
			exit when i > width;
			if i > 0 then
				retval(i) := str (i-at_left+(str 'left-1));
			end if;
		end loop;

		for i in width-at_right+1 to width loop
			retval(i) := blank;
		end loop;

		return retval;
	end;

	function alignment (
		constant value : natural)
		return style_vector is
		variable retval : style_vector(0 to 0);
	begin
		retval(0)(alignment) := value;
		return retval;
	end;

	function background_color (
		constant value : natural)
		return style_vector is
		variable retval : style_vector(0 to 0);
	begin
		retval(0)(background_color) := value;
		return retval;
	end;

	function text_color (
		constant value : natural)
		return style_vector is
		variable retval : style_vector(0 to 0);
	begin
		retval(0)(text_color) := value;
		return retval;
	end;

	function width (
		constant value : natural)
		return style_vector is
		variable retval : style_vector(0 to 0);
	begin
		retval(0)(width) := value;
		return retval;
	end;

	function styles (
		constant values : style_vector)
		return style_t is
		variable retval : style_t;
	begin
		for i in values'reverse_range loop
			for j in style_t'range loop
				if values(i)(j)/=0 then
					retval(j) := values(i)(j);
				end if;
			end loop;
		end loop;
		return retval;
	end;

	function endtag 
		return tag is
		variable retval : tag;
	begin
		retval.tid := tid_end;
		return retval;
	end;

	function div (
		constant children : tag_vector;
		constant style    : style_t;
		constant id       : string := "")
		return tag_vector is
		variable div : tag;
	begin
		div.tid   := tid_div;
		div.style := style;
		if div.style(width)=0 then
			for i in children'range loop
				div.style(width) := div.style(width) + children(i).style(width);
			end loop;
		end if;
		return div & children & endtag;
	end;

	function textbox_data (
		constant tags : tag_vector)
		return string
	is
		variable i : natural;
		variable j : natural;
		variable retval : string(1 to 1);
	begin
		i := tags'left;
		while i <= tags'right loop
			j := i;
			while tags(j).tid/=tid_end loop
				retval := retval & stralign(
					str   => tags(j).content, 
					width => tags(j).style(width),
					align => tags(j).style(alignment));
				j := j + 1;
			end loop;
			i := j + 1;
		end loop;
		return retval;
	end;

	function text (
		constant content : string := "";
		constant style   : style_t;
		constant id      : string := "")
		return tag_vector is
		variable retval : tag_vector(0 to 0);
	begin
		retval(0).tid     := tid_text;
		retval(0).id      := strfill(id, retval(0).id'length);
		retval(0).content := strfill(content, setif(style(width)/=0, style(width), retval(0).content'length));
		return retval;
	end;

	constant layout : tag_vector := 
		div (
			style    => styles(background_color(0) & alignment(right_alignment)),
			children => 
				text(
					style   => styles(background_color(0) & width(8) & alignment(right_alignment)),
					id      => "hzoffset") &
				text(
					style   => styles(background_color(0) & width(3) & alignment(center_alignment)),
					content => ":") &
				text(
					style   => styles(background_color(0) & width(8) & alignment(right_alignment)),
					id      => "hzdiv") &
				text(
					style   => styles(background_color(0) & alignment(center_alignment)),
					content => " ") &
				text(
					style   => styles(background_color(0) & width(1) & alignment(right_alignment)),
					id      => "hzmag") &
				text(
					style   => styles(background_color(0) & alignment(center_alignment)),
					content => "s")) &
		div (
			style    => styles(background_color(0) & alignment(right_alignment)),
			children => 
				text(
					style   => styles(background_color(0) & width(1) & alignment(right_alignment)),
					id      => "tgr_freeze") &
				text(
					style   => styles(background_color(0) & width(1) & alignment(right_alignment)),
					id      => "tgr_edge") &
				text(
					style   => styles(background_color(0) & width(1) & alignment(right_alignment)),
					id      => "tgr_level") &
				text(
					style   => styles(background_color(0) & alignment(center_alignment)),
					content => " ") &
				text(
					style   => styles(background_color(0) & width(2) & alignment(right_alignment)),
					id      => "tgr_div") &
				text(
					style   => styles(background_color(0) & alignment(center_alignment)),
					content => " ") &
				text(
					style   => styles(background_color(0) & width(1) & alignment(right_alignment)),
					id      => "tgr_mag") &
				text(
					style   => styles(background_color(0) & alignment(center_alignment)),
					content => "V"));

end;
