From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC 2/4] drm: exynos: add MDNIE post processor
Date: Wed, 19 Mar 2014 22:51:07 +0530
Message-ID: <CAK9yfHzD50i1pVjbxFa2Ya1t_fkGKhq6dm8G9At79xOX2P695A@mail.gmail.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
	<1395238975-24600-3-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:33630 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277AbaCSRVJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Mar 2014 13:21:09 -0400
Received: by mail-oa0-f53.google.com with SMTP id j17so8727648oag.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2014 10:21:08 -0700 (PDT)
In-Reply-To: <1395238975-24600-3-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Inki Dae <inki.dae@samsung.com>, seanpaul@google.com, Ajay kumar <ajaynumb@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, sunil joshi <joshi@samsung.com>, Prashanth G <prashanth.g@samsung.com>, marcheu@chromium.org, Shirish S <s.shirish@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>

Hi Ajay,

On 19 March 2014 19:52, Ajay Kumar <ajaykumar.rs@samsung.com> wrote:
> Add post processor ops for MDNIE and their support functions.
> Expose an interface for the FIMD to register MDNIE PP.
>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Shirish S <s.shirish@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Makefile            |   2 +-
>  drivers/gpu/drm/exynos/exynos_mdnie.c      | 707 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/exynos/exynos_mdnie_regs.h | 154 +++++++
>  3 files changed, 862 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie.c
>  create mode 100644 drivers/gpu/drm/exynos/exynos_mdnie_regs.h
>
> diff --git a/drivers/gpu/drm/exynos/Makefile b/drivers/gpu/drm/exynos/Makefile
> index 02dde22..653eab5 100644
> --- a/drivers/gpu/drm/exynos/Makefile
> +++ b/drivers/gpu/drm/exynos/Makefile
> @@ -10,7 +10,7 @@ exynosdrm-y := exynos_drm_drv.o exynos_drm_encoder.o \
>
>  exynosdrm-$(CONFIG_DRM_EXYNOS_IOMMU) += exynos_drm_iommu.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_DMABUF) += exynos_drm_dmabuf.o
> -exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)    += exynos_drm_fimd.o
> +exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)    += exynos_drm_fimd.o exynos_mdnie.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)     += exynos_drm_dsi.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_DP)      += exynos_dp_core.o exynos_dp_reg.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)    += exynos_hdmi.o exynos_mixer.o
> diff --git a/drivers/gpu/drm/exynos/exynos_mdnie.c b/drivers/gpu/drm/exynos/exynos_mdnie.c
> new file mode 100644
> index 0000000..a043853
> --- /dev/null
> +++ b/drivers/gpu/drm/exynos/exynos_mdnie.c
> @@ -0,0 +1,707 @@
> +/* drivers/gpu/drm/exynos/exynos_mdnie.c
> + *
> + * Samsung mDNIe driver
> + *
> + * Copyright (C) 2014 Samsung Electronics Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License as published by the
> + * Free Software Foundation; either version 2 of the License, or (at your
> + * option) any later version.
> +*/
> +
> +#include <linux/clk.h>
> +#include <linux/errno.h>
> +#include <linux/of_device.h>
> +
> +#include <video/samsung_fimd.h>
> +
> +#include <drm/drmP.h>
> +
> +#include "exynos_drm_drv.h"
> +#include "exynos_fimd_pp.h"
> +#include "exynos_mdnie_regs.h"
> +
> +#define GAMMA_RAMP_LENGTH      17
> +#define COLOR_COMPONENTS       3
> +
> +#define MDNIE_ON       1
> +#define MDNIE_OFF      0
> +
> +#define PARAM_IN_RANGE(r, p, l, u)                                     \
> +       do {                                                    \
> +               r = ((p >= l) && (p <= u)) ? 0 : 1;             \
> +               if (r) \
> +                       DRM_ERROR("Wrong param: %s:%llu\n", #p, (u64)p); \
> +       } while (0)
> +

[snip]

> +static int mdnie_set_color_saturation_params(
> +               struct mdnie_context *mdnie,
> +               const struct drm_mode_color_saturation *params)
> +{
> +       int ret;
> +
> +       PARAM_IN_RANGE(ret, params->hue_gain_red, HG_MIN, HG_MAX);
> +       PARAM_IN_RANGE(ret, params->hue_gain_green, HG_MIN, HG_MAX);
> +       PARAM_IN_RANGE(ret, params->hue_gain_blue, HG_MIN, HG_MAX);
> +       PARAM_IN_RANGE(ret, params->hue_gain_cyan, HG_MIN, HG_MAX);
> +       PARAM_IN_RANGE(ret, params->hue_gain_magenta, HG_MIN, HG_MAX);
> +       PARAM_IN_RANGE(ret, params->hue_gain_yellow, HG_MIN, HG_MAX);
> +       PARAM_IN_RANGE(ret, params->hue_gain_overall, HG_MIN, HG_MAX);
> +
> +       if (ret)
> +               return -EINVAL;

This would be applicable only for the last macro call as ret would get
overwritten after
each call.


> +       memcpy(&mdnie->params.cs_params, params, sizeof(*params));
> +
> +       return 0;
> +}
> +
> +static int mdnie_set_color_reproduction_params(
> +               struct mdnie_context *mdnie,
> +               const struct drm_mode_color_reproduction *params)
> +{
> +       int ret;
> +
> +       PARAM_IN_RANGE(ret, params->red_rgb[0], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->red_rgb[1], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->red_rgb[2], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->green_rgb[0], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->green_rgb[1], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->green_rgb[2], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->blue_rgb[0], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->blue_rgb[1], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->blue_rgb[2], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->cyan_rgb[0], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->cyan_rgb[1], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->cyan_rgb[2], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->magenta_rgb[0], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->magenta_rgb[1], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->magenta_rgb[2], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->yellow_rgb[0], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->yellow_rgb[1], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->yellow_rgb[2], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->white_rgb[0], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->white_rgb[1], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->white_rgb[2], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->black_rgb[0], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->black_rgb[1], CC_MIN, CC_MAX);
> +       PARAM_IN_RANGE(ret, params->black_rgb[2], CC_MIN, CC_MAX);
> +
> +       if (ret)
> +               return -EINVAL;
>
ditto

> +       memcpy(&mdnie->params.cr_params, params, sizeof(*params));
> +       return 0;
> +}
> +
> +static int mdnie_set_edge_enhancement_params(
> +               struct mdnie_context *mdnie,
> +               const struct drm_mode_edge_enhancement *params)
> +{
> +       int ret;
> +
> +       PARAM_IN_RANGE(ret, params->edge_th, TH_MIN, TH_MAX);
> +       PARAM_IN_RANGE(ret, params->background_th, TH_MIN, TH_MAX);
> +       PARAM_IN_RANGE(ret, params->pg_edge, GAIN_MIN, GAIN_MAX);
> +       PARAM_IN_RANGE(ret, params->pg_flat, GAIN_MIN, GAIN_MAX);
> +       PARAM_IN_RANGE(ret, params->pg_background, GAIN_MIN, GAIN_MAX);
> +       PARAM_IN_RANGE(ret, params->ng_edge, GAIN_MIN, GAIN_MAX);
> +       PARAM_IN_RANGE(ret, params->ng_flat, GAIN_MIN, GAIN_MAX);
> +       PARAM_IN_RANGE(ret, params->ng_background, GAIN_MIN, GAIN_MAX);

ditto

> +       if (ret)
> +               return -EINVAL;
> +
> +       memcpy(&mdnie->params.de_params, params, sizeof(*params));
> +       return 0;
> +}
> +
> +static int mdnie_set_window_params(
> +               struct mdnie_context *mdnie,
> +               const struct drm_exynos_mdnie_window *params)
> +{
> +       int ret;
> +
> +       PARAM_IN_RANGE(ret, params->win_x, X_MIN, X_MAX);
> +       PARAM_IN_RANGE(ret, params->win_y, Y_MIN, Y_MAX);
> +       PARAM_IN_RANGE(ret, params->win_w, params->win_x, X_MAX);
> +       PARAM_IN_RANGE(ret, params->win_h, params->win_y, Y_MAX);

ditto and all other places of similar usage.







[snip]

> +int exynos_mdnie_init(struct device *dev, struct exynos_fimd_pp **pp)
> +{
> +       struct device_node *np = dev->of_node;
> +       struct device_node *mdnie_np;
> +       struct mdnie_context *mdnie = NULL;
> +       u32 disp1blk_phyaddr;
> +       int ret = 0;
> +       u32 buf[2];
> +
> +       mdnie_np = of_parse_phandle(np, "samsung,mdnie", 0);
> +       if (!mdnie_np) {
> +               DRM_INFO("No mdnie node present, "
> +                               "MDNIE feature will be disabled\n");
> +               ret = -EINVAL;
> +               goto err0;

return directly from here.

> +       }
> +
> +       if (of_property_read_u32_array(mdnie_np, "reg", buf, 2)) {
> +               DRM_ERROR("failed to get base address for MDNIE\n");
> +               ret = -ENOMEM;
> +               goto err0;

ditto

> +       }
> +
> +       mdnie = kzalloc(sizeof(struct mdnie_context), GFP_KERNEL);

nit: use sizeof(*mdnie)

> +       if (!mdnie) {
> +               DRM_ERROR("failed to allocate mdnie\n");

This message is not needed as kzalloc prints OOM message upon failure.

> +               ret = -ENOMEM;
> +               goto err0;
> +       }

return directly.

> +
> +       mdnie->exynos_mdnie_base = ioremap(buf[0], buf[1]);
> +       if (!mdnie->exynos_mdnie_base) {
> +               DRM_ERROR("failed to ioremap mdnie device\n");
> +               ret = -ENOMEM;
> +               goto err1;
> +       }
> +
> +       if (dt_parse_disp1blk_cfg(dev, &disp1blk_phyaddr)) {
> +               DRM_ERROR("failed to get disp1blk property.\n");
> +               ret = -ENODEV;
> +               goto err1;
> +       }
> +
> +       if (exynos_iomap_disp1blk(mdnie, disp1blk_phyaddr)) {
> +               DRM_ERROR("failed to iopmap disp1blk sysreg.\n");

s/iopmap/iomap


-- 
With warm regards,
Sachin
