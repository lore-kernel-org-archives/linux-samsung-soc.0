From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH] drm/exynos: fix pending update handling
Date: Fri, 16 Sep 2016 15:41:17 +0200
Message-ID: <6d1c2ba2-9036-274e-98f2-5316cd038533@samsung.com>
References: <572C4C65.4070501@math.uni-bielefeld.de>
 <1462521783-4723-1-git-send-email-a.hajda@samsung.com>
 <CGME20160916132726eucas1p22da51190ea8899fb60d2d112f84a2c26@eucas1p2.samsung.com>
 <57DBF335.4070306@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54515 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933756AbcIPNlW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 09:41:22 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ODL00HY3NCV7470@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Sep 2016 14:41:19 +0100 (BST)
In-reply-to: <57DBF335.4070306@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com

On 16.09.2016 15:27, Tobias Jakobi wrote:
> Hello everyone,
>
> any update on this issue? I can see that the old/custom wait-for-vblank
> code is still in place.
>
> Andrzej mentioned that this patch is quick/dirty, but isn't using DRM
> core functionality actually the better approach?

Thanks for pinging the problem.

As the patch changes exynos-drm core, it can influence all exynos
crtc drivers. These drivers requires review and testing. I will look
at them to verify if the patch does not introduce regression.

Regards
Andrzej

>
> With best wishes,
> Tobias
>
>
> Andrzej Hajda wrote:
>> Exynos DRM devices update their registers at vblank time. Exynos-DRM uses
>> custom mechanism to wait for vblank. This mechanism is error prone -
>> variables are not updated atomically. As a result in certain circumstances
>> user space can try to free buffers which are still in use by hardware,
>> in such cases IOMMU can throw OOPS.
>> The patch instead of fixing the mechanism replaces it with drm core helper.
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>> Hi Tobias,
>>
>> This is a quick/dirty patch just for checking if it solves your issue.
>> Successfully tested on decon5433/dsi/i80 path.
>>
>> Please verify if it helps in your case.
>>
>> The patch is based on exynos-drm-next and
>> "drm/exynos: fix cancel page flip code" [1].
>>
>> [1]: http://permalink.gmane.org/gmane.linux.kernel.samsung-soc/53801
>>
>> Regards
>> Andrzej
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 16 +-----------
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  | 44 +-------------------------------
>>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |  2 --
>>  3 files changed, 2 insertions(+), 60 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> index 785ffa6..5b6845b 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> @@ -134,8 +134,6 @@ struct exynos_drm_crtc *exynos_drm_crtc_create(struct drm_device *drm_dev,
>>  	exynos_crtc->ops = ops;
>>  	exynos_crtc->ctx = ctx;
>>  
>> -	init_waitqueue_head(&exynos_crtc->wait_update);
>> -
>>  	crtc = &exynos_crtc->base;
>>  
>>  	private->crtc[pipe] = crtc;
>> @@ -175,13 +173,6 @@ void exynos_drm_crtc_disable_vblank(struct drm_device *dev, unsigned int pipe)
>>  		exynos_crtc->ops->disable_vblank(exynos_crtc);
>>  }
>>  
>> -void exynos_drm_crtc_wait_pending_update(struct exynos_drm_crtc *exynos_crtc)
>> -{
>> -	wait_event_timeout(exynos_crtc->wait_update,
>> -			   (atomic_read(&exynos_crtc->pending_update) == 0),
>> -			   msecs_to_jiffies(50));
>> -}
>> -
>>  void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
>>  				struct exynos_drm_plane *exynos_plane)
>>  {
>> @@ -190,9 +181,6 @@ void exynos_drm_crtc_finish_update(struct exynos_drm_crtc *exynos_crtc,
>>  
>>  	exynos_plane->pending_fb = NULL;
>>  
>> -	if (atomic_dec_and_test(&exynos_crtc->pending_update))
>> -		wake_up(&exynos_crtc->wait_update);
>> -
>>  	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>>  	if (exynos_crtc->event)
>>  		drm_crtc_send_vblank_event(crtc, exynos_crtc->event);
>> @@ -235,10 +223,8 @@ void exynos_drm_crtc_cancel_page_flip(struct drm_crtc *crtc,
>>  	spin_lock_irqsave(&crtc->dev->event_lock, flags);
>>  
>>  	e = exynos_crtc->event;
>> -	if (e && e->base.file_priv == file) {
>> +	if (e && e->base.file_priv == file)
>>  		exynos_crtc->event = NULL;
>> -		atomic_dec(&exynos_crtc->pending_update);
>> -	}
>>  
>>  	spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>>  
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> index 0281b30..cc96e85 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -45,37 +45,11 @@ struct exynos_atomic_commit {
>>  	u32			crtcs;
>>  };
>>  
>> -static void exynos_atomic_wait_for_commit(struct drm_atomic_state *state)
>> -{
>> -	struct drm_crtc_state *crtc_state;
>> -	struct drm_crtc *crtc;
>> -	int i, ret;
>> -
>> -	for_each_crtc_in_state(state, crtc, crtc_state, i) {
>> -		struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
>> -
>> -		if (!crtc->state->enable)
>> -			continue;
>> -
>> -		ret = drm_crtc_vblank_get(crtc);
>> -		if (ret)
>> -			continue;
>> -
>> -		exynos_drm_crtc_wait_pending_update(exynos_crtc);
>> -		drm_crtc_vblank_put(crtc);
>> -	}
>> -}
>> -
>>  static void exynos_atomic_commit_complete(struct exynos_atomic_commit *commit)
>>  {
>>  	struct drm_device *dev = commit->dev;
>>  	struct exynos_drm_private *priv = dev->dev_private;
>>  	struct drm_atomic_state *state = commit->state;
>> -	struct drm_plane *plane;
>> -	struct drm_crtc *crtc;
>> -	struct drm_plane_state *plane_state;
>> -	struct drm_crtc_state *crtc_state;
>> -	int i;
>>  
>>  	drm_atomic_helper_commit_modeset_disables(dev, state);
>>  
>> @@ -89,25 +63,9 @@ static void exynos_atomic_commit_complete(struct exynos_atomic_commit *commit)
>>  	 * have the relevant clocks enabled to perform the update.
>>  	 */
>>  
>> -	for_each_crtc_in_state(state, crtc, crtc_state, i) {
>> -		struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
>> -
>> -		atomic_set(&exynos_crtc->pending_update, 0);
>> -	}
>> -
>> -	for_each_plane_in_state(state, plane, plane_state, i) {
>> -		struct exynos_drm_crtc *exynos_crtc =
>> -						to_exynos_crtc(plane->crtc);
>> -
>> -		if (!plane->crtc)
>> -			continue;
>> -
>> -		atomic_inc(&exynos_crtc->pending_update);
>> -	}
>> -
>>  	drm_atomic_helper_commit_planes(dev, state, false);
>>  
>> -	exynos_atomic_wait_for_commit(state);
>> +	drm_atomic_helper_wait_for_vblanks(dev, state);
>>  
>>  	drm_atomic_helper_cleanup_planes(dev, state);
>>  
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> index 561925f..0bb3766 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
>> @@ -174,8 +174,6 @@ struct exynos_drm_crtc {
>>  	enum exynos_drm_output_type	type;
>>  	unsigned int			pipe;
>>  	struct drm_pending_vblank_event	*event;
>> -	wait_queue_head_t		wait_update;
>> -	atomic_t			pending_update;
>>  	const struct exynos_drm_crtc_ops	*ops;
>>  	void				*ctx;
>>  	struct exynos_drm_clk		*pipe_clk;
>>
>
>
>
