From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 2/4] drm: exynos: add MDNIE post processor
Date: Tue, 01 Apr 2014 10:01:45 +0200
Message-ID: <533A7269.2010802@samsung.com>
References: <1395238975-24600-1-git-send-email-ajaykumar.rs@samsung.com>
 <1395238975-24600-3-git-send-email-ajaykumar.rs@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1395238975-24600-3-git-send-email-ajaykumar.rs@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ajay Kumar <ajaykumar.rs@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Shirish S <s.shirish@samsung.com>, seanpaul@google.com, sw0312.kim@samsung.com, joshi@samsung.com, ajaynumb@gmail.com, marcheu@chromium.org, prashanth.g@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Ajay,

Thanks for the patch.

On 03/19/2014 03:22 PM, Ajay Kumar wrote:
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
> -exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o
> +exynosdrm-$(CONFIG_DRM_EXYNOS_FIMD)	+= exynos_drm_fimd.o exynos_mdnie.o

Is there is a reason to not to create Kconfig entry?

>  exynosdrm-$(CONFIG_DRM_EXYNOS_DSI)	+= exynos_drm_dsi.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_DP)	+= exynos_dp_core.o exynos_dp_reg.o
>  exynosdrm-$(CONFIG_DRM_EXYNOS_HDMI)	+= exynos_hdmi.o exynos_mixer.o
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
> +#define GAMMA_RAMP_LENGTH	17
> +#define COLOR_COMPONENTS	3

It is not used.

> +
> +#define MDNIE_ON	1
> +#define MDNIE_OFF	0

You can drop these and use bool instead.

