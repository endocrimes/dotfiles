# Machine specific configuration
#
if [[ `uname` == 'Linux' ]]
then
  export LINUX=1
else
  export LINUX=
fi

if [[ `uname` == 'Darwin' ]]
then
  export OSX=1
else
  export OSX=
fi
