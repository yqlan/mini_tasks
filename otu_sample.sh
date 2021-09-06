########################################################################################################################################
awk '($10!="*"){
                split($9,s,"_");
                if(!otu[$10]){i++;otu[$10]=i};
                if(!sample[s[2]"_"s[3]"_"s[4]]){j++;sample[s[2]"_"s[3]"_"s[4]]=j};
                a[otu[$10],sample[s[2]"_"s[3]"_"s[4]]]=a[otu[$10],sample[s[2]"_"s[3]"_"s[4]]]+1}
      END{
          for (k in sample){print sample[k],k}
          }' JoeEdward_trial.txt | 
sort -n -k 1,1 |
awk '{if(NR<17){printf "%s ",$2}else{printf "%s\n",$2}}' > sample.txt  ## sample-1  ##


awk '($10!="*"){
                split($9,s,"_");
                if(!otu[$10]){i++;otu[$10]=i};
                if(!sample[s[2]"_"s[3]"_"s[4]]){j++;sample[s[2]"_"s[3]"_"s[4]]=j};
                a[otu[$10],sample[s[2]"_"s[3]"_"s[4]]]=a[otu[$10],sample[s[2]"_"s[3]"_"s[4]]]+1}
      END{
          for(m=1;m<=i;m++){
                            for (n=1;n<j;n++){
                                              if(!a[m,n]){printf "%d ",a[m,n]=0}else{printf "%d ",a[m,n]}
                                              };
                            if(!a[m,j]){printf "%d\n",a[m,n]=0}else{printf "%d\n",a[m,n]}
                            }
         }' JoeEdward_trial.txt  > data.txt

##########################################################################################################################################
awk '($10!="*"){
                split($9,s,"_");
                if(!otu[$10]){i++;otu[$10]=i};
                if(!sample[s[2]"_"s[3]"_"s[4]]){j++;sample[s[2]"_"s[3]"_"s[4]]=j};
                a[otu[$10],sample[s[2]"_"s[3]"_"s[4]]]=a[otu[$10],sample[s[2]"_"s[3]"_"s[4]]]+1}
      END{
          for (k in otu){print otu[k],k}
          }' JoeEdward_trial.txt |
sort -n -k 1,1 | 
awk 'BEGIN{print "otu"}{print $2}' > otu.txt

###########################################################################################################################################
cat sample.txt data.txt | paste otu.txt - | less -S

