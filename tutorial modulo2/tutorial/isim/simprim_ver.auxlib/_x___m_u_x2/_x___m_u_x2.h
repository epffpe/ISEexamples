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

#ifndef H_simprim_ver_auxlibM_x___m_u_x2_H
#define H_simprim_ver_auxlibM_x___m_u_x2_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class simprim_ver_auxlibM_x___m_u_x2 : public HSim__s5{
public: 
    simprim_ver_auxlibM_x___m_u_x2(const char *instname);
    ~simprim_ver_auxlibM_x___m_u_x2();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    HSim__s1 us[4];
    HSimVlogParam up[1];
};

#endif
