From: Tobias Jakobi <liquid.acid@gmx.net>
Subject: Re: drm/exynos: Add atomic modesetting support
Date: Fri, 08 May 2015 23:51:03 +0200
Message-ID: <554D2FC7.1070208@gmx.net>
References: <1430430651-22416-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.21]:62373 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751480AbbEHVvP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 May 2015 17:51:15 -0400
In-Reply-To: <1430430651-22416-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com

Hello,

I've tested this on my Hardkernel Odroid-X2 (connected via HDMI to a
1080p panel).

Run the usual modetest tests (just primary plane, primary plane with
vsync, primary plane with overlay, primary plane with overlay and video
overlay, overlay partially outside of crtc area, etc.) and haven't
noticed any issues so far.

Kernel log is 'clean', so the series works fine for me.

You can add my
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

With best wishes,
Tobias


Gustavo Padovan wrote:
> Hi,
> 
> Here goes the full support for atomic modesetting on exynos. I've
> split the patches in the various phases of atomic support.
> 
> v2: fixes comments by Joonyoung
>         - remove unused var in patch 09
>         - use ->disable instead of outdated ->dpms in hdmi code
>         - remove WARN_ON from crtc enable/disable
> 
> v3: fixes comment by Joonyoung
>         - move the removal of drm_helper_disable_unused_functions() to
>         separated patch
> 
> v4: add patches that remove unnecessary calls to disable_plane()
> 
> 	Gustavo
> 
> ---
> Gustavo Padovan (12):
>       drm/exynos: atomic phase 1: use drm_plane_helper_update()
>       drm/exynos: atomic phase 1: use drm_plane_helper_disable()
>       drm/exynos: atomic phase 1: add .mode_set_nofb() callback
>       drm/exynos: atomic phase 2: wire up state reset(), duplicate() and destroy()
>       drm/exynos: atomic phase 2: keep track of framebuffer pointer
>       drm/exynos: atomic phase 3: atomic updates of planes
>       drm/exynos: atomic phase 3: use atomic .set_config helper
>       drm/exynos: atomic phase 3: convert page flips
>       drm/exynos: remove exported functions from exynos_drm_plane
>       drm/exynos: don't disable unused functions at init
>       drm/exynos: atomic dpms support
>       drm/exynos: remove unnecessary calls to disable_plane()
> 
>  drivers/gpu/drm/bridge/ps8622.c             |   6 +-
>  drivers/gpu/drm/bridge/ptn3460.c            |   6 +-
>  drivers/gpu/drm/exynos/exynos_dp_core.c     |   6 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 215 +++++++++----------------------
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |   6 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c     |   2 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |   4 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |   6 +-
>  drivers/gpu/drm/exynos/exynos_drm_encoder.c |  35 +----
>  drivers/gpu/drm/exynos/exynos_drm_fb.c      |  12 +-
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c   |   3 -
>  drivers/gpu/drm/exynos/exynos_drm_plane.c   | 115 +++++++++--------
>  drivers/gpu/drm/exynos/exynos_drm_plane.h   |  11 --
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |   6 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  10 +-
>  15 files changed, 178 insertions(+), 265 deletions(-)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
