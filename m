From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: [PATCH 0/7] drm/exynos/hdmi: refactoring/cleanup patches
Date: Sun, 12 Jul 2015 17:34:57 +0200
Message-ID: <55A28921.60802@gmx.net>
References: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout-xforward.gmx.net ([82.165.159.42]:59799 "EHLO
	mout-xforward.gmx.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751074AbbGLPzX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Jul 2015 11:55:23 -0400
In-Reply-To: <1436452092-20757-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

Hello Andrzej!

Just some small comments.

It seems like linux-samsung-soc wasn't put into Cc for '[PATCH RESEND
0/6] drm/exynos: HDMI related fixes' (even though this series was),
maybe you should also forward the other series to this list.

This series doesn't apply cleanly when 'drm/exynos: HDMI related fixes'
is applied. E.g. the 'powered' boolean was removed by that series, but
here in patch 2/7 ('drm/exynos/hdmi: Simplify HPD gpio handling') it's
still there.

I also noticed that some of the patches ('drm/exynos/hdmi: remove
private lock code') clash with Gustavo's latest cleanup series [1]. E.g.
your patch 3/7 ('drm/exynos/hdmi: remove private lock code') touches
hdmi_commit() which was removed by Gustavo. Maybe you should coordinate
things with him?


With best wishes,
Tobias


[1] http://www.spinics.net/lists/linux-samsung-soc/msg45787.html


Andrzej Hajda wrote:
> Hi Inki, Joonyoung,
> 
> These patches removes obsolete and old structures, to simplify further
> development. They should not change behavior of the driver.
> 
> The patchset is based on exynos-drm-next plus my HDMI related fixes [1].
> 
> The patchset was tested on Universal and Odroid U3.
> 
> [1]: http://permalink.gmane.org/gmane.comp.video.dri.devel/132348
> 
> Regards
> Andrzej
> 
> 
> Andrzej Hajda (7):
>   drm/exynos/hdmi: remove old platform data code
>   drm/exynos/hdmi: Simplify HPD gpio handling
>   drm/exynos/hdmi: remove private lock code
>   drm/exynos/hdmi: add driver data pointer to private context
>   drm/exynos/hdmi: remove redundant configuration fields
>   drm/exynos/hdmi: remove hdmi_v13_conf struct
>   drm/exynos/hdmi: remove hdmi_v14_conf struct
> 
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 860 ++++++++++-------------------------
>  1 file changed, 245 insertions(+), 615 deletions(-)
> 
