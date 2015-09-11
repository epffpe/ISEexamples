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

#ifndef H_simprim_ver_auxlibM_x___f_f_H
#define H_simprim_ver_auxlibM_x___f_f_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class simprim_ver_auxlibM_x___f_f : public HSim__s5{
public: 
    simprim_ver_auxlibM_x___f_f(const char *instname);
    ~simprim_ver_auxlibM_x___f_f();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    bool simprim_ver_auxlibM_x___f_f::tc_c_01();
    bool simprim_ver_auxlibM_x___f_f::tc_c_11();
    bool simprim_ver_auxlibM_x___f_f::tc_c_21();
    bool simprim_ver_auxlibM_x___f_f::tc_c_31();
    bool simprim_ver_auxlibM_x___f_f::tc_c_41();
    bool simprim_ver_auxlibM_x___f_f::tc_c_51();
    bool simprim_ver_auxlibM_x___f_f::tc_c_60();
    HSim__s1 us[22];
    HSim__s3 uv[4];
    HSimVlogParam up[4];
};

#endif
