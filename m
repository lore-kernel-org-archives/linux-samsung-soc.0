From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] drm/bridge: add Silicon Image SiI9234 driver
Date: Sun, 13 Aug 2017 06:43:12 +0800
Message-ID: <201708130616.VVZcmxIK%fengguang.wu@intel.com>
References: <1501746323-5254-2-git-send-email-m.purski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="uAKRQypu60I7Lcqm"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1501746323-5254-2-git-send-email-m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kbuild-all-JC7UmRfGjtg@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Maciej Purski <m.purski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maciej,

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v4.13-rc4 next-20170811]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Maciej-Purski/add-Silicon-Image-SiI9234-driver/20170803-200255
base:   git://people.freedesktop.org/~airlied/linux.git drm-next
config: i386-randconfig-h0-08130402 (attached as .config)
compiler: gcc-6 (Debian 6.2.0-3) 6.2.0 20160901
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

   drivers/gpu//drm/bridge/sii9234.c: In function 'sii9234_mode_valid':
   drivers/gpu//drm/bridge/sii9234.c:909:18: warning: unused variable 'ctx' [-Wunused-variable]
     struct sii9234 *ctx = bridge_to_sii9234(bridge);
                     ^~~
   drivers/gpu//drm/bridge/sii9234.c: In function 'sii9234_mhl_tx_i2c_probe':
>> drivers/gpu//drm/bridge/sii9234.c:971:13: error: 'struct drm_bridge' has no member named 'of_node'
     ctx->bridge.of_node = dev->of_node;
                ^
   In file included from include/uapi/linux/stddef.h:1:0,
                    from include/linux/stddef.h:4,
                    from include/uapi/linux/posix_types.h:4,
                    from include/uapi/linux/types.h:13,
                    from include/linux/types.h:5,
                    from include/drm/bridge/mhl.h:18,
                    from drivers/gpu//drm/bridge/sii9234.c:26:
   drivers/gpu//drm/bridge/sii9234.c: At top level:
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'strcpy' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:390:2: note: in expansion of macro 'if'
     if (p_size == (size_t)-1 && q_size == (size_t)-1)
     ^~
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'kmemdup' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:380:2: note: in expansion of macro 'if'
     if (p_size < size)
     ^~
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'kmemdup' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:378:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(size) && p_size < size)
     ^~
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memchr_inv' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:369:2: note: in expansion of macro 'if'
     if (p_size < size)
     ^~
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memchr_inv' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:367:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(size) && p_size < size)
     ^~
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memchr' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:358:2: note: in expansion of macro 'if'
     if (p_size < size)
     ^~
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memchr' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:356:2: note: in expansion of macro 'if'
     if (__builtin_constant_p(size) && p_size < size)
     ^~
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memcmp' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:348:2: note: in expansion of macro 'if'
     if (p_size < size || q_size < size)
     ^~
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memcmp' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:345:3: note: in expansion of macro 'if'
      if (q_size < size)
      ^~
   include/linux/compiler.h:162:4: warning: '______f' is static but declared in inline function 'memcmp' which is not static
       ______f = {     \
       ^
   include/linux/compiler.h:154:23: note: in expansion of macro '__trace_if'
    #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                          ^~~~~~~~~~
   include/linux/string.h:343:3: note: in expansion of macro 'if'
      if (p_size < size)
      ^~

vim +971 drivers/gpu//drm/bridge/sii9234.c

   905	
   906	static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
   907						const struct drm_display_mode *mode)
   908	{
 > 909		struct sii9234 *ctx = bridge_to_sii9234(bridge);
   910	
   911		if (mode->clock > MHL1_MAX_CLK)
   912			return MODE_CLOCK_HIGH;
   913	
   914		return MODE_OK;
   915	}
   916	
   917	static const struct drm_bridge_funcs sii9234_bridge_funcs = {
   918		.mode_valid = sii9234_mode_valid,
   919	};
   920	
   921	static int sii9234_mhl_tx_i2c_probe(struct i2c_client *client,
   922						      const struct i2c_device_id *id)
   923	{
   924		struct i2c_adapter *adapter = to_i2c_adapter(client->dev.parent);
   925		struct sii9234 *ctx;
   926		struct device *dev = &client->dev;
   927		int ret;
   928	
   929		ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
   930		if (!ctx)
   931			return -ENOMEM;
   932	
   933		ctx->dev = dev;
   934	
   935		if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
   936			dev_err(dev, "I2C adapter lacks SMBUS feature\n");
   937			return -EIO;
   938		}
   939	
   940		mutex_init(&ctx->lock);
   941	
   942		ret = sii9234_init_resources(ctx, client);
   943		if (ret < 0) {
   944			dev_err(&client->dev, "failed to initialize sii9234 resources\n");
   945			return ret;
   946		}
   947		ret = sii9234_hw_on(ctx);
   948		if (ret) {
   949			dev_err(&client->dev, "failed to enable power\n");
   950			goto err_resource;
   951		}
   952		sii9234_hw_reset(ctx);
   953	
   954		if (!client->irq) {
   955			dev_err(dev, "no irq provided\n");
   956			return -EINVAL;
   957		}
   958		irq_set_status_flags(client->irq, IRQ_NOAUTOEN);
   959		ret = devm_request_threaded_irq(dev, client->irq, NULL,
   960						sii9234_irq_thread,
   961						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
   962						"sii9234", ctx);
   963		if (ret < 0) {
   964			dev_err(dev, "failed to install IRQ handler\n");
   965			return ret;
   966		}
   967	
   968		i2c_set_clientdata(client, ctx);
   969	
   970		ctx->bridge.funcs = &sii9234_bridge_funcs;
 > 971		ctx->bridge.of_node = dev->of_node;
   972		drm_bridge_add(&ctx->bridge);
   973	
   974		sii9234_cable_in(ctx);
   975	
   976		return 0;
   977	
   978	err_resource:
   979		sii9234_deinit_resources(ctx);
   980	
   981		return ret;
   982	}
   983	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--uAKRQypu60I7Lcqm
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
ujVUM9og/D98jlMPWHwBAA==

--uAKRQypu60I7Lcqm--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