> +
> +#define PARAM_IN_RANGE(r, p, l, u)					\
> +	do {							\
> +		r = ((p >= l) && (p <= u)) ? 0 : 1;		\
> +		if (r) \
> +			DRM_ERROR("Wrong param: %s:%llu\n", #p, (u64)p); \
> +	} while (0)

I am not sure if it is applicable but you can try to replace it with clamp.

> +
> +struct exynos_mdnie_drm_gamma {
> +	u8 gamma_r[GAMMA_RAMP_LENGTH];
> +	u8 gamma_g[GAMMA_RAMP_LENGTH];
> +	u8 gamma_b[GAMMA_RAMP_LENGTH];
> +};
> +
> +struct mdnie_conf_params {
> +	u32					modules_enabled;
> +	struct exynos_mdnie_drm_gamma		gamma_params;
> +	struct drm_exynos_mdnie_window		win;
> +	struct drm_mode_color_reproduction	cr_params;
> +	struct drm_mode_color_saturation	cs_params;
> +	struct drm_mode_edge_enhancement	de_params;
> +};
> +
> +struct mdnie_context {
> +	struct mdnie_conf_params		params;
> +	struct clk				*mdnie_mux_clk;
> +	struct clk				*mdnie_bus_clk;
> +	struct clk				*mdnie_src_clk;
> +	struct clk				*sclk_mout_fimd;
> +	void __iomem				*exynos_mdnie_base;
> +	void __iomem				*sysreg_disp1blk;
> +	struct drm_display_mode			mode;
> +};
> +
> +static void exynos_mdnie_unmask(struct mdnie_context *mdnie)
> +{
> +	writel(!MDNIE_RELEASE_RFF_MASK_REGISTERS,
> +			mdnie->exynos_mdnie_base +
> +			MDNIE_RELEASE_RFF * sizeof(u32));
> +}


I see this function is called after many writes, why?

> +
> +static u32 mdnie_read(struct mdnie_context *mdnie, u32 reg)
> +{
> +	return readl(mdnie->exynos_mdnie_base + reg * sizeof(u32)) &
> +			MDNIE_REG_WIDTH;
> +}

By convention registers are addressed using byte offset.

> +
> +static void mdnie_write(struct mdnie_context *mdnie, u32 reg, u32 val)
> +{
> +	writel(val & MDNIE_REG_WIDTH, mdnie->exynos_mdnie_base +
> +			(reg & MDNIE_REG_OFFSET_LIMIT) * sizeof(u32));
> +
> +	exynos_mdnie_unmask(mdnie);
> +}
> +
> +static void exynos_mdnie_bank_sel(struct mdnie_context *mdnie, int bank)
> +{
> +	if (bank)
> +		writel(MDNIE_TOP_R0_BANK1_SEL |
> +			MDNIE_TOP_R0_SHADOW_SEL ,
> +			mdnie->exynos_mdnie_base);
> +	else
> +		writel(MDNIE_TOP_R0_BANK0_SEL |
> +			MDNIE_TOP_R0_SHADOW_SEL ,
> +			mdnie->exynos_mdnie_base);
> +
> +	exynos_mdnie_unmask(mdnie);
> +}
> +
> +static int exynos_mdnie_set_size(struct mdnie_context *mdnie)
> +{
> +	unsigned int cfg;
> +
> +	if ((mdnie->mode.crtc_hdisplay > MDNIE_TOP_RSIZE_MAX) ||
> +			(mdnie->mode.crtc_vdisplay > MDNIE_TOP_RSIZE_MAX))
> +		return -EINVAL;

Is there a scenario when mode can be incorrect? If yes, I guess it
should be checked in mode_set, probably requiring extending exynos_drm
framework.

> +
> +	exynos_mdnie_bank_sel(mdnie, 0);
> +
> +	/* Input Data Unmask */
> +	cfg = mdnie_read(mdnie, MDNIE_TOP_R1);
> +	cfg &= ~(MDNIE_TOP_R1_MASK_INPUT_DATA_ENABLE);
> +	cfg &= ~(MDNIE_TOP_R1_MASK_INPUT_HSYNC);
> +	mdnie_write(mdnie, MDNIE_TOP_R1, cfg);
> +
> +	/* LCD width */
> +	mdnie_write(mdnie, MDNIE_TOP_RIHSIZE,
> +			mdnie->mode.crtc_hdisplay);
> +
> +	/* LCD height */
> +	mdnie_write(mdnie, MDNIE_TOP_RIVSIZE,
> +			mdnie->mode.crtc_vdisplay);
> +	return 0;
> +}
> +
> +static void mdnie_set_all_modules_off(struct mdnie_context *mdnie)
> +{
> +	u32 val;
> +
> +	val = mdnie_read(mdnie, MDNIE_TOP_R8);
> +	val &= ~(MDNIE_TOP_R8_DITH_MODULE_ON |
> +		MDNIE_TOP_R8_ABC_MODULE_ON |
> +		MDNIE_TOP_R8_SCR_MODULE_ON |
> +		MDNIE_TOP_R8_CC_MODULE_ON |
> +		MDNIE_TOP_R8_CS_MODULE_ON |
> +		MDNIE_TOP_R8_DE_MODULE_ON);
> +	mdnie_write(mdnie, MDNIE_TOP_R8, val);
> +
> +	val = mdnie_read(mdnie, MDNIE_TOP_R9);
> +	val &= ~(MDNIE_TOP_R9_MCM_MODULE_ON);
> +	mdnie_write(mdnie, MDNIE_TOP_R9, val);
> +
> +	val = mdnie_read(mdnie, MDNIE_TOP_RA);
> +	val &= ~(MDNIE_TOP_RA_UC_MODULE_ON);
> +	mdnie_write(mdnie, MDNIE_TOP_RA, val);
> +}
> +
> +static void mdnie_set_req_modules_on(struct mdnie_context *mdnie)
> +{
> +	u32 val;
> +
> +	val = mdnie_read(mdnie, MDNIE_TOP_R8);
> +	if (mdnie->params.modules_enabled & BIT(MDNIE_COLOR_REPRODUCTION))

MDNIE_COLOR_REPRODUCTION is not defined. Anyway you always
uses BIT(MDNIE_COLOR_REPRODUCTION), so maybe it would be better to
define it already as shifted bit instead of bit number, the same for
other bits.

> +		val |= MDNIE_TOP_R8_SCR_MODULE_ON;
> +	if (mdnie->params.modules_enabled & BIT(MDNIE_CURVE_CONTROL))
> +		val |= MDNIE_TOP_R8_CC_MODULE_ON;
> +	if (mdnie->params.modules_enabled & BIT(MDNIE_COLOR_SATURATION))
> +		val |= MDNIE_TOP_R8_CS_MODULE_ON;
> +	if (mdnie->params.modules_enabled & BIT(MDNIE_DETAIL_ENHANCEMENT))
> +		val |= MDNIE_TOP_R8_DE_MODULE_ON;
> +
> +	mdnie_write(mdnie, MDNIE_TOP_R8, val);
> +}
> +
> +static int mdnie_set_color_saturation_params(
> +		struct mdnie_context *mdnie,
> +		const struct drm_mode_color_saturation *params)
> +{
> +	int ret;
> +
> +	PARAM_IN_RANGE(ret, params->hue_gain_red, HG_MIN, HG_MAX);
> +	PARAM_IN_RANGE(ret, params->hue_gain_green, HG_MIN, HG_MAX);
> +	PARAM_IN_RANGE(ret, params->hue_gain_blue, HG_MIN, HG_MAX);
> +	PARAM_IN_RANGE(ret, params->hue_gain_cyan, HG_MIN, HG_MAX);
> +	PARAM_IN_RANGE(ret, params->hue_gain_magenta, HG_MIN, HG_MAX);
> +	PARAM_IN_RANGE(ret, params->hue_gain_yellow, HG_MIN, HG_MAX);
> +	PARAM_IN_RANGE(ret, params->hue_gain_overall, HG_MIN, HG_MAX);
> +
> +	if (ret)
> +		return -EINVAL;

As I mentioned before maybe clamp would be better, but this changes
behavior so it is up to you, but if you want to return an error on bad
range you should fix it anyway, but that Sachin already pointed out.
Regarding error maybe ERANGE would be better?

> +
> +	memcpy(&mdnie->params.cs_params, params, sizeof(*params));
> +
> +	return 0;
> +}
> +
> +static int mdnie_set_color_reproduction_params(
> +		struct mdnie_context *mdnie,
> +		const struct drm_mode_color_reproduction *params)
> +{
> +	int ret;
> +
> +	PARAM_IN_RANGE(ret, params->red_rgb[0], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->red_rgb[1], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->red_rgb[2], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->green_rgb[0], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->green_rgb[1], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->green_rgb[2], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->blue_rgb[0], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->blue_rgb[1], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->blue_rgb[2], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->cyan_rgb[0], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->cyan_rgb[1], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->cyan_rgb[2], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->magenta_rgb[0], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->magenta_rgb[1], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->magenta_rgb[2], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->yellow_rgb[0], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->yellow_rgb[1], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->yellow_rgb[2], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->white_rgb[0], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->white_rgb[1], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->white_rgb[2], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->black_rgb[0], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->black_rgb[1], CC_MIN, CC_MAX);
> +	PARAM_IN_RANGE(ret, params->black_rgb[2], CC_MIN, CC_MAX);
> +
> +	if (ret)
> +		return -EINVAL;

ditto

> +
> +	memcpy(&mdnie->params.cr_params, params, sizeof(*params));
> +	return 0;
> +}
> +
> +static int mdnie_set_edge_enhancement_params(
> +		struct mdnie_context *mdnie,
> +		const struct drm_mode_edge_enhancement *params)
> +{
> +	int ret;
> +
> +	PARAM_IN_RANGE(ret, params->edge_th, TH_MIN, TH_MAX);
> +	PARAM_IN_RANGE(ret, params->background_th, TH_MIN, TH_MAX);
> +	PARAM_IN_RANGE(ret, params->pg_edge, GAIN_MIN, GAIN_MAX);
> +	PARAM_IN_RANGE(ret, params->pg_flat, GAIN_MIN, GAIN_MAX);
> +	PARAM_IN_RANGE(ret, params->pg_background, GAIN_MIN, GAIN_MAX);
> +	PARAM_IN_RANGE(ret, params->ng_edge, GAIN_MIN, GAIN_MAX);
> +	PARAM_IN_RANGE(ret, params->ng_flat, GAIN_MIN, GAIN_MAX);
> +	PARAM_IN_RANGE(ret, params->ng_background, GAIN_MIN, GAIN_MAX);
> +
> +	if (ret)
> +		return -EINVAL;

ditto

> +
> +	memcpy(&mdnie->params.de_params, params, sizeof(*params));
> +	return 0;
> +}
> +
> +static int mdnie_set_window_params(
> +		struct mdnie_context *mdnie,
> +		const struct drm_exynos_mdnie_window *params)
> +{
> +	int ret;
> +
> +	PARAM_IN_RANGE(ret, params->win_x, X_MIN, X_MAX);
> +	PARAM_IN_RANGE(ret, params->win_y, Y_MIN, Y_MAX);
> +	PARAM_IN_RANGE(ret, params->win_w, params->win_x, X_MAX);
> +	PARAM_IN_RANGE(ret, params->win_h, params->win_y, Y_MAX);
> +
> +	if (ret)
> +		return -EINVAL;

ditto

> +
> +	memcpy(&mdnie->params.win, params, sizeof(*params));
> +	return 0;
> +}
> +
> +static int mdnie_enable_sub_modules(struct mdnie_context *mdnie,
> +		uint64_t module_en)
> +{
> +	uint64_t mask;
> +	int ret;
> +
> +	mask = BIT(MDNIE_COLOR_REPRODUCTION) |
> +		BIT(MDNIE_CURVE_CONTROL) |
> +		BIT(MDNIE_COLOR_SATURATION) |
> +		BIT(MDNIE_DETAIL_ENHANCEMENT);
> +
> +	ret = module_en & ~mask;
> +
> +	if (ret)
> +		return -EINVAL;
> +
> +	mdnie->params.modules_enabled = (uint32_t)module_en;
> +	return 0;
> +}
> +
> +static void mdnie_apply_de_params(struct mdnie_context *mdnie)
> +{
> +	struct drm_mode_edge_enhancement de = mdnie->params.de_params;
> +
> +	/* remains contant for all mdnie modes */
> +	u32 max_out_ratio = 0x1000;
> +	u32 min_out_ratio = 0x0100;
> +
> +	mdnie_write(mdnie, MDNIE_DE_TH_EDGE, de.edge_th);
> +	mdnie_write(mdnie, MDNIE_DE_TH_BKG, de.background_th);
> +	mdnie_write(mdnie, MDNIE_DE_GAINPOS_EDGE, de.pg_edge);
> +	mdnie_write(mdnie, MDNIE_DE_GAINPOS_FLAT, de.pg_flat);
> +	mdnie_write(mdnie, MDNIE_DE_GAINPOS_BKG, de.pg_background);
> +	mdnie_write(mdnie, MDNIE_DE_GAINNEG_EDGE, de.ng_edge);
> +	mdnie_write(mdnie, MDNIE_DE_GAINNEG_FLAT, de.ng_flat);
> +	mdnie_write(mdnie, MDNIE_DE_GAINNEG_BKG, de.ng_background);
> +	mdnie_write(mdnie, MDNIE_DE_MAX_RATIO, max_out_ratio);
> +	mdnie_write(mdnie, MDNIE_DE_MIN_RATIO, min_out_ratio);
> +}
> +
> +static void mdnie_apply_cs_params(struct mdnie_context *mdnie)
> +{
> +	struct drm_mode_color_saturation cs = mdnie->params.cs_params;
> +
> +	mdnie_write(mdnie, MDNIE_CS_RED_YELLOW_HUE_GAIN,
> +		MDNIE_CS_RED_HUE_GAIN(cs.hue_gain_red) |
> +		MDNIE_CS_YELLOW_HUE_GAIN(cs.hue_gain_yellow));
> +
> +	mdnie_write(mdnie, MDNIE_CS_GREEN_CYAN_HUE_GAIN,
> +		MDNIE_CS_GREEN_HUE_GAIN(cs.hue_gain_green) |
> +		MDNIE_CS_CYAN_HUE_GAIN(cs.hue_gain_cyan));
> +
> +	mdnie_write(mdnie, MDNIE_CS_BLUE_MAG_HUE_GAIN,
> +		MDNIE_CS_BLUE_HUE_GAIN(cs.hue_gain_blue) |
> +		MDNIE_CS_MAGENTA_HUE_GAIN(cs.hue_gain_magenta));
> +
> +	mdnie_write(mdnie, MDNIE_CS_OVERALL_HUE_GAIN_REG,
> +		mdnie_read(mdnie, MDNIE_CS_OVERALL_HUE_GAIN_REG) |
> +		MDNIE_CS_OVERALL_HUE_GAIN(cs.hue_gain_overall));

Why is it or-ed in this case with current value? And replaced in case of
others?

> +}
> +
> +static void mdnie_apply_cc_gamma_params(struct mdnie_context *mdnie)
> +{
> +	struct exynos_mdnie_drm_gamma *cc = &mdnie->params.gamma_params;
> +	u32 i, val;
> +	u8 strength = MDNIE_DEFAULT_CC_STRENGTH;
> +	u8 gamma_channel = RGB_GAMMA_R;
> +
> +	val = mdnie_read(mdnie, MDNIE_CC_CHSEL_STRENGTH);
> +	val &= ~(MDNIE_CC_CHSEL_MASK);
> +	val |= MDNIE_CC_CHSEL(gamma_channel);
> +	val &= ~(MDNIE_CC_STRENGTH_MASK);
> +	val |= MDNIE_CC_STRENGTH(strength);
> +	mdnie_write(mdnie, MDNIE_CC_CHSEL_STRENGTH, val);
> +
> +	mdnie_write(mdnie, MDNIE_CC_GAMMA_RED_0_REG, cc->gamma_r[0]);
> +	for (i = 1; i <= 8; i++)
> +		mdnie_write(mdnie,
> +			MDNIE_CC_GAMMA_RED_0_REG + i,
> +			MDNIE_CC_GAMMA_MSB(cc->gamma_r[i]) |
> +			MDNIE_CC_GAMMA_LSB(cc->gamma_r[i + 8]));

What is the difference between gamma_r[0], gamma_r[1..8] and
gamma[9..17] ? It should be documented if possible.
Anyway .set_gamma is not present in exynos_drm framework.

> +
> +	mdnie_write(mdnie, MDNIE_CC_GAMMA_GREEN_0_REG, cc->gamma_g[0]);
> +	for (i = 1; i <= 8; i++)
> +		mdnie_write(mdnie,
> +			MDNIE_CC_GAMMA_GREEN_0_REG + i,
> +			MDNIE_CC_GAMMA_MSB(cc->gamma_g[i]) |
> +			MDNIE_CC_GAMMA_LSB(cc->gamma_g[i + 8]));
> +
> +	mdnie_write(mdnie, MDNIE_CC_GAMMA_BLUE_0_REG, cc->gamma_b[0]);
> +	for (i = 1; i <= 8; i++)
> +		mdnie_write(mdnie,
> +			MDNIE_CC_GAMMA_BLUE_0_REG + i,
> +			MDNIE_CC_GAMMA_MSB(cc->gamma_b[i]) |
> +			MDNIE_CC_GAMMA_LSB(cc->gamma_b[i + 8]));

Three blocks with the same code, maybe some function ?

> +}
> +
> +static void mdnie_apply_cr_params(struct mdnie_context *mdnie)
> +{
> +	struct drm_mode_color_reproduction cr = mdnie->params.cr_params;
> +
> +	mdnie_write(mdnie, MDNIE_SCR_R_R,
> +			MDNIE_SCR_MSB(cr.red_rgb[0]) |
> +			MDNIE_SCR_LSB(cr.cyan_rgb[0]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_R_G,
> +			MDNIE_SCR_MSB(cr.red_rgb[1]) |
> +			MDNIE_SCR_LSB(cr.cyan_rgb[1]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_R_B,
> +			MDNIE_SCR_MSB(cr.red_rgb[2]) |
> +			MDNIE_SCR_LSB(cr.cyan_rgb[2]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_G_R,
> +			MDNIE_SCR_MSB(cr.green_rgb[0]) |
> +			MDNIE_SCR_LSB(cr.magenta_rgb[0]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_G_G,
> +			MDNIE_SCR_MSB(cr.green_rgb[1]) |
> +			MDNIE_SCR_LSB(cr.magenta_rgb[1]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_G_B,
> +			MDNIE_SCR_MSB(cr.green_rgb[2]) |
> +			MDNIE_SCR_LSB(cr.magenta_rgb[2]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_B_R,
> +			MDNIE_SCR_MSB(cr.blue_rgb[0]) |
> +			MDNIE_SCR_LSB(cr.yellow_rgb[0]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_B_G,
> +			MDNIE_SCR_MSB(cr.blue_rgb[1]) |
> +			MDNIE_SCR_LSB(cr.yellow_rgb[1]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_B_B,
> +			MDNIE_SCR_MSB(cr.blue_rgb[2]) |
> +			MDNIE_SCR_LSB(cr.yellow_rgb[2]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_K_R,
> +			MDNIE_SCR_MSB(cr.black_rgb[0]) |
> +			MDNIE_SCR_LSB(cr.white_rgb[0]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_K_G,
> +			MDNIE_SCR_MSB(cr.black_rgb[1]) |
> +			MDNIE_SCR_LSB(cr.white_rgb[1]));
> +
> +	mdnie_write(mdnie, MDNIE_SCR_K_B,
> +			MDNIE_SCR_MSB(cr.black_rgb[2]) |
> +			MDNIE_SCR_LSB(cr.white_rgb[2]));
> +}
> +
> +static int exynos_mdnie_update(struct mdnie_context *mdnie)
> +{
> +	/* Bank 0 controls */
> +	exynos_mdnie_bank_sel(mdnie, 0);
> +
> +	mdnie_set_all_modules_off(mdnie);
> +	mdnie_set_req_modules_on(mdnie);

Those two functions are used together, maybe one function can be used
instead?

> +
> +	if (mdnie->params.modules_enabled & BIT(MDNIE_DETAIL_ENHANCEMENT))
> +		mdnie_apply_de_params(mdnie);
> +	if (mdnie->params.modules_enabled & BIT(MDNIE_COLOR_SATURATION))
> +		mdnie_apply_cs_params(mdnie);
> +
> +	/* Bank 1 controls */
> +	exynos_mdnie_bank_sel(mdnie, 1);
> +
> +	if (mdnie->params.modules_enabled & BIT(MDNIE_CURVE_CONTROL))
> +		mdnie_apply_cc_gamma_params(mdnie);
> +	if (mdnie->params.modules_enabled & BIT(MDNIE_COLOR_REPRODUCTION))
> +		mdnie_apply_cr_params(mdnie);
> +
> +	return 0;
> +}
> +
> +static void exynos_fimd_mdnie_cfg(struct mdnie_context *mdnie, int mdnie_on)
> +{
> +	u32 val = readl(mdnie->sysreg_disp1blk);
> +
> +	val &= ~EXYNOS_FIFORST_DISP1;		/* DISP1_BLK FIFO reset */
> +	val &= ~EXYNOS_CLEAR_DISP0;		/* Clear DISP0 */
> +	val &= ~EXYNOS_VT_DISP1_MASK;
> +	val |= EXYNOS_VT_DISP1_RGB;		/* Set RGB interface */

Those settings are not MDNIE specific, it seems its place is in FIMD.

> +
> +	val |= EXYNOS_FIFORST_DISP1;
> +
> +	if (mdnie_on) {
> +		val &= ~EXYNOS_FIMDBYPASS_DISP1;	/* MIE, MDNIE path */
> +		val |= EXYNOS_MDNIE_SEL;		/* MDNIE */
> +		val |= EXYNOS_MDNIE_ENABLE;		/* ENABLE */
> +	} else {
> +		val |= EXYNOS_FIMDBYPASS_DISP1;		/* FIMD path */
> +		val &= ~EXYNOS_MDNIE_SEL;		/* Clear MDNIE */
> +		val &= ~EXYNOS_MDNIE_ENABLE;		/* Clear MDNIE ENABLE */
> +	}
> +	writel(val, mdnie->sysreg_disp1blk);

These settings are chip version specific, please specify on which
versions it is supposed to work and on which it has been tested.
Do you plan to add support for more chip versions?

> +}



> +
> +static int exynos_mdnie_power_on(void *pp_ctx)
> +{
> +	struct mdnie_context *mdnie = pp_ctx;
> +	int ret = 0;
> +
> +	exynos_fimd_mdnie_cfg(mdnie, MDNIE_ON);
> +
> +	ret = clk_prepare_enable(mdnie->mdnie_bus_clk);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to enable mdnie bus clk [%d]\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(mdnie->mdnie_src_clk);
> +	if (ret < 0) {
> +		DRM_ERROR("failed to enable mdnie src clk [%d]\n", ret);
> +		clk_disable_unprepare(mdnie->mdnie_bus_clk);
> +		return ret;
> +	}
> +
> +	ret = exynos_mdnie_set_size(mdnie);

In case of error you should unwind all changes.

> +	exynos_mdnie_update(mdnie);
> +
> +	return ret;
> +}
> +
> +static int exynos_mdnie_power_off(void *pp_ctx)
> +{
> +	struct mdnie_context *mdnie = pp_ctx;
> +
> +	clk_disable_unprepare(mdnie->mdnie_src_clk);
> +	clk_disable_unprepare(mdnie->mdnie_bus_clk);
> +
> +	exynos_fimd_mdnie_cfg(mdnie, MDNIE_OFF);
> +
> +	return 0;
> +}
> +
> +static int exynos_mdnie_set_property(struct drm_device *drm_dev,
> +		void *pp_ctx, struct drm_property *property, uint64_t val)
> +{
> +	struct mdnie_context *mdnie = pp_ctx;
> +	struct drm_property_blob *blob;
> +	struct drm_mode_object *blob_obj;
> +	int ret = 0;
> +
> +	DRM_DEBUG("[PROP:%s, VALUE:%llu]\n", property->name, val);
> +
> +	if (drm_dev->mode_config.color_saturation_property == property) {
> +		blob = drm_dev->mode_config.color_saturation_blob_ptr;
> +		ret = mdnie_set_color_saturation_params(mdnie,
> +			(struct drm_mode_color_saturation *)blob->data);
> +		if (ret)
> +			return ret;

Since ifs are exclusive you can replace it by:
		return mdnie_set_color_saturation_params(mdnie,
			(struct drm_mode_color_saturation *)blob->data);
The same applies for the rest of ifs.


> +	}
> +
> +	if (drm_dev->mode_config.color_reproduction_property == property) {
> +		blob = drm_dev->mode_config.color_reproduction_blob_ptr;
> +		mdnie_set_color_reproduction_params(mdnie,
> +			(struct drm_mode_color_reproduction *)blob->data);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (drm_dev->mode_config.edge_enhancement_property == property) {
> +		blob = drm_dev->mode_config.edge_enhancement_blob_ptr;
> +		mdnie_set_edge_enhancement_params(mdnie,
> +			(struct drm_mode_edge_enhancement *)blob->data);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!strcmp("mdnie_window", property->name)) {
> +		blob_obj = drm_mode_object_find(drm_dev, val,
> +				DRM_MODE_OBJECT_BLOB);
> +		blob = obj_to_blob(blob_obj);
> +
> +		mdnie_set_window_params(mdnie,
> +			(struct drm_exynos_mdnie_window *)blob->data);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!strcmp("mdnie_modules_enable", property->name)) {
> +		mdnie_enable_sub_modules(mdnie, val);
> +		if (ret)
> +			return ret;
> +	}

Where are the last two properties registered/created? Anyway I am not
sure if strcmp is a good way for identification.

> +
> +	return 0;
> +}
> +
> +static int exynos_mdnie_set_gamma(void *pp_ctx, u16 *r, u16 *g,
> +		u16 *b, uint32_t start, uint32_t size)
> +{
> +	struct mdnie_context *mdnie = pp_ctx;
> +	struct exynos_mdnie_drm_gamma *gamma = &mdnie->params.gamma_params;
> +	int i, ret;
> +
> +	DRM_DEBUG("[LENGTH :%u]\n", size);
> +
> +	if (size > GAMMA_RAMP_LENGTH)
> +		return -EINVAL;
> +
> +	for (i = 0; i < size; i++) {
> +		PARAM_IN_RANGE(ret, r[i], CC_MIN, CC_MAX);
> +		PARAM_IN_RANGE(ret, g[i], CC_MIN, CC_MAX);
> +		PARAM_IN_RANGE(ret, b[i], CC_MIN, CC_MAX);
> +	}
> +
> +	if (ret)
> +		return -EINVAL;
> +
> +	for (i = 0; i < size; i++) {
> +		gamma->gamma_r[i] = r[i];
> +		gamma->gamma_g[i] = g[i];
> +		gamma->gamma_b[i] = b[i];
> +	}
> +
> +	return 0;
> +}
> +
> +void exynos_mdnie_mode_set(void *pp_ctx,
> +			const struct drm_display_mode *in_mode)
> +{
> +	struct mdnie_context *mdnie = pp_ctx;
> +
> +	DRM_DEBUG("[MODE :%s]\n", in_mode->name);
> +
> +	/* preserve mode everytime for later use */
> +	drm_mode_copy(&mdnie->mode, in_mode);
> +}
> +
> +static struct exynos_fimd_pp_ops mdnie_ops = {
> +	.power_on = exynos_mdnie_power_on,
> +	.power_off = exynos_mdnie_power_off,
> +	.set_property = exynos_mdnie_set_property,
> +	.set_gamma = exynos_mdnie_set_gamma,
> +	.mode_set = exynos_mdnie_mode_set,
> +};
> +
> +static struct exynos_fimd_pp mdnie_pp = {
> +	.ops = &mdnie_ops,
> +};
> +
> +static int dt_parse_disp1blk_cfg(struct device *dev, u32 *disp1blk_addr)
> +{
> +	struct device_node *np = dev->of_node;
> +
> +	if (of_property_read_u32(np, "samsung,disp1blk-cfg", disp1blk_addr)) {
> +		DRM_INFO("No DISP1BLK_CFG property present, "
> +			"MDNIE feature will be disabled\n");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int exynos_iomap_disp1blk(struct mdnie_context *mdnie,
> +			u32 disp1blk_addr)
> +{
> +	mdnie->sysreg_disp1blk = ioremap(disp1blk_addr, 4);
> +	if (!mdnie->sysreg_disp1blk) {
> +		DRM_ERROR("failed to ioremap DISP1BLK_CFG\n");
> +		return -ENOMEM;
> +	}
> +
> +	return 0;
> +}

Please look at "samsung,sysreg" property in fimc driver or recent
samsung-phy patches, they are using syscon device instead of direct access.

> +
> +int exynos_mdnie_init(struct device *dev, struct exynos_fimd_pp **pp)
> +{
> +	struct device_node *np = dev->of_node;
> +	struct device_node *mdnie_np;
> +	struct mdnie_context *mdnie = NULL;
> +	u32 disp1blk_phyaddr;
> +	int ret = 0;
> +	u32 buf[2];
> +
> +	mdnie_np = of_parse_phandle(np, "samsung,mdnie", 0);
> +	if (!mdnie_np) {
> +		DRM_INFO("No mdnie node present, "
> +				"MDNIE feature will be disabled\n");
> +		ret = -EINVAL;
> +		goto err0;
> +	}
> +
> +	if (of_property_read_u32_array(mdnie_np, "reg", buf, 2)) {
> +		DRM_ERROR("failed to get base address for MDNIE\n");
> +		ret = -ENOMEM;
> +		goto err0;
> +	}
> +
> +	mdnie = kzalloc(sizeof(struct mdnie_context), GFP_KERNEL);
> +	if (!mdnie) {
> +		DRM_ERROR("failed to allocate mdnie\n");
> +		ret = -ENOMEM;
> +		goto err0;
> +	}

You can use devm_kzalloc, no error log needed.

> +
> +	mdnie->exynos_mdnie_base = ioremap(buf[0], buf[1]);
> +	if (!mdnie->exynos_mdnie_base) {
> +		DRM_ERROR("failed to ioremap mdnie device\n");
> +		ret = -ENOMEM;
> +		goto err1;
> +	}

platform_device provide helpers for it:
	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
	ctx->regs = devm_ioremap_resource(dev, res);


> +
> +	if (dt_parse_disp1blk_cfg(dev, &disp1blk_phyaddr)) {
> +		DRM_ERROR("failed to get disp1blk property.\n");
> +		ret = -ENODEV;
> +		goto err1;
> +	}
> +
> +	if (exynos_iomap_disp1blk(mdnie, disp1blk_phyaddr)) {
> +		DRM_ERROR("failed to iopmap disp1blk sysreg.\n");
> +		ret = -ENODEV;
> +		goto err1;
> +	}
> +
> +	/* Setup MDNIE clocks */
> +	mdnie->mdnie_bus_clk = devm_clk_get(dev, "mdnie");
> +	if (IS_ERR(mdnie->mdnie_bus_clk)) {
> +		DRM_ERROR("failed to get mdnie bus clock\n");
> +		ret = PTR_ERR(mdnie->mdnie_bus_clk);
> +		goto err1;
> +	}
> +
> +	mdnie->mdnie_src_clk = devm_clk_get(dev, "sclk_mdnie");
> +	if (IS_ERR(mdnie->mdnie_src_clk)) {
> +		DRM_ERROR("failed to get mdnie_src_clk\n");
> +		ret = PTR_ERR(mdnie->mdnie_src_clk);
> +		goto err1;
> +	}
> +
> +	mdnie_pp.ctx = mdnie;
> +	*pp = &mdnie_pp;
> +
> +	DRM_INFO("MDNIE initialzation done\n");
> +
> +	return 0;
> +
> +err1:
> +	kfree(mdnie);
> +err0:
> +	return ret;

no iounmap, dev_node_put on error path, additionally devm_ allocations
will be freed only after main device (fimd) removal.

> +}

Why do not use platform_device here?
It is real device with real resources.

> +EXPORT_SYMBOL(exynos_mdnie_init);
> diff --git a/drivers/gpu/drm/exynos/exynos_mdnie_regs.h b/drivers/gpu/drm/exynos/exynos_mdnie_regs.h
> new file mode 100644
> index 0000000..66a8edc
> --- /dev/null
> +++ b/drivers/gpu/drm/exynos/exynos_mdnie_regs.h
> @@ -0,0 +1,154 @@
> +/* drivers/gpu/drm/exynos/exynos_mdnie_regs.h
> + *
> + * Header file for Samsung (MDNIE) driver
> + *
> + * Copyright (c) 2014 Samsung Electronics
> + *	http://www.samsungsemi.com/
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __REGS_MDNIE_H__
> +#define __REGS_MDNIE_H__
> +
> +/* Exynos DISP1BLK_CFG register */
> +#define EXYNOS_MDNIE_ENABLE			(1 << 0)
> +#define EXYNOS_MDNIE_SEL			(1 << 14)
> +#define EXYNOS_FIMDBYPASS_DISP1			(1 << 15)
> +#define EXYNOS_FIFORST_DISP1			(1 << 23)
> +#define EXYNOS_CLEAR_DISP0			(1 << 27)
> +#define EXYNOS_VT_DISP1_MASK			(3 << 24)
> +#define EXYNOS_VT_DISP1_RGB			(0 << 24)
> +#define EXYNOS_VT_DISP1_I80			(1 << 24)

Those defines are for specific versions of chip, it should be marked
somehow.


Regards
Andrzej

> +
> +#define MDNIE_REG_WIDTH				0xFFFF
> +#define MDNIE_REG_OFFSET_LIMIT			0xFF
> +
> +/* BANK 0: MODULE_TOP */
> +#define MDNIE_TOP_R0				0x0000
> +#define MDNIE_TOP_R0_BANK0_SEL			(0 << 0)
> +#define MDNIE_TOP_R0_BANK1_SEL			(1 << 0)
> +#define MDNIE_TOP_R0_SHADOW_SEL			(1 << 3)
> +#define MDNIE_TOP_R1				0x0001
> +#define MDNIE_TOP_R1_MASK_INPUT_DATA_ENABLE	(1 << 10)
> +#define MDNIE_TOP_R1_MASK_INPUT_HSYNC		(1 << 9)
> +#define MDNIE_TOP_RIHSIZE			0x0003
> +#define MDNIE_TOP_RSIZE_MAX			2560
> +#define MDNIE_TOP_RIVSIZE			0x0004
> +#define MDNIE_TOP_R8				0x0008
> +#define MDNIE_TOP_R8_DITH_MODULE_ON		(1 << 13)
> +#define MDNIE_TOP_R8_ABC_MODULE_ON		(1 << 11)
> +#define MDNIE_TOP_R8_SCR_MODULE_ON		(1 << 9)
> +#define MDNIE_TOP_R8_CC_MODULE_ON		(1 << 8)
> +#define MDNIE_TOP_R8_CS_MODULE_ON		(1 << 5)
> +#define MDNIE_TOP_R8_DE_MODULE_ON		(1 << 4)
> +#define MDNIE_TOP_R9				0x0009
> +#define MDNIE_TOP_R9_MCM_MODULE_ON		(1 << 0)
> +#define MDNIE_TOP_RA				0x000A
> +#define MDNIE_TOP_RA_UC_MODULE_ON		(1 << 0)
> +#define MDNIE_TOP_RB				0x000B
> +
> +/* BANK 0: MODULE_DE */
> +#define MDNIE_DE_TH_EDGE				0xB0
> +#define MDNIE_DE_TH_BKG				0xB1
> +#define MDNIE_DE_TH_MAX				2047
> +
> +#define MDNIE_DE_GAINPOS_EDGE			0xB2
> +#define MDNIE_DE_GAINPOS_FLAT			0xB3
> +#define MDNIE_DE_GAINPOS_BKG			0xB4
> +#define MDNIE_DE_GAINNEG_EDGE			0xB5
> +#define MDNIE_DE_GAINNEG_FLAT			0xB6
> +#define MDNIE_DE_GAINNEG_BKG			0xB7
> +#define MDNIE_DE_GAIN_MAX			8191
> +
> +#define MDNIE_DE_MAX_RATIO			0xB8
> +#define MDNIE_DE_MAX_RATIO_MIN			1024
> +#define MDNIE_DE_MAX_RATIO_MAX			65535
> +#define MDNIE_DE_MIN_RATIO			0xB9
> +#define MDNIE_DE_MIN_RATIO_MIN			0
> +#define MDNIE_DE_MIN_RATIO_MAX			1024
> +#define MDNIE_DE_RBA				0xBA
> +#define MDNIE_DE_RBA_MAXPLUS(x)			((x & 0xFF) << 8)
> +#define MDNIE_DE_RBA_MAXMINUS(x)			((x & 0xFF) << 0)
> +
> +/* BANK 0: MODULE_CS */
> +#define MDNIE_CS_RED_YELLOW_HUE_GAIN		0xC0
> +#define MDNIE_CS_RED_HUE_GAIN(x)			((x & 0x3F) << 8)
> +#define MDNIE_CS_YELLOW_HUE_GAIN(x)		((x & 0x3F) << 0)
> +#define MDNIE_CS_GREEN_CYAN_HUE_GAIN		0xC1
> +#define MDNIE_CS_GREEN_HUE_GAIN(x)		((x & 0x3F) << 8)
> +#define MDNIE_CS_CYAN_HUE_GAIN(x)		((x & 0x3F) << 0)
> +#define MDNIE_CS_BLUE_MAG_HUE_GAIN		0xC2
> +#define MDNIE_CS_BLUE_HUE_GAIN(x)		((x & 0x3F) << 8)
> +#define MDNIE_CS_MAGENTA_HUE_GAIN(x)		((x & 0x3F) << 0)
> +#define MDNIE_CS_OVERALL_HUE_GAIN_REG		0xC3
> +#define MDNIE_CS_OVERALL_HUE_GAIN(x)		((x & 0x3F) << 8)
> +#define MDNIE_CS_HUE_GAIN_MAX			0x3F
> +
> +/* BANK 0: RELEASE0 */
> +#define MDNIE_RELEASE_RFF			0x00FF
> +#define MDNIE_RELEASE_RFF_MASK_REGISTERS		(1 << 0)
> +
> +/* BANK 1: MODULE_CC */
> +#define MDNIE_CC_CHSEL_STRENGTH			0x13F
> +#define MDNIE_CC_CHSEL_MASK			((0x3 << 0x8))
> +#define MDNIE_CC_CHSEL(x)			((x) << 0x8)
> +#define MDNIE_CC_STRENGTH_MASK			0xFF
> +#define MDNIE_CC_STRENGTH(x)			(x << 0)
> +#define MDNIE_DEFAULT_CC_STRENGTH		0x80
> +
> +/* Gamma Ramp */
> +#define MDNIE_CC_GAMMA_RED_0_REG			0x140
> +#define MDNIE_CC_GAMMA_GREEN_0_REG		0x150
> +#define MDNIE_CC_GAMMA_BLUE_0_REG		0x160
> +#define MDNIE_CC_GAMMA_MSB(x)			((x & 0xFF) << 8)
> +#define MDNIE_CC_GAMMA_LSB(x)			((x & 0xFF) << 0)
> +
> +/* MODULE SCRPLUS */
> +#define MDNIE_SCR_GCC_ONOFF			0x170
> +#define MDNIE_SCR_GCC_ON				(1 << 0)
> +#define MDNIE_SCR_R_R				0x171
> +#define MDNIE_SCR_R_G				0x172
> +#define MDNIE_SCR_R_B				0x173
> +#define MDNIE_SCR_G_R				0x174
> +#define MDNIE_SCR_G_G				0x175
> +#define MDNIE_SCR_G_B				0x176
> +#define MDNIE_SCR_B_R				0x177
> +#define MDNIE_SCR_B_G				0x178
> +#define MDNIE_SCR_B_B				0x179
> +#define MDNIE_SCR_K_R				0x17A
> +#define MDNIE_SCR_K_G				0x17B
> +#define MDNIE_SCR_K_B				0x17C
> +#define MDNIE_SCR_MSB(x)				((x & 0xFF) << 8)
> +#define MDNIE_SCR_LSB(x)				((x & 0xFF) << 0)
> +
> +/*  Hue gain ranges */
> +#define HG_MIN			0
> +#define HG_MAX			63
> +
> +/*  Color Component ranges */
> +#define CC_MIN			0
> +#define CC_MAX			255
> +
> +/*  threshold ranges */
> +#define TH_MIN			0
> +#define TH_MAX			2047
> +
> +/*  pos/neg gain ranges */
> +#define GAIN_MIN		0
> +#define GAIN_MAX		8191
> +
> +/*  window ranges */
> +#define X_MIN			0
> +#define X_MAX			1920
> +#define Y_MIN			0
> +#define Y_MAX			1080
> +
> +/*  gamma modes */
> +#define RGB_GAMMA_R		0
> +#define R_GAMMA_R		1
> +#define Y_GAMMA_R		2
> +
> +#endif
> 
