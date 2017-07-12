From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] drm/exynos/hdmi: fix disable sequence
Date: Wed, 12 Jul 2017 12:31:43 +0200
Message-ID: <ce49d672-5bee-86ef-24cc-7ebdd76ee9f2@samsung.com>
References: <CGME20170712100130eucas1p28e5dd505bee3f5e7f09d81bab8e5ba06@eucas1p2.samsung.com>
 <1499853683-10261-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:33833 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755590AbdGLKbs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Jul 2017 06:31:48 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OSZ00GW53WY2F00@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Jul 2017 11:31:46 +0100 (BST)
In-reply-to: <1499853683-10261-1-git-send-email-a.hajda@samsung.com>
Content-language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Hi

On 2017-07-12 12:01, Andrzej Hajda wrote:
> The "Fixes" patch was incorrectly merged, as a result PHY is prematurely
> powered off and for example Odroid-U3 cannot disable TV power domain
> when HDMI cable is unplugged.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: 625e63e2 ("drm/exynos/hdmi: fix pipeline disable order")~

This patch finally fixes the 'Power domain TV disable failed' issue in 
linux-next.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
>   drivers/gpu/drm/exynos/exynos_hdmi.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index e65cdbf..b1718d8 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1501,8 +1501,6 @@ static void hdmi_disable(struct drm_encoder *encoder)
>   	 */
>   	cancel_delayed_work(&hdata->hotplug_work);
>   	cec_notifier_set_phys_addr(hdata->notifier, CEC_PHYS_ADDR_INVALID);
> -
> -	hdmiphy_disable(hdata);
>   }
>   
>   static const struct drm_encoder_helper_funcs exynos_hdmi_encoder_helper_funcs = {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
