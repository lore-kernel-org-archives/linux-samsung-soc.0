From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 1/4] drm: exynos: Add infrastructure to support FIMD post
 processors
Date: Mon, 31 Mar 2014 14:04:06 +0200
Message-ID: <533959B6.4070708@samsung.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
 <1395238975-24600-2-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:23307 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752623AbaCaMEM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 31 Mar 2014 08:04:12 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3A009VAUUWIS80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 31 Mar 2014 13:04:09 +0100 (BST)
In-reply-to: <1395238975-24600-2-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, sw0312.kim@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, marcheu@chromium.org, Shirish S <s.shirish@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Ajay,


On 03/19/2014 03:22 PM, Ajay Kumar wrote:
> Exynos variants support post pocessors(PP) for FIMD (MDNIE and IELCD)
> which work closely with fimd. These post processors have strict
> dependency on FIMD for poweron/poweroff. This patch adds an
> infrastructure in FIMD driver to accomodate such devices.
> 
> Added structure definition for FIMD PP and interfaces from FIMD
> driver to control FIMD PP.
> 
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Shirish S <s.shirish@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 162 +++++++++++++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_fimd_pp.h  |  52 ++++++++++
>  include/video/samsung_fimd.h             |   6 +-
>  3 files changed, 219 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/exynos/exynos_fimd_pp.h
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> index a5511be..a584d8e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -30,6 +30,7 @@
>  #include "exynos_drm_fbdev.h"
>  #include "exynos_drm_crtc.h"
>  #include "exynos_drm_iommu.h"
> +#include "exynos_fimd_pp.h"
>  
>  /*
>   * FIMD stands for Fully Interactive Mobile Display and
> @@ -113,11 +114,14 @@ struct fimd_context {
>  	void __iomem			*regs;
>  	struct drm_display_mode		mode;
>  	struct fimd_win_data		win_data[WINDOWS_NR];
> +	struct list_head		fimd_pp_list;
>  	unsigned int			default_win;
>  	unsigned long			irq_flags;
>  	u32				vidcon0;
>  	u32				vidcon1;
>  	bool				suspended;
> +	bool				enable_pp;
> +	bool				pp_running;
>  	int				pipe;
>  	wait_queue_head_t		wait_vsync_queue;
>  	atomic_t			wait_vsync_event;
> @@ -145,6 +149,12 @@ static inline struct fimd_driver_data *drm_fimd_get_driver_data(
>  	return (struct fimd_driver_data *)of_id->data;
>  }
>  
> +void fimd_add_pp_to_list(struct fimd_context *ctx,
> +			struct exynos_fimd_pp *pp)
> +{
> +	list_add_tail(&pp->list, &ctx->fimd_pp_list);
> +}
> +
>  static int fimd_mgr_initialize(struct exynos_drm_manager *mgr,
>  			struct drm_device *drm_dev)
>  {
> @@ -214,17 +224,49 @@ static void fimd_mode_set(struct exynos_drm_manager *mgr,
>  		const struct drm_display_mode *in_mode)
>  {
>  	struct fimd_context *ctx = mgr->ctx;
> +	struct exynos_fimd_pp *pp_display;
>  
>  	drm_mode_copy(&ctx->mode, in_mode);
> +
> +	/* mode_set for the post processors*/
> +	list_for_each_entry(pp_display, &ctx->fimd_pp_list, list)
> +		if (pp_display->ops->mode_set)
> +			pp_display->ops->mode_set(pp_display->ctx, in_mode);
> +}
> +
> +static int fimd_wait_till_per_frame_off(struct fimd_context *ctx)
> +{
> +	unsigned int val = readl(ctx->regs + VIDCON0);
> +	int count = 10;
> +
> +	val &= ~(VIDCON0_ENVID_F);
> +	writel(val, ctx->regs + VIDCON0);
> +
> +	while (count) {
> +		val = readl(ctx->regs + VIDCON0);
> +		if ((val & VIDCON0_ENVID_F) == 0)
> +			break;
> +		mdelay(17);

Do we really need mdelay here? This function is not called in atomic
context, is it?


> +		count--;
> +	}
> +
> +	if (count == 0) {
> +		DRM_ERROR("FIMD per frame switch off TIMEDOUT\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
>  }

Have you tried to use interrupts/completion instead of busy-waiting
approach?

>  
>  static void fimd_commit(struct exynos_drm_manager *mgr)
>  {
>  	struct fimd_context *ctx = mgr->ctx;
>  	struct drm_display_mode *mode = &ctx->mode;
> +	struct exynos_fimd_pp *pp_display;
>  	struct fimd_driver_data *driver_data;
>  	u32 val, clkdiv, vidcon1;
>  	int hblank, vblank, vsync_len, vbpd, vfpd, hsync_len, hbpd, hfpd;
> +	int ret = 0;
>  
>  	driver_data = ctx->driver_data;
>  	if (ctx->suspended)
> @@ -234,6 +276,30 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>  	if (mode->htotal == 0 || mode->vtotal == 0)
>  		return;
>  
> +	/* The FIMD and the post processor(PP) poweroff calls below are needed
> +	 * here to make sure that fimd_commit doesn't switch on the PPs twice
> +	 * in a row. For proper working we need to keep fimd, and the PPs
> +	 * off, before we start again. This flag "pp_running" will also help
> +	 * in syncing any of the clock enable/disable calls in PP routines.
> +	 */
> +	if (ctx->enable_pp && ctx->pp_running) {
> +		if (fimd_wait_till_per_frame_off(ctx))
> +			DRM_ERROR("failed to switch off fimd per frame\n");
> +		list_for_each_entry_reverse(pp_display, &ctx->fimd_pp_list,
> +									list) {
> +			if (pp_display->ops->power_off) {
> +				ret = pp_display->ops->
> +						power_off(pp_display->ctx);
> +				if (ret) {
> +					DRM_ERROR("fimd_pp switch off fail\n");
> +					ctx->enable_pp = false;

Resetting enable_pp on power ops failures prevents disabling
DP_MDNIE_CLKCON clock on fimd power off.

> +				} else {
> +					ctx->pp_running = false;
> +				}
> +			}
> +		}
> +	}
> +

By the way, content of this big conditional maps easily to crtc and
encoder/bridge callbacks:
fimd_wait_till_per_frame_off: could be in drm_crtc_helper_funcs::prepare
power_off: could be in drm_(encoder|bridge)_helper_funcs::disable

It is just another argument for looking for common interface to
implement such blocks in more generic way, now we will have
drm_encoder, drm_bridge and exynos_fimd_pp implementing very similar
interfaces.


>  	/* setup polarity values */
>  	vidcon1 = ctx->vidcon1;
>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> @@ -286,10 +352,34 @@ static void fimd_commit(struct exynos_drm_manager *mgr)
>  	else
>  		val &= ~VIDCON0_CLKDIR;	/* 1:1 clock */
>  
> +	writel(val, ctx->regs + VIDCON0);
> +
> +	if (ctx->enable_pp && !ctx->pp_running) {
> +		/* set VCLK Free run control */
> +		val = readl(ctx->regs + VIDCON0);
> +		val |= VIDCON0_VCLKFREE;
> +		writel(val, ctx->regs + VIDCON0);
> +
> +		/* post processor setup and poweron*/
> +		list_for_each_entry(pp_display, &ctx->fimd_pp_list, list) {
> +			if (pp_display->ops->power_on) {
> +				ret = pp_display->ops->
> +						power_on(pp_display->ctx);
> +				if (ret) {
> +					DRM_ERROR("fimd_pp poweron failed\n");
> +					ctx->enable_pp = false;
> +				} else {
> +					ctx->pp_running = true;
> +				}
> +			}
> +		}
> +	}
> +

The same comment applies here.

>  	/*
>  	 * fields of register with prefix '_F' would be updated
>  	 * at vsync(same as dma start)
>  	 */
> +	val = readl(ctx->regs + VIDCON0);
>  	val |= VIDCON0_ENVID | VIDCON0_ENVID_F;
>  	writel(val, ctx->regs + VIDCON0);
>  }
> @@ -749,6 +839,9 @@ static int fimd_poweron(struct exynos_drm_manager *mgr)
>  		goto lcd_clk_err;
>  	}
>  
> +	if (ctx->enable_pp)
> +		writel(MDNIE_CLK_ENABLE, ctx->regs + DP_MDNIE_CLKCON);
> +

Name suggests that enable_pp field is for whole post-processing and
MDNIE_CLK_ENABLE is MDNIE specific, it seems to be incorrect.

>  	/* if vblank was enabled status, enable it again. */
>  	if (test_and_clear_bit(0, &ctx->irq_flags)) {
>  		ret = fimd_enable_vblank(mgr);
> @@ -776,6 +869,9 @@ bus_clk_err:
>  static int fimd_poweroff(struct exynos_drm_manager *mgr)
>  {
>  	struct fimd_context *ctx = mgr->ctx;
> +	struct exynos_fimd_pp *pp_display;
> +	int ret = 0;
> +
>  
>  	if (ctx->suspended)
>  		return 0;
> @@ -787,6 +883,27 @@ static int fimd_poweroff(struct exynos_drm_manager *mgr)
>  	 */
>  	fimd_window_suspend(mgr);
>  
> +	if (ctx->enable_pp && ctx->pp_running) {
> +		if (fimd_wait_till_per_frame_off(ctx))
> +			DRM_ERROR("failed to switch off fimd per frame\n");
> +		list_for_each_entry_reverse(pp_display, &ctx->fimd_pp_list,
> +									list) {
> +			if (pp_display->ops->power_off) {
> +				ret = pp_display->ops->
> +						power_off(pp_display->ctx);
> +				if (ret) {
> +					DRM_ERROR("fimd_pp switch off fail\n");
> +					ctx->enable_pp = false;
> +				} else {
> +					ctx->pp_running = false;
> +				}
> +			}
> +		}
> +	}

The same loop again, separate function could be used instead.

> +
> +	if (ctx->enable_pp)
> +		writel(0, ctx->regs + DP_MDNIE_CLKCON);
> +

Again, mixing different level of abstraction.


>  	clk_disable_unprepare(ctx->lcd_clk);
>  	clk_disable_unprepare(ctx->bus_clk);
>  
> @@ -815,6 +932,47 @@ static void fimd_dpms(struct exynos_drm_manager *mgr, int mode)
>  	}
>  }
>  
> +static int fimd_set_property(void *in_ctx, struct drm_property *property,
> +								uint64_t val)
> +{
> +	struct fimd_context *ctx = in_ctx;
> +	struct exynos_fimd_pp *pp_display;
> +	int ret;
> +
> +	list_for_each_entry(pp_display, &ctx->fimd_pp_list, list) {
> +		if (pp_display->ops->set_property) {
> +			ret = pp_display->ops->set_property(ctx->drm_dev,
> +					pp_display->ctx, property, val);
> +			if (ret) {
> +				DRM_ERROR("pp set_property failed.\n");
> +				return ret;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int fimd_set_gamma(void *in_ctx, u16 *r, u16 *g, u16 *b,
> +					uint32_t start, uint32_t size)
> +{
> +	struct fimd_context *ctx = in_ctx;
> +	struct exynos_fimd_pp *pp_display;
> +	int ret;
> +
> +	list_for_each_entry(pp_display, &ctx->fimd_pp_list, list) {
> +		if (pp_display->ops->set_property)

s/property/gamma/;

> +			ret = pp_display->ops->set_gamma(pp_display->ctx,
> +							r, g, b, start, size);
> +			if (ret) {
> +				DRM_ERROR("pp set_gamma failed.\n");
> +				return ret;
> +			}
> +	}
> +
> +	return 0;
> +}
> +
>  static struct exynos_drm_manager_ops fimd_manager_ops = {
>  	.dpms = fimd_dpms,
>  	.mode_fixup = fimd_mode_fixup,
> @@ -826,6 +984,8 @@ static struct exynos_drm_manager_ops fimd_manager_ops = {
>  	.win_mode_set = fimd_win_mode_set,
>  	.win_commit = fimd_win_commit,
>  	.win_disable = fimd_win_disable,
> +	.set_property = fimd_set_property,
> +	.set_gamma = fimd_set_gamma,
>  };

.set_property and .set_gamma fields are not present in
exynos_drm_manager_ops in exynos-drm-next-todo branch, I guess some
patches are missing.

>  
>  static struct exynos_drm_manager fimd_manager = {
> @@ -919,6 +1079,8 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
>  	init_waitqueue_head(&ctx->wait_vsync_queue);
>  	atomic_set(&ctx->wait_vsync_event, 0);
>  
> +	INIT_LIST_HEAD(&ctx->fimd_pp_list);
> +
>  	platform_set_drvdata(pdev, &fimd_manager);
>  
>  	fimd_manager.ctx = ctx;
> diff --git a/drivers/gpu/drm/exynos/exynos_fimd_pp.h b/drivers/gpu/drm/exynos/exynos_fimd_pp.h
> new file mode 100644
> index 0000000..528d3cb
> --- /dev/null
> +++ b/drivers/gpu/drm/exynos/exynos_fimd_pp.h
> @@ -0,0 +1,52 @@
> +/* drivers/gpu/drm/exynos/exynos_fimd_pp.h
> + *
> + * Copyright (C) 2014 Samsung Electronics Co.Ltd
> + *
> + * Header file for FIMD post processors.
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + *
> + */
> +
> +#ifndef __EXYNOS_FIMD_H__
> +#define __EXYNOS_FIMD_H__
> +
> +#include <drm/exynos_drm.h>
> +
> +/**
> + * Post Processor interfaces structure for DRM based FIMD.
> + *
> + * @power_on: setup the post processor.
> + * @power_off: power off the post processor.
> + * @mode_set: set video timings if needed by the post processor.
> + * @set_property: use crtc properties to set the post processor.
> + * @set_gamma: set gamma properties to post processor.
> + *
> + */
> +struct exynos_fimd_pp_ops {
> +	int (*power_on)(void *pp_ctx);
> +	int (*power_off)(void *pp_ctx);
> +	void (*mode_set)(void *pp_ctx, const struct drm_display_mode *in_mode);
> +	int (*set_property)(struct drm_device *drm_dev, void *pp_ctx,
> +				struct drm_property *property, uint64_t val);

I wonder if it would not be better to use drm_crtc instead of drm_device
here, it seems to be more consistent with drm_crtc_funcs:set_property.


Regards
Andrzej

> +	int (*set_gamma)(void *pp_ctx, u16 *r,
> +			u16 *g, u16 *b, uint32_t start, uint32_t size);
> +};
> +
> +/*
> + * Exynos FIMD post processor structure
> + * @list: the list entry
> + * @ops: pointer to callbacks for post processor specific functionality
> + * @ctx: A pointer to the post processor's implementation specific context
> + *
> + */
> +struct exynos_fimd_pp {
> +	struct list_head list;
> +	struct exynos_fimd_pp_ops *ops;
> +	void *ctx;
> +};
> +
> +#endif
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> index b039320..3ff7cad 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -60,7 +60,7 @@
>  #define VIDCON0_CLKVAL_F_SHIFT			6
>  #define VIDCON0_CLKVAL_F_LIMIT			0xff
>  #define VIDCON0_CLKVAL_F(_x)			((_x) << 6)
> -#define VIDCON0_VLCKFREE			(1 << 5)
> +#define VIDCON0_VCLKFREE			(1 << 5)
>  #define VIDCON0_CLKDIR				(1 << 4)
>  
>  #define VIDCON0_CLKSEL_MASK			(0x3 << 2)
> @@ -435,6 +435,10 @@
>  #define BLENDCON_NEW_8BIT_ALPHA_VALUE		(1 << 0)
>  #define BLENDCON_NEW_4BIT_ALPHA_VALUE		(0 << 0)
>  
> +/* DP_MDNIE_CLKCON */
> +#define DP_MDNIE_CLKCON				0x27c
> +#define MDNIE_CLK_ENABLE				0x3
> +
>  /* Notes on per-window bpp settings
>   *
>   * Value	Win0	 Win1	  Win2	   Win3	    Win 4
> 
