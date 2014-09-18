From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/exynos: fix plane-framebuffer linkage
Date: Thu, 18 Sep 2014 08:39:46 +0200
Message-ID: <CAKMK7uFGyYfwTx7+Xt2ng74QD+jUwA-tv-aW+jLsLMtk2uw3_g@mail.gmail.com>
References: <1410807137-8323-1-git-send-email-drake@endlessm.com>
	<20140916063501.GT4740@phenom.ffwll.local>
	<54192BB1.8060606@samsung.com>
	<54192EF0.5000705@samsung.com>
	<54193BCD.3090003@samsung.com>
	<CAD8Lp47-ho47WF-te15NZ=JHTd-zt1JxPXwQsTh_Ta_G89zrTA@mail.gmail.com>
	<CAKMK7uFuo_Sq8cjaiTopSmex6c4hMcAFrD7Ya+R059v=ThurXA@mail.gmail.com>
	<CAD8Lp458rPEAtDdZDs5KtcbP_kRUF6nTKZhk4S+q5m_41BUagA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:46764 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149AbaIRGjq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 18 Sep 2014 02:39:46 -0400
Received: by mail-ie0-f172.google.com with SMTP id rd18so566477iec.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2014 23:39:46 -0700 (PDT)
In-Reply-To: <CAD8Lp458rPEAtDdZDs5KtcbP_kRUF6nTKZhk4S+q5m_41BUagA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Wed, Sep 17, 2014 at 6:41 PM, Daniel Drake <drake@endlessm.com> wrote:
> 2. drm_mode_rmfb then calls drm_framebuffer_remove, which calls
> drm_mode_set_config_internal() in order to turn off the CRTC, dropping
> another reference in the process.
>         if (tmp->old_fb)
>             drm_framebuffer_unreference(tmp->old_fb);
>
> 3. drm_framebuffer_remove calls drm_plane_force_disable() which drops
> another reference:
>     /* disconnect the plane from the fb and crtc: */
>     __drm_framebuffer_unreference(old_fb);

If 3. here is about the primary plane then this won't happen, since
the primary plane pointer&reference has already been cleared in step
2.

And even if their would be a bug in here, you _certainly_ should not
try to paper over this in your driver, but instead fix up the
refcounting done in the drm core.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
