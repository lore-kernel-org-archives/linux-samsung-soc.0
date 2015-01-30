From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH] exynos/drm: fix no hdmi output
Date: Fri, 30 Jan 2015 16:29:21 +0900
Message-ID: <54CB32D1.9000201@samsung.com>
References: <1422566320-6126-1-git-send-email-prahal@yahoo.com>
 <54CACF31.2040303@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60345 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759794AbbA3H3V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jan 2015 02:29:21 -0500
In-reply-to: <54CACF31.2040303@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alban Browaeys <alban.browaeys@gmail.com>, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-next@vger.kernel.org, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>

Hi,

On 01/30/2015 09:24 AM, Joonyoung Shim wrote:
> +Cc dri-devel ML.
> 
> Hi Alban,
> 
> On 01/30/2015 06:18 AM, Alban Browaeys wrote:
>> The hdmi outputs black screen only even though under the hood Xorg and
>> framebuffer console  are fine : devices found and initialized, but
>> not a pixel out.
>>
>> Commit 93bca243ec96 ("drm/exynos: remove struct exynos_drm_manager")
>> changed the call order of mixer_initialize with regards to
>>  exynos_drm_crtc_create.
>>
> 
> Right, there is no any reason to change order but i don't think it
> causes problem because they don't any dependency.
> 

OK, i also get blank screen from hdmi after enable vidi.

>> This changes breaks hdmi out on Odroid U2 (linux-next with added
>>  Marek Szyprowski v4 hdmi patchset from linux-samsung-soc ML).
>>
> 
> I tested Odroid U3 but hdmi out is working well.
> 
> Thanks.
> 
>> Restore the previous call ordering get hdmi to ouput proper pixels:
>> ie call mixer_initialize first then exynos_drm_crtc_create.
>>
>> Fixes: 93bca243ec96 ("drm/exynos: remove struct exynos_drm_manager")
>> Signed-off-by: Alban Browaeys <prahal@yahoo.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos_mixer.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
>> index d8fd8e1..188f90f 100644
>> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
>> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
>> @@ -1258,18 +1258,19 @@ static int mixer_bind(struct device *dev, struct device *manager, void *data)
>>  	struct drm_device *drm_dev = data;
>>  	int ret;
>>  
>> +	ret = mixer_initialize(ctx, drm_dev);
>> +	if (ret)
>> +		return ret;
>> +

The pipe value for crtc is increased in mixer_initialize so it should be
called before exynos_drm_crtc_create because the pipe value is used in
exynos_drm_crtc_create.

Acked-by: Joonyoung Shim <jy0922.shim@samsung.com>

Fimd and VIDI driver also have same issue. I will post the patch to fix
this for Fimd and VIDI driver.

Thanks.

>>  	ctx->crtc = exynos_drm_crtc_create(drm_dev, ctx->pipe,
>>  				     EXYNOS_DISPLAY_TYPE_HDMI,
>>  				     &mixer_crtc_ops, ctx);
>>  	if (IS_ERR(ctx->crtc)) {
>> +		mixer_ctx_remove(ctx);
>>  		ret = PTR_ERR(ctx->crtc);
>>  		goto free_ctx;
>>  	}
>>  
>> -	ret = mixer_initialize(ctx, drm_dev);
>> -	if (ret)
>> -		goto free_ctx;
>> -
>>  	return 0;
>>  
>>  free_ctx:
>>
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
