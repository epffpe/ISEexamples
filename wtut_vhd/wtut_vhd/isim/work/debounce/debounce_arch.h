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

#ifndef H_Work_debounce_debounce_arch_H
#define H_Work_debounce_debounce_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_debounce_debounce_arch: public HSim__s6 {
public:

    HSim__s1 SE[3];

    HSim__s1 SA[3];
  char t193;
  char t194;
  char t195;
    Work_debounce_debounce_arch(const char * name);
    ~Work_debounce_debounce_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_debounce_debounce_arch(const char *name);

#endif
