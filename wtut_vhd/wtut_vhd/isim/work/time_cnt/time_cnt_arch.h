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

#ifndef H_Work_time_cnt_time_cnt_arch_H
#define H_Work_time_cnt_time_cnt_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_time_cnt_time_cnt_arch: public HSim__s6 {
public:

    HSim__s1 SE[6];

    HSim__s1 SA[3];
HSimConstraints *c203;
  char *t204;
    Work_time_cnt_time_cnt_arch(const char * name);
    ~Work_time_cnt_time_cnt_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_time_cnt_time_cnt_arch(const char *name);

#endif
