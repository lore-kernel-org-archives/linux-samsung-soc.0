From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos: remove unnecessary codes
Date: Mon, 16 Jan 2017 12:24:09 +0100
Message-ID: <587CAD59.9000101@math.uni-bielefeld.de>
References: <1484558003-18691-1-git-send-email-inki.dae@samsung.com>
 <CGME20170116091327epcas5p1250b06956c0fb805113c35c3223a94e3@epcas5p1.samsung.com>
 <1484558003-18691-2-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39957 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751363AbdAPLYL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 06:24:11 -0500
In-Reply-To: <1484558003-18691-2-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org

Seen this quite often lately. It should be be 'code' and not 'codes'.

Code in the programming context is always a collection of instructions.

With best wishes,
Tobias


Inki Dae wrote:
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
> -
>  }
>  
>  static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
> 
