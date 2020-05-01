#!/bin/bash

set -e

echo "checking for samtools"
which samtools 
echo "samtools found"
# This is a rather minimal example Argbash potential
# Example taken from http://argbash.readthedocs.io/en/stable/example.html


# ARG_OPTIONAL_SINGLE([subject],[s],[generator file containing the subject of interest])
# ARG_OPTIONAL_SINGLE([ref],[r],[file path to the desired reference file])
# ARG_OPTIONAL_SINGLE([threads],[t],[number of threads to use])
# ARG_OPTIONAL_SINGLE([kmersize],[k],[size of Khmer to use])
# ARG_OPTIONAL_SINGLE([min],[m],[overwrites the minimum k-mer count to call variant])
# ARG_POSITIONAL_INF([controls],[generator files containing the control subjects],[0])



# ARG_HELP([The general script's help msg])
# ARGBASH_GO()
# needed because of Argbash --> m4_ignore([
### START OF CODE GENERATED BY Argbash v2.5.1 one line above ###
# Argbash is a bash code generator used to get arguments parsing right.
# Argbash is FREE SOFTWARE, see https://argbash.io for more info
# Generated online by https://argbash.io/generate
MaxHashDepth=1200; #need to make this a passed option
RDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

die()
{
    local _ret=$2
    test -n "$_ret" || _ret=1
    test "$_PRINT_HELP" = yes && print_help >&2
    echo "$1" >&2
    exit ${_ret}
}

begins_with_short_option()
{
    local first_option all_short_options
    all_short_options='srtkmh'
    first_option="${1:0:1}"
    test "$all_short_options" = "${all_short_options/$first_option/}" && return 1 || return 0
}


# THE DEFAULTS INITIALIZATION - POSITIONALS
_positionals=()
_arg_exclude=()
# THE DEFAULTS INITIALIZATION - OPTIONALS
_arg_controls=()
_arg_subject=
_arg_ref=
_arg_threads=
_arg_kmersize=
_arg_min=
_arg_refhash=
_arg_saliva="FALSE"
_arg_exome="FALSE"
MaxAlleleSize="1000"
print_help ()
{
    printf "%s\n" "The general script's help msg"
    printf 'Usage: %s [-s|--subject <arg>] [-r|--ref <arg>] [-t|--threads <arg>] [-k|--kmersize <arg>] [-m|--min <arg>] [-h|--help] [<controls-1>] ... [<controls-n>] ...\n' "$0"
    printf "\t%s\n" "-c, --controls: bam files containing the control subjects ()"
    printf "\t%s\n" "-s,--subject: bam file containing the subject of interest (no default)"
    printf "\t%s\n" "-r,--ref: file path to the desired reference file (no default)"
    printf "\t%s\n" "-cr,--cramref: file path to the desired reference file to decompress input cram files (no default)"
    printf "\t%s\n" "-t,--threads: number of threads to use (no default) (min 3)"
    printf "\t%s\n" "-k,--kersize: size of k-mer to use (no default)"
    printf "\t%s\n" "-m,--min: overwrites the minimum k-mer count to call variant (no default)"
    printf "\t%s\n" "--saliva: flag to indicate that the subject sample is a buccal swab and likely contains a significant fractino of contaminant DNA"
    printf "\t%s\n" "--exome: flat go set if your input data is exome sequecing. Sugjested you also set -m, default is -m 20"
    printf "\t%s\n" "-h,--help: HELP!!!!!!!!!!!!!!!"
}

