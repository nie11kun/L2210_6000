;**********************MASK1:磨削参数_外:panel_1:;**********************
//M(Mask1/$85101//)

	DEF MSG_1=(I///$85102,$85102,,/WR1///80,10,150/0,0,0/);MESSAGE

	DEF VAR0=(I/0,2//$85103,$85103,,/WR2,,al1//"$R[221]"/10,40,110/120,40,80/);第1工序刀库号
	DEF VAR1=(I/0,2//$85104,$85104,,/WR2,,al1//"$R[222]"/10,60,110/120,60,80/);第2工序刀库号
	DEF VAR2=(I/1,2//$85105,$85105,,/WR2,,al1//"$R[4]"/10,90,170/180,90,80/);试切，加工

	DEF VAR3=(R///$85107,$85107,,/WR2,,al1//"$R[50]"/10,150,170/180,150,80/);工序1 x 起始位
	DEF VAR4=(R///$85108,$85108,,/WR2,,al1//"$R[51]"/10,170,170/180,170,80/);工序1 x 终止位
	DEF VAR5=(R///$85109,$85109,,/WR2,,al1//"$R[52]"/10,190,170/180,190,80/);工序1 x 变速位
	DEF VAR6=(R///$85110,$85110,,/WR2,,al1//"$R[60]"/10,220,170/180,220,80/);工序2 x 起始位
	DEF VAR7=(R///$85111,$85111,,/WR2,,al1//"$R[61]"/10,240,170/180,240,80/);工序2 x 终止位
	DEF VAR8=(R///$85112,$85112,,/WR2,,al1//"$R[62]"/10,260,170/180,260,80/);工序2 x 变速位

	DEF MSG_2=(I///$85114,$85114,,/WR1///350,10,150/0,0,0/);MESSAGE

	DEF VAR10=(I/0,1//$85115,$85115,,/WR2,,al1//"$R[0]"/260,40,210/470,40,80/);重新加工/继续加工标记
	DEF VAR11=(I/1,2//$85116,$85116,,/WR2,,al1//"$R[5]"/280,70,190/470,70,80/);起始加工工序
	DEF VAR12=(I/1,//$85117,$85117,,/WR2,,al1//"$R[7]"/300,100,170/470,100,80/);起始加工槽
	DEF VAR13=(I/1,2//$85118,$85118,,/WR2,,al1//"$R[8]"/300,120,170/470,120,80/);最终加工工序号
	DEF VAR14=(I/1,//$85119,$85119,,/WR2,,al1//"$R[10]"/300,150,170/470,150,80/);最终加工槽
	DEF VAR15=(I/1,//$85120,$85120,,/WR2,,al1//"$R[11]"/280,170,190/470,170,80/);总槽数

	DEF VAR16=(R/-1,1//$85122,$85122,,/WR2,,al1//"$R[20]"/300,210,170/470,210,80/);Y补偿
	DEF VAR17=(R/-1,1//$85123,$85123,,/WR2,,al1//"$R[21]"/300,230,170/470,230,80/);z补偿
	DEF VAR18=(R/-1,1//$85124,$85124,,/WR2,,al1//"$R[22]"/300,250,170/470,250,80/);A补偿
	DEF VAR19=(R/-1,1//$85125,$85125,,/WR2,,al1//"$R[23]"/300,270,170/470,270,80/);C补偿

	DEF VAR23=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_TOOL_START[2]"/0,0,0/0,0,0/);工序1 x 起始位
	DEF VAR24=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_TOOL_END[2]"/0,0,0/0,0,0/);工序1 x 终止位
	DEF VAR25=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_SPEED_CHANGE[2]"/0,0,0/0,0,0/);工序1 x 变速位
	DEF VAR26=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_TOOL_START[3]"/0,0,0/0,0,0/);工序2 x 起始位
	DEF VAR27=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_TOOL_END[3]"/0,0,0/0,0,0/);工序2 x 终止位
	DEF VAR28=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_SPEED_CHANGE[3]"/0,0,0/0,0,0/);工序2 x 变速位

	HS1=($85100,ac7,se3);磨削参数
	HS8=($85073,ac7,se1);返回

	VS1=("")

	PRESS(HS1)
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	CHANGE(VAR3)
		IF VAR23.VAL<>VAR3.VAL
			VAR23.VAL=VAR3.VAL
		ENDIF
	END_CHANGE
	CHANGE(VAR4)
		IF VAR24.VAL<>VAR4.VAL
			VAR24.VAL=VAR4.VAL
		ENDIF
	END_CHANGE
	CHANGE(VAR5)
		IF VAR25.VAL<>VAR5.VAL
			VAR25.VAL=VAR5.VAL
		ENDIF
	END_CHANGE
	CHANGE(VAR6)
		IF VAR26.VAL<>VAR6.VAL
			VAR26.VAL=VAR6.VAL
		ENDIF
	END_CHANGE
	CHANGE(VAR7)
		IF VAR27.VAL<>VAR7.VAL
			VAR27.VAL=VAR7.VAL
		ENDIF
	END_CHANGE
	CHANGE(VAR8)
		IF VAR28.VAL<>VAR8.VAL
			VAR28.VAL=VAR8.VAL
		ENDIF
	END_CHANGE

//END