From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 2/2] drm/exynos: Fix build after removal of DRM_WAKUP
Date: Wed, 8 Jan 2014 10:15:25 +0900
Message-ID: <CAAQKjZPh1UdcPYb-CgpxNZjYbWyvuL2acH0_qiYm18OgGc7xhQ@mail.gmail.com>
References: <1389103152-21877-1-git-send-email-broonie@kernel.org>
	<1389103152-21877-2-git-send-email-broonie@kernel.org>
	<20140107161442.GJ4770@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:44038 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752310AbaAHBP0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 20:15:26 -0500
Received: by mail-we0-f181.google.com with SMTP id x55so854843wes.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2014 17:15:25 -0800 (PST)
In-Reply-To: <20140107161442.GJ4770@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Mark Brown <broonie@kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Mark Brown <broonie@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, linaro-kernel@lists.linaro.org

Hi,

2014/1/8 Daniel Vetter <daniel@ffwll.ch>:
> On Tue, Jan 07, 2014 at 01:59:12PM +0000, Mark Brown wrote:
>> From: Mark Brown <broonie@linaro.org>
>>
>> Commit 57ed0f7b4375 (drm: Kill DRM_WAKUP and DRM_INIT_WAITQUEUE) removed
>> the definition of DRM_WAKUP but did not remove the use of it in the Exynos
>> DRM driver causing it to fail to build. Fix that.
>>
>> Signed-off-by: Mark Brown <broonie@linaro.org>
>
> Oops, looks like something slipped past between me making the patches and
> them getting merged. Thanks for taking care of this. Both patches are
>

These patches already were posted by Seung-Woo link below, and I
merged already them to exynos-drm-next.
    http://www.spinics.net/lists/dri-devel/msg50921.html

Thanks,
Inki Dae

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> index bdfe31fb731b..05b72b07a134 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
>> @@ -706,7 +706,7 @@ static irqreturn_t fimd_irq_handler(int irq, void *dev_id)
>>       /* set wait vsync event to zero and wake up queue. */
>>       if (atomic_read(&ctx->wait_vsync_event)) {
>>               atomic_set(&ctx->wait_vsync_event, 0);
>> -             DRM_WAKEUP(&ctx->wait_vsync_queue);
>> +             wake_up(&ctx->wait_vsync_queue);
>>       }
>>  out:
>>       return IRQ_HANDLED;
>> --
>> 1.8.5.2
>>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> +41 (0) 79 365 57 48 - http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
