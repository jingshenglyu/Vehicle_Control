  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 4;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (kw11hncegb)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% kw11hncegb.a
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 4;
      section.data(4)  = dumData; %prealloc
      
	  ;% kw11hncegb.Blauer_Pfeil
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
	  ;% kw11hncegb.FD_green
	  section.data(2).logicalSrcIdx = 2;
	  section.data(2).dtTransOffset = 192;
	
	  ;% kw11hncegb.OE_green
	  section.data(3).logicalSrcIdx = 3;
	  section.data(3).dtTransOffset = 384;
	
	  ;% kw11hncegb.SC_blue
	  section.data(4).logicalSrcIdx = 4;
	  section.data(4).dtTransOffset = 576;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 22;
      section.data(22)  = dumData; %prealloc
      
	  ;% kw11hncegb.Gain2_Gain
	  section.data(1).logicalSrcIdx = 5;
	  section.data(1).dtTransOffset = 0;
	
	  ;% kw11hncegb.Gain1_Gain
	  section.data(2).logicalSrcIdx = 6;
	  section.data(2).dtTransOffset = 1;
	
	  ;% kw11hncegb.Gain_Gain
	  section.data(3).logicalSrcIdx = 7;
	  section.data(3).dtTransOffset = 2;
	
	  ;% kw11hncegb.TransportDelay1_Delay
	  section.data(4).logicalSrcIdx = 8;
	  section.data(4).dtTransOffset = 3;
	
	  ;% kw11hncegb.TransportDelay1_InitOutput
	  section.data(5).logicalSrcIdx = 9;
	  section.data(5).dtTransOffset = 4;
	
	  ;% kw11hncegb.Integrator1_IC
	  section.data(6).logicalSrcIdx = 10;
	  section.data(6).dtTransOffset = 5;
	
	  ;% kw11hncegb.Constant_Value
	  section.data(7).logicalSrcIdx = 11;
	  section.data(7).dtTransOffset = 6;
	
	  ;% kw11hncegb.TransportDelay2_Delay
	  section.data(8).logicalSrcIdx = 12;
	  section.data(8).dtTransOffset = 7;
	
	  ;% kw11hncegb.TransportDelay2_InitOutput
	  section.data(9).logicalSrcIdx = 13;
	  section.data(9).dtTransOffset = 8;
	
	  ;% kw11hncegb.Integrator1_IC_ojmoabbmrq
	  section.data(10).logicalSrcIdx = 14;
	  section.data(10).dtTransOffset = 9;
	
	  ;% kw11hncegb.Switch1_Threshold
	  section.data(11).logicalSrcIdx = 15;
	  section.data(11).dtTransOffset = 10;
	
	  ;% kw11hncegb.Gain2_Gain_nf1ef5dbdh
	  section.data(12).logicalSrcIdx = 16;
	  section.data(12).dtTransOffset = 11;
	
	  ;% kw11hncegb.Switch_Threshold
	  section.data(13).logicalSrcIdx = 17;
	  section.data(13).dtTransOffset = 12;
	
	  ;% kw11hncegb.Gain_Gain_m1pxhw4cyl
	  section.data(14).logicalSrcIdx = 18;
	  section.data(14).dtTransOffset = 13;
	
	  ;% kw11hncegb.Gain1_Gain_htzvfb04rv
	  section.data(15).logicalSrcIdx = 19;
	  section.data(15).dtTransOffset = 14;
	
	  ;% kw11hncegb.Out1_Y0
	  section.data(16).logicalSrcIdx = 20;
	  section.data(16).dtTransOffset = 15;
	
	  ;% kw11hncegb.Constant_Value_fsy5hzupsd
	  section.data(17).logicalSrcIdx = 21;
	  section.data(17).dtTransOffset = 16;
	
	  ;% kw11hncegb.Switch_Threshold_ojfnd1c2sq
	  section.data(18).logicalSrcIdx = 22;
	  section.data(18).dtTransOffset = 17;
	
	  ;% kw11hncegb.DataStoreMemory1_InitialValue
	  section.data(19).logicalSrcIdx = 23;
	  section.data(19).dtTransOffset = 18;
	
	  ;% kw11hncegb.DataStoreMemory3_InitialValue
	  section.data(20).logicalSrcIdx = 24;
	  section.data(20).dtTransOffset = 19;
	
	  ;% kw11hncegb.DataStoreMemory5_InitialValue
	  section.data(21).logicalSrcIdx = 25;
	  section.data(21).dtTransOffset = 20;
	
	  ;% kw11hncegb.DataStoreMemory6_InitialValue
	  section.data(22).logicalSrcIdx = 26;
	  section.data(22).dtTransOffset = 21;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% kw11hncegb.ManualSwitch1_CurrentSetting
	  section.data(1).logicalSrcIdx = 27;
	  section.data(1).dtTransOffset = 0;
	
	  ;% kw11hncegb.DataStoreMemory_InitialValue
	  section.data(2).logicalSrcIdx = 28;
	  section.data(2).dtTransOffset = 1;
	
	  ;% kw11hncegb.DataStoreMemory4_InitialValue
	  section.data(3).logicalSrcIdx = 29;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 2;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (ei5hrfjm2r1)
    ;%
      section.nData     = 26;
      section.data(26)  = dumData; %prealloc
      
	  ;% ei5hrfjm2r1.nh1gfajwef
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% ei5hrfjm2r1.b1qasgrqty
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% ei5hrfjm2r1.apo1o0kwyu
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% ei5hrfjm2r1.ml31brdj5e
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% ei5hrfjm2r1.ecxzm02mgb
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% ei5hrfjm2r1.mindq5arle
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% ei5hrfjm2r1.ptpqosasy4
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% ei5hrfjm2r1.i0gdjhd4k3
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% ei5hrfjm2r1.foc3bflfag
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% ei5hrfjm2r1.j0vlsckbud
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% ei5hrfjm2r1.iodqrpf3mu
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% ei5hrfjm2r1.guw3ndqcxd
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
	  ;% ei5hrfjm2r1.cqiu3vlu2p
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 12;
	
	  ;% ei5hrfjm2r1.dftmqpvog5
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 13;
	
	  ;% ei5hrfjm2r1.b5xhrynpod
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 14;
	
	  ;% ei5hrfjm2r1.af3mnjru2n
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 15;
	
	  ;% ei5hrfjm2r1.gm4vgsnrn0
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 16;
	
	  ;% ei5hrfjm2r1.i0gzl3sfxb
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 17;
	
	  ;% ei5hrfjm2r1.pg4xyrefbd
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 18;
	
	  ;% ei5hrfjm2r1.lxfmdufokc
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 19;
	
	  ;% ei5hrfjm2r1.gv0rtxiogh
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 20;
	
	  ;% ei5hrfjm2r1.jrer3mkemb
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 21;
	
	  ;% ei5hrfjm2r1.kzwijek2l0
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 22;
	
	  ;% ei5hrfjm2r1.dbdswj33pm
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 23;
	
	  ;% ei5hrfjm2r1.hhhmiuh1de
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 24;
	
	  ;% ei5hrfjm2r1.ftq4sgsdrl
	  section.data(26).logicalSrcIdx = 25;
	  section.data(26).dtTransOffset = 25;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 9;
      section.data(9)  = dumData; %prealloc
      
	  ;% ei5hrfjm2r1.ousekimotz
	  section.data(1).logicalSrcIdx = 26;
	  section.data(1).dtTransOffset = 0;
	
	  ;% ei5hrfjm2r1.mxsdpwamy3
	  section.data(2).logicalSrcIdx = 27;
	  section.data(2).dtTransOffset = 1;
	
	  ;% ei5hrfjm2r1.mycu0oqn0w
	  section.data(3).logicalSrcIdx = 28;
	  section.data(3).dtTransOffset = 2;
	
	  ;% ei5hrfjm2r1.oxcjhocfkx
	  section.data(4).logicalSrcIdx = 29;
	  section.data(4).dtTransOffset = 194;
	
	  ;% ei5hrfjm2r1.b5i33i2rjj
	  section.data(5).logicalSrcIdx = 30;
	  section.data(5).dtTransOffset = 386;
	
	  ;% ei5hrfjm2r1.e0buvj4om3
	  section.data(6).logicalSrcIdx = 31;
	  section.data(6).dtTransOffset = 578;
	
	  ;% ei5hrfjm2r1.hj4djitsbs
	  section.data(7).logicalSrcIdx = 32;
	  section.data(7).dtTransOffset = 770;
	
	  ;% ei5hrfjm2r1.jbhkenmhxy
	  section.data(8).logicalSrcIdx = 33;
	  section.data(8).dtTransOffset = 307970;
	
	  ;% ei5hrfjm2r1.ffp0wuzdeg
	  section.data(9).logicalSrcIdx = 34;
	  section.data(9).dtTransOffset = 461570;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 9;
    sectIdxOffset = 2;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (myihbvydvik)
    ;%
      section.nData     = 21;
      section.data(21)  = dumData; %prealloc
      
	  ;% myihbvydvik.fexd4dpopf
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% myihbvydvik.h4m535gbvz
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% myihbvydvik.a2wfcez000
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% myihbvydvik.d30qn0muln
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% myihbvydvik.knh2jitho2
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% myihbvydvik.dojfabqed2
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 15004;
	
	  ;% myihbvydvik.n2czr30fju
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 15014;
	
	  ;% myihbvydvik.p0gxdojlzl
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 15015;
	
	  ;% myihbvydvik.dyavmkl4j1
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 15016;
	
	  ;% myihbvydvik.gxrklq3pqt
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 15017;
	
	  ;% myihbvydvik.hql4rfb2os
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 15018;
	
	  ;% myihbvydvik.jle4nahreg
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 15019;
	
	  ;% myihbvydvik.o4ovskjov3
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 15020;
	
	  ;% myihbvydvik.j0ls0zib11
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 15021;
	
	  ;% myihbvydvik.kw41nwr0mp
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 15022;
	
	  ;% myihbvydvik.mkytoqva3z
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 15023;
	
	  ;% myihbvydvik.gkj2elmi4g
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 15024;
	
	  ;% myihbvydvik.mewafh0efm
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 15025;
	
	  ;% myihbvydvik.bomeuuwpby
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 15026;
	
	  ;% myihbvydvik.endmrnl5v5
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 15027;
	
	  ;% myihbvydvik.l0cxffwmdz
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 15028;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% myihbvydvik.j2uzpdm1aa
	  section.data(1).logicalSrcIdx = 21;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% myihbvydvik.hpsl2pm3wp
	  section.data(1).logicalSrcIdx = 22;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% myihbvydvik.ameaefrv3p.modelTStart
	  section.data(1).logicalSrcIdx = 23;
	  section.data(1).dtTransOffset = 0;
	
	  ;% myihbvydvik.pnvsiaqt43.modelTStart
	  section.data(2).logicalSrcIdx = 24;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 5;
      section.data(5)  = dumData; %prealloc
      
	  ;% myihbvydvik.cv4foov321.TUbufferPtrs
	  section.data(1).logicalSrcIdx = 25;
	  section.data(1).dtTransOffset = 0;
	
	  ;% myihbvydvik.gqvlkov5sw.TUbufferPtrs
	  section.data(2).logicalSrcIdx = 26;
	  section.data(2).dtTransOffset = 2;
	
	  ;% myihbvydvik.jrjkhsqhas.LoggedData
	  section.data(3).logicalSrcIdx = 27;
	  section.data(3).dtTransOffset = 4;
	
	  ;% myihbvydvik.fwlxvrmpnu.LoggedData
	  section.data(4).logicalSrcIdx = 28;
	  section.data(4).dtTransOffset = 6;
	
	  ;% myihbvydvik.oh3ggg0zjg.LoggedData
	  section.data(5).logicalSrcIdx = 29;
	  section.data(5).dtTransOffset = 8;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% myihbvydvik.knjlllxqry.Tail
	  section.data(1).logicalSrcIdx = 30;
	  section.data(1).dtTransOffset = 0;
	
	  ;% myihbvydvik.mwpsdvqwhf.Tail
	  section.data(2).logicalSrcIdx = 31;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(6) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% myihbvydvik.kg5rwdamq4
	  section.data(1).logicalSrcIdx = 32;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(7) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% myihbvydvik.mzjdmbfzce
	  section.data(1).logicalSrcIdx = 33;
	  section.data(1).dtTransOffset = 0;
	
	  ;% myihbvydvik.jdaqz3vlbn
	  section.data(2).logicalSrcIdx = 34;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(8) = section;
      clear section
      
      section.nData     = 9;
      section.data(9)  = dumData; %prealloc
      
	  ;% myihbvydvik.ouaafcu3sp
	  section.data(1).logicalSrcIdx = 35;
	  section.data(1).dtTransOffset = 0;
	
	  ;% myihbvydvik.fiiczxiv1z
	  section.data(2).logicalSrcIdx = 36;
	  section.data(2).dtTransOffset = 1;
	
	  ;% myihbvydvik.f3r4uepqer
	  section.data(3).logicalSrcIdx = 37;
	  section.data(3).dtTransOffset = 2;
	
	  ;% myihbvydvik.je4mkdcimy
	  section.data(4).logicalSrcIdx = 38;
	  section.data(4).dtTransOffset = 3;
	
	  ;% myihbvydvik.hdjv33gmbm
	  section.data(5).logicalSrcIdx = 39;
	  section.data(5).dtTransOffset = 4;
	
	  ;% myihbvydvik.pb4o2gnevw
	  section.data(6).logicalSrcIdx = 40;
	  section.data(6).dtTransOffset = 5;
	
	  ;% myihbvydvik.gg2q5w0mew
	  section.data(7).logicalSrcIdx = 41;
	  section.data(7).dtTransOffset = 6;
	
	  ;% myihbvydvik.ksvc5zqamo
	  section.data(8).logicalSrcIdx = 42;
	  section.data(8).dtTransOffset = 7;
	
	  ;% myihbvydvik.g2xcbcm0bt
	  section.data(9).logicalSrcIdx = 43;
	  section.data(9).dtTransOffset = 8;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(9) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 1831860155;
  targMap.checksum1 = 449381451;
  targMap.checksum2 = 1247639850;
  targMap.checksum3 = 1391092637;

