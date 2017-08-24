From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 01/10] drm/exynos/decon5433: use readl_poll_timeout
 helpers
Date: Thu, 24 Aug 2017 18:18:22 +0200
Message-ID: <5ed41b91-a62e-c03d-6b45-473622fe112f@samsung.com>
References: <1503581639-580-1-git-send-email-a.hajda@samsung.com>
        <CGME20170824133408eucas1p1e7b9988ac74fdd3e8dd8d25ead949ec5@eucas1p1.samsung.com>
        <1503581639-580-2-git-send-email-a.hajda@samsung.com>
        <2ae55d7a-3730-72f7-ae7e-8556b9e4e4a5@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48444 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753231AbdHXQS3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 12:18:29 -0400
In-reply-to: <2ae55d7a-3730-72f7-ae7e-8556b9e4e4a5@math.uni-bielefeld.de>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>

On 24.08.2017 15:54, Tobias Jakobi wrote:
> Hello Andrzej,
>
>
> Andrzej Hajda wrote:
>> Linux core provide helpers for polling with timeout, lets use them.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 20 ++++++++------------
>>  1 file changed, 8 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> index 5792ca88..237b4c9 100644
>> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/platform_device.h>
>>  #include <linux/clk.h>
>>  #include <linux/component.h>
>> +#include <linux/iopoll.h>
>>  #include <linux/mfd/syscon.h>
>>  #include <linux/of_device.h>
>>  #include <linux/of_gpio.h>
>> @@ -407,24 +408,19 @@ static void decon_atomic_flush(struct exynos_drm_crtc *crtc)
>>  
>>  static void decon_swreset(struct decon_context *ctx)
>>  {
>> -	unsigned int tries;
>>  	unsigned long flags;
>> +	u32 val;
>> +	int ret;
>>  
>>  	writel(0, ctx->addr + DECON_VIDCON0);
>> -	for (tries = 2000; tries; --tries) {
>> -		if (~readl(ctx->addr + DECON_VIDCON0) & VIDCON0_STOP_STATUS)
>> -			break;
>> -		udelay(10);
>> -	}
>> +	readl_poll_timeout(ctx->addr + DECON_VIDCON0, val,
>> +			   ~val & VIDCON0_STOP_STATUS, 12, 20000);
> Wouldn't it be more consistent to also check for a timeout here?

Timeout here is not an error, ie it happens for example in interlace mode.

Regards
Andrzej
