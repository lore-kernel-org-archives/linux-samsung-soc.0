From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v5 RESEND 5/8] drm/exynos: fimc: Convert driver to IPP
 v2 core API
Date: Thu, 09 Nov 2017 13:45:05 +0900
Message-ID: <5A03DD51.90706@samsung.com>
References: <20171108094147.25854-6-m.szyprowski@samsung.com>
        <CGME20171108120103eucas1p1481c1c17b234717c616fa5465a3987dd@eucas1p1.samsung.com>
        <20171108120055.13538-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:17433 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751472AbdKIEpI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Nov 2017 23:45:08 -0500
In-reply-to: <20171108120055.13538-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>, Hoegeun Kwon <hoegeun.kwon@samsung.com>

Also warnigs,

WARNING: line over 80 characters
#145: FILE: drivers/gpu/drm/exynos/exynos_drm_drv.c:299:
+				component_match_add(dev, &match, compare_dev, d);

WARNING: please, no spaces at the start of a line
#2702: FILE: drivers/gpu/drm/exynos/exynos_drm_fimc.c:730:
+     struct drm_exynos_ipp_task_rect *src, struct drm_exynos_ipp_task_rect *dst)$

WARNING: 'ture' may be misspelled - perhaps 'true'?
#2975: FILE: drivers/gpu/drm/exynos/exynos_drm_fimc.c:1003:
+	/* If set ture, we can save jpeg about screen */

WARNING: line over 80 characters
#3098: FILE: drivers/gpu/drm/exynos/exynos_drm_fimc.c:1126:
+			   DRM_EXYNOS_IPP_CAP_SCALE | DRM_EXYNOS_IPP_CAP_CONVERT,

Thanks,
Inki Dae

