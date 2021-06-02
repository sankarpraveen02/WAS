declare -a args
mapfile -t args < input.txt
lineCount=$(grep -c "^" input.txt)
echo "#####Repositories $lineCount #####"
for((i=0;i<${lineCount};i++));
do
IFS=',' read -r -a string <<< ${args[i]}
echo "#####Cloning all files from ${string[1]} repository with all branches and commits#####"
git clone --mirror ${string[0]}
returncode=$? 
if [ ${returncode} -eq 0 ]
then
   echo "#####Changing workspace directory#####"
   cd ${string[1]}.git
   returncode=$? 
   if [ ${returncode} -eq 0 ]
   then 
      echo "#####Removing old repository connections#####"
      git remote rm origin
	  echo "#####Adding new repo connections#####"
      git remote add origin ${string[2]}
	  returncode=$? 
	  if [ ${returncode} -eq 0 ]
      then
         echo "#####Pushing all files with branches and commits#####"
         git push --mirror
		 returncode=$? 
         if [ ${returncode} -eq 0 ]
		 then
	        cd ..
		 else
		 echo "#####Push command failed#####"
		 exit 1
		 fi
	  else 
	  echo "#####New Repo url wrong or missing value#####"
      exit 1
      fi	  
   else
   echo "#####No such Directory or missing value#####"
   exit 1
   fi
else
echo "#####Clone url wrong or missing value or already exist in local#####"
exit 1
fi
done
