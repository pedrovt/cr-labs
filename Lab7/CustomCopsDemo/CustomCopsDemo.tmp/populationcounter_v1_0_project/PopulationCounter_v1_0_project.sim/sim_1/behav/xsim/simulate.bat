@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu May 14 11:42:06 +0100 2020
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim PopulationCountTb_behav -key {Behavioral:sim_1:Functional:PopulationCountTb} -tclbatch PopulationCountTb.tcl -log simulate.log"
call xsim  PopulationCountTb_behav -key {Behavioral:sim_1:Functional:PopulationCountTb} -tclbatch PopulationCountTb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
