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

#ifndef H_unisim_ver_auxlibM_l_u_t3_H
#define H_unisim_ver_auxlibM_l_u_t3_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class unisim_ver_auxlibM_l_u_t3 : public HSim__s5{
public: 
    unisim_ver_auxlibM_l_u_t3(const char *instname);
    ~unisim_ver_auxlibM_l_u_t3();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    class cu0 : public HSimVlogTask{
    public: 
        HSim__s3 uv[3];
        cu0(unisim_ver_auxlibM_l_u_t3* arch );
        HSimVlogTaskCall * createTaskCall(HSim__s7 * process );
        void deleteTaskCall(HSimVlogTaskCall *p );
        void reset();
        void constructObject();
        int getSizeForArg(int argNumber);
        int getSize();
        HSim::VlogVarType getType();
        unisim_ver_auxlibM_l_u_t3* Arch ;
        HSimVector<HSimRegion *> activeInstanceList ;
        HSimVector<HSimRegion *>  availableTaskCallObjList ;
        ~cu0();
        bool disable(HSim__s7* proc);
    };
    cu0 u0;
    HSim__s2 *driver_us0;
    HSim__s1 us[4];
    HSim__s3 uv[1];
    HSimVlogParam up[1];
};

#endif
