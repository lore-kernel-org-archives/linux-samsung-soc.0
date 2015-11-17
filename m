From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/exynos: only run atomic_check() if crtc is active
Date: Tue, 17 Nov 2015 17:12:39 +0100
Message-ID: <20151117161239.GI16848@phenom.ffwll.local>
References: <1447333880-16555-1-git-send-email-gustavo@padovan.org>
 <20151112134929.GC645@ulmo>
 <20151117100611.GO16848@phenom.ffwll.local>
 <564B3777.1020804@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:37970 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751903AbbKQQMn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2015 11:12:43 -0500
Received: by wmec201 with SMTP id c201so33526453wme.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Nov 2015 08:12:41 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <564B3777.1020804@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>, linux-samsung-soc@vger.kernel.org, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org, tjakobi@math.uni-bielefeld.de, "Szyprowski, Marek" <m.szyprowski@samsung.com>

On Tue, Nov 17, 2015 at 03:19:35PM +0100, Andrzej Hajda wrote:
> Hi Daniel,
> 
> On 11/17/2015 11:06 AM, Daniel Vetter wrote:
> > On Thu, Nov 12, 2015 at 02:49:29PM +0100, Thierry Reding wrote:
> >> On Thu, Nov 12, 2015 at 11:11:20AM -0200, Gustavo Padovan wrote:
> >>> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >>>
> >>> Fixes an regression added by 3ae2436 (drm/exynos/mixer: replace
> >>> direct cross-driver call with drm mode). The whole atomic update
> >>> was failing if the hdmi display is not present/active. Add a test
> >>> to only run atomic_check() if the CRTC is active.
> >>>
> >>> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >>> ---
> >>>  drivers/gpu/drm/exynos/exynos_drm_crtc.c | 3 +++
> >>>  1 file changed, 3 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> >>> index b3ba27f..1d3ca0a 100644
> >>> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> >>> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> >>> @@ -55,6 +55,9 @@ static int exynos_crtc_atomic_check(struct drm_crtc *crtc,
> >>>  {
> >>>  	struct exynos_drm_crtc *exynos_crtc = to_exynos_crtc(crtc);
> >>>  
> >>> +	if (!state->active)
> >>> +		return 0;
> >>> +
> >>>  	if (exynos_crtc->ops->atomic_check)
> >>>  		return exynos_crtc->ops->atomic_check(exynos_crtc, state);
> >>>  
> >>
> >> This looks like something that the core should be doing.
> > 
> > Nah, this is a bug in exynos atomic_check code. Drivers _must_ check state
> > irrespective of state->active - if they forgoe any checking when active =
> > false then legacy DPMS On might spuriuosly fail, which will upset
> > userspace. There shouldn't be any exceptions to this rule.
> > 
> > Cheers, Daniel
> > 
> 
> What about the situation when we have two display pipelines
> with separate crtcs:
> - one for panel, fimd->dsi->panel,
> - one for hdmi, mixer->hdmi->TV.
> 
> Since TV is not connected mixer state have mode initially filled
> with zeros and active field set to 0. How should we handle situation
> if userspace tries to enable dpms on HDMI connector?
> How should we handle situation userspace tries to start panel pipeline?
> In this case atomic_check for mixer is called also, but since
> it will not be used and its state will not be changed it
> should not return error, am I right?

Check crtc_state->enable, skip if false. That's the "is this pipeline
configured" knob. For plane/connector it's state->crtc, but with the same
role.

I guess we could check that in the helpers, but we need to be careful to
still call ->atomic_check for the disabling transition, in case userspace
is asking for a vblank-synced flip that disables a plane but somehow
that's not possible. I somewhat prefer to handle that all in drivers
though.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
