From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 01/10] drm/exynos/mixer: abstract out output mode setup
 code
Date: Tue, 12 Sep 2017 15:16:40 +0200
Message-ID: <661b6a90-5286-d0ea-8089-75e70fa50b98@samsung.com>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
        <CGME20170906103728eucas1p2f32e4a98f0e034c68fa425efb5ac8269@eucas1p2.samsung.com>
        <1504694220-15818-2-git-send-email-a.hajda@samsung.com>
        <f6fb3ec8-a974-8c54-0076-8ff4dda68ffb@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48677 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751289AbdILNQp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 09:16:45 -0400
In-reply-to: <f6fb3ec8-a974-8c54-0076-8ff4dda68ffb@math.uni-bielefeld.de>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Daniel Drake <drake@endlessm.com>

Hi Tobias,

Thanks for review.


On 12.09.2017 14:29, Tobias Jakobi wrote:
> Hello Andrzej,
>
>
> Andrzej Hajda wrote:
>> Mode setup code is called from video plane update and mixer plane update.
>> Lets group it together in mixer_commit function like in case of other
>> Exynos CRTCs.
> Minor typo: Lets --> Let's
>
> Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> With some small question below.
>
>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_mixer.c | 33 ++++++++++++++++++---------------
>>  1 file changed, 18 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index 0027554..499ebdc 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -473,6 +473,22 @@ static void mixer_stop(struct mixer_context *ctx)
>>  		usleep_range(10000, 12000);
>>  }
>>  
>> +static void mixer_commit(struct mixer_context *ctx)
>> +{
>> +	struct drm_display_mode *mode = &ctx->crtc->base.state->adjusted_mode;
>> +
>> +	/* setup display size */
>> +	if (ctx->mxr_ver == MXR_VER_128_0_0_184) {
>> +		u32 val  = MXR_MXR_RES_HEIGHT(mode->vdisplay)
>> +			 | MXR_MXR_RES_WIDTH(mode->hdisplay);
>> +		mixer_reg_write(&ctx->mixer_res, MXR_RESOLUTION, val);
>> +	}
>> +
>> +	mixer_cfg_scan(ctx, mode->vdisplay);
>> +	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
>> +	mixer_run(ctx);
>> +}
>> +
>>  static void vp_video_buffer(struct mixer_context *ctx,
>>  			    struct exynos_drm_plane *plane)
>>  {
>> @@ -553,11 +569,9 @@ static void vp_video_buffer(struct mixer_context *ctx,
>>  	vp_reg_write(res, VP_TOP_C_PTR, chroma_addr[0]);
>>  	vp_reg_write(res, VP_BOT_C_PTR, chroma_addr[1]);
>>  
>> -	mixer_cfg_scan(ctx, mode->vdisplay);
>> -	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
>>  	mixer_cfg_layer(ctx, plane->index, priority, true);
>>  	mixer_cfg_vp_blend(ctx);
>> -	mixer_run(ctx);
>> +	mixer_commit(ctx);
>>  
>>  	spin_unlock_irqrestore(&res->reg_slock, flags);
>>  
>> @@ -638,14 +652,6 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>>  	mixer_reg_write(res, MXR_GRAPHIC_SPAN(win),
>>  			fb->pitches[0] / fb->format->cpp[0]);
>>  
>> -	/* setup display size */
>> -	if (ctx->mxr_ver == MXR_VER_128_0_0_184 &&
>> -		win == DEFAULT_WIN) {
>> -		val  = MXR_MXR_RES_HEIGHT(mode->vdisplay);
>> -		val |= MXR_MXR_RES_WIDTH(mode->hdisplay);
>> -		mixer_reg_write(res, MXR_RESOLUTION, val);
>> -	}
>> -
>>  	val  = MXR_GRP_WH_WIDTH(state->src.w);
>>  	val |= MXR_GRP_WH_HEIGHT(state->src.h);
>>  	val |= MXR_GRP_WH_H_SCALE(x_ratio);
>> @@ -660,18 +666,15 @@ static void mixer_graph_buffer(struct mixer_context *ctx,
>>  	/* set buffer address to mixer */
>>  	mixer_reg_write(res, MXR_GRAPHIC_BASE(win), dma_addr);
>>  
>> -	mixer_cfg_scan(ctx, mode->vdisplay);
>> -	mixer_cfg_rgb_fmt(ctx, mode->vdisplay);
>>  	mixer_cfg_layer(ctx, win, priority, true);
>>  	mixer_cfg_gfx_blend(ctx, win, is_alpha_format(fb->format->format));
>> +	mixer_commit(ctx);
> With this change, mixer_run() is now done before mixer_layer_update(). I just
> wanted to make sure that the order of operations isn't critical here.

It shoudn't matter, as it is between atomic_begin, which disables shadow
updates,
and atomic_flush, which re-enables them.

Regards
Andrzej

>
>
>
>>  	/* layer update mandatory for mixer 16.0.33.0 */
>>  	if (ctx->mxr_ver == MXR_VER_16_0_33_0 ||
>>  		ctx->mxr_ver == MXR_VER_128_0_0_184)
>>  		mixer_layer_update(ctx);
>>  
>> -	mixer_run(ctx);
>> -
>>  	spin_unlock_irqrestore(&res->reg_slock, flags);
>>  
>>  	mixer_regs_dump(ctx);
>>
>
>
>
