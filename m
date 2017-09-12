From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 04/10] drm/exynos/mixer: fix mode validation code
Date: Tue, 12 Sep 2017 15:26:46 +0200
Message-ID: <a22e0033-74ab-46c5-d3dd-7eea38134754@samsung.com>
References: <1504694220-15818-1-git-send-email-a.hajda@samsung.com>
        <CGME20170906103729eucas1p1844077cd598fb44535719925f3279c6e@eucas1p1.samsung.com>
        <1504694220-15818-5-git-send-email-a.hajda@samsung.com>
        <779fe975-84fa-f44f-bc6c-41fbdca1679e@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:49997 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751289AbdILN0v (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 09:26:51 -0400
In-reply-to: <779fe975-84fa-f44f-bc6c-41fbdca1679e@math.uni-bielefeld.de>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Daniel Drake <drake@endlessm.com>

On 12.09.2017 14:31, Tobias Jakobi wrote:
> Hello Andrzej,
>
>
> Andrzej Hajda wrote:
>> Mode limitation checked in mixer driver affects only older HW.
>> Mixer in Exynos542x has no such limitations. While at it patch changes
>> validation callback to recently introduced mode_valid which is more
>> suitable for the check. Additionally little cleanup is performed.
> Reviewed-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
>
> And some small suggestion below.
>
>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_mixer.c | 24 +++++++++++-------------
>>  1 file changed, 11 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index a87f60b..d530c18 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -1040,26 +1040,24 @@ static void mixer_disable(struct exynos_drm_crtc *crtc)
>>  	clear_bit(MXR_BIT_POWERED, &ctx->flags);
>>  }
>>  
>> -/* Only valid for Mixer version 16.0.33.0 */
>> -static int mixer_atomic_check(struct exynos_drm_crtc *crtc,
>> -		       struct drm_crtc_state *state)
>> +static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
>> +		const struct drm_display_mode *mode)
>>  {
>> -	struct drm_display_mode *mode = &state->adjusted_mode;
>> -	u32 w, h;
>> +	struct mixer_context *ctx = crtc->ctx;
>> +	u32 w = mode->hdisplay, h = mode->vdisplay;
>>  
>> -	w = mode->hdisplay;
>> -	h = mode->vdisplay;
>> +	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%d\n", w, h,
>> +		mode->vrefresh, !!(mode->flags & DRM_MODE_FLAG_INTERLACE));
>>  
>> -	DRM_DEBUG_KMS("xres=%d, yres=%d, refresh=%d, intl=%d\n",
>> -		mode->hdisplay, mode->vdisplay, mode->vrefresh,
>> -		(mode->flags & DRM_MODE_FLAG_INTERLACE) ? 1 : 0);
>> +	if (ctx->mxr_ver == MXR_VER_128_0_0_184)
>> +		return MODE_OK;
>>  
>>  	if ((w >= 464 && w <= 720 && h >= 261 && h <= 576) ||
>>  		(w >= 1024 && w <= 1280 && h >= 576 && h <= 720) ||
>>  		(w >= 1664 && w <= 1920 && h >= 936 && h <= 1080))
> I think it would be nice to have these aligned.

Yes, it should look better.

Regards
Andrzej


>
>
>> -		return 0;
>> +		return MODE_OK;
>>  
>> -	return -EINVAL;
>> +	return MODE_BAD;
>>  }
>>  
>>  static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
>> @@ -1071,7 +1069,7 @@ static const struct exynos_drm_crtc_ops mixer_crtc_ops = {
>>  	.update_plane		= mixer_update_plane,
>>  	.disable_plane		= mixer_disable_plane,
>>  	.atomic_flush		= mixer_atomic_flush,
>> -	.atomic_check		= mixer_atomic_check,
>> +	.mode_valid		= mixer_mode_valid,
>>  };
>>  
>>  static const struct mixer_drv_data exynos5420_mxr_drv_data = {
>>
>
>
>
