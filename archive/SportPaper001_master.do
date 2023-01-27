**********************
* 综述
* 这个脚本为论文生成表格和数字.
* "我的项目"(作者:zzq)
* 所有的原始数据都存储在/data中
* 所有的表格都输出到/results/tables中
* 所有的数字都输出到/results/figures中.
*
* 软件要求
*分析在Windows上运行,使用Stata 17版本和R-3.6.0
*
*要执行一个干净的运行,请删除以下两个文件夹.
* /processed
* /results
**********************

* 用户必须定义这个全局宏,指向包括这个run.do脚本的文件夹路径
global MyProject "/Users/zhouzhengqing/Desktop/SportPaper001"
* 要禁用分析的R部分,请将以下标志设置为1

global DisableR = 0

* Confirm that the global for the project root directory was defined
assert !missing("$MyProject")

* Initialize log
clear
set more off
cap mkdir "$MyProject/scripts/logs"
cap log close
local datetime : di %tcCCYY.NN.DD!-HH.MM.SS `=clock("$S_DATE $S_TIME", "DMYhms")'
local logfile "$MyProject/scripts/logs/`datetime'.log.txt"
log using "`logfile'", text

* 配置Stata的图书馆环境和记录系统参数
run "$MyProject/scripts/programs/_config.do"

* R包可以手动安装(见README),也可以通过取消注释以下一行自动安装
* 如果"$DisableR"!="1" rscript使用"$MyProject/scripts/programs/_install_R_packages.R"
* Stata和R的版本控制

version 17
if "$DisableR"!="1" rscript, rversion(4.2.0) require(tidyverse estimatr)

* Create directories for output files
cap mkdir "$MyProject/processed"
cap mkdir "$MyProject/results"
cap mkdir "$MyProject/results/figures"
cap mkdir "$MyProject/results/intermediate"
cap mkdir "$MyProject/results/tables"

* Run project analysis
do "$MyProject/scripts/1_process_raw_data.do"
do "$MyProject/scripts/2_clean_data.do"
do "$MyProject/scripts/3_regressions.do"
do "$MyProject/scripts/4_make_tables_figures.do"

* End log
di "End date and time: $S_DATE $S_TIME"
log close

** EOF
