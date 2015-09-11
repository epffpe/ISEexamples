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

#ifndef H_Work_led_control_led_control_arch_H
#define H_Work_led_control_led_control_arch_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_led_control_led_control_arch: public HSim__s6 {
public:

    HSim__s1 SE[8];

    HSim__s1 SA[4];
  char *t225;
    Work_led_control_led_control_arch(const char * name);
    ~Work_led_control_led_control_arch();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_led_control_led_control_arch(const char *name);

#endif