2017년 11월 08일 21:00에 Marek Szyprowski 이(가) 쓴 글:
> This patch adapts Exynos DRM FIMC driver to new IPP v2 core API.
> The side effect of this conversion is a switch to driver component API
> to register properly in the Exynos DRM core.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This is a proper v5 version, by mistake I posted unfinished patch in the
> "[PATCH v5 0/8] Exynos DRM: rewrite IPP subsystem and userspace API" patchset.
> ---
>  drivers/gpu/drm/exynos/Kconfig           |    2 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |    7 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |    9 +
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c | 3170 +++++++++++++-----------------
>  drivers/gpu/drm/exynos/exynos_drm_fimc.h |   23 -
>  5 files changed, 1388 insertions(+), 1823 deletions(-)
>  rewrite drivers/gpu/drm/exynos/exynos_drm_fimc.c (47%)
>  delete mode 100644 drivers/gpu/drm/exynos/exynos_drm_fimc.h
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 9b66a9838dca..73f06a3a8bec 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -99,7 +99,7 @@ config DRM_EXYNOS_IPP
>  
>  config DRM_EXYNOS_FIMC
>  	bool "FIMC"
> -	depends on BROKEN && MFD_SYSCON
> +	select DRM_EXYNOS_IPP
>  	help
>  	  Choose this option if you want to use Exynos FIMC for DRM.
>  
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 72344b74387d..3bd671a5620c 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -219,6 +219,7 @@ struct exynos_drm_driver_info {
>  #define DRM_COMPONENT_DRIVER	BIT(0)	/* supports component framework */
>  #define DRM_VIRTUAL_DEVICE	BIT(1)	/* create virtual platform device */
>  #define DRM_DMA_DEVICE		BIT(2)	/* can be used for dma allocations */
> +#define DRM_FIMC_DEVICE		BIT(3)	/* devices shared with V4L2 subsystem */
>  
>  #define DRV_PTR(drv, cond) (IS_ENABLED(cond) ? &drv : NULL)
>  
> @@ -258,6 +259,7 @@ static struct exynos_drm_driver_info exynos_drm_drivers[] = {
>  		DRV_PTR(g2d_driver, CONFIG_DRM_EXYNOS_G2D),
>  	}, {
>  		DRV_PTR(fimc_driver, CONFIG_DRM_EXYNOS_FIMC),
> +		DRM_COMPONENT_DRIVER | DRM_FIMC_DEVICE,
>  	}, {
>  		DRV_PTR(rotator_driver, CONFIG_DRM_EXYNOS_ROTATOR),
>  		DRM_COMPONENT_DRIVER
> @@ -291,7 +293,10 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
>  					    &info->driver->driver,
>  					    (void *)platform_bus_type.match))) {
>  			put_device(p);
> -			component_match_add(dev, &match, compare_dev, d);
> +
> +			if (!(info->flags & DRM_FIMC_DEVICE) ||
> +			    exynos_drm_check_fimc_device(d) == 0)
> +				component_match_add(dev, &match, compare_dev, d);
>  			p = d;
>  		}
>  		put_device(p);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> index b47f810d64d2..9dfe005805b9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -275,6 +275,15 @@ static inline int exynos_dpi_bind(struct drm_device *dev,
>  }
>  #endif
>  
> +#ifdef CONFIG_DRM_EXYNOS_FIMC
> +int exynos_drm_check_fimc_device(struct device *dev);
> +#else
> +static inline int exynos_drm_check_fimc_device(struct device *dev)
> +{
> +	return 0;
> +}
> +#endif
> +
>  int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state *state,
>  			 bool nonblock);
>  int exynos_atomic_check(struct drm_device *dev, struct drm_atomic_state *state);
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> dissimilarity index 47%
> index 5b18b5c5fdf2..fa961e8724c4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -1,1798 +1,1372 @@
> -/*
> - * Copyright (C) 2012 Samsung Electronics Co.Ltd
> - * Authors:
> - *	Eunchul Kim <chulspro.kim@samsung.com>
> - *	Jinyoung Jeon <jy0.jeon@samsung.com>
> - *	Sangmin Lee <lsmin.lee@samsung.com>
> - *
> - * This program is free software; you can redistribute  it and/or modify it
> - * under  the terms of  the GNU General  Public License as published by the
> - * Free Software Foundation;  either version 2 of the  License, or (at your
> - * option) any later version.
> - *
> - */
> -#include <linux/kernel.h>
> -#include <linux/platform_device.h>
> -#include <linux/mfd/syscon.h>
> -#include <linux/regmap.h>
> -#include <linux/clk.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/of.h>
> -#include <linux/spinlock.h>
> -
> -#include <drm/drmP.h>
> -#include <drm/exynos_drm.h>
> -#include "regs-fimc.h"
> -#include "exynos_drm_drv.h"
> -#include "exynos_drm_ipp.h"
> -#include "exynos_drm_fimc.h"
> -
> -/*
> - * FIMC stands for Fully Interactive Mobile Camera and
> - * supports image scaler/rotator and input/output DMA operations.
> - * input DMA reads image data from the memory.
> - * output DMA writes image data to memory.
> - * FIMC supports image rotation and image effect functions.
> - *
> - * M2M operation : supports crop/scale/rotation/csc so on.
> - * Memory ----> FIMC H/W ----> Memory.
> - * Writeback operation : supports cloned screen with FIMD.
> - * FIMD ----> FIMC H/W ----> Memory.
> - * Output operation : supports direct display using local path.
> - * Memory ----> FIMC H/W ----> FIMD.
> - */
> -
> -/*
> - * TODO
> - * 1. check suspend/resume api if needed.
> - * 2. need to check use case platform_device_id.
> - * 3. check src/dst size with, height.
> - * 4. added check_prepare api for right register.
> - * 5. need to add supported list in prop_list.
> - * 6. check prescaler/scaler optimization.
> - */
> -
> -#define FIMC_MAX_DEVS	4
> -#define FIMC_MAX_SRC	2
> -#define FIMC_MAX_DST	32
> -#define FIMC_SHFACTOR	10
> -#define FIMC_BUF_STOP	1
> -#define FIMC_BUF_START	2
> -#define FIMC_WIDTH_ITU_709	1280
> -#define FIMC_REFRESH_MAX	60
> -#define FIMC_REFRESH_MIN	12
> -#define FIMC_CROP_MAX	8192
> -#define FIMC_CROP_MIN	32
> -#define FIMC_SCALE_MAX	4224
> -#define FIMC_SCALE_MIN	32
> -
> -#define get_fimc_context(dev)	platform_get_drvdata(to_platform_device(dev))
> -#define get_ctx_from_ippdrv(ippdrv)	container_of(ippdrv,\
> -					struct fimc_context, ippdrv);
> -enum fimc_wb {
> -	FIMC_WB_NONE,
> -	FIMC_WB_A,
> -	FIMC_WB_B,
> -};
> -
> -enum {
> -	FIMC_CLK_LCLK,
> -	FIMC_CLK_GATE,
> -	FIMC_CLK_WB_A,
> -	FIMC_CLK_WB_B,
> -	FIMC_CLK_MUX,
> -	FIMC_CLK_PARENT,
> -	FIMC_CLKS_MAX
> -};
> -
> -static const char * const fimc_clock_names[] = {
> -	[FIMC_CLK_LCLK]   = "sclk_fimc",
> -	[FIMC_CLK_GATE]   = "fimc",
> -	[FIMC_CLK_WB_A]   = "pxl_async0",
> -	[FIMC_CLK_WB_B]   = "pxl_async1",
> -	[FIMC_CLK_MUX]    = "mux",
> -	[FIMC_CLK_PARENT] = "parent",
> -};
> -
> -#define FIMC_DEFAULT_LCLK_FREQUENCY 133000000UL
> -
> -/*
> - * A structure of scaler.
> - *
> - * @range: narrow, wide.
> - * @bypass: unused scaler path.
> - * @up_h: horizontal scale up.
> - * @up_v: vertical scale up.
> - * @hratio: horizontal ratio.
> - * @vratio: vertical ratio.
> - */
> -struct fimc_scaler {
> -	bool	range;
> -	bool bypass;
> -	bool up_h;
> -	bool up_v;
> -	u32 hratio;
> -	u32 vratio;
> -};
> -
> -/*
> - * A structure of scaler capability.
> - *
> - * find user manual table 43-1.
> - * @in_hori: scaler input horizontal size.
> - * @bypass: scaler bypass mode.
> - * @dst_h_wo_rot: target horizontal size without output rotation.
> - * @dst_h_rot: target horizontal size with output rotation.
> - * @rl_w_wo_rot: real width without input rotation.
> - * @rl_h_rot: real height without output rotation.
> - */
> -struct fimc_capability {
> -	/* scaler */
> -	u32	in_hori;
> -	u32	bypass;
> -	/* output rotator */
> -	u32	dst_h_wo_rot;
> -	u32	dst_h_rot;
> -	/* input rotator */
> -	u32	rl_w_wo_rot;
> -	u32	rl_h_rot;
> -};
> -
> -/*
> - * A structure of fimc context.
> - *
> - * @ippdrv: prepare initialization using ippdrv.
> - * @regs_res: register resources.
> - * @regs: memory mapped io registers.
> - * @lock: locking of operations.
> - * @clocks: fimc clocks.
> - * @clk_frequency: LCLK clock frequency.
> - * @sysreg: handle to SYSREG block regmap.
> - * @sc: scaler infomations.
> - * @pol: porarity of writeback.
> - * @id: fimc id.
> - * @irq: irq number.
> - * @suspended: qos operations.
> - */
> -struct fimc_context {
> -	struct exynos_drm_ippdrv	ippdrv;
> -	struct resource	*regs_res;
> -	void __iomem	*regs;
> -	spinlock_t	lock;
> -	struct clk	*clocks[FIMC_CLKS_MAX];
> -	u32		clk_frequency;
> -	struct regmap	*sysreg;
> -	struct fimc_scaler	sc;
> -	int	id;
> -	int	irq;
> -	bool	suspended;
> -};
> -
> -static u32 fimc_read(struct fimc_context *ctx, u32 reg)
> -{
> -	return readl(ctx->regs + reg);
> -}
> -
> -static void fimc_write(struct fimc_context *ctx, u32 val, u32 reg)
> -{
> -	writel(val, ctx->regs + reg);
> -}
> -
> -static void fimc_set_bits(struct fimc_context *ctx, u32 reg, u32 bits)
> -{
> -	void __iomem *r = ctx->regs + reg;
> -
> -	writel(readl(r) | bits, r);
> -}
> -
> -static void fimc_clear_bits(struct fimc_context *ctx, u32 reg, u32 bits)
> -{
> -	void __iomem *r = ctx->regs + reg;
> -
> -	writel(readl(r) & ~bits, r);
> -}
> -
> -static void fimc_sw_reset(struct fimc_context *ctx)
> -{
> -	u32 cfg;
> -
> -	/* stop dma operation */
> -	cfg = fimc_read(ctx, EXYNOS_CISTATUS);
> -	if (EXYNOS_CISTATUS_GET_ENVID_STATUS(cfg))
> -		fimc_clear_bits(ctx, EXYNOS_MSCTRL, EXYNOS_MSCTRL_ENVID);
> -
> -	fimc_set_bits(ctx, EXYNOS_CISRCFMT, EXYNOS_CISRCFMT_ITU601_8BIT);
> -
> -	/* disable image capture */
> -	fimc_clear_bits(ctx, EXYNOS_CIIMGCPT,
> -		EXYNOS_CIIMGCPT_IMGCPTEN_SC | EXYNOS_CIIMGCPT_IMGCPTEN);
> -
> -	/* s/w reset */
> -	fimc_set_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_SWRST);
> -
> -	/* s/w reset complete */
> -	fimc_clear_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_SWRST);
> -
> -	/* reset sequence */
> -	fimc_write(ctx, 0x0, EXYNOS_CIFCNTSEQ);
> -}
> -
> -static int fimc_set_camblk_fimd0_wb(struct fimc_context *ctx)
> -{
> -	return regmap_update_bits(ctx->sysreg, SYSREG_CAMERA_BLK,
> -				  SYSREG_FIMD0WB_DEST_MASK,
> -				  ctx->id << SYSREG_FIMD0WB_DEST_SHIFT);
> -}
> -
> -static void fimc_set_type_ctrl(struct fimc_context *ctx, enum fimc_wb wb)
> -{
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("wb[%d]\n", wb);
> -
> -	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
> -	cfg &= ~(EXYNOS_CIGCTRL_TESTPATTERN_MASK |
> -		EXYNOS_CIGCTRL_SELCAM_ITU_MASK |
> -		EXYNOS_CIGCTRL_SELCAM_MIPI_MASK |
> -		EXYNOS_CIGCTRL_SELCAM_FIMC_MASK |
> -		EXYNOS_CIGCTRL_SELWB_CAMIF_MASK |
> -		EXYNOS_CIGCTRL_SELWRITEBACK_MASK);
> -
> -	switch (wb) {
> -	case FIMC_WB_A:
> -		cfg |= (EXYNOS_CIGCTRL_SELWRITEBACK_A |
> -			EXYNOS_CIGCTRL_SELWB_CAMIF_WRITEBACK);
> -		break;
> -	case FIMC_WB_B:
> -		cfg |= (EXYNOS_CIGCTRL_SELWRITEBACK_B |
> -			EXYNOS_CIGCTRL_SELWB_CAMIF_WRITEBACK);
> -		break;
> -	case FIMC_WB_NONE:
> -	default:
> -		cfg |= (EXYNOS_CIGCTRL_SELCAM_ITU_A |
> -			EXYNOS_CIGCTRL_SELWRITEBACK_A |
> -			EXYNOS_CIGCTRL_SELCAM_MIPI_A |
> -			EXYNOS_CIGCTRL_SELCAM_FIMC_ITU);
> -		break;
> -	}
> -
> -	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
> -}
> -
> -static void fimc_handle_jpeg(struct fimc_context *ctx, bool enable)
> -{
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("enable[%d]\n", enable);
> -
> -	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
> -	if (enable)
> -		cfg |= EXYNOS_CIGCTRL_CAM_JPEG;
> -	else
> -		cfg &= ~EXYNOS_CIGCTRL_CAM_JPEG;
> -
> -	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
> -}
> -
> -static void fimc_mask_irq(struct fimc_context *ctx, bool enable)
> -{
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("enable[%d]\n", enable);
> -
> -	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
> -	if (enable) {
> -		cfg &= ~EXYNOS_CIGCTRL_IRQ_OVFEN;
> -		cfg |= EXYNOS_CIGCTRL_IRQ_ENABLE | EXYNOS_CIGCTRL_IRQ_LEVEL;
> -	} else
> -		cfg &= ~EXYNOS_CIGCTRL_IRQ_ENABLE;
> -	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
> -}
> -
> -static void fimc_clear_irq(struct fimc_context *ctx)
> -{
> -	fimc_set_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_IRQ_CLR);
> -}
> -
> -static bool fimc_check_ovf(struct fimc_context *ctx)
> -{
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	u32 status, flag;
> -
> -	status = fimc_read(ctx, EXYNOS_CISTATUS);
> -	flag = EXYNOS_CISTATUS_OVFIY | EXYNOS_CISTATUS_OVFICB |
> -		EXYNOS_CISTATUS_OVFICR;
> -
> -	DRM_DEBUG_KMS("flag[0x%x]\n", flag);
> -
> -	if (status & flag) {
> -		fimc_set_bits(ctx, EXYNOS_CIWDOFST,
> -			EXYNOS_CIWDOFST_CLROVFIY | EXYNOS_CIWDOFST_CLROVFICB |
> -			EXYNOS_CIWDOFST_CLROVFICR);
> -
> -		dev_err(ippdrv->dev, "occurred overflow at %d, status 0x%x.\n",
> -			ctx->id, status);
> -		return true;
> -	}
> -
> -	return false;
> -}
> -
> -static bool fimc_check_frame_end(struct fimc_context *ctx)
> -{
> -	u32 cfg;
> -
> -	cfg = fimc_read(ctx, EXYNOS_CISTATUS);
> -
> -	DRM_DEBUG_KMS("cfg[0x%x]\n", cfg);
> -
> -	if (!(cfg & EXYNOS_CISTATUS_FRAMEEND))
> -		return false;
> -
> -	cfg &= ~(EXYNOS_CISTATUS_FRAMEEND);
> -	fimc_write(ctx, cfg, EXYNOS_CISTATUS);
> -
> -	return true;
> -}
> -
> -static int fimc_get_buf_id(struct fimc_context *ctx)
> -{
> -	u32 cfg;
> -	int frame_cnt, buf_id;
> -
> -	cfg = fimc_read(ctx, EXYNOS_CISTATUS2);
> -	frame_cnt = EXYNOS_CISTATUS2_GET_FRAMECOUNT_BEFORE(cfg);
> -
> -	if (frame_cnt == 0)
> -		frame_cnt = EXYNOS_CISTATUS2_GET_FRAMECOUNT_PRESENT(cfg);
> -
> -	DRM_DEBUG_KMS("present[%d]before[%d]\n",
> -		EXYNOS_CISTATUS2_GET_FRAMECOUNT_PRESENT(cfg),
> -		EXYNOS_CISTATUS2_GET_FRAMECOUNT_BEFORE(cfg));
> -
> -	if (frame_cnt == 0) {
> -		DRM_ERROR("failed to get frame count.\n");
> -		return -EIO;
> -	}
> -
> -	buf_id = frame_cnt - 1;
> -	DRM_DEBUG_KMS("buf_id[%d]\n", buf_id);
> -
> -	return buf_id;
> -}
> -
> -static void fimc_handle_lastend(struct fimc_context *ctx, bool enable)
> -{
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("enable[%d]\n", enable);
> -
> -	cfg = fimc_read(ctx, EXYNOS_CIOCTRL);
> -	if (enable)
> -		cfg |= EXYNOS_CIOCTRL_LASTENDEN;
> -	else
> -		cfg &= ~EXYNOS_CIOCTRL_LASTENDEN;
> -
> -	fimc_write(ctx, cfg, EXYNOS_CIOCTRL);
> -}
> -
> -
> -static int fimc_src_set_fmt_order(struct fimc_context *ctx, u32 fmt)
> -{
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
> -
> -	/* RGB */
> -	cfg = fimc_read(ctx, EXYNOS_CISCCTRL);
> -	cfg &= ~EXYNOS_CISCCTRL_INRGB_FMT_RGB_MASK;
> -
> -	switch (fmt) {
> -	case DRM_FORMAT_RGB565:
> -		cfg |= EXYNOS_CISCCTRL_INRGB_FMT_RGB565;
> -		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> -		return 0;
> -	case DRM_FORMAT_RGB888:
> -	case DRM_FORMAT_XRGB8888:
> -		cfg |= EXYNOS_CISCCTRL_INRGB_FMT_RGB888;
> -		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> -		return 0;
> -	default:
> -		/* bypass */
> -		break;
> -	}
> -
> -	/* YUV */
> -	cfg = fimc_read(ctx, EXYNOS_MSCTRL);
> -	cfg &= ~(EXYNOS_MSCTRL_ORDER2P_SHIFT_MASK |
> -		EXYNOS_MSCTRL_C_INT_IN_2PLANE |
> -		EXYNOS_MSCTRL_ORDER422_YCBYCR);
> -
> -	switch (fmt) {
> -	case DRM_FORMAT_YUYV:
> -		cfg |= EXYNOS_MSCTRL_ORDER422_YCBYCR;
> -		break;
> -	case DRM_FORMAT_YVYU:
> -		cfg |= EXYNOS_MSCTRL_ORDER422_YCRYCB;
> -		break;
> -	case DRM_FORMAT_UYVY:
> -		cfg |= EXYNOS_MSCTRL_ORDER422_CBYCRY;
> -		break;
> -	case DRM_FORMAT_VYUY:
> -	case DRM_FORMAT_YUV444:
> -		cfg |= EXYNOS_MSCTRL_ORDER422_CRYCBY;
> -		break;
> -	case DRM_FORMAT_NV21:
> -	case DRM_FORMAT_NV61:
> -		cfg |= (EXYNOS_MSCTRL_ORDER2P_LSB_CRCB |
> -			EXYNOS_MSCTRL_C_INT_IN_2PLANE);
> -		break;
> -	case DRM_FORMAT_YUV422:
> -	case DRM_FORMAT_YUV420:
> -	case DRM_FORMAT_YVU420:
> -		cfg |= EXYNOS_MSCTRL_C_INT_IN_3PLANE;
> -		break;
> -	case DRM_FORMAT_NV12:
> -	case DRM_FORMAT_NV16:
> -		cfg |= (EXYNOS_MSCTRL_ORDER2P_LSB_CBCR |
> -			EXYNOS_MSCTRL_C_INT_IN_2PLANE);
> -		break;
> -	default:
> -		dev_err(ippdrv->dev, "invalid source yuv order 0x%x.\n", fmt);
> -		return -EINVAL;
> -	}
> -
> -	fimc_write(ctx, cfg, EXYNOS_MSCTRL);
> -
> -	return 0;
> -}
> -
> -static int fimc_src_set_fmt(struct device *dev, u32 fmt)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
> -
> -	cfg = fimc_read(ctx, EXYNOS_MSCTRL);
> -	cfg &= ~EXYNOS_MSCTRL_INFORMAT_RGB;
> -
> -	switch (fmt) {
> -	case DRM_FORMAT_RGB565:
> -	case DRM_FORMAT_RGB888:
> -	case DRM_FORMAT_XRGB8888:
> -		cfg |= EXYNOS_MSCTRL_INFORMAT_RGB;
> -		break;
> -	case DRM_FORMAT_YUV444:
> -		cfg |= EXYNOS_MSCTRL_INFORMAT_YCBCR420;
> -		break;
> -	case DRM_FORMAT_YUYV:
> -	case DRM_FORMAT_YVYU:
> -	case DRM_FORMAT_UYVY:
> -	case DRM_FORMAT_VYUY:
> -		cfg |= EXYNOS_MSCTRL_INFORMAT_YCBCR422_1PLANE;
> -		break;
> -	case DRM_FORMAT_NV16:
> -	case DRM_FORMAT_NV61:
> -	case DRM_FORMAT_YUV422:
> -		cfg |= EXYNOS_MSCTRL_INFORMAT_YCBCR422;
> -		break;
> -	case DRM_FORMAT_YUV420:
> -	case DRM_FORMAT_YVU420:
> -	case DRM_FORMAT_NV12:
> -	case DRM_FORMAT_NV21:
> -		cfg |= EXYNOS_MSCTRL_INFORMAT_YCBCR420;
> -		break;
> -	default:
> -		dev_err(ippdrv->dev, "invalid source format 0x%x.\n", fmt);
> -		return -EINVAL;
> -	}
> -
> -	fimc_write(ctx, cfg, EXYNOS_MSCTRL);
> -
> -	cfg = fimc_read(ctx, EXYNOS_CIDMAPARAM);
> -	cfg &= ~EXYNOS_CIDMAPARAM_R_MODE_MASK;
> -
> -	cfg |= EXYNOS_CIDMAPARAM_R_MODE_LINEAR;
> -
> -	fimc_write(ctx, cfg, EXYNOS_CIDMAPARAM);
> -
> -	return fimc_src_set_fmt_order(ctx, fmt);
> -}
> -
> -static int fimc_src_set_transf(struct device *dev,
> -		enum drm_exynos_degree degree,
> -		enum drm_exynos_flip flip, bool *swap)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	u32 cfg1, cfg2;
> -
> -	DRM_DEBUG_KMS("degree[%d]flip[0x%x]\n", degree, flip);
> -
> -	cfg1 = fimc_read(ctx, EXYNOS_MSCTRL);
> -	cfg1 &= ~(EXYNOS_MSCTRL_FLIP_X_MIRROR |
> -		EXYNOS_MSCTRL_FLIP_Y_MIRROR);
> -
> -	cfg2 = fimc_read(ctx, EXYNOS_CITRGFMT);
> -	cfg2 &= ~EXYNOS_CITRGFMT_INROT90_CLOCKWISE;
> -
> -	switch (degree) {
> -	case EXYNOS_DRM_DEGREE_0:
> -		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
> -			cfg1 |= EXYNOS_MSCTRL_FLIP_X_MIRROR;
> -		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
> -			cfg1 |= EXYNOS_MSCTRL_FLIP_Y_MIRROR;
> -		break;
> -	case EXYNOS_DRM_DEGREE_90:
> -		cfg2 |= EXYNOS_CITRGFMT_INROT90_CLOCKWISE;
> -		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
> -			cfg1 |= EXYNOS_MSCTRL_FLIP_X_MIRROR;
> -		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
> -			cfg1 |= EXYNOS_MSCTRL_FLIP_Y_MIRROR;
> -		break;
> -	case EXYNOS_DRM_DEGREE_180:
> -		cfg1 |= (EXYNOS_MSCTRL_FLIP_X_MIRROR |
> -			EXYNOS_MSCTRL_FLIP_Y_MIRROR);
> -		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
> -			cfg1 &= ~EXYNOS_MSCTRL_FLIP_X_MIRROR;
> -		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
> -			cfg1 &= ~EXYNOS_MSCTRL_FLIP_Y_MIRROR;
> -		break;
> -	case EXYNOS_DRM_DEGREE_270:
> -		cfg1 |= (EXYNOS_MSCTRL_FLIP_X_MIRROR |
> -			EXYNOS_MSCTRL_FLIP_Y_MIRROR);
> -		cfg2 |= EXYNOS_CITRGFMT_INROT90_CLOCKWISE;
> -		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
> -			cfg1 &= ~EXYNOS_MSCTRL_FLIP_X_MIRROR;
> -		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
> -			cfg1 &= ~EXYNOS_MSCTRL_FLIP_Y_MIRROR;
> -		break;
> -	default:
> -		dev_err(ippdrv->dev, "invalid degree value %d.\n", degree);
> -		return -EINVAL;
> -	}
> -
> -	fimc_write(ctx, cfg1, EXYNOS_MSCTRL);
> -	fimc_write(ctx, cfg2, EXYNOS_CITRGFMT);
> -	*swap = (cfg2 & EXYNOS_CITRGFMT_INROT90_CLOCKWISE) ? 1 : 0;
> -
> -	return 0;
> -}
> -
> -static int fimc_set_window(struct fimc_context *ctx,
> -		struct drm_exynos_pos *pos, struct drm_exynos_sz *sz)
> -{
> -	u32 cfg, h1, h2, v1, v2;
> -
> -	/* cropped image */
> -	h1 = pos->x;
> -	h2 = sz->hsize - pos->w - pos->x;
> -	v1 = pos->y;
> -	v2 = sz->vsize - pos->h - pos->y;
> -
> -	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]hsize[%d]vsize[%d]\n",
> -		pos->x, pos->y, pos->w, pos->h, sz->hsize, sz->vsize);
> -	DRM_DEBUG_KMS("h1[%d]h2[%d]v1[%d]v2[%d]\n", h1, h2, v1, v2);
> -
> -	/*
> -	 * set window offset 1, 2 size
> -	 * check figure 43-21 in user manual
> -	 */
> -	cfg = fimc_read(ctx, EXYNOS_CIWDOFST);
> -	cfg &= ~(EXYNOS_CIWDOFST_WINHOROFST_MASK |
> -		EXYNOS_CIWDOFST_WINVEROFST_MASK);
> -	cfg |= (EXYNOS_CIWDOFST_WINHOROFST(h1) |
> -		EXYNOS_CIWDOFST_WINVEROFST(v1));
> -	cfg |= EXYNOS_CIWDOFST_WINOFSEN;
> -	fimc_write(ctx, cfg, EXYNOS_CIWDOFST);
> -
> -	cfg = (EXYNOS_CIWDOFST2_WINHOROFST2(h2) |
> -		EXYNOS_CIWDOFST2_WINVEROFST2(v2));
> -	fimc_write(ctx, cfg, EXYNOS_CIWDOFST2);
> -
> -	return 0;
> -}
> -
> -static int fimc_src_set_size(struct device *dev, int swap,
> -		struct drm_exynos_pos *pos, struct drm_exynos_sz *sz)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct drm_exynos_pos img_pos = *pos;
> -	struct drm_exynos_sz img_sz = *sz;
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("swap[%d]hsize[%d]vsize[%d]\n",
> -		swap, sz->hsize, sz->vsize);
> -
> -	/* original size */
> -	cfg = (EXYNOS_ORGISIZE_HORIZONTAL(img_sz.hsize) |
> -		EXYNOS_ORGISIZE_VERTICAL(img_sz.vsize));
> -
> -	fimc_write(ctx, cfg, EXYNOS_ORGISIZE);
> -
> -	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]\n", pos->x, pos->y, pos->w, pos->h);
> -
> -	if (swap) {
> -		img_pos.w = pos->h;
> -		img_pos.h = pos->w;
> -		img_sz.hsize = sz->vsize;
> -		img_sz.vsize = sz->hsize;
> -	}
> -
> -	/* set input DMA image size */
> -	cfg = fimc_read(ctx, EXYNOS_CIREAL_ISIZE);
> -	cfg &= ~(EXYNOS_CIREAL_ISIZE_HEIGHT_MASK |
> -		EXYNOS_CIREAL_ISIZE_WIDTH_MASK);
> -	cfg |= (EXYNOS_CIREAL_ISIZE_WIDTH(img_pos.w) |
> -		EXYNOS_CIREAL_ISIZE_HEIGHT(img_pos.h));
> -	fimc_write(ctx, cfg, EXYNOS_CIREAL_ISIZE);
> -
> -	/*
> -	 * set input FIFO image size
> -	 * for now, we support only ITU601 8 bit mode
> -	 */
> -	cfg = (EXYNOS_CISRCFMT_ITU601_8BIT |
> -		EXYNOS_CISRCFMT_SOURCEHSIZE(img_sz.hsize) |
> -		EXYNOS_CISRCFMT_SOURCEVSIZE(img_sz.vsize));
> -	fimc_write(ctx, cfg, EXYNOS_CISRCFMT);
> -
> -	/* offset Y(RGB), Cb, Cr */
> -	cfg = (EXYNOS_CIIYOFF_HORIZONTAL(img_pos.x) |
> -		EXYNOS_CIIYOFF_VERTICAL(img_pos.y));
> -	fimc_write(ctx, cfg, EXYNOS_CIIYOFF);
> -	cfg = (EXYNOS_CIICBOFF_HORIZONTAL(img_pos.x) |
> -		EXYNOS_CIICBOFF_VERTICAL(img_pos.y));
> -	fimc_write(ctx, cfg, EXYNOS_CIICBOFF);
> -	cfg = (EXYNOS_CIICROFF_HORIZONTAL(img_pos.x) |
> -		EXYNOS_CIICROFF_VERTICAL(img_pos.y));
> -	fimc_write(ctx, cfg, EXYNOS_CIICROFF);
> -
> -	return fimc_set_window(ctx, &img_pos, &img_sz);
> -}
> -
> -static int fimc_src_set_addr(struct device *dev,
> -		struct drm_exynos_ipp_buf_info *buf_info, u32 buf_id,
> -		enum drm_exynos_ipp_buf_type buf_type)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
> -	struct drm_exynos_ipp_property *property;
> -	struct drm_exynos_ipp_config *config;
> -
> -	if (!c_node) {
> -		DRM_ERROR("failed to get c_node.\n");
> -		return -EINVAL;
> -	}
> -
> -	property = &c_node->property;
> -
> -	DRM_DEBUG_KMS("prop_id[%d]buf_id[%d]buf_type[%d]\n",
> -		property->prop_id, buf_id, buf_type);
> -
> -	if (buf_id > FIMC_MAX_SRC) {
> -		dev_info(ippdrv->dev, "invalid buf_id %d.\n", buf_id);
> -		return -ENOMEM;
> -	}
> -
> -	/* address register set */
> -	switch (buf_type) {
> -	case IPP_BUF_ENQUEUE:
> -		config = &property->config[EXYNOS_DRM_OPS_SRC];
> -		fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_Y],
> -			EXYNOS_CIIYSA0);
> -
> -		if (config->fmt == DRM_FORMAT_YVU420) {
> -			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
> -				EXYNOS_CIICBSA0);
> -			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
> -				EXYNOS_CIICRSA0);
> -		} else {
> -			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
> -				EXYNOS_CIICBSA0);
> -			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
> -				EXYNOS_CIICRSA0);
> -		}
> -		break;
> -	case IPP_BUF_DEQUEUE:
> -		fimc_write(ctx, 0x0, EXYNOS_CIIYSA0);
> -		fimc_write(ctx, 0x0, EXYNOS_CIICBSA0);
> -		fimc_write(ctx, 0x0, EXYNOS_CIICRSA0);
> -		break;
> -	default:
> -		/* bypass */
> -		break;
> -	}
> -
> -	return 0;
> -}
> -
> -static struct exynos_drm_ipp_ops fimc_src_ops = {
> -	.set_fmt = fimc_src_set_fmt,
> -	.set_transf = fimc_src_set_transf,
> -	.set_size = fimc_src_set_size,
> -	.set_addr = fimc_src_set_addr,
> -};
> -
> -static int fimc_dst_set_fmt_order(struct fimc_context *ctx, u32 fmt)
> -{
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
> -
> -	/* RGB */
> -	cfg = fimc_read(ctx, EXYNOS_CISCCTRL);
> -	cfg &= ~EXYNOS_CISCCTRL_OUTRGB_FMT_RGB_MASK;
> -
> -	switch (fmt) {
> -	case DRM_FORMAT_RGB565:
> -		cfg |= EXYNOS_CISCCTRL_OUTRGB_FMT_RGB565;
> -		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> -		return 0;
> -	case DRM_FORMAT_RGB888:
> -		cfg |= EXYNOS_CISCCTRL_OUTRGB_FMT_RGB888;
> -		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> -		return 0;
> -	case DRM_FORMAT_XRGB8888:
> -		cfg |= (EXYNOS_CISCCTRL_OUTRGB_FMT_RGB888 |
> -			EXYNOS_CISCCTRL_EXTRGB_EXTENSION);
> -		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> -		break;
> -	default:
> -		/* bypass */
> -		break;
> -	}
> -
> -	/* YUV */
> -	cfg = fimc_read(ctx, EXYNOS_CIOCTRL);
> -	cfg &= ~(EXYNOS_CIOCTRL_ORDER2P_MASK |
> -		EXYNOS_CIOCTRL_ORDER422_MASK |
> -		EXYNOS_CIOCTRL_YCBCR_PLANE_MASK);
> -
> -	switch (fmt) {
> -	case DRM_FORMAT_XRGB8888:
> -		cfg |= EXYNOS_CIOCTRL_ALPHA_OUT;
> -		break;
> -	case DRM_FORMAT_YUYV:
> -		cfg |= EXYNOS_CIOCTRL_ORDER422_YCBYCR;
> -		break;
> -	case DRM_FORMAT_YVYU:
> -		cfg |= EXYNOS_CIOCTRL_ORDER422_YCRYCB;
> -		break;
> -	case DRM_FORMAT_UYVY:
> -		cfg |= EXYNOS_CIOCTRL_ORDER422_CBYCRY;
> -		break;
> -	case DRM_FORMAT_VYUY:
> -		cfg |= EXYNOS_CIOCTRL_ORDER422_CRYCBY;
> -		break;
> -	case DRM_FORMAT_NV21:
> -	case DRM_FORMAT_NV61:
> -		cfg |= EXYNOS_CIOCTRL_ORDER2P_LSB_CRCB;
> -		cfg |= EXYNOS_CIOCTRL_YCBCR_2PLANE;
> -		break;
> -	case DRM_FORMAT_YUV422:
> -	case DRM_FORMAT_YUV420:
> -	case DRM_FORMAT_YVU420:
> -		cfg |= EXYNOS_CIOCTRL_YCBCR_3PLANE;
> -		break;
> -	case DRM_FORMAT_NV12:
> -	case DRM_FORMAT_NV16:
> -		cfg |= EXYNOS_CIOCTRL_ORDER2P_LSB_CBCR;
> -		cfg |= EXYNOS_CIOCTRL_YCBCR_2PLANE;
> -		break;
> -	default:
> -		dev_err(ippdrv->dev, "invalid target yuv order 0x%x.\n", fmt);
> -		return -EINVAL;
> -	}
> -
> -	fimc_write(ctx, cfg, EXYNOS_CIOCTRL);
> -
> -	return 0;
> -}
> -
> -static int fimc_dst_set_fmt(struct device *dev, u32 fmt)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
> -
> -	cfg = fimc_read(ctx, EXYNOS_CIEXTEN);
> -
> -	if (fmt == DRM_FORMAT_AYUV) {
> -		cfg |= EXYNOS_CIEXTEN_YUV444_OUT;
> -		fimc_write(ctx, cfg, EXYNOS_CIEXTEN);
> -	} else {
> -		cfg &= ~EXYNOS_CIEXTEN_YUV444_OUT;
> -		fimc_write(ctx, cfg, EXYNOS_CIEXTEN);
> -
> -		cfg = fimc_read(ctx, EXYNOS_CITRGFMT);
> -		cfg &= ~EXYNOS_CITRGFMT_OUTFORMAT_MASK;
> -
> -		switch (fmt) {
> -		case DRM_FORMAT_RGB565:
> -		case DRM_FORMAT_RGB888:
> -		case DRM_FORMAT_XRGB8888:
> -			cfg |= EXYNOS_CITRGFMT_OUTFORMAT_RGB;
> -			break;
> -		case DRM_FORMAT_YUYV:
> -		case DRM_FORMAT_YVYU:
> -		case DRM_FORMAT_UYVY:
> -		case DRM_FORMAT_VYUY:
> -			cfg |= EXYNOS_CITRGFMT_OUTFORMAT_YCBCR422_1PLANE;
> -			break;
> -		case DRM_FORMAT_NV16:
> -		case DRM_FORMAT_NV61:
> -		case DRM_FORMAT_YUV422:
> -			cfg |= EXYNOS_CITRGFMT_OUTFORMAT_YCBCR422;
> -			break;
> -		case DRM_FORMAT_YUV420:
> -		case DRM_FORMAT_YVU420:
> -		case DRM_FORMAT_NV12:
> -		case DRM_FORMAT_NV21:
> -			cfg |= EXYNOS_CITRGFMT_OUTFORMAT_YCBCR420;
> -			break;
> -		default:
> -			dev_err(ippdrv->dev, "invalid target format 0x%x.\n",
> -				fmt);
> -			return -EINVAL;
> -		}
> -
> -		fimc_write(ctx, cfg, EXYNOS_CITRGFMT);
> -	}
> -
> -	cfg = fimc_read(ctx, EXYNOS_CIDMAPARAM);
> -	cfg &= ~EXYNOS_CIDMAPARAM_W_MODE_MASK;
> -
> -	cfg |= EXYNOS_CIDMAPARAM_W_MODE_LINEAR;
> -
> -	fimc_write(ctx, cfg, EXYNOS_CIDMAPARAM);
> -
> -	return fimc_dst_set_fmt_order(ctx, fmt);
> -}
> -
> -static int fimc_dst_set_transf(struct device *dev,
> -		enum drm_exynos_degree degree,
> -		enum drm_exynos_flip flip, bool *swap)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("degree[%d]flip[0x%x]\n", degree, flip);
> -
> -	cfg = fimc_read(ctx, EXYNOS_CITRGFMT);
> -	cfg &= ~EXYNOS_CITRGFMT_FLIP_MASK;
> -	cfg &= ~EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE;
> -
> -	switch (degree) {
> -	case EXYNOS_DRM_DEGREE_0:
> -		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
> -			cfg |= EXYNOS_CITRGFMT_FLIP_X_MIRROR;
> -		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
> -			cfg |= EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
> -		break;
> -	case EXYNOS_DRM_DEGREE_90:
> -		cfg |= EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE;
> -		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
> -			cfg |= EXYNOS_CITRGFMT_FLIP_X_MIRROR;
> -		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
> -			cfg |= EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
> -		break;
> -	case EXYNOS_DRM_DEGREE_180:
> -		cfg |= (EXYNOS_CITRGFMT_FLIP_X_MIRROR |
> -			EXYNOS_CITRGFMT_FLIP_Y_MIRROR);
> -		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
> -			cfg &= ~EXYNOS_CITRGFMT_FLIP_X_MIRROR;
> -		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
> -			cfg &= ~EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
> -		break;
> -	case EXYNOS_DRM_DEGREE_270:
> -		cfg |= (EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE |
> -			EXYNOS_CITRGFMT_FLIP_X_MIRROR |
> -			EXYNOS_CITRGFMT_FLIP_Y_MIRROR);
> -		if (flip & EXYNOS_DRM_FLIP_VERTICAL)
> -			cfg &= ~EXYNOS_CITRGFMT_FLIP_X_MIRROR;
> -		if (flip & EXYNOS_DRM_FLIP_HORIZONTAL)
> -			cfg &= ~EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
> -		break;
> -	default:
> -		dev_err(ippdrv->dev, "invalid degree value %d.\n", degree);
> -		return -EINVAL;
> -	}
> -
> -	fimc_write(ctx, cfg, EXYNOS_CITRGFMT);
> -	*swap = (cfg & EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE) ? 1 : 0;
> -
> -	return 0;
> -}
> -
> -static int fimc_set_prescaler(struct fimc_context *ctx, struct fimc_scaler *sc,
> -		struct drm_exynos_pos *src, struct drm_exynos_pos *dst)
> -{
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	u32 cfg, cfg_ext, shfactor;
> -	u32 pre_dst_width, pre_dst_height;
> -	u32 hfactor, vfactor;
> -	int ret = 0;
> -	u32 src_w, src_h, dst_w, dst_h;
> -
> -	cfg_ext = fimc_read(ctx, EXYNOS_CITRGFMT);
> -	if (cfg_ext & EXYNOS_CITRGFMT_INROT90_CLOCKWISE) {
> -		src_w = src->h;
> -		src_h = src->w;
> -	} else {
> -		src_w = src->w;
> -		src_h = src->h;
> -	}
> -
> -	if (cfg_ext & EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE) {
> -		dst_w = dst->h;
> -		dst_h = dst->w;
> -	} else {
> -		dst_w = dst->w;
> -		dst_h = dst->h;
> -	}
> -
> -	/* fimc_ippdrv_check_property assures that dividers are not null */
> -	hfactor = fls(src_w / dst_w / 2);
> -	if (hfactor > FIMC_SHFACTOR / 2) {
> -		dev_err(ippdrv->dev, "failed to get ratio horizontal.\n");
> -		return -EINVAL;
> -	}
> -
> -	vfactor = fls(src_h / dst_h / 2);
> -	if (vfactor > FIMC_SHFACTOR / 2) {
> -		dev_err(ippdrv->dev, "failed to get ratio vertical.\n");
> -		return -EINVAL;
> -	}
> -
> -	pre_dst_width = src_w >> hfactor;
> -	pre_dst_height = src_h >> vfactor;
> -	DRM_DEBUG_KMS("pre_dst_width[%d]pre_dst_height[%d]\n",
> -		pre_dst_width, pre_dst_height);
> -	DRM_DEBUG_KMS("hfactor[%d]vfactor[%d]\n", hfactor, vfactor);
> -
> -	sc->hratio = (src_w << 14) / (dst_w << hfactor);
> -	sc->vratio = (src_h << 14) / (dst_h << vfactor);
> -	sc->up_h = (dst_w >= src_w) ? true : false;
> -	sc->up_v = (dst_h >= src_h) ? true : false;
> -	DRM_DEBUG_KMS("hratio[%d]vratio[%d]up_h[%d]up_v[%d]\n",
> -		sc->hratio, sc->vratio, sc->up_h, sc->up_v);
> -
> -	shfactor = FIMC_SHFACTOR - (hfactor + vfactor);
> -	DRM_DEBUG_KMS("shfactor[%d]\n", shfactor);
> -
> -	cfg = (EXYNOS_CISCPRERATIO_SHFACTOR(shfactor) |
> -		EXYNOS_CISCPRERATIO_PREHORRATIO(1 << hfactor) |
> -		EXYNOS_CISCPRERATIO_PREVERRATIO(1 << vfactor));
> -	fimc_write(ctx, cfg, EXYNOS_CISCPRERATIO);
> -
> -	cfg = (EXYNOS_CISCPREDST_PREDSTWIDTH(pre_dst_width) |
> -		EXYNOS_CISCPREDST_PREDSTHEIGHT(pre_dst_height));
> -	fimc_write(ctx, cfg, EXYNOS_CISCPREDST);
> -
> -	return ret;
> -}
> -
> -static void fimc_set_scaler(struct fimc_context *ctx, struct fimc_scaler *sc)
> -{
> -	u32 cfg, cfg_ext;
> -
> -	DRM_DEBUG_KMS("range[%d]bypass[%d]up_h[%d]up_v[%d]\n",
> -		sc->range, sc->bypass, sc->up_h, sc->up_v);
> -	DRM_DEBUG_KMS("hratio[%d]vratio[%d]\n",
> -		sc->hratio, sc->vratio);
> -
> -	cfg = fimc_read(ctx, EXYNOS_CISCCTRL);
> -	cfg &= ~(EXYNOS_CISCCTRL_SCALERBYPASS |
> -		EXYNOS_CISCCTRL_SCALEUP_H | EXYNOS_CISCCTRL_SCALEUP_V |
> -		EXYNOS_CISCCTRL_MAIN_V_RATIO_MASK |
> -		EXYNOS_CISCCTRL_MAIN_H_RATIO_MASK |
> -		EXYNOS_CISCCTRL_CSCR2Y_WIDE |
> -		EXYNOS_CISCCTRL_CSCY2R_WIDE);
> -
> -	if (sc->range)
> -		cfg |= (EXYNOS_CISCCTRL_CSCR2Y_WIDE |
> -			EXYNOS_CISCCTRL_CSCY2R_WIDE);
> -	if (sc->bypass)
> -		cfg |= EXYNOS_CISCCTRL_SCALERBYPASS;
> -	if (sc->up_h)
> -		cfg |= EXYNOS_CISCCTRL_SCALEUP_H;
> -	if (sc->up_v)
> -		cfg |= EXYNOS_CISCCTRL_SCALEUP_V;
> -
> -	cfg |= (EXYNOS_CISCCTRL_MAINHORRATIO((sc->hratio >> 6)) |
> -		EXYNOS_CISCCTRL_MAINVERRATIO((sc->vratio >> 6)));
> -	fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> -
> -	cfg_ext = fimc_read(ctx, EXYNOS_CIEXTEN);
> -	cfg_ext &= ~EXYNOS_CIEXTEN_MAINHORRATIO_EXT_MASK;
> -	cfg_ext &= ~EXYNOS_CIEXTEN_MAINVERRATIO_EXT_MASK;
> -	cfg_ext |= (EXYNOS_CIEXTEN_MAINHORRATIO_EXT(sc->hratio) |
> -		EXYNOS_CIEXTEN_MAINVERRATIO_EXT(sc->vratio));
> -	fimc_write(ctx, cfg_ext, EXYNOS_CIEXTEN);
> -}
> -
> -static int fimc_dst_set_size(struct device *dev, int swap,
> -		struct drm_exynos_pos *pos, struct drm_exynos_sz *sz)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct drm_exynos_pos img_pos = *pos;
> -	struct drm_exynos_sz img_sz = *sz;
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("swap[%d]hsize[%d]vsize[%d]\n",
> -		swap, sz->hsize, sz->vsize);
> -
> -	/* original size */
> -	cfg = (EXYNOS_ORGOSIZE_HORIZONTAL(img_sz.hsize) |
> -		EXYNOS_ORGOSIZE_VERTICAL(img_sz.vsize));
> -
> -	fimc_write(ctx, cfg, EXYNOS_ORGOSIZE);
> -
> -	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]\n", pos->x, pos->y, pos->w, pos->h);
> -
> -	/* CSC ITU */
> -	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
> -	cfg &= ~EXYNOS_CIGCTRL_CSC_MASK;
> -
> -	if (sz->hsize >= FIMC_WIDTH_ITU_709)
> -		cfg |= EXYNOS_CIGCTRL_CSC_ITU709;
> -	else
> -		cfg |= EXYNOS_CIGCTRL_CSC_ITU601;
> -
> -	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
> -
> -	if (swap) {
> -		img_pos.w = pos->h;
> -		img_pos.h = pos->w;
> -		img_sz.hsize = sz->vsize;
> -		img_sz.vsize = sz->hsize;
> -	}
> -
> -	/* target image size */
> -	cfg = fimc_read(ctx, EXYNOS_CITRGFMT);
> -	cfg &= ~(EXYNOS_CITRGFMT_TARGETH_MASK |
> -		EXYNOS_CITRGFMT_TARGETV_MASK);
> -	cfg |= (EXYNOS_CITRGFMT_TARGETHSIZE(img_pos.w) |
> -		EXYNOS_CITRGFMT_TARGETVSIZE(img_pos.h));
> -	fimc_write(ctx, cfg, EXYNOS_CITRGFMT);
> -
> -	/* target area */
> -	cfg = EXYNOS_CITAREA_TARGET_AREA(img_pos.w * img_pos.h);
> -	fimc_write(ctx, cfg, EXYNOS_CITAREA);
> -
> -	/* offset Y(RGB), Cb, Cr */
> -	cfg = (EXYNOS_CIOYOFF_HORIZONTAL(img_pos.x) |
> -		EXYNOS_CIOYOFF_VERTICAL(img_pos.y));
> -	fimc_write(ctx, cfg, EXYNOS_CIOYOFF);
> -	cfg = (EXYNOS_CIOCBOFF_HORIZONTAL(img_pos.x) |
> -		EXYNOS_CIOCBOFF_VERTICAL(img_pos.y));
> -	fimc_write(ctx, cfg, EXYNOS_CIOCBOFF);
> -	cfg = (EXYNOS_CIOCROFF_HORIZONTAL(img_pos.x) |
> -		EXYNOS_CIOCROFF_VERTICAL(img_pos.y));
> -	fimc_write(ctx, cfg, EXYNOS_CIOCROFF);
> -
> -	return 0;
> -}
> -
> -static void fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
> -		enum drm_exynos_ipp_buf_type buf_type)
> -{
> -	unsigned long flags;
> -	u32 buf_num;
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("buf_id[%d]buf_type[%d]\n", buf_id, buf_type);
> -
> -	spin_lock_irqsave(&ctx->lock, flags);
> -
> -	cfg = fimc_read(ctx, EXYNOS_CIFCNTSEQ);
> -
> -	if (buf_type == IPP_BUF_ENQUEUE)
> -		cfg |= (1 << buf_id);
> -	else
> -		cfg &= ~(1 << buf_id);
> -
> -	fimc_write(ctx, cfg, EXYNOS_CIFCNTSEQ);
> -
> -	buf_num = hweight32(cfg);
> -
> -	if (buf_type == IPP_BUF_ENQUEUE && buf_num >= FIMC_BUF_START)
> -		fimc_mask_irq(ctx, true);
> -	else if (buf_type == IPP_BUF_DEQUEUE && buf_num <= FIMC_BUF_STOP)
> -		fimc_mask_irq(ctx, false);
> -
> -	spin_unlock_irqrestore(&ctx->lock, flags);
> -}
> -
> -static int fimc_dst_set_addr(struct device *dev,
> -		struct drm_exynos_ipp_buf_info *buf_info, u32 buf_id,
> -		enum drm_exynos_ipp_buf_type buf_type)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
> -	struct drm_exynos_ipp_property *property;
> -	struct drm_exynos_ipp_config *config;
> -
> -	if (!c_node) {
> -		DRM_ERROR("failed to get c_node.\n");
> -		return -EINVAL;
> -	}
> -
> -	property = &c_node->property;
> -
> -	DRM_DEBUG_KMS("prop_id[%d]buf_id[%d]buf_type[%d]\n",
> -		property->prop_id, buf_id, buf_type);
> -
> -	if (buf_id > FIMC_MAX_DST) {
> -		dev_info(ippdrv->dev, "invalid buf_id %d.\n", buf_id);
> -		return -ENOMEM;
> -	}
> -
> -	/* address register set */
> -	switch (buf_type) {
> -	case IPP_BUF_ENQUEUE:
> -		config = &property->config[EXYNOS_DRM_OPS_DST];
> -
> -		fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_Y],
> -			EXYNOS_CIOYSA(buf_id));
> -
> -		if (config->fmt == DRM_FORMAT_YVU420) {
> -			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
> -				EXYNOS_CIOCBSA(buf_id));
> -			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
> -				EXYNOS_CIOCRSA(buf_id));
> -		} else {
> -			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CB],
> -				EXYNOS_CIOCBSA(buf_id));
> -			fimc_write(ctx, buf_info->base[EXYNOS_DRM_PLANAR_CR],
> -				EXYNOS_CIOCRSA(buf_id));
> -		}
> -		break;
> -	case IPP_BUF_DEQUEUE:
> -		fimc_write(ctx, 0x0, EXYNOS_CIOYSA(buf_id));
> -		fimc_write(ctx, 0x0, EXYNOS_CIOCBSA(buf_id));
> -		fimc_write(ctx, 0x0, EXYNOS_CIOCRSA(buf_id));
> -		break;
> -	default:
> -		/* bypass */
> -		break;
> -	}
> -
> -	fimc_dst_set_buf_seq(ctx, buf_id, buf_type);
> -
> -	return 0;
> -}
> -
> -static struct exynos_drm_ipp_ops fimc_dst_ops = {
> -	.set_fmt = fimc_dst_set_fmt,
> -	.set_transf = fimc_dst_set_transf,
> -	.set_size = fimc_dst_set_size,
> -	.set_addr = fimc_dst_set_addr,
> -};
> -
> -static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
> -{
> -	struct fimc_context *ctx = dev_id;
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
> -	struct drm_exynos_ipp_event_work *event_work =
> -		c_node->event_work;
> -	int buf_id;
> -
> -	DRM_DEBUG_KMS("fimc id[%d]\n", ctx->id);
> -
> -	fimc_clear_irq(ctx);
> -	if (fimc_check_ovf(ctx))
> -		return IRQ_NONE;
> -
> -	if (!fimc_check_frame_end(ctx))
> -		return IRQ_NONE;
> -
> -	buf_id = fimc_get_buf_id(ctx);
> -	if (buf_id < 0)
> -		return IRQ_HANDLED;
> -
> -	DRM_DEBUG_KMS("buf_id[%d]\n", buf_id);
> -
> -	fimc_dst_set_buf_seq(ctx, buf_id, IPP_BUF_DEQUEUE);
> -
> -	event_work->ippdrv = ippdrv;
> -	event_work->buf_id[EXYNOS_DRM_OPS_DST] = buf_id;
> -	queue_work(ippdrv->event_workq, &event_work->work);
> -
> -	return IRQ_HANDLED;
> -}
> -
> -static int fimc_init_prop_list(struct exynos_drm_ippdrv *ippdrv)
> -{
> -	struct drm_exynos_ipp_prop_list *prop_list = &ippdrv->prop_list;
> -
> -	prop_list->version = 1;
> -	prop_list->writeback = 1;
> -	prop_list->refresh_min = FIMC_REFRESH_MIN;
> -	prop_list->refresh_max = FIMC_REFRESH_MAX;
> -	prop_list->flip = (1 << EXYNOS_DRM_FLIP_NONE) |
> -				(1 << EXYNOS_DRM_FLIP_VERTICAL) |
> -				(1 << EXYNOS_DRM_FLIP_HORIZONTAL);
> -	prop_list->degree = (1 << EXYNOS_DRM_DEGREE_0) |
> -				(1 << EXYNOS_DRM_DEGREE_90) |
> -				(1 << EXYNOS_DRM_DEGREE_180) |
> -				(1 << EXYNOS_DRM_DEGREE_270);
> -	prop_list->csc = 1;
> -	prop_list->crop = 1;
> -	prop_list->crop_max.hsize = FIMC_CROP_MAX;
> -	prop_list->crop_max.vsize = FIMC_CROP_MAX;
> -	prop_list->crop_min.hsize = FIMC_CROP_MIN;
> -	prop_list->crop_min.vsize = FIMC_CROP_MIN;
> -	prop_list->scale = 1;
> -	prop_list->scale_max.hsize = FIMC_SCALE_MAX;
> -	prop_list->scale_max.vsize = FIMC_SCALE_MAX;
> -	prop_list->scale_min.hsize = FIMC_SCALE_MIN;
> -	prop_list->scale_min.vsize = FIMC_SCALE_MIN;
> -
> -	return 0;
> -}
> -
> -static inline bool fimc_check_drm_flip(enum drm_exynos_flip flip)
> -{
> -	switch (flip) {
> -	case EXYNOS_DRM_FLIP_NONE:
> -	case EXYNOS_DRM_FLIP_VERTICAL:
> -	case EXYNOS_DRM_FLIP_HORIZONTAL:
> -	case EXYNOS_DRM_FLIP_BOTH:
> -		return true;
> -	default:
> -		DRM_DEBUG_KMS("invalid flip\n");
> -		return false;
> -	}
> -}
> -
> -static int fimc_ippdrv_check_property(struct device *dev,
> -		struct drm_exynos_ipp_property *property)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	struct drm_exynos_ipp_prop_list *pp = &ippdrv->prop_list;
> -	struct drm_exynos_ipp_config *config;
> -	struct drm_exynos_pos *pos;
> -	struct drm_exynos_sz *sz;
> -	bool swap;
> -	int i;
> -
> -	for_each_ipp_ops(i) {
> -		if ((i == EXYNOS_DRM_OPS_SRC) &&
> -			(property->cmd == IPP_CMD_WB))
> -			continue;
> -
> -		config = &property->config[i];
> -		pos = &config->pos;
> -		sz = &config->sz;
> -
> -		/* check for flip */
> -		if (!fimc_check_drm_flip(config->flip)) {
> -			DRM_ERROR("invalid flip.\n");
> -			goto err_property;
> -		}
> -
> -		/* check for degree */
> -		switch (config->degree) {
> -		case EXYNOS_DRM_DEGREE_90:
> -		case EXYNOS_DRM_DEGREE_270:
> -			swap = true;
> -			break;
> -		case EXYNOS_DRM_DEGREE_0:
> -		case EXYNOS_DRM_DEGREE_180:
> -			swap = false;
> -			break;
> -		default:
> -			DRM_ERROR("invalid degree.\n");
> -			goto err_property;
> -		}
> -
> -		/* check for buffer bound */
> -		if ((pos->x + pos->w > sz->hsize) ||
> -			(pos->y + pos->h > sz->vsize)) {
> -			DRM_ERROR("out of buf bound.\n");
> -			goto err_property;
> -		}
> -
> -		/* check for crop */
> -		if ((i == EXYNOS_DRM_OPS_SRC) && (pp->crop)) {
> -			if (swap) {
> -				if ((pos->h < pp->crop_min.hsize) ||
> -					(sz->vsize > pp->crop_max.hsize) ||
> -					(pos->w < pp->crop_min.vsize) ||
> -					(sz->hsize > pp->crop_max.vsize)) {
> -					DRM_ERROR("out of crop size.\n");
> -					goto err_property;
> -				}
> -			} else {
> -				if ((pos->w < pp->crop_min.hsize) ||
> -					(sz->hsize > pp->crop_max.hsize) ||
> -					(pos->h < pp->crop_min.vsize) ||
> -					(sz->vsize > pp->crop_max.vsize)) {
> -					DRM_ERROR("out of crop size.\n");
> -					goto err_property;
> -				}
> -			}
> -		}
> -
> -		/* check for scale */
> -		if ((i == EXYNOS_DRM_OPS_DST) && (pp->scale)) {
> -			if (swap) {
> -				if ((pos->h < pp->scale_min.hsize) ||
> -					(sz->vsize > pp->scale_max.hsize) ||
> -					(pos->w < pp->scale_min.vsize) ||
> -					(sz->hsize > pp->scale_max.vsize)) {
> -					DRM_ERROR("out of scale size.\n");
> -					goto err_property;
> -				}
> -			} else {
> -				if ((pos->w < pp->scale_min.hsize) ||
> -					(sz->hsize > pp->scale_max.hsize) ||
> -					(pos->h < pp->scale_min.vsize) ||
> -					(sz->vsize > pp->scale_max.vsize)) {
> -					DRM_ERROR("out of scale size.\n");
> -					goto err_property;
> -				}
> -			}
> -		}
> -	}
> -
> -	return 0;
> -
> -err_property:
> -	for_each_ipp_ops(i) {
> -		if ((i == EXYNOS_DRM_OPS_SRC) &&
> -			(property->cmd == IPP_CMD_WB))
> -			continue;
> -
> -		config = &property->config[i];
> -		pos = &config->pos;
> -		sz = &config->sz;
> -
> -		DRM_ERROR("[%s]f[%d]r[%d]pos[%d %d %d %d]sz[%d %d]\n",
> -			i ? "dst" : "src", config->flip, config->degree,
> -			pos->x, pos->y, pos->w, pos->h,
> -			sz->hsize, sz->vsize);
> -	}
> -
> -	return -EINVAL;
> -}
> -
> -static void fimc_clear_addr(struct fimc_context *ctx)
> -{
> -	int i;
> -
> -	for (i = 0; i < FIMC_MAX_SRC; i++) {
> -		fimc_write(ctx, 0, EXYNOS_CIIYSA(i));
> -		fimc_write(ctx, 0, EXYNOS_CIICBSA(i));
> -		fimc_write(ctx, 0, EXYNOS_CIICRSA(i));
> -	}
> -
> -	for (i = 0; i < FIMC_MAX_DST; i++) {
> -		fimc_write(ctx, 0, EXYNOS_CIOYSA(i));
> -		fimc_write(ctx, 0, EXYNOS_CIOCBSA(i));
> -		fimc_write(ctx, 0, EXYNOS_CIOCRSA(i));
> -	}
> -}
> -
> -static int fimc_ippdrv_reset(struct device *dev)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -
> -	/* reset h/w block */
> -	fimc_sw_reset(ctx);
> -
> -	/* reset scaler capability */
> -	memset(&ctx->sc, 0x0, sizeof(ctx->sc));
> -
> -	fimc_clear_addr(ctx);
> -
> -	return 0;
> -}
> -
> -static int fimc_ippdrv_start(struct device *dev, enum drm_exynos_ipp_cmd cmd)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -	struct drm_exynos_ipp_cmd_node *c_node = ippdrv->c_node;
> -	struct drm_exynos_ipp_property *property;
> -	struct drm_exynos_ipp_config *config;
> -	struct drm_exynos_pos	img_pos[EXYNOS_DRM_OPS_MAX];
> -	struct drm_exynos_ipp_set_wb set_wb;
> -	int ret, i;
> -	u32 cfg0, cfg1;
> -
> -	DRM_DEBUG_KMS("cmd[%d]\n", cmd);
> -
> -	if (!c_node) {
> -		DRM_ERROR("failed to get c_node.\n");
> -		return -EINVAL;
> -	}
> -
> -	property = &c_node->property;
> -
> -	fimc_mask_irq(ctx, true);
> -
> -	for_each_ipp_ops(i) {
> -		config = &property->config[i];
> -		img_pos[i] = config->pos;
> -	}
> -
> -	ret = fimc_set_prescaler(ctx, &ctx->sc,
> -		&img_pos[EXYNOS_DRM_OPS_SRC],
> -		&img_pos[EXYNOS_DRM_OPS_DST]);
> -	if (ret) {
> -		dev_err(dev, "failed to set prescaler.\n");
> -		return ret;
> -	}
> -
> -	/* If set ture, we can save jpeg about screen */
> -	fimc_handle_jpeg(ctx, false);
> -	fimc_set_scaler(ctx, &ctx->sc);
> -
> -	switch (cmd) {
> -	case IPP_CMD_M2M:
> -		fimc_set_type_ctrl(ctx, FIMC_WB_NONE);
> -		fimc_handle_lastend(ctx, false);
> -
> -		/* setup dma */
> -		cfg0 = fimc_read(ctx, EXYNOS_MSCTRL);
> -		cfg0 &= ~EXYNOS_MSCTRL_INPUT_MASK;
> -		cfg0 |= EXYNOS_MSCTRL_INPUT_MEMORY;
> -		fimc_write(ctx, cfg0, EXYNOS_MSCTRL);
> -		break;
> -	case IPP_CMD_WB:
> -		fimc_set_type_ctrl(ctx, FIMC_WB_A);
> -		fimc_handle_lastend(ctx, true);
> -
> -		/* setup FIMD */
> -		ret = fimc_set_camblk_fimd0_wb(ctx);
> -		if (ret < 0) {
> -			dev_err(dev, "camblk setup failed.\n");
> -			return ret;
> -		}
> -
> -		set_wb.enable = 1;
> -		set_wb.refresh = property->refresh_rate;
> -		exynos_drm_ippnb_send_event(IPP_SET_WRITEBACK, (void *)&set_wb);
> -		break;
> -	case IPP_CMD_OUTPUT:
> -	default:
> -		ret = -EINVAL;
> -		dev_err(dev, "invalid operations.\n");
> -		return ret;
> -	}
> -
> -	/* Reset status */
> -	fimc_write(ctx, 0x0, EXYNOS_CISTATUS);
> -
> -	cfg0 = fimc_read(ctx, EXYNOS_CIIMGCPT);
> -	cfg0 &= ~EXYNOS_CIIMGCPT_IMGCPTEN_SC;
> -	cfg0 |= EXYNOS_CIIMGCPT_IMGCPTEN_SC;
> -
> -	/* Scaler */
> -	cfg1 = fimc_read(ctx, EXYNOS_CISCCTRL);
> -	cfg1 &= ~EXYNOS_CISCCTRL_SCAN_MASK;
> -	cfg1 |= (EXYNOS_CISCCTRL_PROGRESSIVE |
> -		EXYNOS_CISCCTRL_SCALERSTART);
> -
> -	fimc_write(ctx, cfg1, EXYNOS_CISCCTRL);
> -
> -	/* Enable image capture*/
> -	cfg0 |= EXYNOS_CIIMGCPT_IMGCPTEN;
> -	fimc_write(ctx, cfg0, EXYNOS_CIIMGCPT);
> -
> -	/* Disable frame end irq */
> -	fimc_clear_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_IRQ_END_DISABLE);
> -
> -	fimc_clear_bits(ctx, EXYNOS_CIOCTRL, EXYNOS_CIOCTRL_WEAVE_MASK);
> -
> -	if (cmd == IPP_CMD_M2M)
> -		fimc_set_bits(ctx, EXYNOS_MSCTRL, EXYNOS_MSCTRL_ENVID);
> -
> -	return 0;
> -}
> -
> -static void fimc_ippdrv_stop(struct device *dev, enum drm_exynos_ipp_cmd cmd)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct drm_exynos_ipp_set_wb set_wb = {0, 0};
> -	u32 cfg;
> -
> -	DRM_DEBUG_KMS("cmd[%d]\n", cmd);
> -
> -	switch (cmd) {
> -	case IPP_CMD_M2M:
> -		/* Source clear */
> -		cfg = fimc_read(ctx, EXYNOS_MSCTRL);
> -		cfg &= ~EXYNOS_MSCTRL_INPUT_MASK;
> -		cfg &= ~EXYNOS_MSCTRL_ENVID;
> -		fimc_write(ctx, cfg, EXYNOS_MSCTRL);
> -		break;
> -	case IPP_CMD_WB:
> -		exynos_drm_ippnb_send_event(IPP_SET_WRITEBACK, (void *)&set_wb);
> -		break;
> -	case IPP_CMD_OUTPUT:
> -	default:
> -		dev_err(dev, "invalid operations.\n");
> -		break;
> -	}
> -
> -	fimc_mask_irq(ctx, false);
> -
> -	/* reset sequence */
> -	fimc_write(ctx, 0x0, EXYNOS_CIFCNTSEQ);
> -
> -	/* Scaler disable */
> -	fimc_clear_bits(ctx, EXYNOS_CISCCTRL, EXYNOS_CISCCTRL_SCALERSTART);
> -
> -	/* Disable image capture */
> -	fimc_clear_bits(ctx, EXYNOS_CIIMGCPT,
> -		EXYNOS_CIIMGCPT_IMGCPTEN_SC | EXYNOS_CIIMGCPT_IMGCPTEN);
> -
> -	/* Enable frame end irq */
> -	fimc_set_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_IRQ_END_DISABLE);
> -}
> -
> -static void fimc_put_clocks(struct fimc_context *ctx)
> -{
> -	int i;
> -
> -	for (i = 0; i < FIMC_CLKS_MAX; i++) {
> -		if (IS_ERR(ctx->clocks[i]))
> -			continue;
> -		clk_put(ctx->clocks[i]);
> -		ctx->clocks[i] = ERR_PTR(-EINVAL);
> -	}
> -}
> -
> -static int fimc_setup_clocks(struct fimc_context *ctx)
> -{
> -	struct device *fimc_dev = ctx->ippdrv.dev;
> -	struct device *dev;
> -	int ret, i;
> -
> -	for (i = 0; i < FIMC_CLKS_MAX; i++)
> -		ctx->clocks[i] = ERR_PTR(-EINVAL);
> -
> -	for (i = 0; i < FIMC_CLKS_MAX; i++) {
> -		if (i == FIMC_CLK_WB_A || i == FIMC_CLK_WB_B)
> -			dev = fimc_dev->parent;
> -		else
> -			dev = fimc_dev;
> -
> -		ctx->clocks[i] = clk_get(dev, fimc_clock_names[i]);
> -		if (IS_ERR(ctx->clocks[i])) {
> -			if (i >= FIMC_CLK_MUX)
> -				break;
> -			ret = PTR_ERR(ctx->clocks[i]);
> -			dev_err(fimc_dev, "failed to get clock: %s\n",
> -						fimc_clock_names[i]);
> -			goto e_clk_free;
> -		}
> -	}
> -
> -	/* Optional FIMC LCLK parent clock setting */
> -	if (!IS_ERR(ctx->clocks[FIMC_CLK_PARENT])) {
> -		ret = clk_set_parent(ctx->clocks[FIMC_CLK_MUX],
> -				     ctx->clocks[FIMC_CLK_PARENT]);
> -		if (ret < 0) {
> -			dev_err(fimc_dev, "failed to set parent.\n");
> -			goto e_clk_free;
> -		}
> -	}
> -
> -	ret = clk_set_rate(ctx->clocks[FIMC_CLK_LCLK], ctx->clk_frequency);
> -	if (ret < 0)
> -		goto e_clk_free;
> -
> -	ret = clk_prepare_enable(ctx->clocks[FIMC_CLK_LCLK]);
> -	if (!ret)
> -		return ret;
> -e_clk_free:
> -	fimc_put_clocks(ctx);
> -	return ret;
> -}
> -
> -static int fimc_parse_dt(struct fimc_context *ctx)
> -{
> -	struct device_node *node = ctx->ippdrv.dev->of_node;
> -
> -	/* Handle only devices that support the LCD Writeback data path */
> -	if (!of_property_read_bool(node, "samsung,lcd-wb"))
> -		return -ENODEV;
> -
> -	if (of_property_read_u32(node, "clock-frequency",
> -					&ctx->clk_frequency))
> -		ctx->clk_frequency = FIMC_DEFAULT_LCLK_FREQUENCY;
> -
> -	ctx->id = of_alias_get_id(node, "fimc");
> -
> -	if (ctx->id < 0) {
> -		dev_err(ctx->ippdrv.dev, "failed to get node alias id.\n");
> -		return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static int fimc_probe(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct fimc_context *ctx;
> -	struct resource *res;
> -	struct exynos_drm_ippdrv *ippdrv;
> -	int ret;
> -
> -	if (!dev->of_node) {
> -		dev_err(dev, "device tree node not found.\n");
> -		return -ENODEV;
> -	}
> -
> -	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> -	if (!ctx)
> -		return -ENOMEM;
> -
> -	ctx->ippdrv.dev = dev;
> -
> -	ret = fimc_parse_dt(ctx);
> -	if (ret < 0)
> -		return ret;
> -
> -	ctx->sysreg = syscon_regmap_lookup_by_phandle(dev->of_node,
> -						"samsung,sysreg");
> -	if (IS_ERR(ctx->sysreg)) {
> -		dev_err(dev, "syscon regmap lookup failed.\n");
> -		return PTR_ERR(ctx->sysreg);
> -	}
> -
> -	/* resource memory */
> -	ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
> -	if (IS_ERR(ctx->regs))
> -		return PTR_ERR(ctx->regs);
> -
> -	/* resource irq */
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> -		dev_err(dev, "failed to request irq resource.\n");
> -		return -ENOENT;
> -	}
> -
> -	ctx->irq = res->start;
> -	ret = devm_request_threaded_irq(dev, ctx->irq, NULL, fimc_irq_handler,
> -		IRQF_ONESHOT, "drm_fimc", ctx);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to request irq.\n");
> -		return ret;
> -	}
> -
> -	ret = fimc_setup_clocks(ctx);
> -	if (ret < 0)
> -		return ret;
> -
> -	ippdrv = &ctx->ippdrv;
> -	ippdrv->ops[EXYNOS_DRM_OPS_SRC] = &fimc_src_ops;
> -	ippdrv->ops[EXYNOS_DRM_OPS_DST] = &fimc_dst_ops;
> -	ippdrv->check_property = fimc_ippdrv_check_property;
> -	ippdrv->reset = fimc_ippdrv_reset;
> -	ippdrv->start = fimc_ippdrv_start;
> -	ippdrv->stop = fimc_ippdrv_stop;
> -	ret = fimc_init_prop_list(ippdrv);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to init property list.\n");
> -		goto err_put_clk;
> -	}
> -
> -	DRM_DEBUG_KMS("id[%d]ippdrv[%pK]\n", ctx->id, ippdrv);
> -
> -	spin_lock_init(&ctx->lock);
> -	platform_set_drvdata(pdev, ctx);
> -
> -	pm_runtime_enable(dev);
> -
> -	ret = exynos_drm_ippdrv_register(ippdrv);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to register drm fimc device.\n");
> -		goto err_pm_dis;
> -	}
> -
> -	dev_info(dev, "drm fimc registered successfully.\n");
> -
> -	return 0;
> -
> -err_pm_dis:
> -	pm_runtime_disable(dev);
> -err_put_clk:
> -	fimc_put_clocks(ctx);
> -
> -	return ret;
> -}
> -
> -static int fimc_remove(struct platform_device *pdev)
> -{
> -	struct device *dev = &pdev->dev;
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -	struct exynos_drm_ippdrv *ippdrv = &ctx->ippdrv;
> -
> -	exynos_drm_ippdrv_unregister(ippdrv);
> -
> -	fimc_put_clocks(ctx);
> -	pm_runtime_set_suspended(dev);
> -	pm_runtime_disable(dev);
> -
> -	return 0;
> -}
> -
> -#ifdef CONFIG_PM
> -static int fimc_clk_ctrl(struct fimc_context *ctx, bool enable)
> -{
> -	DRM_DEBUG_KMS("enable[%d]\n", enable);
> -
> -	if (enable) {
> -		clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
> -		clk_prepare_enable(ctx->clocks[FIMC_CLK_WB_A]);
> -		ctx->suspended = false;
> -	} else {
> -		clk_disable_unprepare(ctx->clocks[FIMC_CLK_GATE]);
> -		clk_disable_unprepare(ctx->clocks[FIMC_CLK_WB_A]);
> -		ctx->suspended = true;
> -	}
> -
> -	return 0;
> -}
> -
> -static int fimc_runtime_suspend(struct device *dev)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -
> -	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
> -
> -	return  fimc_clk_ctrl(ctx, false);
> -}
> -
> -static int fimc_runtime_resume(struct device *dev)
> -{
> -	struct fimc_context *ctx = get_fimc_context(dev);
> -
> -	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
> -
> -	return  fimc_clk_ctrl(ctx, true);
> -}
> -#endif
> -
> -static const struct dev_pm_ops fimc_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -				pm_runtime_force_resume)
> -	SET_RUNTIME_PM_OPS(fimc_runtime_suspend, fimc_runtime_resume, NULL)
> -};
> -
> -static const struct of_device_id fimc_of_match[] = {
> -	{ .compatible = "samsung,exynos4210-fimc" },
> -	{ .compatible = "samsung,exynos4212-fimc" },
> -	{ },
> -};
> -MODULE_DEVICE_TABLE(of, fimc_of_match);
> -
> -struct platform_driver fimc_driver = {
> -	.probe		= fimc_probe,
> -	.remove		= fimc_remove,
> -	.driver		= {
> -		.of_match_table = fimc_of_match,
> -		.name	= "exynos-drm-fimc",
> -		.owner	= THIS_MODULE,
> -		.pm	= &fimc_pm_ops,
> -	},
> -};
> -
> +/*
> + * Copyright (C) 2012 Samsung Electronics Co.Ltd
> + * Authors:
> + *	Eunchul Kim <chulspro.kim@samsung.com>
> + *	Jinyoung Jeon <jy0.jeon@samsung.com>
> + *	Sangmin Lee <lsmin.lee@samsung.com>
> + *
> + * This program is free software; you can redistribute  it and/or modify it
> + * under  the terms of  the GNU General  Public License as published by the
> + * Free Software Foundation;  either version 2 of the  License, or (at your
> + * option) any later version.
> + *
> + */
> +#include <linux/kernel.h>
> +#include <linux/component.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/clk.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/of.h>
> +#include <linux/spinlock.h>
> +
> +#include <drm/drmP.h>
> +#include <drm/exynos_drm.h>
> +#include "regs-fimc.h"
> +#include "exynos_drm_drv.h"
> +#include "exynos_drm_iommu.h"
> +#include "exynos_drm_ipp.h"
> +
> +/*
> + * FIMC stands for Fully Interactive Mobile Camera and
> + * supports image scaler/rotator and input/output DMA operations.
> + * input DMA reads image data from the memory.
> + * output DMA writes image data to memory.
> + * FIMC supports image rotation and image effect functions.
> + */
> +
> +#define FIMC_MAX_DEVS	4
> +#define FIMC_MAX_SRC	2
> +#define FIMC_MAX_DST	32
> +#define FIMC_SHFACTOR	10
> +#define FIMC_BUF_STOP	1
> +#define FIMC_BUF_START	2
> +#define FIMC_WIDTH_ITU_709	1280
> +#define FIMC_AUTOSUSPEND_DELAY	2000
> +
> +static unsigned int fimc_mask = 0xc;
> +module_param_named(fimc_devs, fimc_mask, uint, 0644);
> +MODULE_PARM_DESC(fimc_devs, "Alias mask for assigning FIMC devices to Exynos DRM");
> +
> +#define get_fimc_context(dev)	platform_get_drvdata(to_platform_device(dev))
> +
> +enum {
> +	FIMC_CLK_LCLK,
> +	FIMC_CLK_GATE,
> +	FIMC_CLK_WB_A,
> +	FIMC_CLK_WB_B,
> +	FIMC_CLKS_MAX
> +};
> +
> +static const char * const fimc_clock_names[] = {
> +	[FIMC_CLK_LCLK]   = "sclk_fimc",
> +	[FIMC_CLK_GATE]   = "fimc",
> +	[FIMC_CLK_WB_A]   = "pxl_async0",
> +	[FIMC_CLK_WB_B]   = "pxl_async1",
> +};
> +
> +/*
> + * A structure of scaler.
> + *
> + * @range: narrow, wide.
> + * @bypass: unused scaler path.
> + * @up_h: horizontal scale up.
> + * @up_v: vertical scale up.
> + * @hratio: horizontal ratio.
> + * @vratio: vertical ratio.
> + */
> +struct fimc_scaler {
> +	bool range;
> +	bool bypass;
> +	bool up_h;
> +	bool up_v;
> +	u32 hratio;
> +	u32 vratio;
> +};
> +
> +/*
> + * A structure of fimc context.
> + *
> + * @regs_res: register resources.
> + * @regs: memory mapped io registers.
> + * @lock: locking of operations.
> + * @clocks: fimc clocks.
> + * @sc: scaler infomations.
> + * @pol: porarity of writeback.
> + * @id: fimc id.
> + * @irq: irq number.
> + */
> +struct fimc_context {
> +	struct exynos_drm_ipp ipp;
> +	struct drm_device *drm_dev;
> +	struct device	*dev;
> +	struct exynos_drm_ipp_task	*task;
> +	struct exynos_drm_ipp_formats	*formats;
> +	unsigned int			num_formats;
> +
> +	struct resource	*regs_res;
> +	void __iomem	*regs;
> +	spinlock_t	lock;
> +	struct clk	*clocks[FIMC_CLKS_MAX];
> +	struct fimc_scaler	sc;
> +	int	id;
> +	int	irq;
> +};
> +
> +static u32 fimc_read(struct fimc_context *ctx, u32 reg)
> +{
> +	return readl(ctx->regs + reg);
> +}
> +
> +static void fimc_write(struct fimc_context *ctx, u32 val, u32 reg)
> +{
> +	writel(val, ctx->regs + reg);
> +}
> +
> +static void fimc_set_bits(struct fimc_context *ctx, u32 reg, u32 bits)
> +{
> +	void __iomem *r = ctx->regs + reg;
> +
> +	writel(readl(r) | bits, r);
> +}
> +
> +static void fimc_clear_bits(struct fimc_context *ctx, u32 reg, u32 bits)
> +{
> +	void __iomem *r = ctx->regs + reg;
> +
> +	writel(readl(r) & ~bits, r);
> +}
> +
> +static void fimc_sw_reset(struct fimc_context *ctx)
> +{
> +	u32 cfg;
> +
> +	/* stop dma operation */
> +	cfg = fimc_read(ctx, EXYNOS_CISTATUS);
> +	if (EXYNOS_CISTATUS_GET_ENVID_STATUS(cfg))
> +		fimc_clear_bits(ctx, EXYNOS_MSCTRL, EXYNOS_MSCTRL_ENVID);
> +
> +	fimc_set_bits(ctx, EXYNOS_CISRCFMT, EXYNOS_CISRCFMT_ITU601_8BIT);
> +
> +	/* disable image capture */
> +	fimc_clear_bits(ctx, EXYNOS_CIIMGCPT,
> +		EXYNOS_CIIMGCPT_IMGCPTEN_SC | EXYNOS_CIIMGCPT_IMGCPTEN);
> +
> +	/* s/w reset */
> +	fimc_set_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_SWRST);
> +
> +	/* s/w reset complete */
> +	fimc_clear_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_SWRST);
> +
> +	/* reset sequence */
> +	fimc_write(ctx, 0x0, EXYNOS_CIFCNTSEQ);
> +}
> +
> +static void fimc_set_type_ctrl(struct fimc_context *ctx)
> +{
> +	u32 cfg;
> +
> +	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
> +	cfg &= ~(EXYNOS_CIGCTRL_TESTPATTERN_MASK |
> +		EXYNOS_CIGCTRL_SELCAM_ITU_MASK |
> +		EXYNOS_CIGCTRL_SELCAM_MIPI_MASK |
> +		EXYNOS_CIGCTRL_SELCAM_FIMC_MASK |
> +		EXYNOS_CIGCTRL_SELWB_CAMIF_MASK |
> +		EXYNOS_CIGCTRL_SELWRITEBACK_MASK);
> +
> +	cfg |= (EXYNOS_CIGCTRL_SELCAM_ITU_A |
> +		EXYNOS_CIGCTRL_SELWRITEBACK_A |
> +		EXYNOS_CIGCTRL_SELCAM_MIPI_A |
> +		EXYNOS_CIGCTRL_SELCAM_FIMC_ITU);
> +
> +	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
> +}
> +
> +static void fimc_handle_jpeg(struct fimc_context *ctx, bool enable)
> +{
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("enable[%d]\n", enable);
> +
> +	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
> +	if (enable)
> +		cfg |= EXYNOS_CIGCTRL_CAM_JPEG;
> +	else
> +		cfg &= ~EXYNOS_CIGCTRL_CAM_JPEG;
> +
> +	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
> +}
> +
> +static void fimc_mask_irq(struct fimc_context *ctx, bool enable)
> +{
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("enable[%d]\n", enable);
> +
> +	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
> +	if (enable) {
> +		cfg &= ~EXYNOS_CIGCTRL_IRQ_OVFEN;
> +		cfg |= EXYNOS_CIGCTRL_IRQ_ENABLE | EXYNOS_CIGCTRL_IRQ_LEVEL;
> +	} else
> +		cfg &= ~EXYNOS_CIGCTRL_IRQ_ENABLE;
> +	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
> +}
> +
> +static void fimc_clear_irq(struct fimc_context *ctx)
> +{
> +	fimc_set_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_IRQ_CLR);
> +}
> +
> +static bool fimc_check_ovf(struct fimc_context *ctx)
> +{
> +	u32 status, flag;
> +
> +	status = fimc_read(ctx, EXYNOS_CISTATUS);
> +	flag = EXYNOS_CISTATUS_OVFIY | EXYNOS_CISTATUS_OVFICB |
> +		EXYNOS_CISTATUS_OVFICR;
> +
> +	DRM_DEBUG_KMS("flag[0x%x]\n", flag);
> +
> +	if (status & flag) {
> +		fimc_set_bits(ctx, EXYNOS_CIWDOFST,
> +			EXYNOS_CIWDOFST_CLROVFIY | EXYNOS_CIWDOFST_CLROVFICB |
> +			EXYNOS_CIWDOFST_CLROVFICR);
> +
> +		dev_err(ctx->dev, "occurred overflow at %d, status 0x%x.\n",
> +			ctx->id, status);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool fimc_check_frame_end(struct fimc_context *ctx)
> +{
> +	u32 cfg;
> +
> +	cfg = fimc_read(ctx, EXYNOS_CISTATUS);
> +
> +	DRM_DEBUG_KMS("cfg[0x%x]\n", cfg);
> +
> +	if (!(cfg & EXYNOS_CISTATUS_FRAMEEND))
> +		return false;
> +
> +	cfg &= ~(EXYNOS_CISTATUS_FRAMEEND);
> +	fimc_write(ctx, cfg, EXYNOS_CISTATUS);
> +
> +	return true;
> +}
> +
> +static int fimc_get_buf_id(struct fimc_context *ctx)
> +{
> +	u32 cfg;
> +	int frame_cnt, buf_id;
> +
> +	cfg = fimc_read(ctx, EXYNOS_CISTATUS2);
> +	frame_cnt = EXYNOS_CISTATUS2_GET_FRAMECOUNT_BEFORE(cfg);
> +
> +	if (frame_cnt == 0)
> +		frame_cnt = EXYNOS_CISTATUS2_GET_FRAMECOUNT_PRESENT(cfg);
> +
> +	DRM_DEBUG_KMS("present[%d]before[%d]\n",
> +		EXYNOS_CISTATUS2_GET_FRAMECOUNT_PRESENT(cfg),
> +		EXYNOS_CISTATUS2_GET_FRAMECOUNT_BEFORE(cfg));
> +
> +	if (frame_cnt == 0) {
> +		DRM_ERROR("failed to get frame count.\n");
> +		return -EIO;
> +	}
> +
> +	buf_id = frame_cnt - 1;
> +	DRM_DEBUG_KMS("buf_id[%d]\n", buf_id);
> +
> +	return buf_id;
> +}
> +
> +static void fimc_handle_lastend(struct fimc_context *ctx, bool enable)
> +{
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("enable[%d]\n", enable);
> +
> +	cfg = fimc_read(ctx, EXYNOS_CIOCTRL);
> +	if (enable)
> +		cfg |= EXYNOS_CIOCTRL_LASTENDEN;
> +	else
> +		cfg &= ~EXYNOS_CIOCTRL_LASTENDEN;
> +
> +	fimc_write(ctx, cfg, EXYNOS_CIOCTRL);
> +}
> +
> +static void fimc_src_set_fmt_order(struct fimc_context *ctx, u32 fmt)
> +{
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
> +
> +	/* RGB */
> +	cfg = fimc_read(ctx, EXYNOS_CISCCTRL);
> +	cfg &= ~EXYNOS_CISCCTRL_INRGB_FMT_RGB_MASK;
> +
> +	switch (fmt) {
> +	case DRM_FORMAT_RGB565:
> +		cfg |= EXYNOS_CISCCTRL_INRGB_FMT_RGB565;
> +		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> +		return;
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_XRGB8888:
> +		cfg |= EXYNOS_CISCCTRL_INRGB_FMT_RGB888;
> +		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> +		return;
> +	default:
> +		/* bypass */
> +		break;
> +	}
> +
> +	/* YUV */
> +	cfg = fimc_read(ctx, EXYNOS_MSCTRL);
> +	cfg &= ~(EXYNOS_MSCTRL_ORDER2P_SHIFT_MASK |
> +		EXYNOS_MSCTRL_C_INT_IN_2PLANE |
> +		EXYNOS_MSCTRL_ORDER422_YCBYCR);
> +
> +	switch (fmt) {
> +	case DRM_FORMAT_YUYV:
> +		cfg |= EXYNOS_MSCTRL_ORDER422_YCBYCR;
> +		break;
> +	case DRM_FORMAT_YVYU:
> +		cfg |= EXYNOS_MSCTRL_ORDER422_YCRYCB;
> +		break;
> +	case DRM_FORMAT_UYVY:
> +		cfg |= EXYNOS_MSCTRL_ORDER422_CBYCRY;
> +		break;
> +	case DRM_FORMAT_VYUY:
> +	case DRM_FORMAT_YUV444:
> +		cfg |= EXYNOS_MSCTRL_ORDER422_CRYCBY;
> +		break;
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +		cfg |= (EXYNOS_MSCTRL_ORDER2P_LSB_CRCB |
> +			EXYNOS_MSCTRL_C_INT_IN_2PLANE);
> +		break;
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YVU420:
> +		cfg |= EXYNOS_MSCTRL_C_INT_IN_3PLANE;
> +		break;
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +		cfg |= (EXYNOS_MSCTRL_ORDER2P_LSB_CBCR |
> +			EXYNOS_MSCTRL_C_INT_IN_2PLANE);
> +		break;
> +	}
> +
> +	fimc_write(ctx, cfg, EXYNOS_MSCTRL);
> +}
> +
> +static void fimc_src_set_fmt(struct fimc_context *ctx, u32 fmt)
> +{
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
> +
> +	cfg = fimc_read(ctx, EXYNOS_MSCTRL);
> +	cfg &= ~EXYNOS_MSCTRL_INFORMAT_RGB;
> +
> +	switch (fmt) {
> +	case DRM_FORMAT_RGB565:
> +	case DRM_FORMAT_RGB888:
> +	case DRM_FORMAT_XRGB8888:
> +		cfg |= EXYNOS_MSCTRL_INFORMAT_RGB;
> +		break;
> +	case DRM_FORMAT_YUV444:
> +		cfg |= EXYNOS_MSCTRL_INFORMAT_YCBCR420;
> +		break;
> +	case DRM_FORMAT_YUYV:
> +	case DRM_FORMAT_YVYU:
> +	case DRM_FORMAT_UYVY:
> +	case DRM_FORMAT_VYUY:
> +		cfg |= EXYNOS_MSCTRL_INFORMAT_YCBCR422_1PLANE;
> +		break;
> +	case DRM_FORMAT_NV16:
> +	case DRM_FORMAT_NV61:
> +	case DRM_FORMAT_YUV422:
> +		cfg |= EXYNOS_MSCTRL_INFORMAT_YCBCR422;
> +		break;
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YVU420:
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV21:
> +		cfg |= EXYNOS_MSCTRL_INFORMAT_YCBCR420;
> +		break;
> +	}
> +
> +	fimc_write(ctx, cfg, EXYNOS_MSCTRL);
> +
> +	cfg = fimc_read(ctx, EXYNOS_CIDMAPARAM);
> +	cfg &= ~EXYNOS_CIDMAPARAM_R_MODE_MASK;
> +
> +	cfg |= EXYNOS_CIDMAPARAM_R_MODE_LINEAR;
> +
> +	fimc_write(ctx, cfg, EXYNOS_CIDMAPARAM);
> +
> +	fimc_src_set_fmt_order(ctx, fmt);
> +}
> +
> +static void fimc_src_set_transf(struct fimc_context *ctx, unsigned int rotation)
> +{
> +	unsigned int degree = rotation & DRM_MODE_ROTATE_MASK;
> +	u32 cfg1, cfg2;
> +
> +	DRM_DEBUG_KMS("rotation[%x]\n", rotation);
> +
> +	cfg1 = fimc_read(ctx, EXYNOS_MSCTRL);
> +	cfg1 &= ~(EXYNOS_MSCTRL_FLIP_X_MIRROR |
> +		EXYNOS_MSCTRL_FLIP_Y_MIRROR);
> +
> +	cfg2 = fimc_read(ctx, EXYNOS_CITRGFMT);
> +	cfg2 &= ~EXYNOS_CITRGFMT_INROT90_CLOCKWISE;
> +
> +	switch (degree) {
> +	case DRM_MODE_ROTATE_0:
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			cfg1 |= EXYNOS_MSCTRL_FLIP_X_MIRROR;
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			cfg1 |= EXYNOS_MSCTRL_FLIP_Y_MIRROR;
> +		break;
> +	case DRM_MODE_ROTATE_90:
> +		cfg2 |= EXYNOS_CITRGFMT_INROT90_CLOCKWISE;
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			cfg1 |= EXYNOS_MSCTRL_FLIP_X_MIRROR;
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			cfg1 |= EXYNOS_MSCTRL_FLIP_Y_MIRROR;
> +		break;
> +	case DRM_MODE_ROTATE_180:
> +		cfg1 |= (EXYNOS_MSCTRL_FLIP_X_MIRROR |
> +			EXYNOS_MSCTRL_FLIP_Y_MIRROR);
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			cfg1 &= ~EXYNOS_MSCTRL_FLIP_X_MIRROR;
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			cfg1 &= ~EXYNOS_MSCTRL_FLIP_Y_MIRROR;
> +		break;
> +	case DRM_MODE_ROTATE_270:
> +		cfg1 |= (EXYNOS_MSCTRL_FLIP_X_MIRROR |
> +			EXYNOS_MSCTRL_FLIP_Y_MIRROR);
> +		cfg2 |= EXYNOS_CITRGFMT_INROT90_CLOCKWISE;
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			cfg1 &= ~EXYNOS_MSCTRL_FLIP_X_MIRROR;
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			cfg1 &= ~EXYNOS_MSCTRL_FLIP_Y_MIRROR;
> +		break;
> +	}
> +
> +	fimc_write(ctx, cfg1, EXYNOS_MSCTRL);
> +	fimc_write(ctx, cfg2, EXYNOS_CITRGFMT);
> +}
> +
> +static void fimc_set_window(struct fimc_context *ctx,
> +			    struct exynos_drm_ipp_buffer *buf)
> +{
> +	u32 cfg, h1, h2, v1, v2;
> +
> +	/* cropped image */
> +	h1 = buf->rect.x;
> +	h2 = buf->buf.width - buf->rect.w - buf->rect.x;
> +	v1 = buf->rect.y;
> +	v2 = buf->buf.height - buf->rect.h - buf->rect.y;
> +
> +	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]hsize[%d]vsize[%d]\n",
> +		buf->rect.x, buf->rect.y, buf->rect.w, buf->rect.h,
> +		buf->buf.width, buf->buf.height);
> +	DRM_DEBUG_KMS("h1[%d]h2[%d]v1[%d]v2[%d]\n", h1, h2, v1, v2);
> +
> +	/*
> +	 * set window offset 1, 2 size
> +	 * check figure 43-21 in user manual
> +	 */
> +	cfg = fimc_read(ctx, EXYNOS_CIWDOFST);
> +	cfg &= ~(EXYNOS_CIWDOFST_WINHOROFST_MASK |
> +		EXYNOS_CIWDOFST_WINVEROFST_MASK);
> +	cfg |= (EXYNOS_CIWDOFST_WINHOROFST(h1) |
> +		EXYNOS_CIWDOFST_WINVEROFST(v1));
> +	cfg |= EXYNOS_CIWDOFST_WINOFSEN;
> +	fimc_write(ctx, cfg, EXYNOS_CIWDOFST);
> +
> +	cfg = (EXYNOS_CIWDOFST2_WINHOROFST2(h2) |
> +		EXYNOS_CIWDOFST2_WINVEROFST2(v2));
> +	fimc_write(ctx, cfg, EXYNOS_CIWDOFST2);
> +}
> +
> +static void fimc_src_set_size(struct fimc_context *ctx,
> +			      struct exynos_drm_ipp_buffer *buf)
> +{
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("hsize[%d]vsize[%d]\n", buf->buf.width, buf->buf.height);
> +
> +	/* original size */
> +	cfg = (EXYNOS_ORGISIZE_HORIZONTAL(buf->buf.width) |
> +		EXYNOS_ORGISIZE_VERTICAL(buf->buf.height));
> +
> +	fimc_write(ctx, cfg, EXYNOS_ORGISIZE);
> +
> +	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]\n", buf->rect.x, buf->rect.y,
> +		buf->rect.w, buf->rect.h);
> +
> +	/* set input DMA image size */
> +	cfg = fimc_read(ctx, EXYNOS_CIREAL_ISIZE);
> +	cfg &= ~(EXYNOS_CIREAL_ISIZE_HEIGHT_MASK |
> +		EXYNOS_CIREAL_ISIZE_WIDTH_MASK);
> +	cfg |= (EXYNOS_CIREAL_ISIZE_WIDTH(buf->rect.w) |
> +		EXYNOS_CIREAL_ISIZE_HEIGHT(buf->rect.h));
> +	fimc_write(ctx, cfg, EXYNOS_CIREAL_ISIZE);
> +
> +	/*
> +	 * set input FIFO image size
> +	 * for now, we support only ITU601 8 bit mode
> +	 */
> +	cfg = (EXYNOS_CISRCFMT_ITU601_8BIT |
> +		EXYNOS_CISRCFMT_SOURCEHSIZE(buf->buf.width) |
> +		EXYNOS_CISRCFMT_SOURCEVSIZE(buf->buf.height));
> +	fimc_write(ctx, cfg, EXYNOS_CISRCFMT);
> +
> +	/* offset Y(RGB), Cb, Cr */
> +	cfg = (EXYNOS_CIIYOFF_HORIZONTAL(buf->rect.x) |
> +		EXYNOS_CIIYOFF_VERTICAL(buf->rect.y));
> +	fimc_write(ctx, cfg, EXYNOS_CIIYOFF);
> +	cfg = (EXYNOS_CIICBOFF_HORIZONTAL(buf->rect.x) |
> +		EXYNOS_CIICBOFF_VERTICAL(buf->rect.y));
> +	fimc_write(ctx, cfg, EXYNOS_CIICBOFF);
> +	cfg = (EXYNOS_CIICROFF_HORIZONTAL(buf->rect.x) |
> +		EXYNOS_CIICROFF_VERTICAL(buf->rect.y));
> +	fimc_write(ctx, cfg, EXYNOS_CIICROFF);
> +
> +	fimc_set_window(ctx, buf);
> +}
> +
> +static void fimc_src_set_addr(struct fimc_context *ctx,
> +			      struct exynos_drm_ipp_buffer *buf)
> +{
> +	fimc_write(ctx, buf->dma_addr[0], EXYNOS_CIIYSA(0));
> +	fimc_write(ctx, buf->dma_addr[1], EXYNOS_CIICBSA(0));
> +	fimc_write(ctx, buf->dma_addr[2], EXYNOS_CIICRSA(0));
> +}
> +
> +static void fimc_dst_set_fmt_order(struct fimc_context *ctx, u32 fmt)
> +{
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
> +
> +	/* RGB */
> +	cfg = fimc_read(ctx, EXYNOS_CISCCTRL);
> +	cfg &= ~EXYNOS_CISCCTRL_OUTRGB_FMT_RGB_MASK;
> +
> +	switch (fmt) {
> +	case DRM_FORMAT_RGB565:
> +		cfg |= EXYNOS_CISCCTRL_OUTRGB_FMT_RGB565;
> +		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> +		return;
> +	case DRM_FORMAT_RGB888:
> +		cfg |= EXYNOS_CISCCTRL_OUTRGB_FMT_RGB888;
> +		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> +		return;
> +	case DRM_FORMAT_XRGB8888:
> +		cfg |= (EXYNOS_CISCCTRL_OUTRGB_FMT_RGB888 |
> +			EXYNOS_CISCCTRL_EXTRGB_EXTENSION);
> +		fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> +		break;
> +	default:
> +		/* bypass */
> +		break;
> +	}
> +
> +	/* YUV */
> +	cfg = fimc_read(ctx, EXYNOS_CIOCTRL);
> +	cfg &= ~(EXYNOS_CIOCTRL_ORDER2P_MASK |
> +		EXYNOS_CIOCTRL_ORDER422_MASK |
> +		EXYNOS_CIOCTRL_YCBCR_PLANE_MASK);
> +
> +	switch (fmt) {
> +	case DRM_FORMAT_XRGB8888:
> +		cfg |= EXYNOS_CIOCTRL_ALPHA_OUT;
> +		break;
> +	case DRM_FORMAT_YUYV:
> +		cfg |= EXYNOS_CIOCTRL_ORDER422_YCBYCR;
> +		break;
> +	case DRM_FORMAT_YVYU:
> +		cfg |= EXYNOS_CIOCTRL_ORDER422_YCRYCB;
> +		break;
> +	case DRM_FORMAT_UYVY:
> +		cfg |= EXYNOS_CIOCTRL_ORDER422_CBYCRY;
> +		break;
> +	case DRM_FORMAT_VYUY:
> +		cfg |= EXYNOS_CIOCTRL_ORDER422_CRYCBY;
> +		break;
> +	case DRM_FORMAT_NV21:
> +	case DRM_FORMAT_NV61:
> +		cfg |= EXYNOS_CIOCTRL_ORDER2P_LSB_CRCB;
> +		cfg |= EXYNOS_CIOCTRL_YCBCR_2PLANE;
> +		break;
> +	case DRM_FORMAT_YUV422:
> +	case DRM_FORMAT_YUV420:
> +	case DRM_FORMAT_YVU420:
> +		cfg |= EXYNOS_CIOCTRL_YCBCR_3PLANE;
> +		break;
> +	case DRM_FORMAT_NV12:
> +	case DRM_FORMAT_NV16:
> +		cfg |= EXYNOS_CIOCTRL_ORDER2P_LSB_CBCR;
> +		cfg |= EXYNOS_CIOCTRL_YCBCR_2PLANE;
> +		break;
> +	}
> +
> +	fimc_write(ctx, cfg, EXYNOS_CIOCTRL);
> +}
> +
> +static void fimc_dst_set_fmt(struct fimc_context *ctx, u32 fmt)
> +{
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("fmt[0x%x]\n", fmt);
> +
> +	cfg = fimc_read(ctx, EXYNOS_CIEXTEN);
> +
> +	if (fmt == DRM_FORMAT_AYUV) {
> +		cfg |= EXYNOS_CIEXTEN_YUV444_OUT;
> +		fimc_write(ctx, cfg, EXYNOS_CIEXTEN);
> +	} else {
> +		cfg &= ~EXYNOS_CIEXTEN_YUV444_OUT;
> +		fimc_write(ctx, cfg, EXYNOS_CIEXTEN);
> +
> +		cfg = fimc_read(ctx, EXYNOS_CITRGFMT);
> +		cfg &= ~EXYNOS_CITRGFMT_OUTFORMAT_MASK;
> +
> +		switch (fmt) {
> +		case DRM_FORMAT_RGB565:
> +		case DRM_FORMAT_RGB888:
> +		case DRM_FORMAT_XRGB8888:
> +			cfg |= EXYNOS_CITRGFMT_OUTFORMAT_RGB;
> +			break;
> +		case DRM_FORMAT_YUYV:
> +		case DRM_FORMAT_YVYU:
> +		case DRM_FORMAT_UYVY:
> +		case DRM_FORMAT_VYUY:
> +			cfg |= EXYNOS_CITRGFMT_OUTFORMAT_YCBCR422_1PLANE;
> +			break;
> +		case DRM_FORMAT_NV16:
> +		case DRM_FORMAT_NV61:
> +		case DRM_FORMAT_YUV422:
> +			cfg |= EXYNOS_CITRGFMT_OUTFORMAT_YCBCR422;
> +			break;
> +		case DRM_FORMAT_YUV420:
> +		case DRM_FORMAT_YVU420:
> +		case DRM_FORMAT_NV12:
> +		case DRM_FORMAT_NV21:
> +			cfg |= EXYNOS_CITRGFMT_OUTFORMAT_YCBCR420;
> +			break;
> +		}
> +
> +		fimc_write(ctx, cfg, EXYNOS_CITRGFMT);
> +	}
> +
> +	cfg = fimc_read(ctx, EXYNOS_CIDMAPARAM);
> +	cfg &= ~EXYNOS_CIDMAPARAM_W_MODE_MASK;
> +
> +	cfg |= EXYNOS_CIDMAPARAM_W_MODE_LINEAR;
> +
> +	fimc_write(ctx, cfg, EXYNOS_CIDMAPARAM);
> +
> +	fimc_dst_set_fmt_order(ctx, fmt);
> +}
> +
> +static void fimc_dst_set_transf(struct fimc_context *ctx, unsigned int rotation)
> +{
> +	unsigned int degree = rotation & DRM_MODE_ROTATE_MASK;
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("rotation[0x%x]\n", rotation);
> +
> +	cfg = fimc_read(ctx, EXYNOS_CITRGFMT);
> +	cfg &= ~EXYNOS_CITRGFMT_FLIP_MASK;
> +	cfg &= ~EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE;
> +
> +	switch (degree) {
> +	case DRM_MODE_ROTATE_0:
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			cfg |= EXYNOS_CITRGFMT_FLIP_X_MIRROR;
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			cfg |= EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
> +		break;
> +	case DRM_MODE_ROTATE_90:
> +		cfg |= EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE;
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			cfg |= EXYNOS_CITRGFMT_FLIP_X_MIRROR;
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			cfg |= EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
> +		break;
> +	case DRM_MODE_ROTATE_180:
> +		cfg |= (EXYNOS_CITRGFMT_FLIP_X_MIRROR |
> +			EXYNOS_CITRGFMT_FLIP_Y_MIRROR);
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			cfg &= ~EXYNOS_CITRGFMT_FLIP_X_MIRROR;
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			cfg &= ~EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
> +		break;
> +	case DRM_MODE_ROTATE_270:
> +		cfg |= (EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE |
> +			EXYNOS_CITRGFMT_FLIP_X_MIRROR |
> +			EXYNOS_CITRGFMT_FLIP_Y_MIRROR);
> +		if (rotation & DRM_MODE_REFLECT_X)
> +			cfg &= ~EXYNOS_CITRGFMT_FLIP_X_MIRROR;
> +		if (rotation & DRM_MODE_REFLECT_Y)
> +			cfg &= ~EXYNOS_CITRGFMT_FLIP_Y_MIRROR;
> +		break;
> +	}
> +
> +	fimc_write(ctx, cfg, EXYNOS_CITRGFMT);
> +}
> +
> +static int fimc_set_prescaler(struct fimc_context *ctx, struct fimc_scaler *sc,
> +     struct drm_exynos_ipp_task_rect *src, struct drm_exynos_ipp_task_rect *dst)
> +{
> +	u32 cfg, cfg_ext, shfactor;
> +	u32 pre_dst_width, pre_dst_height;
> +	u32 hfactor, vfactor;
> +	int ret = 0;
> +	u32 src_w, src_h, dst_w, dst_h;
> +
> +	cfg_ext = fimc_read(ctx, EXYNOS_CITRGFMT);
> +	if (cfg_ext & EXYNOS_CITRGFMT_INROT90_CLOCKWISE) {
> +		src_w = src->h;
> +		src_h = src->w;
> +	} else {
> +		src_w = src->w;
> +		src_h = src->h;
> +	}
> +
> +	if (cfg_ext & EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE) {
> +		dst_w = dst->h;
> +		dst_h = dst->w;
> +	} else {
> +		dst_w = dst->w;
> +		dst_h = dst->h;
> +	}
> +
> +	/* fimc_ippdrv_check_property assures that dividers are not null */
> +	hfactor = fls(src_w / dst_w / 2);
> +	if (hfactor > FIMC_SHFACTOR / 2) {
> +		dev_err(ctx->dev, "failed to get ratio horizontal.\n");
> +		return -EINVAL;
> +	}
> +
> +	vfactor = fls(src_h / dst_h / 2);
> +	if (vfactor > FIMC_SHFACTOR / 2) {
> +		dev_err(ctx->dev, "failed to get ratio vertical.\n");
> +		return -EINVAL;
> +	}
> +
> +	pre_dst_width = src_w >> hfactor;
> +	pre_dst_height = src_h >> vfactor;
> +	DRM_DEBUG_KMS("pre_dst_width[%d]pre_dst_height[%d]\n",
> +		pre_dst_width, pre_dst_height);
> +	DRM_DEBUG_KMS("hfactor[%d]vfactor[%d]\n", hfactor, vfactor);
> +
> +	sc->hratio = (src_w << 14) / (dst_w << hfactor);
> +	sc->vratio = (src_h << 14) / (dst_h << vfactor);
> +	sc->up_h = (dst_w >= src_w) ? true : false;
> +	sc->up_v = (dst_h >= src_h) ? true : false;
> +	DRM_DEBUG_KMS("hratio[%d]vratio[%d]up_h[%d]up_v[%d]\n",
> +		sc->hratio, sc->vratio, sc->up_h, sc->up_v);
> +
> +	shfactor = FIMC_SHFACTOR - (hfactor + vfactor);
> +	DRM_DEBUG_KMS("shfactor[%d]\n", shfactor);
> +
> +	cfg = (EXYNOS_CISCPRERATIO_SHFACTOR(shfactor) |
> +		EXYNOS_CISCPRERATIO_PREHORRATIO(1 << hfactor) |
> +		EXYNOS_CISCPRERATIO_PREVERRATIO(1 << vfactor));
> +	fimc_write(ctx, cfg, EXYNOS_CISCPRERATIO);
> +
> +	cfg = (EXYNOS_CISCPREDST_PREDSTWIDTH(pre_dst_width) |
> +		EXYNOS_CISCPREDST_PREDSTHEIGHT(pre_dst_height));
> +	fimc_write(ctx, cfg, EXYNOS_CISCPREDST);
> +
> +	return ret;
> +}
> +
> +static void fimc_set_scaler(struct fimc_context *ctx, struct fimc_scaler *sc)
> +{
> +	u32 cfg, cfg_ext;
> +
> +	DRM_DEBUG_KMS("range[%d]bypass[%d]up_h[%d]up_v[%d]\n",
> +		sc->range, sc->bypass, sc->up_h, sc->up_v);
> +	DRM_DEBUG_KMS("hratio[%d]vratio[%d]\n",
> +		sc->hratio, sc->vratio);
> +
> +	cfg = fimc_read(ctx, EXYNOS_CISCCTRL);
> +	cfg &= ~(EXYNOS_CISCCTRL_SCALERBYPASS |
> +		EXYNOS_CISCCTRL_SCALEUP_H | EXYNOS_CISCCTRL_SCALEUP_V |
> +		EXYNOS_CISCCTRL_MAIN_V_RATIO_MASK |
> +		EXYNOS_CISCCTRL_MAIN_H_RATIO_MASK |
> +		EXYNOS_CISCCTRL_CSCR2Y_WIDE |
> +		EXYNOS_CISCCTRL_CSCY2R_WIDE);
> +
> +	if (sc->range)
> +		cfg |= (EXYNOS_CISCCTRL_CSCR2Y_WIDE |
> +			EXYNOS_CISCCTRL_CSCY2R_WIDE);
> +	if (sc->bypass)
> +		cfg |= EXYNOS_CISCCTRL_SCALERBYPASS;
> +	if (sc->up_h)
> +		cfg |= EXYNOS_CISCCTRL_SCALEUP_H;
> +	if (sc->up_v)
> +		cfg |= EXYNOS_CISCCTRL_SCALEUP_V;
> +
> +	cfg |= (EXYNOS_CISCCTRL_MAINHORRATIO((sc->hratio >> 6)) |
> +		EXYNOS_CISCCTRL_MAINVERRATIO((sc->vratio >> 6)));
> +	fimc_write(ctx, cfg, EXYNOS_CISCCTRL);
> +
> +	cfg_ext = fimc_read(ctx, EXYNOS_CIEXTEN);
> +	cfg_ext &= ~EXYNOS_CIEXTEN_MAINHORRATIO_EXT_MASK;
> +	cfg_ext &= ~EXYNOS_CIEXTEN_MAINVERRATIO_EXT_MASK;
> +	cfg_ext |= (EXYNOS_CIEXTEN_MAINHORRATIO_EXT(sc->hratio) |
> +		EXYNOS_CIEXTEN_MAINVERRATIO_EXT(sc->vratio));
> +	fimc_write(ctx, cfg_ext, EXYNOS_CIEXTEN);
> +}
> +
> +static void fimc_dst_set_size(struct fimc_context *ctx,
> +			     struct exynos_drm_ipp_buffer *buf)
> +{
> +	u32 cfg, cfg_ext;
> +
> +	DRM_DEBUG_KMS("hsize[%d]vsize[%d]\n", buf->buf.width, buf->buf.height);
> +
> +	/* original size */
> +	cfg = (EXYNOS_ORGOSIZE_HORIZONTAL(buf->buf.width) |
> +		EXYNOS_ORGOSIZE_VERTICAL(buf->buf.height));
> +
> +	fimc_write(ctx, cfg, EXYNOS_ORGOSIZE);
> +
> +	DRM_DEBUG_KMS("x[%d]y[%d]w[%d]h[%d]\n", buf->rect.x, buf->rect.y,
> +		buf->rect.w, buf->rect.h);
> +
> +	/* CSC ITU */
> +	cfg = fimc_read(ctx, EXYNOS_CIGCTRL);
> +	cfg &= ~EXYNOS_CIGCTRL_CSC_MASK;
> +
> +	if (buf->buf.width >= FIMC_WIDTH_ITU_709)
> +		cfg |= EXYNOS_CIGCTRL_CSC_ITU709;
> +	else
> +		cfg |= EXYNOS_CIGCTRL_CSC_ITU601;
> +
> +	fimc_write(ctx, cfg, EXYNOS_CIGCTRL);
> +
> +	cfg_ext = fimc_read(ctx, EXYNOS_CITRGFMT);
> +
> +	/* target image size */
> +	cfg = fimc_read(ctx, EXYNOS_CITRGFMT);
> +	cfg &= ~(EXYNOS_CITRGFMT_TARGETH_MASK |
> +		EXYNOS_CITRGFMT_TARGETV_MASK);
> +	if (cfg_ext & EXYNOS_CITRGFMT_OUTROT90_CLOCKWISE)
> +		cfg |= (EXYNOS_CITRGFMT_TARGETHSIZE(buf->rect.h) |
> +			EXYNOS_CITRGFMT_TARGETVSIZE(buf->rect.w));
> +	else
> +		cfg |= (EXYNOS_CITRGFMT_TARGETHSIZE(buf->rect.w) |
> +			EXYNOS_CITRGFMT_TARGETVSIZE(buf->rect.h));
> +	fimc_write(ctx, cfg, EXYNOS_CITRGFMT);
> +
> +	/* target area */
> +	cfg = EXYNOS_CITAREA_TARGET_AREA(buf->rect.w * buf->rect.h);
> +	fimc_write(ctx, cfg, EXYNOS_CITAREA);
> +
> +	/* offset Y(RGB), Cb, Cr */
> +	cfg = (EXYNOS_CIOYOFF_HORIZONTAL(buf->rect.x) |
> +		EXYNOS_CIOYOFF_VERTICAL(buf->rect.y));
> +	fimc_write(ctx, cfg, EXYNOS_CIOYOFF);
> +	cfg = (EXYNOS_CIOCBOFF_HORIZONTAL(buf->rect.x) |
> +		EXYNOS_CIOCBOFF_VERTICAL(buf->rect.y));
> +	fimc_write(ctx, cfg, EXYNOS_CIOCBOFF);
> +	cfg = (EXYNOS_CIOCROFF_HORIZONTAL(buf->rect.x) |
> +		EXYNOS_CIOCROFF_VERTICAL(buf->rect.y));
> +	fimc_write(ctx, cfg, EXYNOS_CIOCROFF);
> +}
> +
> +static void fimc_dst_set_buf_seq(struct fimc_context *ctx, u32 buf_id,
> +		bool enqueue)
> +{
> +	unsigned long flags;
> +	u32 buf_num;
> +	u32 cfg;
> +
> +	DRM_DEBUG_KMS("buf_id[%d]enqueu[%d]\n", buf_id, enqueue);
> +
> +	spin_lock_irqsave(&ctx->lock, flags);
> +
> +	cfg = fimc_read(ctx, EXYNOS_CIFCNTSEQ);
> +
> +	if (enqueue)
> +		cfg |= (1 << buf_id);
> +	else
> +		cfg &= ~(1 << buf_id);
> +
> +	fimc_write(ctx, cfg, EXYNOS_CIFCNTSEQ);
> +
> +	buf_num = hweight32(cfg);
> +
> +	if (enqueue && buf_num >= FIMC_BUF_START)
> +		fimc_mask_irq(ctx, true);
> +	else if (!enqueue && buf_num <= FIMC_BUF_STOP)
> +		fimc_mask_irq(ctx, false);
> +
> +	spin_unlock_irqrestore(&ctx->lock, flags);
> +}
> +
> +static void fimc_dst_set_addr(struct fimc_context *ctx,
> +			     struct exynos_drm_ipp_buffer *buf)
> +{
> +	fimc_write(ctx, buf->dma_addr[0], EXYNOS_CIOYSA(0));
> +	fimc_write(ctx, buf->dma_addr[1], EXYNOS_CIOCBSA(0));
> +	fimc_write(ctx, buf->dma_addr[2], EXYNOS_CIOCRSA(0));
> +
> +	fimc_dst_set_buf_seq(ctx, 0, true);
> +}
> +
> +static void fimc_stop(struct fimc_context *ctx);
> +
> +static irqreturn_t fimc_irq_handler(int irq, void *dev_id)
> +{
> +	struct fimc_context *ctx = dev_id;
> +	int buf_id;
> +
> +	DRM_DEBUG_KMS("fimc id[%d]\n", ctx->id);
> +
> +	fimc_clear_irq(ctx);
> +	if (fimc_check_ovf(ctx))
> +		return IRQ_NONE;
> +
> +	if (!fimc_check_frame_end(ctx))
> +		return IRQ_NONE;
> +
> +	buf_id = fimc_get_buf_id(ctx);
> +	if (buf_id < 0)
> +		return IRQ_HANDLED;
> +
> +	DRM_DEBUG_KMS("buf_id[%d]\n", buf_id);
> +
> +	if (ctx->task) {
> +		struct exynos_drm_ipp_task *task = ctx->task;
> +
> +		ctx->task = NULL;
> +		pm_runtime_mark_last_busy(ctx->dev);
> +		pm_runtime_put_autosuspend(ctx->dev);
> +		exynos_drm_ipp_task_done(task, 0);
> +	}
> +
> +	fimc_dst_set_buf_seq(ctx, buf_id, false);
> +	fimc_stop(ctx);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void fimc_clear_addr(struct fimc_context *ctx)
> +{
> +	int i;
> +
> +	for (i = 0; i < FIMC_MAX_SRC; i++) {
> +		fimc_write(ctx, 0, EXYNOS_CIIYSA(i));
> +		fimc_write(ctx, 0, EXYNOS_CIICBSA(i));
> +		fimc_write(ctx, 0, EXYNOS_CIICRSA(i));
> +	}
> +
> +	for (i = 0; i < FIMC_MAX_DST; i++) {
> +		fimc_write(ctx, 0, EXYNOS_CIOYSA(i));
> +		fimc_write(ctx, 0, EXYNOS_CIOCBSA(i));
> +		fimc_write(ctx, 0, EXYNOS_CIOCRSA(i));
> +	}
> +}
> +
> +static void fimc_reset(struct fimc_context *ctx)
> +{
> +	/* reset h/w block */
> +	fimc_sw_reset(ctx);
> +
> +	/* reset scaler capability */
> +	memset(&ctx->sc, 0x0, sizeof(ctx->sc));
> +
> +	fimc_clear_addr(ctx);
> +}
> +
> +static void fimc_start(struct fimc_context *ctx)
> +{
> +	u32 cfg0, cfg1;
> +
> +	fimc_mask_irq(ctx, true);
> +
> +	/* If set ture, we can save jpeg about screen */
> +	fimc_handle_jpeg(ctx, false);
> +	fimc_set_scaler(ctx, &ctx->sc);
> +
> +	fimc_set_type_ctrl(ctx);
> +	fimc_handle_lastend(ctx, false);
> +
> +	/* setup dma */
> +	cfg0 = fimc_read(ctx, EXYNOS_MSCTRL);
> +	cfg0 &= ~EXYNOS_MSCTRL_INPUT_MASK;
> +	cfg0 |= EXYNOS_MSCTRL_INPUT_MEMORY;
> +	fimc_write(ctx, cfg0, EXYNOS_MSCTRL);
> +
> +	/* Reset status */
> +	fimc_write(ctx, 0x0, EXYNOS_CISTATUS);
> +
> +	cfg0 = fimc_read(ctx, EXYNOS_CIIMGCPT);
> +	cfg0 &= ~EXYNOS_CIIMGCPT_IMGCPTEN_SC;
> +	cfg0 |= EXYNOS_CIIMGCPT_IMGCPTEN_SC;
> +
> +	/* Scaler */
> +	cfg1 = fimc_read(ctx, EXYNOS_CISCCTRL);
> +	cfg1 &= ~EXYNOS_CISCCTRL_SCAN_MASK;
> +	cfg1 |= (EXYNOS_CISCCTRL_PROGRESSIVE |
> +		EXYNOS_CISCCTRL_SCALERSTART);
> +
> +	fimc_write(ctx, cfg1, EXYNOS_CISCCTRL);
> +
> +	/* Enable image capture*/
> +	cfg0 |= EXYNOS_CIIMGCPT_IMGCPTEN;
> +	fimc_write(ctx, cfg0, EXYNOS_CIIMGCPT);
> +
> +	/* Disable frame end irq */
> +	fimc_clear_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_IRQ_END_DISABLE);
> +
> +	fimc_clear_bits(ctx, EXYNOS_CIOCTRL, EXYNOS_CIOCTRL_WEAVE_MASK);
> +
> +	fimc_set_bits(ctx, EXYNOS_MSCTRL, EXYNOS_MSCTRL_ENVID);
> +}
> +
> +static void fimc_stop(struct fimc_context *ctx)
> +{
> +	u32 cfg;
> +
> +	/* Source clear */
> +	cfg = fimc_read(ctx, EXYNOS_MSCTRL);
> +	cfg &= ~EXYNOS_MSCTRL_INPUT_MASK;
> +	cfg &= ~EXYNOS_MSCTRL_ENVID;
> +	fimc_write(ctx, cfg, EXYNOS_MSCTRL);
> +
> +	fimc_mask_irq(ctx, false);
> +
> +	/* reset sequence */
> +	fimc_write(ctx, 0x0, EXYNOS_CIFCNTSEQ);
> +
> +	/* Scaler disable */
> +	fimc_clear_bits(ctx, EXYNOS_CISCCTRL, EXYNOS_CISCCTRL_SCALERSTART);
> +
> +	/* Disable image capture */
> +	fimc_clear_bits(ctx, EXYNOS_CIIMGCPT,
> +		EXYNOS_CIIMGCPT_IMGCPTEN_SC | EXYNOS_CIIMGCPT_IMGCPTEN);
> +
> +	/* Enable frame end irq */
> +	fimc_set_bits(ctx, EXYNOS_CIGCTRL, EXYNOS_CIGCTRL_IRQ_END_DISABLE);
> +}
> +
> +static int fimc_commit(struct exynos_drm_ipp *ipp,
> +			  struct exynos_drm_ipp_task *task)
> +{
> +	struct fimc_context *ctx =
> +			container_of(ipp, struct fimc_context, ipp);
> +
> +	pm_runtime_get_sync(ctx->dev);
> +	ctx->task = task;
> +
> +	fimc_src_set_fmt(ctx, task->src.buf.fourcc);
> +	fimc_src_set_size(ctx, &task->src);
> +	fimc_src_set_transf(ctx, DRM_MODE_ROTATE_0);
> +	fimc_src_set_addr(ctx, &task->src);
> +	fimc_dst_set_fmt(ctx, task->dst.buf.fourcc);
> +	fimc_dst_set_transf(ctx, task->transform.rotation);
> +	fimc_dst_set_size(ctx, &task->dst);
> +	fimc_dst_set_addr(ctx, &task->dst);
> +	fimc_set_prescaler(ctx, &ctx->sc, &task->src.rect, &task->dst.rect);
> +	fimc_start(ctx);
> +
> +	return 0;
> +}
> +
> +static void fimc_abort(struct exynos_drm_ipp *ipp,
> +			  struct exynos_drm_ipp_task *task)
> +{
> +	struct fimc_context *ctx =
> +			container_of(ipp, struct fimc_context, ipp);
> +
> +	fimc_reset(ctx);
> +
> +	if (ctx->task) {
> +		struct exynos_drm_ipp_task *task = ctx->task;
> +
> +		ctx->task = NULL;
> +		pm_runtime_mark_last_busy(ctx->dev);
> +		pm_runtime_put_autosuspend(ctx->dev);
> +		exynos_drm_ipp_task_done(task, -EIO);
> +	}
> +}
> +
> +static struct exynos_drm_ipp_funcs ipp_funcs = {
> +	.commit = fimc_commit,
> +	.abort = fimc_abort,
> +};
> +
> +static int fimc_bind(struct device *dev, struct device *master, void *data)
> +{
> +	struct fimc_context *ctx = dev_get_drvdata(dev);
> +	struct drm_device *drm_dev = data;
> +	struct exynos_drm_ipp *ipp = &ctx->ipp;
> +
> +	ctx->drm_dev = drm_dev;
> +	drm_iommu_attach_device(drm_dev, dev);
> +
> +	exynos_drm_ipp_register(drm_dev, ipp, &ipp_funcs,
> +			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
> +			   DRM_EXYNOS_IPP_CAP_SCALE | DRM_EXYNOS_IPP_CAP_CONVERT,
> +			   ctx->formats, ctx->num_formats, "fimc");
> +
> +	dev_info(dev, "The exynos fimc has been probed successfully\n");
> +
> +	return 0;
> +}
> +
> +static void fimc_unbind(struct device *dev, struct device *master,
> +			void *data)
> +{
> +	struct fimc_context *ctx = dev_get_drvdata(dev);
> +	struct drm_device *drm_dev = data;
> +	struct exynos_drm_ipp *ipp = &ctx->ipp;
> +
> +	exynos_drm_ipp_unregister(drm_dev, ipp);
> +	drm_iommu_detach_device(drm_dev, dev);
> +}
> +
> +static const struct component_ops fimc_component_ops = {
> +	.bind	= fimc_bind,
> +	.unbind = fimc_unbind,
> +};
> +
> +static void fimc_put_clocks(struct fimc_context *ctx)
> +{
> +	int i;
> +
> +	for (i = 0; i < FIMC_CLKS_MAX; i++) {
> +		if (IS_ERR(ctx->clocks[i]))
> +			continue;
> +		clk_put(ctx->clocks[i]);
> +		ctx->clocks[i] = ERR_PTR(-EINVAL);
> +	}
> +}
> +
> +static int fimc_setup_clocks(struct fimc_context *ctx)
> +{
> +	struct device *fimc_dev = ctx->dev;
> +	struct device *dev;
> +	int ret, i;
> +
> +	for (i = 0; i < FIMC_CLKS_MAX; i++)
> +		ctx->clocks[i] = ERR_PTR(-EINVAL);
> +
> +	for (i = 0; i < FIMC_CLKS_MAX; i++) {
> +		if (i == FIMC_CLK_WB_A || i == FIMC_CLK_WB_B)
> +			dev = fimc_dev->parent;
> +		else
> +			dev = fimc_dev;
> +
> +		ctx->clocks[i] = clk_get(dev, fimc_clock_names[i]);
> +		if (IS_ERR(ctx->clocks[i])) {
> +			ret = PTR_ERR(ctx->clocks[i]);
> +			dev_err(fimc_dev, "failed to get clock: %s\n",
> +						fimc_clock_names[i]);
> +			goto e_clk_free;
> +		}
> +	}
> +
> +	ret = clk_prepare_enable(ctx->clocks[FIMC_CLK_LCLK]);
> +	if (!ret)
> +		return ret;
> +e_clk_free:
> +	fimc_put_clocks(ctx);
> +	return ret;
> +}
> +
> +int exynos_drm_check_fimc_device(struct device *dev)
> +{
> +	unsigned int id = of_alias_get_id(dev->of_node, "fimc");
> +
> +	if (id >= 0 && (BIT(id) & fimc_mask))
> +		return 0;
> +	return -ENODEV;
> +}
> +
> +static const unsigned int fimc_formats[] = {
> +	DRM_FORMAT_XRGB8888, DRM_FORMAT_RGB565,
> +	DRM_FORMAT_NV12, DRM_FORMAT_NV16, DRM_FORMAT_NV21, DRM_FORMAT_NV61,
> +	DRM_FORMAT_UYVY, DRM_FORMAT_VYUY, DRM_FORMAT_YUYV, DRM_FORMAT_YVYU,
> +	DRM_FORMAT_YUV420, DRM_FORMAT_YVU420, DRM_FORMAT_YUV422,
> +	DRM_FORMAT_YUV444,
> +};
> +
> +static const struct drm_exynos_ipp_limit fimc_4210_limits_v1[] = {
> +	{ IPP_SIZE_LIMIT(BUFFER, .h = { 32, 8192, 8 }, .v = { 32, 8192, 2 }) },
> +	{ IPP_SIZE_LIMIT(AREA, .h = { 32, 4224, 2 }, .v = { 32, 0, 2 }) },
> +	{ IPP_SIZE_LIMIT(ROTATED, .h = { 128, 1920 }, .v = { 128, 0 }) },
> +	{ IPP_SCALE_LIMIT(.h = { (1 << 16) / 64, (1 << 16) * 64 },
> +			  .v = { (1 << 16) / 64, (1 << 16) * 64 }) },
> +};
> +
> +static const struct drm_exynos_ipp_limit fimc_4210_limits_v2[] = {
> +	{ IPP_SIZE_LIMIT(BUFFER, .h = { 32, 8192, 8 }, .v = { 32, 8192, 2 }) },
> +	{ IPP_SIZE_LIMIT(AREA, .h = { 32, 1920, 2 }, .v = { 32, 0, 2 }) },
> +	{ IPP_SIZE_LIMIT(ROTATED, .h = { 128, 1366 }, .v = { 128, 0 }) },
> +	{ IPP_SCALE_LIMIT(.h = { (1 << 16) / 64, (1 << 16) * 64 },
> +			  .v = { (1 << 16) / 64, (1 << 16) * 64 }) },
> +};
> +
> +static int fimc_probe(struct platform_device *pdev)
> +{
> +	const struct drm_exynos_ipp_limit *limits;
> +	struct exynos_drm_ipp_formats *formats;
> +	struct device *dev = &pdev->dev;
> +	struct fimc_context *ctx;
> +	struct resource *res;
> +	int ret;
> +	int i, num_limits;
> +
> +	if (exynos_drm_check_fimc_device(dev) != 0)
> +		return -ENODEV;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	ctx->dev = dev;
> +	ctx->id = of_alias_get_id(dev->of_node, "fimc");
> +
> +	/* construct formats/limits array */
> +	formats = devm_kzalloc(dev, sizeof(*formats) *
> +			       (ARRAY_SIZE(fimc_formats)), GFP_KERNEL);
> +	if (!formats)
> +		return -ENOMEM;
> +
> +	if (ctx->id < 3) {
> +		limits = fimc_4210_limits_v1;
> +		num_limits = ARRAY_SIZE(fimc_4210_limits_v1);
> +	} else {
> +		limits = fimc_4210_limits_v2;
> +		num_limits = ARRAY_SIZE(fimc_4210_limits_v2);
> +	}
> +	for (i = 0; i < ARRAY_SIZE(fimc_formats); i++) {
> +		formats[i].fourcc = fimc_formats[i];
> +		formats[i].type = DRM_EXYNOS_IPP_FORMAT_SOURCE |
> +				  DRM_EXYNOS_IPP_FORMAT_DESTINATION;
> +		formats[i].limits = limits;
> +		formats[i].num_limits = num_limits;
> +	}
> +	ctx->formats = formats;
> +	ctx->num_formats = ARRAY_SIZE(fimc_formats);
> +
> +	/* resource memory */
> +	ctx->regs_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	ctx->regs = devm_ioremap_resource(dev, ctx->regs_res);
> +	if (IS_ERR(ctx->regs))
> +		return PTR_ERR(ctx->regs);
> +
> +	/* resource irq */
> +	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> +	if (!res) {
> +		dev_err(dev, "failed to request irq resource.\n");
> +		return -ENOENT;
> +	}
> +
> +	ret = devm_request_irq(dev, res->start, fimc_irq_handler,
> +		0, dev_name(dev), ctx);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request irq.\n");
> +		return ret;
> +	}
> +
> +	ret = fimc_setup_clocks(ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	spin_lock_init(&ctx->lock);
> +	platform_set_drvdata(pdev, ctx);
> +
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, FIMC_AUTOSUSPEND_DELAY);
> +	pm_runtime_enable(dev);
> +
> +	ret = component_add(dev, &fimc_component_ops);
> +	if (ret)
> +		goto err_pm_dis;
> +
> +	dev_info(dev, "drm fimc registered successfully.\n");
> +
> +	return 0;
> +
> +err_pm_dis:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +	fimc_put_clocks(ctx);
> +
> +	return ret;
> +}
> +
> +static int fimc_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct fimc_context *ctx = get_fimc_context(dev);
> +
> +	component_del(dev, &fimc_component_ops);
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +
> +	fimc_put_clocks(ctx);
> +
> +	return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int fimc_runtime_suspend(struct device *dev)
> +{
> +	struct fimc_context *ctx = get_fimc_context(dev);
> +
> +	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
> +	clk_disable_unprepare(ctx->clocks[FIMC_CLK_GATE]);
> +	return 0;
> +}
> +
> +static int fimc_runtime_resume(struct device *dev)
> +{
> +	struct fimc_context *ctx = get_fimc_context(dev);
> +
> +	DRM_DEBUG_KMS("id[%d]\n", ctx->id);
> +	return clk_prepare_enable(ctx->clocks[FIMC_CLK_GATE]);
> +}
> +#endif
> +
> +static const struct dev_pm_ops fimc_pm_ops = {
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +	SET_RUNTIME_PM_OPS(fimc_runtime_suspend, fimc_runtime_resume, NULL)
> +};
> +
> +static const struct of_device_id fimc_of_match[] = {
> +	{ .compatible = "samsung,exynos4210-fimc" },
> +	{ .compatible = "samsung,exynos4212-fimc" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, fimc_of_match);
> +
> +struct platform_driver fimc_driver = {
> +	.probe		= fimc_probe,
> +	.remove		= fimc_remove,
> +	.driver		= {
> +		.of_match_table = fimc_of_match,
> +		.name	= "exynos-drm-fimc",
> +		.owner	= THIS_MODULE,
> +		.pm	= &fimc_pm_ops,
> +	},
> +};
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.h b/drivers/gpu/drm/exynos/exynos_drm_fimc.h
> deleted file mode 100644
> index 127a424c5fdf..000000000000
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.h
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -/*
> - * Copyright (c) 2012 Samsung Electronics Co., Ltd.
> - *
> - * Authors:
> - *	Eunchul Kim <chulspro.kim@samsung.com>
> - *	Jinyoung Jeon <jy0.jeon@samsung.com>
> - *	Sangmin Lee <lsmin.lee@samsung.com>
> - *
> - * This program is free software; you can redistribute  it and/or modify it
> - * under  the terms of  the GNU General  Public License as published by the
> - * Free Software Foundation;  either version 2 of the  License, or (at your
> - * option) any later version.
> - */
> -
> -#ifndef _EXYNOS_DRM_FIMC_H_
> -#define _EXYNOS_DRM_FIMC_H_
> -
> -/*
> - * TODO
> - * FIMD output interface notifier callback.
> - */
> -
> -#endif /* _EXYNOS_DRM_FIMC_H_ */
> 
