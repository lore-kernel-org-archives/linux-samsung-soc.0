From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2] drm/exynos: use atomic helper commit
Date: Mon, 23 Jan 2017 18:00:43 +0900
Message-ID: <5885C63B.7060606@samsung.com>
References: <CGME20170119101840epcas5p36732799cf9d707abdf6a8f07e5169131@epcas5p3.samsung.com>
 <1484821118-10479-1-git-send-email-inki.dae@samsung.com>
 <5880B5E8.4000309@math.uni-bielefeld.de> <5881874A.5050506@samsung.com>
 <58820B33.8050107@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:41778 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750724AbdAWJA7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2017 04:00:59 -0500
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OK801GJ66D89OE0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jan 2017 18:00:44 +0900 (KST)
In-reply-to: <58820B33.8050107@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, dri-devel@lists.freedesktop.org
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org



2017년 01월 20일 22:05에 Tobias Jakobi 이(가) 쓴 글:
> Inki Dae wrote:
>> Hi Tobias,
>>
>> 2017년 01월 19일 21:49에 Tobias Jakobi 이(가) 쓴 글:
>>> What about Laurent's comment stating that drm_atomic_helper_commit() is
>>> broken at the moment? Shouldn't there be some kind of warning in the
>>> commit message that this patch is only safe to apply once the fixes for
>>> drm_atomic_helper_commit() have landed? I'm already seeing this getting
>>> merged by accident, without Maarten's series even being reviewed.
>>
>> What patches you mean?
> The patchset that Laurent mentioned.
> [PATCH v3 0/7] drm/atomic: Add accessor macros for all atomic state.
> https://www.spinics.net/lists/dri-devel/msg129537.html
> 
> 
>> According to Laurent's comment, async commit support of drm_atomic_helper_commit is subect to a race condition.
>> So I'm checking whether there is any case to use async commit in Exynos DRM driver.
> I'm not sure what you're exactly checking here, because it is userspace
> that requests a atomic commit to be executed asynchronously.

Hm... See the below code from mainline,

