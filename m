From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] drm/exynos: fix plane-framebuffer linkage
Date: Wed, 17 Sep 2014 08:35:29 +0200
Message-ID: <54192BB1.8060606@samsung.com>
References: <1410807137-8323-1-git-send-email-drake@endlessm.com>
 <20140916063501.GT4740@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:47114 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362AbaIQGff (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 02:35:35 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NC100EFP93Z9P10@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Sep 2014 07:38:23 +0100 (BST)
In-reply-to: <20140916063501.GT4740@phenom.ffwll.local>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>, Daniel Drake <drake@endlessm.com>
Cc: inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hi,

On 09/16/2014 08:35 AM, Daniel Vetter wrote:
> On Mon, Sep 15, 2014 at 12:52:17PM -0600, Daniel Drake wrote:
>> Pageflipping currently causes some inconsistencies that lead to
>> crashes. Just run an app that causes a CRTC pageflip in a raw X session
>> and check that it exits cleanly and can be restarted - you'll see
>> crashes like:
>>  Unable to handle kernel NULL pointer dereference at virtual address 00000334
>>  PC is at exynos_drm_crtc_plane_commit+0x20/0x40
>>  LR is at exynos_drm_crtc_plane_commit+0x20/0x40
>>  [<c03749b4>] (exynos_drm_crtc_plane_commit) from [<c03741bc>] (exynos_drm_crtc_commit+0x44/0x70)
>>  [<c03741bc>] (exynos_drm_crtc_commit) from [<c03743a0>] (exynos_drm_crtc_mode_set_commit.isra.2+0xb4/0xc4)
>>  [<c03743a0>] (exynos_drm_crtc_mode_set_commit.isra.2) from [<c03744f4>] (exynos_drm_crtc_page_flip+0x140/0x1a8)
>>  [<c03744f4>] (exynos_drm_crtc_page_flip) from [<c036b20c>] (drm_mode_page_flip_ioctl+0x224/0x2dc)
>>  [<c036b20c>] (drm_mode_page_flip_ioctl) from [<c035c324>] (drm_ioctl+0x338/0x4fc)
>>
>> These crashes happen because drm_plane_force_disable has previously set
>> plane->crtc to NULL.
>>
>> When drm_mode_page_flip_ioctl() is used to flip another framebuffer
>> onto the primary plane, crtc->primary->fb is correctly updated (this is
>> a virtual plane created by plane_helper), but plane->fb is not (this
>> plane is the real one, created by exynos_drm_crtc_create).
>>
>> We then come to handle rmfb of the backbuffer, which the "real" primary
>> plane is incorrectly pointing at. So drm_framebuffer_remove() decides that
>> the buffer is actually active on a plane and force-disables the plane.
>>
>> Ensuring that plane->fb is kept up-to-date solves that issue, but
>> exposes a reference counting problem. Now we see crashes when rmfb is
>> called on the front-buffer, because the rmfb code expects to drop 3
>> references here, and there are only 2.
>>
>> That can be fixed by adopting the reference management found in omapdrm:
>> Framebuffer references are not taken directly in crtc mode_set context,
>> but rather in the context of updating the plane, which also covers
>> flips. Like omapdrm we also unreference the old framebuffer here.
>>
>> Signed-off-by: Daniel Drake <drake@endlessm.com>
> This sounds very much like exynos should switch to universal planes so
> that the fake primary plane created by the helpers doesn't get in the way.
> And for chips which already use planes for everything internally this
> shouldn't be a lot more than a few lines.
> -Daniel

The patch proposed here of course supersedes my patch fixing fb refcounting.
But the best solution is to get rid of virtual plane as Daniel Vetter
stated.
Daniel (Drake of course :) ) do you want to prepare patch switching to
universal planes?
Maybe other volunteers? If not I can try to do it, as it seems quite
straightforward.

Regards
Andrzej

>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c  | 12 ++----------
>>  drivers/gpu/drm/exynos/exynos_drm_plane.c |  8 ++++++++
>>  2 files changed, 10 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> index b68e58f..7aa9dee 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
>> @@ -140,16 +140,8 @@ exynos_drm_crtc_mode_set(struct drm_crtc *crtc, struct drm_display_mode *mode,
>>  	if (manager->ops->mode_set)
>>  		manager->ops->mode_set(manager, &crtc->mode);
>>  
>> -	ret = exynos_plane_mode_set(plane, crtc, crtc->primary->fb, 0, 0, crtc_w, crtc_h,
>> -				    x, y, crtc_w, crtc_h);
>> -	if (ret)
>> -		return ret;
>> -
>> -	plane->crtc = crtc;
>> -	plane->fb = crtc->primary->fb;
>> -	drm_framebuffer_reference(plane->fb);
>> -
>> -	return 0;
>> +	return exynos_plane_mode_set(plane, crtc, crtc->primary->fb, 0, 0,
>> +				     crtc_w, crtc_h, x, y, crtc_w, crtc_h);
>>  }
>>  
>>  static int exynos_drm_crtc_mode_set_commit(struct drm_crtc *crtc, int x, int y,
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> index 8371cbd..df27e35 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
>> @@ -139,6 +139,14 @@ int exynos_plane_mode_set(struct drm_plane *plane, struct drm_crtc *crtc,
>>  			overlay->crtc_x, overlay->crtc_y,
>>  			overlay->crtc_width, overlay->crtc_height);
>>  
>> +	if (plane->fb)
>> +		drm_framebuffer_unreference(plane->fb);
>> +
>> +	drm_framebuffer_reference(fb);
>> +
>> +	plane->fb = fb;
>> +	plane->crtc = crtc;
>> +
>>  	exynos_drm_crtc_plane_mode_set(crtc, overlay);
>>  
>>  	return 0;
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