print_devhelp ()
{
    printf "%s\n" "The general script's help msg"
    printf 'Usage: %s [-s|--subject <arg>] [-r|--ref <arg>] [-t|--threads <arg>] [-k|--kmersize <arg>] [-m|--min <arg>] [-h|--help] [<controls-1>] ... [<control\
s-n>] ...\n' "$0"
    printf "\t%s\n" "-c, --controls: bam files containing the control subjects"
    printf "\t%s\n" "-s,--subject: bam file containing the subject of interest (no default)"
    printf "\t%s\n" "-r,--ref: file path to the desired reference file (no default)"
    printf "\t%s\n" "-cr,--cramref: file path to the desired reference file to decompress input cram files (no default)"
    printf "\t%s\n" "-t,--threads: number of threads to use (no default) (min 3)"
    printf "\t%s\n" "-f,--refhash: Jhash file containing reference hashList (no default)"
    printf "\t%s\n" "-e,--exclude: Jhash file of kmers to exclude from mutation list (no default)"
    printf "\t%s\n" "-k,--kersize: size of k-mer to use (no default)"
    printf "\t%s\n" "-m,--min: overwrites the minimum k-mer count to call variant (no default)"
    printf "\t%s\n" "--saliva: flag to indicate that the subject sample is a buccal swab and likely contains a significant fractino of contaminant DNA"
    printf "\t%s\n" "--exome: flat go set if your input data is exome sequecing. Sugjested you also set -m, default is -m 20"
    printf "\t%s\n" "-q1,--fastq1: If starting from fastq files, a list of the mate1 fastq files to improve RUFUS.ilter"
    printf "\t%s\n" "-q2,--fastq2: If starting from fastq files, a list of the mate2 fastq files to improve RUFUS.ilter"
    printf "\t%s\n" "-h,--help: HELP!!!!!!!!!!!!!!!"
    printf "\t%s\n" "-d,--devhelp: HELP!!! for developers"
}

parse_commandline ()
{
    while test $# -gt 0
    do
	_key="$1"
	case "$_key" in
	    -s|--subject)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_subject="$2"
		shift
		;;
	    --subject=*)
		_arg_subject="${_key##--subject=}"
		;;
	    -s)
		_arg_subject="${_key##-s}"
		;;
	    -r|--ref)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_ref="$2"
		shift
		;;
	    --ref=*)
		_arg_ref="${_key##--ref=}"
		;;
	    -r*)
		_arg_ref="${_key##-r}"
		;;
            
	    -cr|--cramref)
	         test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_cramref="$2"
		shift
		;;
	    --cramref*)
		_arg_cramref="${_key##--cramref=}"
	    	;;
	    -cr*)
		 _arg_cramref="${_key##-cr}"
		;;
	    
	    -q1|--fastq1)
                 test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_fastqA="$2"
                shift
                ;;
            --fastq1=*)
                _arg_fastqA="${_key##--fastq1=}"
                ;;
            -q1*)
                 _arg_fastqA="${_key##-q1}"
                ;;
	    
	    -q2|--fastq2)
                 test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_fastqB="$2"
                shift
                ;;
            --fastq2=*)
                _arg_fastqB="${_key##--fastq2=}"
                ;;
            -q2*)
                 _arg_fastqB="${_key##-q2}"
                ;;
	    
	    -t|--threads)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_threads="$2"
		shift
		;;
	    --threads=*)
		_arg_threads="${_key##--threads=}"
		;;
	    -t*)
		_arg_threads="${_key##-t}"
		;;

            -f|--refhash)
                test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
                _arg_refhash="$2"
                shift
                ;;
            --refhash=*)
                _arg_refhash="${_key##--refhash=}"
                ;;
            -f*)
                _arg_refhash="${_key##-f}"
                ;;
	    -k|--kmersize)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_kmersize="$2"
		shift
		;;
	    --kmersize=*)
		_arg_kmersize="${_key##--kmersize=}"
		;;
	    -k*)
		_arg_kmersize="${_key##-k}"
		;;
	    -c|--controls)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_controls+=("$2")
		shift
		;;
	    --controls=*)
		_arg_controls+=("${_key##--controls=}")
		;;
	    -c*)
		_arg_controls+=("${_key##-c}")
		;;
	    -m|--min)
		test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
		_arg_min="$2"
		shift
		;;
	    --min=*)
		_arg_min="${_key##--min=}"
		;;
	    -m*)
		_arg_min="${_key##-m}"
		;;
	    --saliva)
	        _arg_saliva="TRUE"
		echo "Saliva subject sample provided"
		;;
	    --exome)
	       _arg_exome="TRUE"
	       echo "Exome run"
	       ;;
	    --MaxAllele)
	       test $# -lt 2 && die "Missing value for the optional argument '$_key'." 1
	       MaxAlleleSize="$2"
	       ;;
	    -h|--help)
		print_help
		exit 0
		;;
	    -h*)
		print_help
		exit 0
		;;
	    -d|--devhelp)
                print_devhelp
                exit 0
                ;;
            -d*)
                print_devhelp
                exit 0
                ;;

	    *)
		_positionals+=("$1")
		;;

	        esac
	shift
	done
}

