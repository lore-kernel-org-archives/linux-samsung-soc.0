From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 1/2] drm/exynos: remove legacy ->suspend()/resume()
Date: Wed, 26 Aug 2015 12:50:44 -0300
Message-ID: <20150826155044.GC1991@joana>
References: <1439496399-25791-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:35793 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751690AbbHZPus (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Aug 2015 11:50:48 -0400
Received: by qgj62 with SMTP id 62so128781065qgj.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Aug 2015 08:50:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1439496399-25791-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, daniel@ffwll.ch, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

What about this patch? We need it to avoid the WARN_ON added by patch
2/2 that was already picked up by Daniel.

	Gustavo

2015-08-13 Gustavo Padovan <gustavo@padovan.org>:

> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> These legacy helpers should only be used by shadow-attaching drivers.
> KMS drivers has its own way to handle suspend/resume and don't need to
> use these two helpers.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index f1d6966..9bcf679 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -280,8 +280,6 @@ static struct drm_driver exynos_drm_driver = {
>  	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_PRIME,
>  	.load			= exynos_drm_load,
>  	.unload			= exynos_drm_unload,
> -	.suspend		= exynos_drm_suspend,
> -	.resume			= exynos_drm_resume,
>  	.open			= exynos_drm_open,
>  	.preclose		= exynos_drm_preclose,
>  	.lastclose		= exynos_drm_lastclose,
> -- 
> 2.1.0
> 
