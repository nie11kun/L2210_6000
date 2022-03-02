;**********************MASK1:磨削参数_外:panel_1:;**********************
//M(Mask1/$85101//)

	DEF MSG_1=(I///$85102,$85102,,/WR1///80,10,150/0,0,0/);MESSAGE

	DEF VAR0=(I/0,2//$85103,$85103,,/WR3,,al1//"$R[221]"/10,40,110/120,40,80/,4);第1工序刀库号
	DEF VAR1=(I/0,2//$85104,$85104,,/WR3,,al1//"$R[222]"/10,60,110/120,60,80/,4);第2工序刀库号

	DEF MSG_3=(I///$85105,$85105,,/WR1,,al1///10,90,230/0,0,0/);MESSAGE
	DEF VAR2=(I/1,2//$85105,$85105,,/WR3,,al1//"$R[4]"/0,0,0/120,110,80/,4);试切，加工

	DEF VAR3=(R///$85107,$85107,,/WR3,,al1//"$R[50]"/0,150,180/180,150,80/,4);工序1 x 起始位
	DEF VAR4=(R///$85108,$85108,,/WR3,,al1//"$R[51]"/0,170,180/180,170,80/,4);工序1 x 终止位
	DEF VAR5=(R///$85109,$85109,,/WR3,,al1//"$R[52]"/0,190,180/180,190,80/,4);工序1 x 变速位
	DEF VAR6=(R///$85110,$85110,,/WR3,,al1//"$R[60]"/0,220,180/180,220,80/,4);工序2 x 起始位
	DEF VAR7=(R///$85111,$85111,,/WR3,,al1//"$R[61]"/0,240,180/180,240,80/,4);工序2 x 终止位
	DEF VAR8=(R///$85112,$85112,,/WR3,,al1//"$R[62]"/0,260,180/180,260,80/,4);工序2 x 变速位

	DEF MSG_2=(I///$85114,$85114,,/WR1///370,10,150/0,0,0/);MESSAGE

	DEF VAR10=(I/0,1//$85115,$85115,,/WR3,,al1//"$R[0]"/260,40,210/470,40,80/,4);重新加工/继续加工标记
	DEF VAR11=(I/1,2//$85116,$85116,,/WR3,,al1//"$R[5]"/280,70,190/470,70,80/,4);起始加工工序
	DEF VAR13=(I/1,2//$85118,$85118,,/WR3,,al1//"$R[8]"/300,90,170/470,90,80/,4);最终加工工序号
	DEF VAR12=(I/1,//$85117,$85117,,/WR3,,al1//"$R[7]"/300,130,170/470,130,80/,4);起始加工槽
	DEF VAR14=(I/1,//$85119,$85119,,/WR3,,al1//"$R[10]"/300,150,170/470,150,80/,4);最终加工槽
	DEF VAR15=(I/1,//$85120,$85120,,/WR3,,al1//"$R[11]"/280,170,190/470,170,80/,4);总槽数

	DEF VAR16=(R///$85122,$85122,,/WR3,,al1//"$R[20]"/300,210,170/470,210,80/,4);Y补偿
	DEF VAR17=(R///$85123,$85123,,/WR3,,al1//"$R[21]"/300,230,170/470,230,80/,4);z补偿
	DEF VAR18=(R///$85124,$85124,,/WR3,,al1//"$R[22]"/300,250,170/470,250,80/,4);A补偿
	DEF VAR19=(R///$85125,$85125,,/WR3,,al1//"$R[23]"/300,270,170/470,270,80/,4);C补偿

	DEF VAR23=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_TOOL_START[2]"/0,0,0/0,0,0/);工序1 x 起始位
	DEF VAR24=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_TOOL_END[2]"/0,0,0/0,0,0/);工序1 x 终止位
	DEF VAR25=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_SPEED_CHANGE[2]"/0,0,0/0,0,0/);工序1 x 变速位
	DEF VAR26=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_TOOL_START[3]"/0,0,0/0,0,0/);工序2 x 起始位
	DEF VAR27=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_TOOL_END[3]"/0,0,0/0,0,0/);工序2 x 终止位
	DEF VAR28=(R////WR4//"/NC/_N_NC_GD2_ACX/X_POS_SPEED_CHANGE[3]"/0,0,0/0,0,0/);工序2 x 变速位

	DEF CHANGE_STATUS=(I//0//WR4///0,0,0/0,0,0/);参数修改状态

	DEF LIMIT_Y=(R////WR4//"/NC/_N_NC_GD2_ACX/INI[1]"/0,0,0/0,0,0);界面补偿参数限制值-Y
	DEF LIMIT_Z=(R////WR4//"/NC/_N_NC_GD2_ACX/INI[2]"/0,0,0/0,0,0);界面补偿参数限制值-Z
	DEF LIMIT_A=(R////WR4//"/NC/_N_NC_GD2_ACX/INI[3]"/0,0,0/0,0,0);界面补偿参数限制值-A
	DEF LIMIT_C=(R////WR4//"/NC/_N_NC_GD2_ACX/INI[4]"/0,0,0/0,0,0);界面补偿参数限制值-C

	HS1=($85100,ac7,se3);磨削参数
	HS8=($85073,ac7,se1);返回

	VS6=($85127,ac7,se1);参数修改

	LOAD
		IF LIMIT_Y.VAL>0;定义限制-Y
			VAR16.MAX=LIMIT_Y.VAL
			VAR16.MIN=-LIMIT_Y.VAL
		ELSE;默认限制
			VAR16.MAX=1
			VAR16.MIN=-1
		ENDIF
		IF LIMIT_Z.VAL>0;定义限制-Z
			VAR17.MAX=LIMIT_Z.VAL
			VAR17.MIN=-LIMIT_Z.VAL
		ELSE;默认限制
			VAR17.MAX=1
			VAR17.MIN=-1
		ENDIF
		IF LIMIT_A.VAL>0;定义限制-A
			VAR18.MAX=LIMIT_A.VAL
			VAR18.MIN=-LIMIT_A.VAL
		ELSE;默认限制
			VAR18.MAX=1
			VAR18.MIN=-1
		ENDIF
		IF LIMIT_C.VAL>0;定义限制-C
			VAR19.MAX=LIMIT_C.VAL
			VAR19.MIN=-LIMIT_C.VAL
		ELSE;默认限制
			VAR19.MAX=1
			VAR19.MIN=-1
		ENDIF
	END_LOAD

	PRESS(HS1)
		LM("MASK1","a_grind.com")
	END_PRESS

	PRESS(HS8)
		EXIT
	END_PRESS

	PRESS(VS6)
		IF CHANGE_STATUS.VAL==0
			CHANGE_STATUS.VAL=1
			VS6.ST=$85128
			VS6.SE=3
			VAR0.WR=2
			VAR1.WR=2
			VAR2.WR=2
			VAR3.WR=2
			VAR4.WR=2
			VAR5.WR=2
			VAR6.WR=2
			VAR7.WR=2
			VAR8.WR=2
			VAR10.WR=2
			VAR11.WR=2
			VAR12.WR=2
			VAR13.WR=2
			VAR14.WR=2
			VAR15.WR=2
			VAR16.WR=2
			VAR17.WR=2
			VAR18.WR=2
			VAR19.WR=2
		ELSE
			CHANGE_STATUS.VAL=0
			VS6.ST=$85127
			VS6.SE=1
			VAR0.WR=3
			VAR1.WR=3
			VAR2.WR=3
			VAR3.WR=3
			VAR4.WR=3
			VAR5.WR=3
			VAR6.WR=3
			VAR7.WR=3
			VAR8.WR=3
			VAR10.WR=3
			VAR11.WR=3
			VAR12.WR=3
			VAR13.WR=3
			VAR14.WR=3
			VAR15.WR=3
			VAR16.WR=3
			VAR17.WR=3
			VAR18.WR=3
			VAR19.WR=3
		ENDIF
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
