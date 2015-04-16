source ../../scripts/adi_env.tcl
source $ad_hdl_dir/projects/scripts/adi_project.tcl

adi_project_create fmcomms1_i2c_zed
adi_project_files fmcomms1_i2c_zed [list \
  "system_top.v" \
  "$ad_hdl_dir/projects/fmcomms1/zed/system_constr.xdc"\
  "$ad_hdl_dir/library/common/ad_iobuf.v" \
  "$ad_hdl_dir/projects/common/zed/zed_system_constr.xdc" \
  "df_constraints.xdc" ]

adi_project_run fmcomms1_i2c_zed

