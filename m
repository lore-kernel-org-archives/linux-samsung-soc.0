From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC 2/2] drm/exynos: mixer: configure layers once in
 mixer_atomic_flush()
Date: Tue, 20 Sep 2016 16:30:56 +0200
Message-ID: <820710d8-ee60-b3df-d85d-3da9699cba9e@samsung.com>
References: <CGME20160919141707eucas1p281593c95940e8c0b833a84175f39ffe2@eucas1p2.samsung.com>
 <1474294604-18876-1-git-send-email-tjakobi@math.uni-bielefeld.de>
 <65ebc459-91c6-9a93-45ae-356c76cc323b@samsung.com>
 <57E11C3F.6060600@math.uni-bielefeld.de>
 <c32f04a8-3e80-bd93-7da8-9e4ef04e7828@samsung.com>
 <defc2e9d-c305-b6a8-13fc-7b1c86187d60@samsung.com>
 <57E1431C.9080102@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:60718 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754851AbcITObC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Sep 2016 10:31:02 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODT00JTG4BNBA40@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Sep 2016 15:30:59 +0100 (BST)
In-reply-to: <57E1431C.9080102@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

On 20.09.2016 16:09, Tobias Jakobi wrote:
> Hi Andrzej,
>
>
> Andrzej Hajda wrote:
>> On 20.09.2016 14:34, Andrzej Hajda wrote:
>>> On 20.09.2016 13:23, Tobias Jakobi wrote:
>>>> Hello Andrzej,
>>>>
>>>> first of all, I've noticed an error myself. mixer_disable() calls
>>>> mixer_disable_plane(), so it should also be modified. I'll send a v2 later.
>>>>
>>>> Now to your points...
>>>>
>>>>
>>>> Andrzej Hajda wrote:
>>>>> On 19.09.2016 16:16, Tobias Jakobi wrote:
>>>>>> Only manipulate the MXR_CFG and MXR_LAYER_CFG registers once
>>>>>> in mixer_cfg_layer().
>>>>>> Trigger this via atomic flush.
>>>>>>
>>>>>> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>>>>>> ---
>>>>>>  drivers/gpu/drm/exynos/exynos_mixer.c | 104 ++++++++++++++++++++++------------
>>>>>>  drivers/gpu/drm/exynos/regs-mixer.h   |   2 +
>>>>>>  2 files changed, 69 insertions(+), 37 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>>> index 1e78d57..d4efd9c 100644
>>>>>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>>>>>> @@ -99,6 +99,7 @@ struct mixer_context {
>>>>>>  	struct drm_device	*drm_dev;
>>>>>>  	struct exynos_drm_crtc	*crtc;
>>>>>>  	struct exynos_drm_plane	planes[MIXER_WIN_NR];
>>>>>> +	unsigned long		state_cache;
>>>>> The name of the variable is cryptic.
>>>> Yes, I'll try to come up with something better. It would probably be
>>>> easier if struct mixer_context had a documentation for its fields.
>>>>
>>>> Anyway, any suggestions?
>>> (active|enabled)_(planes|windows), or sth similar?
> Thanks, I think I'll go with the 'window' terminology then.
>
>
>>>>>>  	int			pipe;
>>>>>>  	unsigned long		flags;
>>>>>>  
>>>>>> @@ -418,37 +419,68 @@ static void mixer_cfg_rgb_fmt(struct mixer_context *ctx, unsigned int height)
>>>>>>  	mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_RGB_FMT_MASK);
>>>>>>  }
>>>>>>  
>>>>>> -static void mixer_cfg_layer(struct mixer_context *ctx, unsigned int win,
>>>>>> -			    unsigned int priority, bool enable)
>>>>>> +static void mixer_cfg_layer(struct mixer_context *ctx)
>>>>>>  {
>>>>>>  	struct mixer_resources *res = &ctx->mixer_res;
>>>>>> -	u32 val = enable ? ~0 : 0;
>>>>>> -
>>>>>> -	switch (win) {
>>>>>> -	case 0:
>>>>>> -		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP0_ENABLE);
>>>>>> -		mixer_reg_writemask(res, MXR_LAYER_CFG,
>>>>>> -				    MXR_LAYER_CFG_GRP0_VAL(priority),
>>>>>> -				    MXR_LAYER_CFG_GRP0_MASK);
>>>>>> -		break;
>>>>>> -	case 1:
>>>>>> -		mixer_reg_writemask(res, MXR_CFG, val, MXR_CFG_GRP1_ENABLE);
>>>>>> -		mixer_reg_writemask(res, MXR_LAYER_CFG,
>>>>>> -				    MXR_LAYER_CFG_GRP1_VAL(priority),
>>>>>> -				    MXR_LAYER_CFG_GRP1_MASK);
>>>>>> +	unsigned int win;
>>>>>>  
>>>>>> -		break;
>>>>>> -	case VP_DEFAULT_WIN:
>>>>>> -		if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags)) {
>>>>>> -			vp_reg_writemask(res, VP_ENABLE, val, VP_ENABLE_ON);
>>>>>> -			mixer_reg_writemask(res, MXR_CFG, val,
>>>>>> -				MXR_CFG_VP_ENABLE);
>>>>>> -			mixer_reg_writemask(res, MXR_LAYER_CFG,
>>>>>> -					    MXR_LAYER_CFG_VP_VAL(priority),
>>>>>> -					    MXR_LAYER_CFG_VP_MASK);
>>>>>> +	struct exynos_drm_plane_state *state;
>>>>>> +	struct drm_framebuffer *fb;
>>>>>> +	unsigned int priority;
>>>>>> +	u32 mxr_cfg = 0, mxr_layer_cfg = 0, vp_enable = 0;
>>>>>> +	bool enable;
>>>>>> +
>>>>>> +	for (win = 0; win < MIXER_WIN_NR; ++win) {
>>>>>> +		state = to_exynos_plane_state(ctx->planes[win].base.state);
>>>>>> +		fb = state->fb;
>>>>>> +
>>>>>> +		priority = state->base.normalized_zpos + 1;
>>>>>> +		enable = test_bit(win, &ctx->state_cache);
>>>>>> +
>>>>>> +		if (!enable)
>>>>>> +			continue;
>>>>>> +
>>>>>> +		switch (win) {
>>>>>> +		case 0:
>>>>>> +			mxr_cfg |=  MXR_CFG_GRP0_ENABLE;
>>>>>> +			mxr_layer_cfg |= MXR_LAYER_CFG_GRP0_VAL(priority);
>>>>>> +			break;
>>>>>> +
>>>>>> +		case 1:
>>>>>> +			mxr_cfg |=  MXR_CFG_GRP1_ENABLE;
>>>>>> +			mxr_layer_cfg |= MXR_LAYER_CFG_GRP1_VAL(priority);
>>>>>> +			break;
>>>>>> +
>>>>>> +		case VP_DEFAULT_WIN:
>>>>>> +			vp_enable = VP_ENABLE_ON;
>>>>>> +			mxr_cfg |=  MXR_CFG_VP_ENABLE;
>>>>>> +			mxr_layer_cfg |= MXR_LAYER_CFG_VP_VAL(priority);
>>>>>> +			break;
>>>>>> +		}
>>>>>> +
>>>>>> +		if (!fb)
>>>>>> +			continue;
>>>>>> +
>>>>>> +		/*
>>>>>> +		 * TODO: Don't enable alpha blending for the bottom window.
>>>>>> +		 */
>>>>>> +		switch (win) {
>>>>>> +		case 0:
>>>>>> +		case 1:
>>>>>> +			mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->pixel_format));
>>>>>> +			break;
>>>>>> +
>>>>>> +		case VP_DEFAULT_WIN:
>>>>>> +			mixer_cfg_vp_blend(ctx);
>>>>>> +			break;
>>>>>>  		}
>>>>>> -		break;
>>>>>>  	}
>>>>>> +
>>>>>> +	if (test_bit(MXR_BIT_VP_ENABLED, &ctx->flags))
>>>>>> +		vp_reg_writemask(res, VP_ENABLE, vp_enable, VP_ENABLE_ON);
>>>>>> +
>>>>>> +	mixer_reg_writemask(res, MXR_CFG, mxr_cfg, MXR_CFG_ENABLE_MASK);
>>>>>> +	mixer_reg_writemask(res, MXR_LAYER_CFG, mxr_layer_cfg, MXR_LAYER_CFG_MASK);
>>>>> What about enabled planes which are not updated?
>>>>> Corresponding bit in ctx->state_cache will be 0.
>>>> Hmm, it shouldn't. state_cache is initialized once when the mixer
>>>> context struct is calloced. If the plane is not updated, the
>>>> corresponding bit in state_cache doesn't change, hence it stays 'on' in
>>>> this case (enabled plane).
>>> Thanks for the explanation, I have though (incorrectly) that state_cache is
>>> reset before every atomic transaction.
>>> By the way I wonder, if we cannot get information if window is enabled
>>> by checking 'plane_state->crtc && plane_state->crtc->state->active'.
>> drm_atomic_crtc_for_each_plane seems to be a better choice,
>> msm and vc4 uses it in flush function.
> I have looked into this, but this seems to be quite a detour.
>
> If I understand atomic sequencing correctly, then we always have:
> (1) atomic_begin()
> (2) calls to update_plane() and disable_plane()
> (3) atomic_flush()
>
> We already get all the necessary information through the calls in step
> (2), so I don't see the need to query this information again from DRM
> core in step (3). Especially since this means iterating over lists again.
>
> In particular drm_atomic_crtc_for_each_plane() does list_for_each_entry
> calling drm_plane_index() in each step, which in turn iterates over the
> list of planes again.

Fortunately drm_plane_index() is saner since 'drm: Store the plane's index'
patch, so the loop have similar complexity, but is more generic.
Moreover state_cache duplicates drm_crtc_state::plane_mask.

Anyway I have no strong feeling about it, do as you wish :)

Regards
Andrzej
