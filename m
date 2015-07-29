From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v3 1/9] drm/exynos: pass the correct pipe number
Date: Wed, 29 Jul 2015 17:11:04 -0300
Message-ID: <20150729201104.GA15429@joana>
References: <1437060219-32278-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f173.google.com ([209.85.220.173]:33785 "EHLO
	mail-qk0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752331AbbG2ULK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Jul 2015 16:11:10 -0400
Received: by qkdg63 with SMTP id g63so10417075qkd.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jul 2015 13:11:09 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1437060219-32278-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Inki,

Any comments about this series?

Thanks,
	
	Gustavo

2015-07-16 Gustavo Padovan <gustavo@padovan.org>:

> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> Instead of giving -1 to as arg to  drm_send_vblank_event() pass the
> correct pipe number to it.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> index 644b4b7..22b9ca0 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -203,7 +203,7 @@ void exynos_drm_crtc_finish_pageflip(struct drm_device *dev, int pipe)
>  	spin_lock_irqsave(&dev->event_lock, flags);
>  	if (exynos_crtc->event) {
>  
> -		drm_send_vblank_event(dev, -1, exynos_crtc->event);
> +		drm_send_vblank_event(dev, pipe, exynos_crtc->event);
>  		drm_vblank_put(dev, pipe);
>  		wake_up(&exynos_crtc->pending_flip_queue);
>  
> -- 
> 2.1.0
> 
