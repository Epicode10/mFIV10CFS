# mFIV10CFS
mFI-v10 for moderate to severe frailty classification in CFS (mFIV10CFS) is a simple program to convert scores of Multimorbidity Frailty Index-v10 (mFI-v10) into moderate to severe frailty classification in Clinical Frailty Scale (CFS).

# Usage

### Example:
```diff

mFIV10CFS <- function(data){
  model <- -8.24+0.08*data[,"age"]-0.44*data[,"gender"]+9.38*data[,"mFI_v10"]
  prob <- exp(model)/(1+exp(model))
  prob_threshold <- ifelse(prob>0.29,1,0)
  data_df <- data.frame(data, prob, prob_threshold)
  return(data_df)
}

output <- mFIV10CFS(data = data)

```

# Dependencies
R >= 3.6

# Papers
Chien-Chou Su, Yu-Tai Lo, Yi-Ching Yang, Yu-Huai Yu, Wei-Chun Cheng, Wen-Ping Lin, **Deng-Chi Yang**. *Validation of multimorbidity frailty index-v10 in older adults from outpatient and inpatient settings*. (submission)
