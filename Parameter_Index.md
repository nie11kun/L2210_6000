#

|变量名|变量含义|备注
|:----:|:----:|:----:|
|**PLC_NC交换变量**|
|$A_DBB[0]|DB4900.DBX0.0|  $A_IN[11]-840Dsl
|**R参数**||
|R0|程序启动中标记(正常结束为0，启动中为1)|界面参数
|R2|起始加工槽
|R4|加工模式(1:试切单槽/2:整体加工)|界面参数
|R5|当前加工工序号|界面参数
|R7|当前加工槽|界面参数
|R8|最终加工工序号，读取R240|界面参数
|R10|终止磨削槽号|界面参数
|R11|槽总数赋值|界面参数
|R13|主程序-Y轴补偿
|R14|主程序-C轴补偿-加工位
|R20|Y轴补偿|界面参数
|R21|Z轴补偿|界面参数
|R22|A轴补偿|界面参数
|R23|C轴补偿|界面参数
|R29|Z轴磨削起始位置-最终补偿后的位置
|R30|当前齿-A轴磨削角度
|R40|SET_CONSTANTS-Y轴补偿
|R41|SET_CONSTANTS-Z轴补偿
|R50|工序1-X轴磨削起始位|界面参数
|R51|工序1-X轴磨削终止位|界面参数
|R52|工序1-X轴磨削变速位|界面参数
|R60|工序2-X轴磨削起始位|界面参数
|R61|工序2-X轴磨削终止位|界面参数
|R62|工序2-X轴磨削变速位|界面参数
|R63|工序3-X轴磨削起始位|界面参数
|R64|工序3-X轴磨削终止位|界面参数
|R65|工序3-X轴磨削变速位|界面参数
|R70|当前刀库-Y磨削位置
|R71|刀库1-Y磨削位置
|R72|刀库2-Y磨削位置
|R221|工序一调用刀库号|界面参数
|R222|工序二调用刀库号|界面参数
|R223|工序三调用刀库号|界面参数
|R240|工序一有效：1，工序二有效：2，工序三有效：3
|R331|转台号
|R351|当前工序调用刀库号
|R461|工件直径355-Y轴补偿-给R40
|R462|工件直径455-Y轴补偿-给R40
|R463|工件直径800-Y轴补偿-给R40
|R471|工件直径355-Z轴补偿-给R41
|R472|工件直径455-Z轴补偿-给R41
|R473|工件直径800-Z轴补偿-给R41
|**MGUD**||
|X_POS_TOOL_START[1]|工序1-X轴磨削起始位
|X_POS_TOOL_START[2]|工序1-X轴磨削起始位
|X_POS_TOOL_START[3]|工序3-X轴磨削起始位
|X_POS_TOOL_END[1]|工序1-X轴磨削终止位
|X_POS_TOOL_END[2]|工序2-X轴磨削终止位
|X_POS_TOOL_END[3]|工序3-X轴磨削终止位
|X_POS_SPEED_CHANGE[1]|工序1-X轴变速位
|X_POS_SPEED_CHANGE[2]|工序2-X轴变速位
|X_POS_SPEED_CHANGE[3]|工序3-X轴变速位
|RETURN_SPEED[1]|X轴回到回到初始位速度
|SPEED_ROUGHING[1]|工序1-X轴粗磨速度   
|SPEED_ROUGHING[2]|工序2-X轴粗磨速度   
|SPEED_ROUGHING[3]|工序3-X轴粗磨速度   
|SPEED_FINISHING[1]|工序1-X轴精磨速度
|SPEED_FINISHING[2]|工序2-X轴精磨速度
|SPEED_FINISHING[3]|工序3-X轴精磨速度
|Z_POS[1]|工序1-Z轴磨削位
|Z_POS[2]|工序2-Z轴磨削位
|Z_POS[3]|工序3-Z轴磨削位
|CASSETTE[1]|工序1-调用刀库号
|CASSETTE[2]|工序2-调用刀库号
|CASSETTE[3]|工序3-调用刀库号
|Z_POS_RETURN_X_AXE|Z轴安全距离
|A_POS|
|NUMBER_OF_SLOTS|齿槽数
|MESSAGE_TEXT|界面提示信息
||
|INI[0]|界面补偿参数限制值-Y(默认0表示限制为正负1)
|INI[1]|界面补偿参数限制值-Z(默认0表示限制为正负1)
|INI[2]|界面补偿参数限制值-A(默认0表示限制为正负1)
|INI[3]|界面补偿参数限制值-C(默认0表示限制为正负1)
