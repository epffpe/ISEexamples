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

#ifndef H_unisim_ver_auxlibM_f_d_c_e_H
#define H_unisim_ver_auxlibM_f_d_c_e_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class unisim_ver_auxlibM_f_d_c_e : public HSim__s5{
public: 
    unisim_ver_auxlibM_f_d_c_e(const char *instname);
    ~unisim_ver_auxlibM_f_d_c_e();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    bool mp_c_1();
    HSim__s1 us[6];
    HSim__s3 uv[1];
    HSimVlogParam up[1];
};

#endif
