From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v2] drm/exynos: use atomic helper commit
Date: Thu, 19 Jan 2017 09:53:39 -0200
Message-ID: <20170119115339.GQ16017@joana>
References: <CGME20170119101840epcas5p36732799cf9d707abdf6a8f07e5169131@epcas5p3.samsung.com>
 <1484821118-10479-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yb0-f194.google.com ([209.85.213.194]:33859 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752192AbdASLxp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Jan 2017 06:53:45 -0500
Received: by mail-yb0-f194.google.com with SMTP id w194so1877792ybe.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2017 03:53:45 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1484821118-10479-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-samsung-soc@vger.kernel.org

Hi Inki,

2017-01-19 Inki Dae <inki.dae@samsung.com>:

> This patch replaces specific atomic commit function
> with atomic helper commit one.
> 
> For this, it removes existing atomic commit function
> and relevant code specific to Exynos DRM and makes
> atomic helper commit to be used instead.
> 
> Below are changes for the use of atomic helper commit:
> - add atomic_commit_tail callback specific to Exynos DRM
>   . default implemention of atomic helper doesn't mesh well
>     with runtime PM so the device driver which supports runtime
>     PM should call drm_atomic_helper_commit_modeset_enables function
>     prior to drm_atomic_helper_commit_planes function call.
>     atomic_commit_tail callback implements this call ordering.
> - allow plane commit only in case that CRTC device is enabled.
>   . for this, it calls atomic_helper_commit_planes function
>     with DRM_PLANE_COMMIT_ACTIVE_ONLY flag in atomic_commit_tail callback.
> 
> Changelog v1:
> - fix comment
> - fix trivial things
> - revive existing comment which explains why plane commit should be
>   called after crtc and encoder device are enabled.
> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c |  10 ++-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c  | 109 -------------------------------
>  drivers/gpu/drm/exynos/exynos_drm_fb.c   |  32 ++++++++-
>  3 files changed, 40 insertions(+), 111 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> index 2530bf5..8f13bce 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -39,6 +39,14 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
>  
>  	if (exynos_crtc->ops->disable)
>  		exynos_crtc->ops->disable(exynos_crtc);
> +
> +	if (crtc->state->event && !crtc->state->active) {
> +		spin_lock_irq(&crtc->dev->event_lock);
> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +		spin_unlock_irq(&crtc->dev->event_lock);
> +
> +		crtc->state->event = NULL;
> +	}
>  }
>  
>  static void
> @@ -94,9 +102,9 @@ static void exynos_crtc_atomic_flush(struct drm_crtc *crtc,
>  			drm_crtc_send_vblank_event(crtc, event);
>  		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  	}
> -
>  }
>  
> +

Please refrain from removing/adding random blank lines when working on your
features, they polute the code review and git history. Actually your line
addition here breaks the kernel coding styles rules. Please update the
patch.

Gustavo
