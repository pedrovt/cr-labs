@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu Feb 20 10:03:56 +0000 2020
REM SW Build 2708876 on Wed Nov  6 21:40:23 MST 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
echo "xelab -wto 2b0a3bd644ab4c1abb15d5b1d5943356 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot BinUDCntEnRst4Tb_behav xil_defaultlib.BinUDCntEnRst4Tb -log elaborate.log"
call xelab  -wto 2b0a3bd644ab4c1abb15d5b1d5943356 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot BinUDCntEnRst4Tb_behav xil_defaultlib.BinUDCntEnRst4Tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
