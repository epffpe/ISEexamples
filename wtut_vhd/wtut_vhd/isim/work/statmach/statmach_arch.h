////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_statmach_statmach_arch_H
#define H_Work_statmach_statmach_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_statmach_statmach_arch: public HSim__s6 {
public:

    HSim__s1 SE[6];

HSim__s4 Cp;
HSim__s4 Cw;
HSim__s4 CD;
HSim__s4 CK;
HSim__s4 CS;
HSim__s4 CZ;
    HSim__s1 SA[2];
    Work_statmach_statmach_arch(const char * name);
    ~Work_statmach_statmach_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_statmach_statmach_arch(const char *name);

#endif
