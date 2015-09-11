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

#ifndef H_simprim_ver_auxlibM_x___l_u_t4_H
#define H_simprim_ver_auxlibM_x___l_u_t4_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class simprim_ver_auxlibM_x___l_u_t4 : public HSim__s5{
public: 
    simprim_ver_auxlibM_x___l_u_t4(const char *instname);
    ~simprim_ver_auxlibM_x___l_u_t4();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    class cu0 : public HSimVlogTask{
    public: 
        HSim__s3 uv[3];
        cu0(simprim_ver_auxlibM_x___l_u_t4* arch );
        HSimVlogTaskCall * createTaskCall(HSim__s7 * process );
        void deleteTaskCall(HSimVlogTaskCall *p );
        void reset();
        void constructObject();
        int getSizeForArg(int argNumber);
        int getSize();
        HSim::VlogVarType getType();
        simprim_ver_auxlibM_x___l_u_t4* Arch ;
        HSimVector<HSimRegion *> activeInstanceList ;
        HSimVector<HSimRegion *>  availableTaskCallObjList ;
        ~cu0();
        bool disable(HSim__s7* proc);
    };
    cu0 u0;
    HSim__s1 us[10];
    HSim__s3 uv[2];
    HSimVlogParam up[2];
};

#endif
