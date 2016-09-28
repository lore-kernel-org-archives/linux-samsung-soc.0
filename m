From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v3] drm/exynos: mixer: configure layers once in
 mixer_atomic_flush()
Date: Wed, 28 Sep 2016 10:26:15 +0900
Message-ID: <57EB1C37.9020905@samsung.com>
References: <CGME20160926113649epcas1p3cc06d1dbcf7a6f4c0a8a0bd07a9e13a8@epcas1p3.samsung.com>
 <1474889789-26721-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <57EA0D68.401@samsung.com> <57EA5664.3040106@math.uni-bielefeld.de>
 <130cf67d-4082-1e29-8f14-7c952c8a8012@samsung.com>
 <57EAA3C2.5000409@math.uni-bielefeld.de> <57EB014D.6010908@samsung.com>
 <57EB08B4.4070201@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47751 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754610AbcI1B0R (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Sep 2016 21:26:17 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OE6001SDXBKDAD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Sep 2016 10:26:15 +0900 (KST)
In-reply-to: <57EB08B4.4070201@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Andrzej Hajda <a.hajda@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com



2016년 09월 28일 09:03에 Tobias Jakobi 이(가) 쓴 글:
> Hey Inki,
> 
> 
> Inki Dae wrote:
>>
>>
>> 2016년 09월 28일 01:52에 Tobias Jakobi 이(가) 쓴 글:
>>> Hello Andrzej,
>>>
>>>
>>> Andrzej Hajda wrote:
>>>> On 27.09.2016 13:22, Tobias Jakobi wrote:
>>>>> Hello Inki,
>>>>>
>>>>>
>>>>> Inki Dae wrote:
>>>>>> 2016년 09월 26일 20:36에 Tobias Jakobi 이(가) 쓴 글:
>>>>>>> Only manipulate the MXR_CFG and MXR_LAYER_CFG registers once
>>>>>>> in mixer_cfg_layer().
>>>>>>> Trigger this via atomic flush.
>>>>>>>
>>>>>>> Changes in v2:
>>>>>>> - issue mixer_cfg_layer() in mixer_disable()
>>>>>>> - rename fields as suggested by Andrzej
>>>>>>> - added docu to mixer context struct
>>>>>>> - simplify mixer_win_reset() as well
>>>>>>>
>>>>>>> Changes in v3:
>>>>>>> - simplify some conditions as suggested by Inki
>>>>>>> - add docu to mixer_cfg_layer()
>>>>>>> - fold switch statements into a single one
>>>>>>>
>>>>>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/exynos/exynos_mixer.c | 135 ++++++++++++++++++++++------------
>>>>>>>  drivers/gpu/drm/exynos/regs-mixer.h   |   2 +
>>>>>>>  2 files changed, 92 insertions(+), 45 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>>>> index 1e78d57..4f06f4d 100644
>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>>>> @@ -93,12 +93,25 @@ static const uint32_t vp_formats[] = {
>>>>>>>  	DRM_FORMAT_NV21,
>>>>>>>  };
>>>>>>>  
>>>>>>> +/*
>>>>>>> + * Mixer context structure.
>>>>>>> + *
>>>>>>> + * @crtc: The HDMI CRTC attached to the mixer.
>>>>>>> + * @planes: Array of plane objects for each of the mixer windows.
>>>>>>> + * @active_windows: Cache of the mixer's hardware state.
>>>>>>> + *       Tracks which mixer windows are active/inactive.
>>>>>>> + * @pipe: The CRTC index.
>>>>>>> + * @flags: Bitfield build from the mixer_flag_bits enumerator.
>>>>>>> + * @mixer_resources: A struct containing registers, clocks, etc.
>>>>>>> + * @mxr_ver: The hardware revision/version of the mixer.
>>>>>>> + */
>>>>>>>  struct mixer_context {
>>>>>>>  	struct platform_device *pdev;
>>>>>>>  	struct device		*dev;
>>>>>>>  	struct drm_device	*drm_dev;
>>>>>>>  	struct exynos_drm_crtc	*crtc;
>>>>>>>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
>>>>>>> +	unsigned long		active_windows;
>>>>>>>  	int			pipe;
>>>>>>>  	unsigned long		flags;
>>>>>>>  
>>>>>>> @@ -418,37 +431,70 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
>>>>>>>  	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_RGB_FMT_MASK);
>>>>>>>  }
>>>>>>>  
>>>>>>> -static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win,
>>>>>>> -			    unsigned int priority, bool enable)
>>>>>>> +/**
>>>>>>> + * mixer_cfg_layer - apply layer configuration to hardware
>>>>>>> + * @ctx: mixer context
>>>>>>> + *
>>>>>>> + * This configures the MXR_CFG and MXR_LAYER_CFG hardware registers
>>>>>>> + * using the 'active_windows' field of the the mixer content, and
>>>>>>> + * the pixel format of the framebuffers associated with the enabled
>>>>>>> + * windows.
>>>>>>> + *
>>>>>>> + * Has to be called under mixer lock.
>>>>>>> + */
>>>>>>> +static void mixer_cfg_layer(struct mixer_context *ctx)
>>>>>>>  {
>>>>>>>  	struct mixer_resources *res = &ctx->mixer_res;
>>>>>>> -	u32 val = enable ? ~0 : 0;
>>>>>>> -
>>>>>>> -	switch (win) {
>>>>>>> -	case 0:
>>>>>>> -		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP0_ENABLE);
>>>>>>> -		mixer_reg_writemask(res, MXR_LAYER_CFG,
>>>>>>> -				    MXR_LAYER_CFG_GRP0_VAL(priority),
>>>>>>> -				    MXR_LAYER_CFG_GRP0_MASK);
>>>>>>> -		break;
>>>>>>> -	case 1:
>>>>>>> -		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP1_ENABLE);
>>>>>>> -		mixer_reg_writemask(res, MXR_LAYER_CFG,
>>>>>>> -				    MXR_LAYER_CFG_GRP1_VAL(priority),
>>>>>>> -				    MXR_LAYER_CFG_GRP1_MASK);
>>>>>>> +	unsigned int win;
>>>>>>>  
>>>>>>> -		break;
>>>>>>> -	case VP_DEFAULT_WIN:
>>>>>>> -		if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
>>>>>>> -			vp_reg_writemask(res, VP_ENABLE, val, VP_ENABLE_ON);
>>>>>>> -			mixer_reg_writemask(res, MXR_CFG, val,
>>>>>>> -				MXR_CFG_VP_ENABLE);
>>>>>>> -			mixer_reg_writemask(res, MXR_LAYER_CFG,
>>>>>>> -					    MXR_LAYER_CFG_VP_VAL(priority),
>>>>>>> -					    MXR_LAYER_CFG_VP_MASK);
>>>>>>> +	struct exynos_drm_plane_state *state;
>>>>>>> +	struct drm_framebuffer *fb;
>>>>>>> +	unsigned int priority;
>>>>>>> +	u32 mxr_cfg = 0, mxr_layer_cfg = 0, vp_enable = 0;
>>>>>>> +	bool enable;
>>>>>>> +
>>>>>>> +	for (win = 0; win < MIXER_WIN_NR; ++win) {
>>>>>>> +		state = to_exynos_plane_state(ctx->planes[win].base.state);
>>>>>>> +		fb = state->fb;
>>>>>>> +
>>>>>>> +		priority = state->base.normalized_zpos + 1;
>>>>>>> +		enable = test_bit(win, &ctx->active_windows);
>>>>>>> +
>>>>>>> +		if (!enable)
>>>>>>> +			continue;
>>>>>>> +
>>>>>>> +		BUG_ON(!fb);
>>>>>>> +
>>>>>>> +		/*
>>>>>>> +		 * TODO: Don't enable alpha blending for the bottom window.
>>>>>>> +		 */
>>>>>>> +		switch (win) {
>>>>>>> +		case 0:
>>>>>>> +			mxr_cfg |=  MXR_CFG_GRP0_ENABLE;
>>>>>>> +			mxr_layer_cfg |= MXR_LAYER_CFG_GRP0_VAL(priority);
>>>>>>> +			mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case 1:
>>>>>>> +			mxr_cfg |=  MXR_CFG_GRP1_ENABLE;
>>>>>>> +			mxr_layer_cfg |= MXR_LAYER_CFG_GRP1_VAL(priority);
>>>>>>> +			mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
>>>>>>> +			break;
>>>>>>> +
>>>>>>> +		case VP_DEFAULT_WIN:
>>>>>>> +			vp_enable = VP_ENABLE_ON;
>>>>>>> +			mxr_cfg |=  MXR_CFG_VP_ENABLE;
>>>>>>> +			mxr_layer_cfg |= MXR_LAYER_CFG_VP_VAL(priority);
>>>>>>> +			mixer_cfg_vp_blend(ctx);
>>>>>>> +			break;
>>>>>>>  		}
>>>>>>> -		break;
>>>>>>>  	}
>>>>>>> +
>>>>>>> +	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags))
>>>>>>> +		vp_reg_writemask(res, VP_ENABLE, vp_enable, VP_ENABLE_ON);
>>>>>>> +
>>>>>>> +	mixer_reg_writemask(res, MXR_CFG, mxr_cfg, MXR_CFG_ENABLE_MASK);
>>>>>>> +	mixer_reg_writemask(res, MXR_LAYER_CFG, mxr_layer_cfg, MXR_LAYER_CFG_MASK);
>>>>>>>  }
>>>>>>>  
>>>>>>>  static void mixer_run(struct mixer_context *ctx)
>>>>>>> @@ -478,7 +524,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
>>>>>>>  	struct drm_display_mode *mode = &state->base.crtc->state->adjusted_mode;
>>>>>>>  	struct mixer_resources *res = &ctx->mixer_res;
>>>>>>>  	struct drm_framebuffer *fb = state->fb;
>>>>>>> -	unsigned int priority = state->base.normalized_zpos + 1;
>>>>>>>  	unsigned long flags;
>>>>>>>  	dma_addr_t luma_addr[2], chroma_addr[2];
>>>>>>>  	bool tiled_mode = false;
>>>>>>> @@ -563,8 +608,6 @@ static void vp_video_buffer(struct mixer_context *ctx,
>>>>>>>  
>>>>>>>  	mixer_cfg_scan(ctx, mode->vdisplay);
>>>>>>>  	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
>>>>>>> -	mixer_cfg_layer(ctx, plane->index, priority, true);
>>>>>>> -	mixer_cfg_vp_blend(ctx);
>>>>>> You removed the function call to set MXR_CFG and MXR_LAYER_CFG registers so what if lagacy set plane ioctl is called by user user space? Where these register are updated?
>>>>> yes, you're right. I completly forgot about the legacy codepaths. Sorry
>>>>> about that!
>>>>
>>>> Are you talking about DRM_IOCTL_MODE_SETPLANE?
>>>> It does not seem to be legacy, or to be more precise it calls
>>>> .update_plane and .disable_plane
>>>> callbacks which in exynos are set as follow:
>>>>     .update_plane    = drm_atomic_helper_update_plane,
>>>>     .disable_plane    = drm_atomic_helper_disable_plane,
>>>>
>>>> So DRM_IOCTL_MODE_SETPLANE calls atomic codepath anyway.
>>> thanks a lot for the heads-up. I can confirm that drm_mode_setplane()
>>> also goes through the atomic path.
>>>
>>> The simplified callstack:
>>> - drm_mode_setplane()
>>>   - __setplane_internal()
>>>     - disable_plane() (set in plane_helper_funcs in exynos_drm_plane.c)
>>>     - update_plane() (same here)
>>
>> Sorry for previous comments not enough.
>>
>> update_plane
>> 	...
>> 	- mixer_update_plane
>> 		- vp_video_buffer or mixer_graph_buffer
>>
>> However, you removed mixer_cfg_layer call from above functions.
> exactly, because that is the very purpose of this patch.
> 
> 
>> So my intention was to keep the modifed mixer_cfg_layer call on vp_video_buffer and mixer_grpah_buffer functions.
> That is not my intention. I want to move register manipulation to the
> atomic flush step.
> 
> 
>> mixer_atomic_flush function is not really proper place to call mixer_cfg_layer function even mixer_win_reset.
> Why do you think so? I think it makes perfect sense to put it there. We
> flush the new configuration to the hardware registers there.
> 
> 
>> For this I mentioned already at previous my comment,
>> "atomic_flush callback will be used to make sure registers to be updated to the real hardware. So calling mixer_cfg_layer function here wouldn't be reasonable."
> You're confusing me. That is exactly what my patch is doing. It moves
> more of the actual hardware register updating to the atomic flush step.

Ok, for your understanding, you can check atomic_begin, atomic_flush and update_plane callback functions of exynos_drm_fimd.c.
After that I think we could continue to discuss this. I doesn't really want to tackle you.

> 
> 
>> Also it would be reasonable to remove mixer_cfg_layer function call from mixer_win_reset function.
> Why is that? In mixer_win_reset() we want to apply a default
> configuration to the various registers. Hence we set active_windows to
> zero and call mixer_cfg_layer().
> 
> 
> With best wishes,
> Tobias
> 
> 
> 
>>> For completeness I've also checked drm_mode_setcrtc(), the other legacy
>>> DRM call that manipulates the primary plane.
>>>
>>> It goes the following route:
>>> - drm_mode_setcrtc
>>>   - drm_mode_set_config_internal()
>>>     - set_config() (set in exynos_crtc_funcs in exynos_drm_crtc.c)
>>>
>>> Also here: .set_config = drm_atomic_helper_set_config
>>>
>>> Both DRM_IOCTL_MODE_SETPLANE and DRM_IOCTL_MODE_CRTC go the atomic
>>> route, so the patch is fine this way.
>>>
>>> @Inki: Can you still queue this up for 4.9.y?
>>>
>>>
>>> With best wishes,
>>> Tobias
>>>
>>>
>>>>
>>>> Regards
>>>> Andrzej
>>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> 
> 
> 
