From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: remove unnecessary codes
Date: Mon, 16 Jan 2017 10:37:14 +0100
Message-ID: <f2f5ff44-17e9-9ae3-d01a-efa4f596e2fa@samsung.com>
References: <1484558003-18691-1-git-send-email-inki.dae@samsung.com>
 <CGME20170116091327epcas5p1250b06956c0fb805113c35c3223a94e3@epcas5p1.samsung.com>
 <1484558003-18691-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:65002 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750901AbdAPJhY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 04:37:24 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OJV004G69E4KB10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Jan 2017 09:37:16 +0000 (GMT)
In-reply-to: <1484558003-18691-2-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org

On 16.01.2017 10:13, Inki Dae wrote:
> This patch removes exynos_drm_crtc_cancel_page_flip call
> when drm is closed because at that time, events will be released
> by drm_events_release function.
>
> Change-Id: I156ea27a4c90aa87a27a50415515fa334148c912
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 9d0df00..035d02e 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -198,13 +198,7 @@ static int exynos_drm_open(struct drm_device *dev, struct drm_file *file)
>  static void exynos_drm_preclose(struct drm_device *dev,
>  					struct drm_file *file)
>  {
> -	struct drm_crtc *crtc;
> -
>  	exynos_drm_subdrv_close(dev, file);
> -
> -	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
> -		exynos_drm_crtc_cancel_page_flip(crtc, file);

Since this is single user of exynos_drm_crtc_cancel_page_flip, this
function can be removed as well.
Beside this:
Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>


Regards
Andrzej

> -
>  }
>  
>  static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
