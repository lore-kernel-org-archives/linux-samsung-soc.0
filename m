From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v2 12/23] drm/exynos: don't track enabled state at
 exynos_crtc
Date: Thu, 9 Jul 2015 19:56:00 -0300
Message-ID: <20150709225600.GA2000@joana>
References: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
 <1436192424-18194-13-git-send-email-gustavo@padovan.org>
 <20150706174147.GB7568@phenom.ffwll.local>
 <559E2C4C.9030603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:36259 "EHLO
	mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbbGIW4F (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jul 2015 18:56:05 -0400
Received: by qkdv3 with SMTP id v3so905850qkd.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jul 2015 15:56:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <559E2C4C.9030603@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, linux-samsung-soc@vger.kernel.org, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>, dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>

2015-07-09 Joonyoung Shim <jy0922.shim@samsung.com>:

> +Cc Andrzej,
> 
> On 07/07/2015 02:41 AM, Daniel Vetter wrote:
> > On Mon, Jul 06, 2015 at 11:20:13AM -0300, Gustavo Padovan wrote:
> >> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >>
> >> struct drm_crtc already stores the enabled state of the crtc
> >> thus we don't need to replicate enabled in exynos_drm_crtc.
> >>
> 
> I think exynos_crtc->enabled can replace flags for power state of each
> hw driver(e.g. "powered" of mixer driver, "suspended" of fimd driver).
> Further, we can add other flag bit for instead of using special flag
> in hw driver like vsync state("int_en" of mixer driver, "irq_flags" of
> fimd driver.)

The reason I removed it is because crtc->state->active already stores
the same information as exynos_crtc->enabled. I think we could rely
on active as well for mixer powered and suspended.

	Gustavo
