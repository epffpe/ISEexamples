////////////////////////////////////////////////////////////////////////////////
//   ____  ____  
//  /   /\/   /  
// /___/  \  /   
// \   \   \/    
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /___/   /\   
// \   \  /  \  
//  \___\/\___\ 
////////////////////////////////////////////////////////////////////////////////

#ifndef H_simprim_ver_auxlibMmux_H
#define H_simprim_ver_auxlibMmux_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class simprim_ver_auxlibMmux: public HSimVlogUdpBase {

public:
    simprim_ver_auxlibMmux(const char *instname);
    ~simprim_ver_auxlibMmux();
    virtual void archImplement();
    HSim__s1 out;
    HSim__s1 ina;
    HSim__s1 inb;
    HSim__s1 sel;
    HSim__s2 * driver_out;
    static const char s_LvlTableOutputs[];
    static const unsigned int s_MultArray[];
};

#endif
