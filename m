From: Daniel Drake <drake@endlessm.com>
Subject: Re: [PATCH] drm/exynos: fix plane-framebuffer linkage
Date: Wed, 17 Sep 2014 06:19:43 -0600
Message-ID: <CAD8Lp47-ho47WF-te15NZ=JHTd-zt1JxPXwQsTh_Ta_G89zrTA@mail.gmail.com>
References: <1410807137-8323-1-git-send-email-drake@endlessm.com>
	<20140916063501.GT4740@phenom.ffwll.local>
	<54192BB1.8060606@samsung.com>
	<54192EF0.5000705@samsung.com>
	<54193BCD.3090003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:49668 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754639AbaIQMTo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Sep 2014 08:19:44 -0400
Received: by mail-wi0-f182.google.com with SMTP id e4so1100421wiv.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2014 05:19:43 -0700 (PDT)
In-Reply-To: <54193BCD.3090003@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>, sw0312.kim@samsung.com, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

On Wed, Sep 17, 2014 at 1:44 AM, Joonyoung Shim <jy0922.shim@samsung.com> wrote:
> It's problem to add this from commit 25c8b5c3048cb6c98d402ca8d4735ccf910f727c.

My patch moves that drm_framebuffer_reference() call to the plane
function which is called from crtc_mode_set context (and also called
in crtc pageflip path), so there should be no problem here.

> Chip specific drm driver internally doesn't have to care fb reference count if
> there is no special case. We should have switched to universal plane at that
> time.

To me it seems like the chip-specific DRM drivers do need to add a
reference in the crtc_mode_set and crtc page flip paths otherwise
framebuffer removal crashes (expecting to remove 3 references), as
noted by my testing and also in commit 25c8b5c304.

However, I'll be happy if universal planes means the driver does not
have to care about this any more. Andrej, please go ahead if you are
interested, I'll be happy to test your results.

Thanks
Daniel
