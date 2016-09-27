From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v3] drm/exynos: mixer: configure layers once in
 mixer_atomic_flush()
Date: Tue, 27 Sep 2016 13:22:10 +0200
Message-ID: <57EA5662.4040006@math.uni-bielefeld.de>
References: <CGME20160926113649epcas1p3cc06d1dbcf7a6f4c0a8a0bd07a9e13a8@epcas1p3.samsung.com>
 <1474889789-26721-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <57E9E95A.6010606@samsung.com> <57EA0648.5000106@math.uni-bielefeld.de>
 <57EA173D.6090604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:40327 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752979AbcI0LWP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 07:22:15 -0400
In-Reply-To: <57EA173D.6090604@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, a.hajda@samsung.com, m.szyprowski@samsung.com

Hey Inki,


Inki Dae wrote:
> 2016년 09월 27일 14:40에 Tobias Jakobi 이(가) 쓴 글:
>> Inki Dae wrote:
>>>
>>>
>>> 2016년 09월 26일 20:36에 Tobias Jakobi 이(가) 쓴 글:
>>>> Only manipulate the MXR_CFG and MXR_LAYER_CFG registers once
>>>> in mixer_cfg_layer().
>>>> Trigger this via atomic flush.
>>>>
>>>> Changes in v2:
>>>> - issue mixer_cfg_layer() in mixer_disable()
>>>> - rename fields as suggested by Andrzej
>>>> - added docu to mixer context struct
>>>> - simplify mixer_win_reset() as well
>>>>
>>>> Changes in v3:
>>>> - simplify some conditions as suggested by Inki
>>>> - add docu to mixer_cfg_layer()
>>>> - fold switch statements into a single one
>>>>
>>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>>> ---
>>>>  drivers/gpu/drm/exynos/exynos_mixer.c | 135 ++++++++++++++++++++++------------
>>>>  drivers/gpu/drm/exynos/regs-mixer.h   |   2 +
>>>>  2 files changed, 92 insertions(+), 45 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>> index 1e78d57..4f06f4d 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>> @@ -93,12 +93,25 @@ static const uint32_t vp_formats[] = {
>>>>  	DRM_FORMAT_NV21,
>>>>  };
>>>>  
>>>> +/*
>>>> + * Mixer context structure.
>>>> + *
>>>> + * @crtc: The HDMI CRTC attached to the mixer.
>>>> + * @planes: Array of plane objects for each of the mixer windows.
>>>> + * @active_windows: Cache of the mixer's hardware state.
>>>> + *       Tracks which mixer windows are active/inactive.
>>>> + * @pipe: The CRTC index.
>>>> + * @flags: Bitfield build from the mixer_flag_bits enumerator.
>>>> + * @mixer_resources: A struct containing registers, clocks, etc.
>>>> + * @mxr_ver: The hardware revision/version of the mixer.
>>>> + */
>>>>  struct mixer_context {
>>>>  	struct platform_device *pdev;
>>>>  	struct device		*dev;
>>>>  	struct drm_device	*drm_dev;
>>>>  	struct exynos_drm_crtc	*crtc;
>>>>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
>>>> +	unsigned long		active_windows;
>>>>  	int			pipe;
>>>>  	unsigned long		flags;
>>>>  
>>>> @@ -418,37 +431,70 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
>>>>  	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_RGB_FMT_MASK);
>>>>  }
>>>>  
>>>> -static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win,
>>>> -			    unsigned int priority, bool enable)
>>>> +/**
>>>> + * mixer_cfg_layer - apply layer configuration to hardware
>>>> + * @ctx: mixer context
>>>> + *
>>>> + * This configures the MXR_CFG and MXR_LAYER_CFG hardware registers
>>>> + * using the 'active_windows' field of the the mixer content, and
>>>> + * the pixel format of the framebuffers associated with the enabled
>>>> + * windows.
>>>> + *
>>>> + * Has to be called under mixer lock.
>>>> + */
>>>> +static void mixer_cfg_layer(struct mixer_context *ctx)
>>>>  {
>>>>  	struct mixer_resources *res = &ctx->mixer_res;
>>>> -	u32 val = enable ? ~0 : 0;
>>>> -
>>>> -	switch (win) {
>>>> -	case 0:
>>>> -		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP0_ENABLE);
>>>> -		mixer_reg_writemask(res, MXR_LAYER_CFG,
>>>> -				    MXR_LAYER_CFG_GRP0_VAL(priority),
>>>> -				    MXR_LAYER_CFG_GRP0_MASK);
>>>> -		break;
>>>> -	case 1:
>>>> -		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP1_ENABLE);
>>>> -		mixer_reg_writemask(res, MXR_LAYER_CFG,
>>>> -				    MXR_LAYER_CFG_GRP1_VAL(priority),
>>>> -				    MXR_LAYER_CFG_GRP1_MASK);
>>>> +	unsigned int win;
>>>>  
>>>> -		break;
>>>> -	case VP_DEFAULT_WIN:
>>>> -		if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
>>>> -			vp_reg_writemask(res, VP_ENABLE, val, VP_ENABLE_ON);
>>>> -			mixer_reg_writemask(res, MXR_CFG, val,
>>>> -				MXR_CFG_VP_ENABLE);
>>>> -			mixer_reg_writemask(res, MXR_LAYER_CFG,
>>>> -					    MXR_LAYER_CFG_VP_VAL(priority),
>>>> -					    MXR_LAYER_CFG_VP_MASK);
>>>> +	struct exynos_drm_plane_state *state;
>>>> +	struct drm_framebuffer *fb;
>>>> +	unsigned int priority;
>>>> +	u32 mxr_cfg = 0, mxr_layer_cfg = 0, vp_enable = 0;
>>>> +	bool enable;
>>>> +
>>>> +	for (win = 0; win < MIXER_WIN_NR; ++win) {
>>>> +		state = to_exynos_plane_state(ctx->planes[win].base.state);
>>>> +		fb = state->fb;
>>>> +
>>>> +		priority = state->base.normalized_zpos + 1;
>>>> +		enable = test_bit(win, &ctx->active_windows);
>>>> +
>>>> +		if (!enable)
>>>> +			continue;
>>>> +
>>>> +		BUG_ON(!fb);
>>>
>>> Not good. Even through some problem happens at mixer driver, other KMS drivers should work.
>> That would be a issue at core level. And in this case, BUG_ON() should
>> be triggered.
> 
> If so, the fb should be checked at core level not specific driver.
I'm not sure I can follow you here. So you actually agree on putting
BUG_ON() here, or not?

Or let me phrase it differently. We have three options here:
(1) Put a BUG_ON(). If something goes terribly wrong in DRM core and fb
is NULL at this point, then we get a nice descriptive Oops.
(2) Put nothing here. Again, something goes terribly wrong, fb is NULL,
etc. Then we also get an Oops here, since we dereference NULL.
(3) Put 'if (fb) something();' here. Now we mask/ignore the issue in DRM
core and continue as if nothing went wrong.

Obviously (3) is the worst approach. We want to fix bugs, not hide them.
Second best in my opinion is (2). The Oops is going to tell us that NULL
was dereferenced, but depending on the build, it's not immediately clear
where in the code that happens.
Best is (1) in my opinion since the Oops is more descriptive and the
code itself actually tells us that this shouldn't happen.


With best wishes,
Tobias



> 
>>
>> - Tobias
>>
>>
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>>
>>
