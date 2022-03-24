* Encoding: UTF-8.

**MLM CCT -GROUPS X decision primitives

DATASET ACTIVATE DataSet39.
BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES TARGET=Num_cards INPUT= hot_cold block num_loss gain_amt loss_amt Group  
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=2000
  /MISSING USERMISSING=EXCLUDE.
MIXED Num_cards WITH hot_cold block num_loss gain_amt loss_amt Group
  /CRITERIA=CIN(95) MXITER(1000000) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, 
    ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)
  /FIXED=Group hot_cold block num_loss gain_amt loss_amt hot_cold*Group block*Group num_loss*Group 
    gain_amt*Group loss_amt*Group hot_cold*block hot_cold*num_loss hot_cold*gain_amt hot_cold*loss_amt 
    hot_cold*block*Group hot_cold*num_loss*Group hot_cold*gain_amt*Group hot_cold*loss_amt*Group | 
    SSTYPE(3)
  /METHOD=REML
  /PRINT=SOLUTION TESTCOV
  /RANDOM=hot_cold block num_loss gain_amt loss_amt hot_cold*block hot_cold*num_loss 
    hot_cold*gain_amt hot_cold*loss_amt | SUBJECT(ID) COVTYPE(AR1).


**Mixed Models Cups - GROUP X decision primitives *

GENLINMIXED
  /DATA_STRUCTURE SUBJECTS=ID
  /FIELDS TARGET=trans1 TRIALS=NONE OFFSET=NONE
  /TARGET_OPTIONS REFERENCE=0 DISTRIBUTION=BINOMIAL LINK=LOGIT
  /FIXED  EFFECTS=Group domain prob outcome group*domain Group*prob Group*outcome domain*prob domain*outcome group*domain*prob group*domain*outcome
   USE_INTERCEPT=TRUE
  /RANDOM EFFECTS= domain prob outcome domain*prob domain*outcome  USE_INTERCEPT=TRUE SUBJECTS=ID 
    COVARIANCE_TYPE=AR1
  /BUILD_OPTIONS TARGET_CATEGORY_ORDER=ASCENDING INPUTS_CATEGORY_ORDER=ASCENDING MAX_ITERATIONS=100 
    CONFIDENCE_LEVEL=95 DF_METHOD=SATTERTHWAITE COVB=ROBUST PCONVERGE=0.000001(ABSOLUTE) SCORING=0 
    SINGULAR=0.000000000001
  /EMMEANS_OPTIONS SCALE=ORIGINAL PADJUST=LSD.


*Generalized Linear Mixed Models- CCT Analyses with stress for gambling group

BOOTSTRAP
  /SAMPLING METHOD=SIMPLE
  /VARIABLES TARGET=Num_cards INPUT= hot_cold block num_loss gain_amt loss_amt zzcmcar zzcentpeak45bed
  /CRITERIA CILEVEL=95 CITYPE=PERCENTILE  NSAMPLES=2000
  /MISSING USERMISSING=EXCLUDE.
MIXED Num_cards WITH ZZcMCAR ZZcentPeak45bed hot_cold block num_loss gain_amt loss_amt
  /CRITERIA=CIN(95) MXITER(100) MXSTEP(10) SCORING(1) SINGULAR(0.000000000001) HCONVERGE(0, 
    ABSOLUTE) LCONVERGE(0, ABSOLUTE) PCONVERGE(0.000001, ABSOLUTE)
  /FIXED=ZZcMCAR ZZcentPeak45bed hot_cold block num_loss gain_amt loss_amt ZZcMCAR*hot_cold ZZcMCAR*block ZZcMCAR*num_loss ZZcMCAR*gain_amt ZZcMCAR*loss_amt 
    ZZcentPeak45bed*hot_cold ZZcentPeak45bed*block ZZcentPeak45bed*num_loss 
    ZZcentPeak45bed*gain_amt ZZcentPeak45bed*loss_amt hot_cold*block hot_cold*num_loss hot_cold*gain_amt hot_cold*loss_amt 
    ZZcMCAR*hot_cold*block ZZcMCAR*hot_cold*num_loss ZZcMCAR*hot_cold*gain_amt ZZcMCAR*hot_cold*loss_amt ZZcentPeak45bed*hot_cold*block 
    ZZcentPeak45bed*hot_cold*num_loss ZZcentPeak45bed*hot_cold*gain_amt 
    ZZcentPeak45bed*hot_cold*loss_amt | SSTYPE(3)
  /METHOD=REML
  /PRINT=SOLUTION TESTCOV
  /RANDOM=hot_cold block num_loss gain_amt loss_amt hot_cold*block hot_cold*num_loss 
    hot_cold*gain_amt hot_cold*loss_amt | SUBJECT(ID) COVTYPE(AR1).


*Generalized Linear Mixed Models. Cups Analysis  --Analyses with stress for gambling group
GENLINMIXED
  /DATA_STRUCTURE SUBJECTS=ID
  /FIELDS TARGET=trans1 TRIALS=NONE OFFSET=NONE
  /TARGET_OPTIONS REFERENCE=0 DISTRIBUTION=BINOMIAL LINK=LOGIT
  /FIXED  EFFECTS=ZZcMCAR ZZcentPeak45bed domain prob outcome domain*ZZcMCAR prob*ZZcMCAR 
    outcome*ZZcMCAR domain*ZZcentPeak45bed prob*ZZcentPeak45bed outcome*ZZcentPeak45bed domain*prob 
    domain*outcome domain*prob*ZZcMCAR domain*outcome*ZZcMCAR domain*prob*ZZcentPeak45bed 
    domain*outcome*ZZcentPeak45bed USE_INTERCEPT=TRUE
  /RANDOM EFFECTS=domain prob outcome domain*prob domain*outcome USE_INTERCEPT=TRUE SUBJECTS=ID 
    COVARIANCE_TYPE=AR1 
  /BUILD_OPTIONS TARGET_CATEGORY_ORDER=ASCENDING INPUTS_CATEGORY_ORDER=ASCENDING MAX_ITERATIONS=100 
    CONFIDENCE_LEVEL=95 DF_METHOD=SATTERTHWAITE COVB=MODEL PCONVERGE=0.000001(ABSOLUTE) SCORING=0 
    SINGULAR=0.000000000001
  /EMMEANS_OPTIONS SCALE=ORIGINAL PADJUST=LSD.

