/** THIS IS AN AUTOMATICALLY GENERATED FILE.  DO NOT MODIFY
 * BY HAND!!
 *
 * Generated by lcm-gen
 **/

#include <stdint.h>
#include <stdlib.h>
#include <lcm/lcm_coretypes.h>
#include <lcm/lcm.h>

#ifndef _bot_procman_info_t_h
#define _bot_procman_info_t_h

#ifdef __cplusplus
extern "C" {
#endif

#include "lcmtypes/bot_procman_deputy_cmd_t.h"
typedef struct _bot_procman_info_t bot_procman_info_t;
struct _bot_procman_info_t
{
    int64_t    utime;
    char*      host;
    float      cpu_load;
    int64_t    phys_mem_total_bytes;
    int64_t    phys_mem_free_bytes;
    int64_t    swap_total_bytes;
    int64_t    swap_free_bytes;
    int32_t    ncmds;
    bot_procman_deputy_cmd_t *cmds;
};

bot_procman_info_t   *bot_procman_info_t_copy(const bot_procman_info_t *p);
void bot_procman_info_t_destroy(bot_procman_info_t *p);

typedef struct _bot_procman_info_t_subscription_t bot_procman_info_t_subscription_t;
typedef void(*bot_procman_info_t_handler_t)(const lcm_recv_buf_t *rbuf,
             const char *channel, const bot_procman_info_t *msg, void *user);

int bot_procman_info_t_publish(lcm_t *lcm, const char *channel, const bot_procman_info_t *p);
bot_procman_info_t_subscription_t* bot_procman_info_t_subscribe(lcm_t *lcm, const char *channel, bot_procman_info_t_handler_t f, void *userdata);
int bot_procman_info_t_unsubscribe(lcm_t *lcm, bot_procman_info_t_subscription_t* hid);
int bot_procman_info_t_subscription_set_queue_capacity(bot_procman_info_t_subscription_t* subs,
                              int num_messages);


int  bot_procman_info_t_encode(void *buf, int offset, int maxlen, const bot_procman_info_t *p);
int  bot_procman_info_t_decode(const void *buf, int offset, int maxlen, bot_procman_info_t *p);
int  bot_procman_info_t_decode_cleanup(bot_procman_info_t *p);
int  bot_procman_info_t_encoded_size(const bot_procman_info_t *p);

// LCM support functions. Users should not call these
int64_t __bot_procman_info_t_get_hash(void);
int64_t __bot_procman_info_t_hash_recursive(const __lcm_hash_ptr *p);
int     __bot_procman_info_t_encode_array(void *buf, int offset, int maxlen, const bot_procman_info_t *p, int elements);
int     __bot_procman_info_t_decode_array(const void *buf, int offset, int maxlen, bot_procman_info_t *p, int elements);
int     __bot_procman_info_t_decode_array_cleanup(bot_procman_info_t *p, int elements);
int     __bot_procman_info_t_encoded_array_size(const bot_procman_info_t *p, int elements);
int     __bot_procman_info_t_clone_array(const bot_procman_info_t *p, bot_procman_info_t *q, int elements);

#ifdef __cplusplus
}
#endif

#endif