assign_positional_args ()
{
    _positional_names=()
    _our_args=$((${#_positionals[@]} - ${#_positional_names[@]}))
    for ((ii = 0; ii < _our_args; ii++))
    do
	_positional_names+=("_arg_exclude[$((ii + 0))]")
	done

    for (( ii = 0; ii < ${#_positionals[@]}; ii++))
    do
	eval "${_positional_names[ii]}=\${_positionals[ii]}" || die "Error during argument parsing, possibly an Argbash bug." 1
	done
}

parse_commandline "$@"
assign_positional_args


# [ <-- needed because of Argbash

##############################__CHECK_FOR_MANDATORY_PARAMS__#################################################
if [ -z $_arg_kmersize ]
then 
 echo "You must provide a minimum kmer size [--kmersize|-k] (we recommend a kmer size of 25)"
 echo "Killing run with non-zero exit status"
 kill -9 $$
fi

if [ -z $_arg_threads ]
then
    echo "You must provide a number of threads to use [--threads|-t] (we recommend 40 threads if available)"
    echo "Killing run with non-zero exit status"
    kill -9 $$
fi

if [ ${#_arg_exclude[@]} -eq 0 ] && [ ${#_arg_controls[@]} -eq 0 ]
then
    echo "You must provide RUFUS with atleast one control sample"
    echo "Killing run with non-zero exit status"
    kill -9 $$
fi

echo "_arg_fastqA = $_arg_fastqA"
echo "_arg_fastqB = $_arg_fastqB"



#########__remove -e and --exclude from _arg_exclude array__################
new_array=()
for value in "${_arg_exclude[@]}"
do
    [[ $value != --exclude ]] && new_array+=($value)
done
ExcludeTemp=("${new_array[@]}")
unset new_array

new_array=()
for value in "${ExcludeTemp[@]}"
do 
    [[ $value != -e ]] && new_array+=($value)
done
_arg_exclude=("${new_array[@]}")
unset new_arary
unset ExcludeTemp
##########################################################

if [ $_arg_exome -eq "TRUE" ]; then 
	echo "Exome run set.  Settin max kmer to 1M and saliva = true"
	MaxHashDepth=1000000
	_arg_saliva="TRUE"
fi


#############################################################################################################

###############__PRINTING_OUT_ARG_BASH_VALUES__##############
#echo "Value of --subject: $_arg_subject"                    #
#echo "Value of --controls:"                                 #
#for each in "${_arg_controls[@]}"                           #
#do                                                          #
#  echo "$each"                                              #
#done                                                        #
#echo "Value of --threads: $_arg_threads"                    #
#echo "Value of --kmersize: $_arg_kmersize"                  #
#echo "Value of --ref: $_arg_ref"                            #
#echo "Value of --minCount $_arg_min"                        #
#############################################################

Parents=("${_arg_controls[@]}")
_arg_ref_cat="${_arg_ref%.*}"



###############__CHECK_IF_ALL_REFERENCE_FILES_EXIST__#####################
if [[ ! -e "$_arg_ref".sa ]] && [[ ! -e "$_arg_ref_cat".sa ]]
then
    echo "Reference file not built for BWA" 
    echo "this program requires the existence of the file" "$_arg_ref".sa
    echo "Killing run with non-zero status"
    kill -9 $$
fi

if [[ ! -e "$_arg_ref".bwt ]] && [[ ! -e "$_arg_ref_cat".bwt ]]
then
    echo "Reference file not built for BWA"
    echo "this program requires the existence of the file" "$_arg_ref".bwt
    echo "Killing run with non-zero status"
    kill -9 $$
fi

if [[ ! -e "$_arg_ref".pac ]] && [[ ! -e "$_arg_ref_cat".pac ]]
then
    echo "Reference file not built for BWA"
    echo "this program requires the existence of the file" "$_arg_ref".pac
    echo "Killing run with njon-zero status"
    kill -9 $$
fi

if [[ ! -e "$_arg_ref".amb ]] && [[ ! -e "$_arg_ref_cat".amb ]]
then
    echo "Reference file not built for BWA"
    echo "this program requires the existence of the file" "$_arg_ref".amb
    echo "Killing run with non-zero status"
    kill -9 $$
fi

if [[ ! -e "$_arg_ref".ann ]] && [[ ! -e "$_arg_ref_cat".ann ]]
then
    echo "Reference file not built for BWA"
    echo "this program requires the existence of the file" "$_arg_ref".ann
    echo "Killing run with non-zero status"
    kill -9 $$
fi
###########################################################################

refFileName=$(basename "$parent")
refExtension="${refFileName##*.}"

if [[ "$refExtension" != fa ]] && [[ -e "$_arg_ref".fa ]] 
then 
    _arg_ref="$_arg_ref".fa
elif [[ "$refExtension" != fasta ]] && [[ -e "$_arg_ref".fasta ]]
then
    _arg_ref="$_arg_ref".fasta
fi

if [[ ! -e "$_arg_ref" ]]
then
    echo "cannot find reference file " "$_arg_ref"
    echo "tried extensions: "
    echo "no extension "
    echo ".fa"
    echo ".fasta"
    echo "killing run with non-zero exit status"
    kill -9 $$
fi
if [[ -e "$_arg_ref_cat".sa ]]
then 
    _arg_ref_bwa=$_arg_ref_cat
else
    _arg_ref_bwa=$_arg_ref
fi


echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "Final reference path being used is" "$_arg_ref"
echo "Final bwa reference path being used is" "$_arg_ref_bwa"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"



#########__CREATE_ALL_GENERATOR_FILES_AND_VARIABLES__#############
ProbandFileName=$(basename "$_arg_subject")
ProbandExtension="${ProbandFileName##*.}"
echo "proband extension is $ProbandExtension"

if [[ "$ProbandExtension" != "cram" ]] && [[ "$ProbandExtension" != "bam" ]] || [[ ! -e "$_arg_subject" ]] && [[ "$ProbandExtension" != "generator" ]]
then 
    echo "The proband bam/generator file" "$_arg_subject" " was not provided or does not exist; killing run with non-zero exit status"
    kill -9 $$
elif [[ "$ProbandExtension" == "bam" ]]
then
    echo "you provided the proband cram file" "$_arg_subject"
    ProbandGenerator="$ProbandFileName".generator
    echo "samtools view -F 3328 $_arg_subject" > "$ProbandGenerator"
elif [[ "$ProbandExtension" == "cram" ]]
then
    echo "you provided the proband cram file" "$_arg_subject"
    ProbandGenerator="$ProbandFileName".generator
    if [ "$_arg_cramref" == "" ]
    then
         echo "ERROR cram reference not provided for cram input";
        kill -9 $$  
     fi
    echo "samtools view -F 3328 -T $_arg_cramref $_arg_subject" > "$ProbandGenerator"
elif [[ "$ProbandExtension" = "generator" ]]
then
    echo "you provided the proband bam file" "$_arg_subject"
    ProbandGenerator="$ProbandFileName"
else 
    echo "unknown error during generator generation, killing run with non-zero exit status"
fi

ParentGenerators=()
ParentJhash=()
ParentFileNames=""
space=" "

for parent in "${Parents[@]}"
do 
    parentFileName=$(basename "$parent")
    ParentFileNames=$ParentFileNames$space$parent
    echo "parent file name is" "$parentFileName"
    parentExtension="${parentFileName##*.}"
    echo "parent file extension name is" "$parentExtension"

    if  [[ "$parentExtension" != "cram" ]] && [[ "$parentExtension" != "bam" ]]  && [[ "$parentExtension" != "generator" ]] 
    then
	echo "The control bam/generator file" "$parent" " was not provided, or does not exist; killing run with non-zero exit status"
	kill -9 $$
    elif [[ "$parentExtension" == "bam" ]]
    then
	    parentGenerator="$parentFileName".generator
	    ParentGenerators+=("$parentGenerator")
	    echo "samtools view -F 3328 $parent" > "$parentGenerator"
	    echo "You provided the control bam file" "$parent"
    elif [[ "$parentExtension" == "cram" ]] 
    then
            parentGenerator="$parentFileName".generator
            ParentGenerators+=("$parentGenerator")
	    if [ "$_arg_cramref" == "" ]
	    then 
		echo "ERROR cram reference not provided for cram input"; 
		 kill -9 $$ 
	    fi
            echo "samtools view -F 3328 -T $_arg_cramref $parent" > "$parentGenerator"
            echo "You provided the control cram file" "$parent"    
elif [[ "$parentExtension" = "generator" ]]
    then
	parentGenerator="$parentFileName"
        ParentGenerators+=("$parentGenerator")
	echo "You provided the control bam file" "$parent"
    fi
done
#################################################################


################__COPY_ARG_BASH_VARIABLES_TO_SCRIPT_VARIABLES__##################

K=$_arg_kmersize
Threads=$_arg_threads
ref=$_arg_ref
#################################################################################

if [[ -z "$K" ]]
then
    echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
    echo "kmer size ([-k|kmersize]) was not provided, killing run with non-zero exit status"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    kill -9 $$

fi

if [[ -z "$Threads" ]]
then
    echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
    echo "number of threads ([-t|--threads]) was not provided, killing run with non-zero exit status"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    kill -9 $$
fi

if [[ -z "$ref" ]]
then
    echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
    echo "reference file ([-r|--ref]) was not provided, killing run with non-zero exit status"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    kill -9 $$

fi


###################__PRINT_VARIABLES_USED__######################################
echo "~~~~~~~~~~~~ printing out paramater values used in script ~~~~~~~~~~~~~~~~"
echo "value of ProbandGenerator $ProbandGenerator"
echo "Value of ParentGenerators:"
for parent  in "${ParentGenerators[@]}"
do
  echo " $parent"
done
echo "Value of K is: $K"
echo "Value of Threads is: $Threads"
echo "value of ref is: $ref"
echo "value of min is: $min" 
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#################################################################################


if [ -z "$_arg_refhash" ]
then
    echo "Did not provide refHash"
else
    echo "privided refhash of: " "$_arg_refhash"
fi

#####__CHECK_IF_MIN_IS_PROVIDED__#####
if [ -z $_arg_min ] && [ $_arg_exome -eq "TRUE" ]; then
	echo "Exome run, min must bet set, auto setting to 20"
	_arg_min="20"
fi

if [ -z "$_arg_min" ]
then
      echo "\$_arg_min is empty"
else
      echo "\$_arg_min is NOT empty"
      MutantMinCov=$_arg_min
fi

 

echo "_arg_min is $_arg_min"
echo "MutantMinCov is $MutantMinCov"
######################################


############__BUILD_JHASH_STRING__################
parentsString=""
parentsExcludeString=""
space=" "
jhash=".Jhash"

for parent in "${ParentGenerators[@]}"
do
  echo "parent is  $parent "
  parentsString=$parentsString$space$parent$jhash
done
for exclude in "${_arg_exclude[@]}"
do
    parentsExcludeString=$parentsExcludeString$space$exclude
done

##################################################



##########################__SET_EXECUTABLE_PATHS__##############################
RUFUSmodel=$RDIR/bin/ModelDist
RUFUSfilter=$RDIR/bin/RUFUS.Filter
RufAlu=$RDIR/bin/externals/rufalu/src/rufalu_project/src/aluDetect
RUFUSOverlap=$RDIR/scripts/Overlap.shorter.sh
RunJelly=$RDIR/scripts/RunJellyForRUFUS.sh
PullSampleHashes=$RDIR/scripts/CheckJellyHashList.sh
modifiedJelly=$RDIR/bin/externals/modified_jellyfish/src/modified_jellyfish_project/bin/jellyfish
bwa=$RDIR/bin/externals/bwa/src/bwa_project/bwa
RUFUSfilterFASTQ=$RDIR/bin/RUFUS.Filter
fastp=$RDIR/bin/externals/fastp/src/fastp_project/fastp
samblaster=$RDIR/bin/externals/samblaster/src/samblaster_project/samblaster
############################################################################################



####################__GENERATE_JHASH_FILES_FROM_JELLYFISH__#####################
JThreads=$(( Threads / 3 ))
if [ "$JThreads" -lt 3 ]
then
    JThreads=3
fi
#JThreads=$Threads

for parent in "${ParentGenerators[@]}"
do
     /usr/bin/time -v bash $RunJelly $parent $K $(echo $JThreads -2 | bc) 2  
done

#/usr/bin/time -v bash $RunJelly $ProbandGenerator $K  $Threads 2
/usr/bin/time -v bash $RunJelly $ProbandGenerator $K $(echo $JThreads -2 | bc) 2     
wait
##############################################################################



###########################_EMPTY_JHASH_CHECK##############################

for parent in "${ParentGenerators[@]}"
do
    ## Check Jhash files are not empty
     if [ ! -s "$parent".Jhash ]
     then
        echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
        echo "$parent.Jhash  is empty"
        echo "Killing run with exit status 1"
        echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
        kill -9 $$
     fi
done

if [ ! -s "$ProbandGenerator".Jhash ]
then
    echo "@@@@@@@@@@@__WARNING__@@@@@@@@@@@@@"
    echo "$ProbandGenerator.Jhash  is empty"
    echo "Killing run with exit status 1"
    echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    kill -9 $$
fi
##############################################################################



##################__GENERATE_JHASH_HISTOGRAMS__#################################
perl -ni -e 's/ /\t/;print' "$ProbandGenerator".Jhash.histo
for parent in "${ParentGenerators[@]}"
do
  perl -ni -e 's/ /\t/;print' "$parent".Jhash.histo
done
##############################################################################



#######################__RUFUS_Model__############################################
if [  -z "$_arg_min" ]
then
    echo "min not provided, building model" 
    if [ -e "$ProbandGenerator.Jhash.histo.7.7.model" ]
    then
        echo "skipping model"
	MutantMinCov=$(head -2 "$ProbandGenerator".Jhash.histo.7.7.model | tail -1 )
	echo "mutant min coverage from generated model is $MutantMinCov"

	MutantSC=$(head -4 "$ProbandGenerator".Jhash.histo.7.7.model | tail -1 )
	echo "mutant SC coverage from generated model is $MutantSC"
	MaxHashDepth=$(echo "$MutantSC * 5" | bc)
	echo "MaxHashDepth = $MaxHashDepth"

    else
	echo "staring model"
        /usr/bin/time -v "$RUFUSmodel" "$ProbandGenerator".Jhash.histo $K 150 $Threads
        echo "done with model"
	MutantMinCov=$(head -2 "$ProbandGenerator".Jhash.histo.7.7.model | tail -1 )
	echo "mutant min coverage from generated model is $MutantMinCov"
   	
	MutantSC=$(head -4 "$ProbandGenerator".Jhash.histo.7.7.model | tail -1 )
        echo "mutant SC coverage from generated model is $MutantSC"
        MaxHashDepth=$(echo "$MutantSC * 5" | bc)
        echo "MaxHashDepth = $MaxHashDepth" 
    fi
else 
    echo "min was provided, min is $_arg_min" 
    MutantMinCov="$_arg_min" 
    touch "$ProbandGenerator".Jhash.histo.7.7.model
fi
########################################################################################

if [ -z $MutantMinCov ]; then 
	echo "ERROR: No min coverage set, possible error in Model"
	exit 100
fi 

#################################__HASH_LIST_FILTER__#####################################
if [ -s "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList ]
then 
    echo "skipping $ProbandGenerator.HashList pull "
else
    if [ -e "$ProbandGenerator".temp ]
    then 
    	rm  "$ProbandGenerator".temp
    fi
    mkfifo "$ProbandGenerator".temp
    /usr/bin/time -v $modifiedJelly merge "$ProbandGenerator".Jhash $(echo $parentsString) $(echo $parentsExcludeString)  > "$ProbandGenerator".temp & 
    /usr/bin/time -v bash $PullSampleHashes $ProbandGenerator.Jhash "$ProbandGenerator".temp $MutantMinCov $MaxHashDepth > "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList 
    wait
    
fi
########################################################################################

wc -l "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList | awk '{print $1}'
if [ $(wc -l "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList | awk '{print $1}') -eq "0" ]; then 
	echo "ERROR: No mutant hashes identfied, either the files are exactly the same of something went wrong in previous step" 
	exit 100
fi

######################__RUFUS_FILTER__##################################################
echo "starting RUFUS filter"

echo "_arg_fastqA = $_arg_fastqA"
echo "_arg_fastqB = $_arg_fastqB"
if [ -e "$ProbandGenerator".Mutations.Mate1.fastq ]
then
	echo "skipping filter"
else
	if [ -z $_arg_fastqA ]
	then
	    if [ -e "$ProbandGenerator".temp.mate1.fastq ]; then 
	    	rm  "$ProbandGenerator".temp.mate1.fastq
	    fi
	    if [ -e "$ProbandGenerator".temp.mate2.fastq ]; then
                rm  "$ProbandGenerator".temp.mate2.fastq
            fi
	    mkfifo "$ProbandGenerator".temp.mate1.fastq "$ProbandGenerator".temp.mate2.fastq
	    /usr/bin/time -v  bash "$ProbandGenerator" | "$RDIR"/bin/PassThroughSamCheck.stranded "$ProbandGenerator".filter.chr  "$ProbandGenerator".temp >  "$ProbandGenerator".temp &
	    /usr/bin/time -v   $RUFUSfilterFASTQ  "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList "$ProbandGenerator".temp.mate1.fastq "$ProbandGenerator".temp.mate2.fastq "$ProbandGenerator" "$K" 13 1 "$(echo $Threads -2 | bc)" &
	    wait
	else
		echo "Running RUFUS.filter from paired FASTQ files"
	
		
		echo "$RUFUSfilterFASTQ "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList  <(bash $_arg_fastqA) <(bash $_arg_fastqB) "$ProbandGenerator" $K 13 1 "$(echo $Threads -2 | bc)""

		#$RUFUSfilterFASTQ "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList  <(bash $_arg_fastqA) <(bash $_arg_fastqB) "$ProbandGenerator" $K 13 1 "$(echo $Threads -2 | bc)"
		echo $RUFUSfilterFASTQ "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList  $_arg_fastqA $_arg_fastqB "$ProbandGenerator" $K 13 1 "$(echo $Threads -2 | bc)"
		$RUFUSfilterFASTQ "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList  $_arg_fastqA $_arg_fastqB "$ProbandGenerator" $K 13 1 "$(echo $Threads -2 | bc)"
		wait
	fi
fi

if [ $(wc -l "$ProbandGenerator".Mutations.Mate1.fastq) -eq "0" ]; then
	echo "ERROR: No mutant fastq reads idenfied.  Either the files are exactly the same of something went wrong in previous step" 
	exit 100
fi


if [ -e "$ProbandGenerator".Mutations.fastq.bam ]
then 
	echo "skipping mapping mates" 
else
	
	#cat "$ProbandGenerator".Mutations.Mate1.fastq "$ProbandGenerator".Mutations.Mate2.fastq > "$ProbandGenerator".Mutations.fastq
        #$bwa mem -t $Threads $_arg_ref_bwa <( cat "$ProbandGenerator".Mutations.Mate1.fastq "$ProbandGenerator".Mutations.Mate2.fastq)  | samtools sort -T "$ProbandGenerator".Mutations.fastq -O bam - > "$ProbandGenerator".Mutations.fastq.bam
        $fastp -i "$ProbandGenerator".Mutations.Mate1.fastq -I "$ProbandGenerator".Mutations.Mate2.fastq -m -o "$ProbandGenerator".Mutations.Mate1.fastq.fastp.fastq -O "$ProbandGenerator".Mutations.Mate2.fastq.fastp.fastq --merged_out "$ProbandGenerator".Mutations.Mate1.fastq.merged.fastq
	$bwa mem -t $Threads $_arg_ref_bwa "$ProbandGenerator".Mutations.Mate1.fastq.fastp.fastq "$ProbandGenerator".Mutations.Mate2.fastq.fastp.fastq  | $samblaster | samtools sort -T "$ProbandGenerator".Mutations.fastq -O bam - > "$ProbandGenerator".Mutations.fastq.pared.bam
	$bwa mem -t $Threads $_arg_ref_bwa "$ProbandGenerator".Mutations.Mate1.fastq.merged.fastq  | samtools sort -T "$ProbandGenerator".Mutations.fastq -O bam - > "$ProbandGenerator".Mutations.fastq.merged.bam
	samtools merge "$ProbandGenerator".Mutations.fastq.bam "$ProbandGenerator".Mutations.fastq.merged.bam "$ProbandGenerator".Mutations.fastq.pared.bam 
	#$bwa mem -t $Threads $_arg_ref_bwa "$ProbandGenerator".Mutations.Mate1.fastq "$ProbandGenerator".Mutations.Mate2.fastq  | $samblaster | samtools sort -T "$ProbandGenerator".Mutations.fastq -O bam - > "$ProbandGenerator".Mutations.fastq.bam
	samtools index "$ProbandGenerator".Mutations.fastq.merged.bam
	samtools index "$ProbandGenerator".Mutations.fastq.pared.bam
	samtools index "$ProbandGenerator".Mutations.fastq.bam
fi
########################################################################################
if [ $_arg_saliva == "TRUE" ]
then 
	echo "saliva sample provided, only using aligned mutant contigs" 
	mv "$ProbandGenerator".Mutations.fastq.bam "$ProbandGenerator".Mutations.fastq.FULL.bam 
	samtools index "$ProbandGenerator".Mutations.fastq.FULL.bam
	rm "$ProbandGenerator".Mutations.fastq.bam.bai
	samtools view -F 12 -b "$ProbandGenerator".Mutations.fastq.FULL.bam > "$ProbandGenerator".Mutations.fastq.bam
	samtools index "$ProbandGenerator".Mutations.fastq.bam
fi



if [ $( samtools view "$ProbandGenerator".Mutations.fastq.bam | wc -l ) -eq "0" ]; then
        echo "ERROR: BWA failed on "$ProbandGenerator".Mutations.fastq.  Either the files are exactly the same of something went wrong in previous step" 
        exit 100
fi 

###################__RUFUS_OVERLAP__#############################################
if [ -e ./runanywayIntermediates/"$ProbandGenerator".V2.overlap.hashcount.fastq.bam.vcf ]
then
    echo "Skipping overlap step"
else
    echo "Starting RUFUS overlap"
    echo "/usr/bin/time bash  $RUFUSOverlap "$_arg_ref" "$ProbandGenerator".Mutations.fastq 3 $ProbandGenerator "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList "$K" "$Threads" "$MaxAlleleSize" "$ProbandGenerator".Jhash "$parentsString" "$_arg_ref_bwa" "$_arg_refhash""
    /usr/bin/time bash  $RUFUSOverlap "$_arg_ref" "$ProbandGenerator".Mutations.fastq 3 $ProbandGenerator "$ProbandGenerator".k"$K"_c"$MutantMinCov".HashList "$K" "$Threads" "$MaxAlleleSize" "$ProbandGenerator".Jhash "$parentsString" "$_arg_ref_bwa" "$_arg_refhash"
    echo "Done with RUFUS overlap"
fi
##############################################################################################


############################__RUFALU__#############################
#aluList=$RDIR/resources/primate_non-LTR_Retrotransposon.fasta
#fastaHackPath=$RDIR/bin/externals/fastahack/src/fastahack_project/bin/tools/fastahack
#jellyfishPath=$RDIR/src/externals/jellyfish-2.2.5/bin/jellyfish
#echo "$RufAlu $ProbandFileName $ProbandGenerator.V2.overlap.hashcount.fastq  $aluList $_arg_ref $jellyfishPath $(echo $ParentFileNames) "
#$RufAlu $_arg_subject $_arg_subject.generator.V2.overlap.hashcount.fastq  $aluList $_arg_ref $fastaHackPath $jellyfishPath  $(echo $ParentFileNames)
########################################################################


echo "cleaning up VCF"

grep ^# $ProbandGenerator.V2.overlap.hashcount.fastq.bam.vcf> ./Intermediates/$ProbandGenerator.V2.overlap.hashcount.fastq.bam.sorted.vcf
grep -v  ^# $ProbandGenerator.V2.overlap.hashcount.fastq.bam.vcf | sort -k1,1 -k2,2n >> ./Intermediates/$ProbandGenerator.V2.overlap.hashcount.fastq.bam.sorted.vcf
bash $RDIR/scripts/VilterAutosomeOnly ./Intermediates/$ProbandGenerator.V2.overlap.hashcount.fastq.bam.sorted.vcf > ./$ProbandGenerator.V2.overlap.hashcount.fastq.bam.FINAL.vcf

bgzip -f ./$ProbandGenerator.V2.overlap.hashcount.fastq.bam.FINAL.vcf
tabix ./$ProbandGenerator.V2.overlap.hashcount.fastq.bam.FINAL.vcf.gz

echo "done with everything"
exit 0
# ] <-- needed because of Argbash
