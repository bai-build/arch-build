# module var
export MED_ROOT_DIR=/opt/salome

# local vars
_med_pythonver=2.7
_med_paraviewver=5.0
_med_path=$MED_ROOT_DIR/bin/salome
_med_librarypath=$MED_ROOT_DIR/lib/salome
_med_pythonpath=$MED_ROOT_DIR/lib/python${_med_pythonver}/site-packages/salome
_med_paraview_pythonpath="/usr/lib/paraview-${_med_paraviewver}/site-packages/:/usr/lib/paraview-${_med_paraviewver}/site-packages/vtk"
_med_paraview_librarypath="/usr/lib/paraview-${_med_paraviewver}"

# PYTHONPATH
if [[ $PYTHONPATH != ${_med_pythonpath} && $PYTHONPATH != *:${_med_pythonpath} && $PYTHONPATH != ${_med_pythonpath}:* && $PYTHONPATH != *:${_med_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_med_pythonpath}
    else
	export PYTHONPATH=${_med_pythonpath}:$PYTHONPATH
    fi
fi
if [[ $PYTHONPATH != ${_med_paraview_pythonpath} && $PYTHONPATH != *:${_med_paraview_pythonpath} && $PYTHONPATH != ${_med_paraview_pythonpath}:* && $PYTHONPATH != *:${_med_paraview_pythonpath}:* ]]; then
    if [[ -z "$PYTHONPATH" ]]; then
	export PYTHONPATH=${_med_paraview_pythonpath}
    else
	export PYTHONPATH=${_med_paraview_pythonpath}:$PYTHONPATH
    fi
fi

# LD_LIBRARY_PATH
if [[ $LD_LIBRARY_PATH != ${_med_librarypath} && $LD_LIBRARY_PATH != *:${_med_librarypath} && $LD_LIBRARY_PATH != ${_med_librarypath}:* && $LD_LIBRARY_PATH != *:${_med_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_med_librarypath}
    else
	export LD_LIBRARY_PATH=${_med_librarypath}:$LD_LIBRARY_PATH
    fi
fi
if [[ $LD_LIBRARY_PATH != ${_med_paraview_librarypath} && $LD_LIBRARY_PATH != *:${_med_paraview_librarypath} && $LD_LIBRARY_PATH != ${_med_paraview_librarypath}:* && $LD_LIBRARY_PATH != *:${_med_paraview_librarypath}:* ]]; then
    if [[ -z "$LD_LIBRARY_PATH" ]]; then
	export LD_LIBRARY_PATH=${_med_paraview_librarypath}
    else
	export LD_LIBRARY_PATH=${_med_paraview_librarypath}:$LD_LIBRARY_PATH
    fi
fi

# PATH
if [[ $PATH != ${_med_path} && $PATH != *:${_med_path} && $PATH != ${_med_path}:* && $PATH != *:${_med_path}:* ]]; then
    if [[ -z "$PATH" ]]; then
	export PATH=${_med_path}
    else
	export PATH=${_med_path}:$PATH
    fi
fi