nt drm_mode_atomic_ioctl(struct drm_device *dev,
			  void *data, struct drm_file *file_priv)
{
	...

	if ((arg->flags & DRM_MODE_PAGE_FLIP_ASYNC) &&
			!dev->mode_config.async_page_flip)
		return -EINVAL;
	...

I'm not sure you checked Exynos drm driver but Exynos drm driver doesn't support async page flip.
And you are right. userspace requests async commit but that is also depend on specific driver.

> 
> 
>> As of now, I don't see any case. even without Maarten's patch set, it works well - actually, I had a test with atomic test app more than 10 hours..
> Can you provide this test application? In particular I'm asking this
> because libdrm currently doesn't provide any tests using the atomic API.
> So this application might be of interest also for other people.

Below is the app I tested. Know that this application is from chromiumOS tree and I just fixed some parts for internal test.
https://review.tizen.org/git/?p=platform/upstream/libdrm.git;a=commitdiff;h=9d3bd95f2c5a9b4b69062a3ff008947054b94f55

> 
> 
>> And important thing is that this posting is just for review not merge.
> In this case the patches should be tagged as 'RFC', something which I
> don't see here.
> 
> 
>> So if there is any critical problem with this patch, I will stop to merge it. This would be my role, maintainer.
> Let me phrase it this way. Your patch is not fixing a bug, it is a

This patch definitely phrased 'This patch replaces specific atomic commit function with atomic helper commit one' not fixing a bug.

Thanks.

> cleanup patch that reduces driver specific code with DRM core code. But
> as Laurent has pointed out this core code currently has some known (!)
> issues. In the interest of not breaking anything I would advise against
> merging this before Maarten's patches have landed.
> 
> 
> With best wishes,
> Tobias
> 
> 
>>
>> Thanks.
>>
>>>
>>> The commit message looks much better now. Still some spelling issues remain:
>>> implemention -> implementation
>>>
>>>
>>> With best wishes,
>>> Tobias
>>>
>>>
>>> Inki Dae wrote:
>>>> This patch replaces specific atomic commit function
>>>> with atomic helper commit one.
>>>>
>>>> For this, it removes existing atomic commit function
>>>> and relevant code specific to Exynos DRM and makes
>>>> atomic helper commit to be used instead.
>>>>
>>>> Below are changes for the use of atomic helper commit:
>>>> - add atomic_commit_tail callback specific to Exynos DRM
>>>>   . default implemention of atomic helper doesn't mesh well
>>>>     with runtime PM so the device driver which supports runtime
>>>>     PM should call drm_atomic_helper_commit_modeset_enables function
>>>>     prior to drm_atomic_helper_commit_planes function call.
>>>>     atomic_commit_tail callback implements this call ordering.
>>>> - allow plane commit only in case that CRTC device is enabled.
>>>>   . for this, it calls atomic_helper_commit_planes function
>>>>     with DRM_PLANE_COMMIT_ACTIVE_ONLY flag in atomic_commit_tail callback.
>>>>
>>>> Changelog v1:
>>>> - fix comment
>>>> - fix trivial things
>>>> - revive existing comment which explains why plane commit should be
>>>>   called after crtc and encoder device are enabled.
>>>>
>>>> Signed-off-by: Inki Dae <inki.dae@samsung.com>
>>>> Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.com>
>>>> ---
>>>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c |  10 ++-
>>>>  drivers/gpu/drm/exynos/exynos_drm_drv.c  | 109 -------------------------------
>>>>  drivers/gpu/drm/exynos/exynos_drm_fb.c   |  32 ++++++++-
>>>>  3 files changed, 40 insertions(+), 111 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>>>> index 2530bf5..8f13bce 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>>>> @@ -39,6 +39,14 @@ static void exynos_drm_crtc_disable(struct drm_crtc *crtc)
>>>>  
>>>>  	if (exynos_crtc->ops->disable)
>>>>  		exynos_crtc->ops->disable(exynos_crtc);
>>>> +
>>>> +	if (crtc->state->event && !crtc->state->active) {
>>>> +		spin_lock_irq(&crtc->dev->event_lock);
>>>> +		drm_crtc_send_vblank_event(crtc, crtc->state->event);
>>>> +		spin_unlock_irq(&crtc->dev->event_lock);
>>>> +
>>>> +		crtc->state->event =ULL;
>>>> +	}
>>>>  }
>>>>  
>>>>  static void
>>>> @@ -94,9 +102,9 @@ static void exynos_crtc_atomic_flush(struct drm_crtc *crtc,
>>>>  			drm_crtc_send_vblank_event(crtc, event);
>>>>  		spin_unlock_irqrestore(&crtc->dev->event_lock, flags);
>>>>  	}
>>>> -
>>>>  }
>>>>  
>>>> +
>>>>  static const struct drm_crtc_helper_funcs exynos_crtc_helper_funcs =
>>>>  	.enable		= xynos_drm_crtc_enable,
>>>>  	.disable	=xynos_drm_crtc_disable,
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>>> index 3ec0535..c8f3eeb 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>>>> @@ -38,56 +38,6 @@
>>>>  #define DRIVER_MAJOR	1
>>>>  #define DRIVER_MINOR	0
>>>>  
>>>> -struct exynos_atomic_commit {
>>>> -	struct work_struct	work;
>>>> -	struct drm_device	*dev;
>>>> -	struct drm_atomic_state *state;
>>>> -	u32			crtcs;
>>>> -};
>>>> -
>>>> -static void exynos_atomic_commit_complete(struct exynos_atomic_commit *commit)
>>>> -{
>>>> -	struct drm_device *dev =ommit->dev;
>>>> -	struct exynos_drm_private *priv =ev->dev_private;
>>>> -	struct drm_atomic_state *state =ommit->state;
>>>> -
>>>> -	drm_atomic_helper_commit_modeset_disables(dev, state);
>>>> -
>>>> -	drm_atomic_helper_commit_modeset_enables(dev, state);
>>>> -
>>>> -	/*
>>>> -	 * Exynos can't update planes with CRTCs and encoders disabled,
>>>> -	 * its updates routines, specially for FIMD, requires the clocks
>>>> -	 * to be enabled. So it is necessary to handle the modeset operations
>>>> -	 * *before* the commit_planes() step, this way it will always
>>>> -	 * have the relevant clocks enabled to perform the update.
>>>> -	 */
>>>> -
>>>> -	drm_atomic_helper_commit_planes(dev, state, 0);
>>>> -
>>>> -	drm_atomic_helper_wait_for_vblanks(dev, state);
>>>> -
>>>> -	drm_atomic_helper_cleanup_planes(dev, state);
>>>> -
>>>> -	drm_atomic_state_put(state);
>>>> -
>>>> -	spin_lock(&priv->lock);
>>>> -	priv->pending &=commit->crtcs;
>>>> -	spin_unlock(&priv->lock);
>>>> -
>>>> -	wake_up_all(&priv->wait);
>>>> -
>>>> -	kfree(commit);
>>>> -}
>>>> -
>>>> -static void exynos_drm_atomic_work(struct work_struct *work)
>>>> -{
>>>> -	struct exynos_atomic_commit *commit =ontainer_of(work,
>>>> -				struct exynos_atomic_commit, work);
>>>> -
>>>> -	exynos_atomic_commit_complete(commit);
>>>> -}
>>>> -
>>>>  static struct device *exynos_drm_get_dma_device(void);
>>>>  
>>>>  static int exynos_drm_load(struct drm_device *dev, unsigned long flags)
>>>> @@ -202,65 +152,6 @@ static void exynos_drm_unload(struct drm_device *dev)
>>>>  	dev->dev_private =ULL;
>>>>  }
>>>>  
>>>> -static int commit_is_pending(struct exynos_drm_private *priv, u32 crtcs)
>>>> -{
>>>> -	bool pending;
>>>> -
>>>> -	spin_lock(&priv->lock);
>>>> -	pending =riv->pending & crtcs;
>>>> -	spin_unlock(&priv->lock);
>>>> -
>>>> -	return pending;
>>>> -}
>>>> -
>>>> -int exynos_atomic_commit(struct drm_device *dev, struct drm_atomic_state *state,
>>>> -			 bool nonblock)
>>>> -{
>>>> -	struct exynos_drm_private *priv =ev->dev_private;
>>>> -	struct exynos_atomic_commit *commit;
>>>> -	struct drm_crtc *crtc;
>>>> -	struct drm_crtc_state *crtc_state;
>>>> -	int i, ret;
>>>> -
>>>> -	commit =zalloc(sizeof(*commit), GFP_KERNEL);
>>>> -	if (!commit)
>>>> -		return -ENOMEM;
>>>> -
>>>> -	ret =rm_atomic_helper_prepare_planes(dev, state);
>>>> -	if (ret) {
>>>> -		kfree(commit);
>>>> -		return ret;
>>>> -	}
>>>> -
>>>> -	/* This is the point of no return */
>>>> -
>>>> -	INIT_WORK(&commit->work, exynos_drm_atomic_work);
>>>> -	commit->dev =ev;
>>>> -	commit->state =tate;
>>>> -
>>>> -	/* Wait until all affected CRTCs have completed previous commits and
>>>> -	 * mark them as pending.
>>>> -	 */
>>>> -	for_each_crtc_in_state(state, crtc, crtc_state, i)
>>>> -		commit->crtcs |=rm_crtc_mask(crtc);
>>>> -
>>>> -	wait_event(priv->wait, !commit_is_pending(priv, commit->crtcs));
>>>> -
>>>> -	spin_lock(&priv->lock);
>>>> -	priv->pending |=ommit->crtcs;
>>>> -	spin_unlock(&priv->lock);
>>>> -
>>>> -	drm_atomic_helper_swap_state(state, true);
>>>> -
>>>> -	drm_atomic_state_get(state);
>>>> -	if (nonblock)
>>>> -		schedule_work(&commit->work);
>>>> -	else
>>>> -		exynos_atomic_commit_complete(commit);
>>>> -
>>>> -	return 0;
>>>> -}
>>>> -
>>>>  int exynos_atomic_check(struct drm_device *dev,
>>>>  			struct drm_atomic_state *state)
>>>>  {
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
>>>> index 68d4142..c77a5ac 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
>>>> @@ -187,11 +187,40 @@ dma_addr_t exynos_drm_fb_dma_addr(struct drm_framebuffer *fb, int index)
>>>>  	return exynos_fb->dma_addr[index];
>>>>  }
>>>>  
>>>> +static void exynos_drm_atomic_commit_tail(struct drm_atomic_state *state)
>>>> +{
>>>> +	struct drm_device *dev =tate->dev;
>>>> +
>>>> +	drm_atomic_helper_commit_modeset_disables(dev, state);
>>>> +
>>>> +	drm_atomic_helper_commit_modeset_enables(dev, state);
>>>> +
>>>> +	/*
>>>> +	 * Exynos can't update planes with CRTCs and encoders disabled,
>>>> +	 * its updates routines, specially for FIMD, requires the clocks
>>>> +	 * to be enabled. So it is necessary to handle the modeset operations
>>>> +	 * *before* the commit_planes() step, this way it will always
>>>> +	 * have the relevant clocks enabled to perform the update.
>>>> +	 */
>>>> +	drm_atomic_helper_commit_planes(dev, state,
>>>> +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
>>>> +
>>>> +	drm_atomic_helper_commit_hw_done(state);
>>>> +
>>>> +	drm_atomic_helper_wait_for_vblanks(dev, state);
>>>> +
>>>> +	drm_atomic_helper_cleanup_planes(dev, state);
>>>> +}
>>>> +
>>>> +static struct drm_mode_config_helper_funcs exynos_drm_mode_config_helpers =
>>>> +	.atomic_commit_tail = xynos_drm_atomic_commit_tail,
>>>> +};
>>>> +
>>>>  static const struct drm_mode_config_funcs exynos_drm_mode_config_funcs =
>>>>  	.fb_create = xynos_user_fb_create,
>>>>  	.output_poll_changed =xynos_drm_output_poll_changed,
>>>>  	.atomic_check =xynos_atomic_check,
>>>> -	.atomic_commit =xynos_atomic_commit,
>>>> +	.atomic_commit =rm_atomic_helper_commit,
>>>>  };
>>>>  
>>>>  void exynos_drm_mode_config_init(struct drm_device *dev)
>>>> @@ -208,4 +237,5 @@ void exynos_drm_mode_config_init(struct drm_device *dev)
>>>>  	dev->mode_config.max_height =096;
>>>>  
>>>>  	dev->mode_config.funcs =exynos_drm_mode_config_funcs;
>>>> +	dev->mode_config.helper_private =exynos_drm_mode_config_helpers;
>>>>  }
>>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
