# 
# Synthesis run script generated by Vivado
# 

namespace eval rt {
    variable rc
}
set rt::rc [catch {
  uplevel #0 {
    set ::env(BUILTIN_SYNTH) true
    source $::env(HRT_TCL_PATH)/rtSynthPrep.tcl
    rt::HARTNDb_resetJobStats
    rt::HARTNDb_startJobStats
    set rt::cmdEcho 0
    rt::set_parameter writeXmsg true
    set ::env(RT_TMP) "Y:/project/zynq_ip_repo/alinx/ov5640_ip/alinx_ov5640.runs/cmos_in_buf_synth_1/.Xil/Vivado-8292-/realtime/tmp"
    if { [ info exists ::env(RT_TMP) ] } {
      file delete -force $::env(RT_TMP)
      file mkdir $::env(RT_TMP)
    }

    rt::delete_design

    set rt::partid xc7z020clg400-2

    set rt::multiChipSynthesisFlow false
    source $::env(SYNTH_COMMON)/common_vhdl.tcl
    set rt::defaultWorkLibName xil_defaultlib

    set rt::useElabCache false
    if {$rt::useElabCache == false} {
      rt::read_vhdl -lib blk_mem_gen_v8_3_1 {
      y:/project/zynq_ip_repo/alinx/ov5640_ip/alinx_ov5640.srcs/sources_1/ip/cmos_in_buf/blk_mem_gen_v8_3_1/hdl/blk_mem_gen_v8_3_vhsyn_rfs.vhd
      y:/project/zynq_ip_repo/alinx/ov5640_ip/alinx_ov5640.srcs/sources_1/ip/cmos_in_buf/blk_mem_gen_v8_3_1/hdl/blk_mem_gen_v8_3.vhd
    }
      rt::read_vhdl -lib fifo_generator_v13_0_1 {
      y:/project/zynq_ip_repo/alinx/ov5640_ip/alinx_ov5640.srcs/sources_1/ip/cmos_in_buf/fifo_generator_v13_0_1/hdl/fifo_generator_v13_0_vhsyn_rfs.vhd
      y:/project/zynq_ip_repo/alinx/ov5640_ip/alinx_ov5640.srcs/sources_1/ip/cmos_in_buf/fifo_generator_v13_0_1/hdl/fifo_generator_v13_0.vhd
    }
      rt::read_vhdl -lib xil_defaultlib y:/project/zynq_ip_repo/alinx/ov5640_ip/alinx_ov5640.srcs/sources_1/ip/cmos_in_buf/synth/cmos_in_buf.vhd
      rt::filesetChecksum
    }
    rt::set_parameter usePostFindUniquification false
    set rt::top cmos_in_buf
    set rt::reportTiming false
    rt::set_parameter elaborateOnly true
    rt::set_parameter elaborateRtl true
    rt::set_parameter eliminateRedundantBitOperator false
    rt::set_parameter writeBlackboxInterface true
    rt::set_parameter merge_flipflops true
    rt::set_parameter srlDepthThreshold 3
    rt::set_parameter rstSrlDepthThreshold 4
    rt::set_parameter webTalkPath {}
    rt::set_parameter enableSplitFlowPath "Y:/project/zynq_ip_repo/alinx/ov5640_ip/alinx_ov5640.runs/cmos_in_buf_synth_1/.Xil/Vivado-8292-/"
    set ok_to_delete_rt_tmp true 
    if { [rt::get_parameter parallelDebug] } { 
       set ok_to_delete_rt_tmp false 
    } 
    if {$rt::useElabCache == false} {
      rt::run_rtlelab -module $rt::top
    }

    set rt::flowresult [ source $::env(SYNTH_COMMON)/flow.tcl ]
    rt::HARTNDb_stopJobStats
    if { $rt::flowresult == 1 } { return -code error }

    if { [ info exists ::env(RT_TMP) ] } {
      if { [info exists ok_to_delete_rt_tmp] && $ok_to_delete_rt_tmp } { 
        file delete -force $::env(RT_TMP)
      }
    }


    source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  } ; #end uplevel
} rt::result]

if { $rt::rc } {
  $rt::db resetHdlParse
  if { [info exists rt::helper_shm_key] && [info exists ::env(BUILTIN_SYNTH)] && [rt::get_parameter enableParallelHelperSpawn] && [info exists rt::doParallel] && $rt::doParallel} { 
     $rt::db killSynthHelper $rt::helper_shm_key
  } 
  source $::env(HRT_TCL_PATH)/rtSynthCleanup.tcl
  return -code "error" $rt::result
}
