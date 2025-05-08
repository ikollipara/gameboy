# Gameboy Justfile
# Ian Kollipara <ian.kollipara@gmail.com>
# 2025-05-07
#
# Command Runner for Gameboy Project

cc := "iverilog"
ccflags := ""

default:
	@just --list

check file:
	{{cc}} -tnull {{file}} 
