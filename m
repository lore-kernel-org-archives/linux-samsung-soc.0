From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH 2/5] drm/exynos: mixer: introduce
 =?UTF-8?Q?mixer=5Flayer=5Fblending=28=29?=
Date: Fri, 22 May 2015 11:49:17 +0200
Message-ID: <f316b23705971d3d14e28ec58cf32c91@math.uni-bielefeld.de>
References: <1430919410-9917-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <1430919410-9917-3-git-send-email-tjakobi@math.uni-bielefeld.de>
 <555EF2FC.5030800@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40746 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757686AbbEVJtU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 May 2015 05:49:20 -0400
In-Reply-To: <555EF2FC.5030800@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com

Hello Joonyoung,

On 2015-05-22 11:12, Joonyoung Shim wrote:
> On 05/06/2015 10:36 PM, Tobias Jakobi wrote:
>> This analyses the current layer configuration (which layers
>> are enabled, which have alpha-pixelformat, etc.) and setups
>> blending accordingly.
>> 
>> We currently disable all kinds of blending for the bottom-most
>> layer, since configuration of the mixer background is not
>> yet exposed.
>> Also blending is only enabled when the layer has a pixelformat
>> with alpha attached.
>> 
>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>> ---
>>  drivers/gpu/drm/exynos/exynos_mixer.c | 108 
>> ++++++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/exynos/regs-mixer.h   |   1 +
>>  2 files changed, 109 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c 
>> b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index e4a5e76..5e95ef2 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -165,6 +165,18 @@ static const u8 filter_cr_horiz_tap4[] = {
>>  	70,	59,	48,	37,	27,	19,	11,	5,
>>  };
>> 
>> +static inline bool is_alpha_format(const struct mixer_context* ctx, 
>> unsigned int win)
>> +{
>> +	switch (ctx->planes[win].pixel_format) {
>> +	case DRM_FORMAT_ARGB8888:
>> +	case DRM_FORMAT_ARGB1555:
>> +	case DRM_FORMAT_ARGB4444:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>>  static inline u32 vp_reg_read(struct mixer_resources *res, u32 
>> reg_id)
>>  {
>>  	return readl(res->vp_regs + reg_id);
>> @@ -322,6 +334,102 @@ static void mixer_layer_priority(struct 
>> mixer_context *ctx)
>>  	mixer_reg_write(&ctx->mixer_res, MXR_LAYER_CFG, val);
>>  }
>> 
>> +/* Configure blending for bottom-most layer. */
>> +static void mixer_bottom_layer(struct mixer_context *ctx,
>> +		const struct layer_config *cfg)
>> +{
>> +	u32 val;
>> +	struct mixer_resources *res = &ctx->mixer_res;
>> +
>> +	if (cfg->index == 2) {
>> +		val = 0; /* use defaults for video layer */
>> +		mixer_reg_write(res, MXR_VIDEO_CFG, val);
>> +	} else {
>> +		val = MXR_GRP_CFG_COLOR_KEY_DISABLE; /* no blank key */
>> +
>> +		/* Don't blend bottom-most layer onto the mixer background. */
>> +		mixer_reg_writemask(res, MXR_GRAPHIC_CFG(cfg->index),
>> +				val, MXR_GRP_CFG_MISC_MASK);
>> +	}
>> +}
>> +
>> +static void mixer_general_layer(struct mixer_context *ctx,
>> +		const struct layer_config *cfg)
>> +{
>> +	u32 val;
>> +	struct mixer_resources *res = &ctx->mixer_res;
>> +
>> +	if (is_alpha_format(ctx, cfg->index)) {
>> +		val = MXR_GRP_CFG_COLOR_KEY_DISABLE; /* no blank key */
>> +		val |= MXR_GRP_CFG_BLEND_PRE_MUL;
>> +		val |= MXR_GRP_CFG_PIXEL_BLEND_EN; /* blending based on pixel alpha 
>> */
>> +
>> +		/* The video layer never has an alpha pixelformat. */
>> +		mixer_reg_writemask(res, MXR_GRAPHIC_CFG(cfg->index),
>> +				val, MXR_GRP_CFG_MISC_MASK);
>> +	} else {
>> +		if (cfg->index == 2) {
>> +			/*
>> +			 * No blending at the moment since the NV12/NV21 pixelformats 
>> don't
>> +			 * have an alpha channel. However the mixer supports a global 
>> alpha
>> +			 * value for a layer. Once this functionality is exposed, we can
>> +			 * support blending of the video layer through this.
>> +			 */
>> +			val = 0;
>> +			mixer_reg_write(res, MXR_VIDEO_CFG, val);
>> +		} else {
>> +			val = MXR_GRP_CFG_COLOR_KEY_DISABLE;
>> +			mixer_reg_writemask(res, MXR_GRAPHIC_CFG(cfg->index),
>> +					val, MXR_GRP_CFG_MISC_MASK);
>> +		}
>> +	}
>> +}
>> +
>> +static void mixer_layer_blending(struct mixer_context *ctx, unsigned 
>> int enable_state)
>> +{
>> +	const struct layer_config *cfg;
>> +	unsigned int i = 0;
>> +	unsigned int index;
>> +
>> +	/* Find bottom-most enabled layer. */
>> +	cfg = NULL;
>> +	while (i < ctx->num_layer) {
>> +		index = ctx->layer_config[i].index;
>> +		++i;
> 
> Don't use priority?
Used in mixer_layer_priority(), see first patch.



> 
>> +
>> +		if (enable_state & (1 << index)) {
>> +			cfg = &ctx->layer_config[i-1];
>> +			break;
>> +		}
>> +	}
>> +
>> +	/* No enabled layers found, nothing to do. */
>> +	if (!cfg)
>> +		return;
>> +
>> +	mixer_bottom_layer(ctx, cfg);
>> +
>> +	while (1) {
>> +		/* Find the next layer. */
>> +		cfg = NULL;
>> +		while (i < ctx->num_layer) {
>> +			index = ctx->layer_config[i].index;
>> +			++i;
>> +
>> +			if (enable_state & (1 << index)) {
>> +				cfg = &ctx->layer_config[i-1];
>> +				break;
>> +			}
>> +		}
>> +
>> +		/* No more enabled layers found. */
>> +		if (!cfg)
>> +			return;
>> +
>> +		mixer_general_layer(ctx, cfg);
>> +	}
>> +}
>> +
>>  static void mixer_vsync_set_update(struct mixer_context *ctx, bool 
>> enable)
>>  {
>>  	struct mixer_resources *res = &ctx->mixer_res;
>> diff --git a/drivers/gpu/drm/exynos/regs-mixer.h 
>> b/drivers/gpu/drm/exynos/regs-mixer.h
>> index ac60260..118872e 100644
>> --- a/drivers/gpu/drm/exynos/regs-mixer.h
>> +++ b/drivers/gpu/drm/exynos/regs-mixer.h
>> @@ -113,6 +113,7 @@
>>  #define MXR_GRP_CFG_BLEND_PRE_MUL	(1 << 20)
>>  #define MXR_GRP_CFG_WIN_BLEND_EN	(1 << 17)
>>  #define MXR_GRP_CFG_PIXEL_BLEND_EN	(1 << 16)
>> +#define MXR_GRP_CFG_MISC_MASK		((3 << 16) | (3 << 20))
>>  #define MXR_GRP_CFG_FORMAT_VAL(x)	MXR_MASK_VAL(x, 11, 8)
>>  #define MXR_GRP_CFG_FORMAT_MASK		MXR_GRP_CFG_FORMAT_VAL(~0)
>>  #define MXR_GRP_CFG_ALPHA_VAL(x)	MXR_MASK_VAL(x, 7, 0)
>> 
> 
> I think this patch can be clean more,
> 
> e.g. remove duplicated codes and while (1) ...
Can you point out what 'duplicated codes' you mean, and why 'while (1)' 
is wrong here?


With best wishes,
Tobias
