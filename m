From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH] drm/exynos: use atomic helper commit
Date: Mon, 16 Jan 2017 12:22:00 +0100
Message-ID: <587CACD8.7090504@math.uni-bielefeld.de>
References: <CGME20170116091327epcas5p11cf9bbd8abe89543df059688abc32fb7@epcas5p1.samsung.com>
 <1484558003-18691-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39952 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751230AbdAPLWF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Jan 2017 06:22:05 -0500
In-Reply-To: <1484558003-18691-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org

Inki Dae wrote:
> This patch relpaces specific atomic commit function
> with atomic helper commit one, which also includes
> atomic_commit_tail callback for Exynos SoC becasue
> crtc devices on Exynos SoC uses power domain device
> so drm_atomic_helper_commit_planes should be called
> after drm_atomic_helper_commit_modeset_enables.
The commit message needs fixing. I think I know my way around Exynos DRM
a bit, but reading this just confuses me.

In particular the first part can probably be dropped, since it only
describes what the patch does (and I can already see this from the diff
itself).
Also some spelling issues:
relpaces -> replaces
becasue - because

With best wishes,
Tobias


> 
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c |   9 ++-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c  | 110 +------------------------------
>  drivers/gpu/drm/exynos/exynos_drm_fb.c   |  25 ++++++-
>  3 files changed, 33 insertions(+), 111 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> index 2530bf5..47da612 100644
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
> @@ -94,7 +102,6 @@ static void exynos_crtc_atomic_flush(struct drm_crtc *crtc,
>  			drm_crtc_send_vblank_event(crtc, event);
>  		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>  	}
> -
>  }
>  
>  static const struct drm_crtc_helper_funcs exynos_crtc_helper_funcs = {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 3ec0535..9d0df00 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -38,56 +38,6 @@
>  #define DRIVER_MAJOR	1
>  #define DRIVER_MINOR	0
>  
> -struct exynos_atomic_commit {
> -	struct work_struct	work;
> -	struct drm_device	*dev;
> -	struct drm_atomic_state *state;
> -	u32			crtcs;
> -};
> -
> -static void exynos_atomic_commit_complete(struct exynos_atomic_commit *commit)
> -{
> -	struct drm_device *dev = commit->dev;
> -	struct exynos_drm_private *priv = dev->dev_private;
> -	struct drm_atomic_state *state = commit->state;
> -
> -	drm_atomic_helper_commit_modeset_disables(dev, state);
> -
> -	drm_atomic_helper_commit_modeset_enables(dev, state);
> -
> -	/*
> -	 * Exynos can't update planes with CRTCs and encoders disabled,
> -	 * its updates routines, specially for FIMD, requires the clocks
> -	 * to be enabled. So it is necessary to handle the modeset operations
> -	 * *before* the commit_planes() step, this way it will always
> -	 * have the relevant clocks enabled to perform the update.
> -	 */
> -
> -	drm_atomic_helper_commit_planes(dev, state, 0);
> -
> -	drm_atomic_helper_wait_for_vblanks(dev, state);
> -
> -	drm_atomic_helper_cleanup_planes(dev, state);
> -
> -	drm_atomic_state_put(state);
> -
> -	spin_lock(&priv->lock);
> -	priv->pending &= ~commit->crtcs;
> -	spin_unlock(&priv->lock);
> -
> -	wake_up_all(&priv->wait);
> -
> -	kfree(commit);
> -}
> -
> -static void exynos_drm_atomic_work(struct work_struct *work)
> -{
> -	struct exynos_atomic_commit *commit = container_of(work,
> -				struct exynos_atomic_commit, work);
> -
> -	exynos_atomic_commit_complete(commit);
> -}
> -
>  static struct device *exynos_drm_get_dma_device(void);
>  
>  static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
> @@ -202,65 +152,6 @@ static void exynos_drm_unload(struct drm_device *dev)
>  	dev->dev_private = NULL;
>  }
>  
> -static int commit_is_pending(struct exynos_drm_private *priv, u32 crtcs)
> -{
> -	bool pending;
> -
> -	spin_lock(&priv->lock);
> -	pending = priv->pending & crtcs;
> -	spin_unlock(&priv->lock);
> -
> -	return pending;
> -}
> -
> -int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state *state,
> -			 bool nonblock)
> -{
> -	struct exynos_drm_private *priv = dev->dev_private;
> -	struct exynos_atomic_commit *commit;
> -	struct drm_crtc *crtc;
> -	struct drm_crtc_state *crtc_state;
> -	int i, ret;
> -
> -	commit = kzalloc(sizeof(*commit), GFP_KERNEL);
> -	if (!commit)
> -		return -ENOMEM;
> -
> -	ret = drm_atomic_helper_prepare_planes(dev, state);
> -	if (ret) {
> -		kfree(commit);
> -		return ret;
> -	}
> -
> -	/* This is the point of no return */
> -
> -	INIT_WORK(&commit->work, exynos_drm_atomic_work);
> -	commit->dev = dev;
> -	commit->state = state;
> -
> -	/* Wait until all affected CRTCs have completed previous commits and
> -	 * mark them as pending.
> -	 */
> -	for_each_crtc_in_state(state, crtc, crtc_state, i)
> -		commit->crtcs |= drm_crtc_mask(crtc);
> -
> -	wait_event(priv->wait, !commit_is_pending(priv, commit->crtcs));
> -
> -	spin_lock(&priv->lock);
> -	priv->pending |= commit->crtcs;
> -	spin_unlock(&priv->lock);
> -
> -	drm_atomic_helper_swap_state(state, true);
> -
> -	drm_atomic_state_get(state);
> -	if (nonblock)
> -		schedule_work(&commit->work);
> -	else
> -		exynos_atomic_commit_complete(commit);
> -
> -	return 0;
> -}
> -
>  int exynos_atomic_check(struct drm_device *dev,
>  			struct drm_atomic_state *state)
>  {
> @@ -313,6 +204,7 @@ static void exynos_drm_preclose(struct drm_device *dev,
>  
>  	list_for_each_entry(crtc, &dev->mode_config.crtc_list, head)
>  		exynos_drm_crtc_cancel_page_flip(crtc, file);
> +
>  }
>  
>  static void exynos_drm_postclose(struct drm_device *dev, struct drm_file *file)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> index 68d4142..1e10b73 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
> @@ -187,11 +187,33 @@ dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)
>  	return exynos_fb->dma_addr[index];
>  }
>  
> +static void exynos_drm_atomic_commit_tail(struct drm_atomic_state *state)
> +{
> +	struct drm_device *dev = state->dev;
> +
> +	drm_atomic_helper_commit_modeset_disables(dev, state);
> +
> +	drm_atomic_helper_commit_modeset_enables(dev, state);
> +
> +	drm_atomic_helper_commit_planes(dev, state,
> +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> +
> +	drm_atomic_helper_commit_hw_done(state);
> +
> +	drm_atomic_helper_wait_for_vblanks(dev, state);
> +
> +	drm_atomic_helper_cleanup_planes(dev, state);
> +}
> +
> +static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helpers = {
> +	.atomic_commit_tail = exynos_drm_atomic_commit_tail,
> +};
> +
>  static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs = {
>  	.fb_create = exynos_user_fb_create,
>  	.output_poll_changed = exynos_drm_output_poll_changed,
>  	.atomic_check = exynos_atomic_check,
> -	.atomic_commit = exynos_atomic_commit,
> +	.atomic_commit = drm_atomic_helper_commit,
>  };
>  
>  void exynos_drm_mode_config_init(struct drm_device *dev)
> @@ -208,4 +230,5 @@ void exynos_drm_mode_config_init(struct drm_device *dev)
>  	dev->mode_config.max_height = 4096;
>  
>  	dev->mode_config.funcs = &exynos_drm_mode_config_funcs;
> +	dev->mode_config.helper_private = &exynos_drm_mode_config_helpers;
>  }
> 
