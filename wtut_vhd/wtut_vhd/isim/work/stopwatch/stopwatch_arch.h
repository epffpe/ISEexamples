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

#ifndef H_Work_stopwatch_stopwatch_arch_H
#define H_Work_stopwatch_stopwatch_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_stopwatch_stopwatch_arch: public HSim__s6 {
public:

    HSim__s1 SE[12];

    HSim__s1 SA[26];
HSimConstraints *c253;
  char *t254;
  char t255;
    Work_stopwatch_stopwatch_arch(const char * name);
    ~Work_stopwatch_stopwatch_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_stopwatch_stopwatch_arch(const char *name);

#endif
