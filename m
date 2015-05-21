From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: Re: [PATCH v6 00/12] drm/exynos: atomic modesetting support
Date: Fri, 22 May 2015 00:06:33 +0200
Message-ID: <555E56E9.4080903@math.uni-bielefeld.de>
References: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:39700 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755180AbbEUWGg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 18:06:36 -0400
In-Reply-To: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi,

I've retested the series together with [1] and FIMD/VIDI enabled. No
irregularities in the kernel log.

Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

With best wishes,
Tobias


[1] http://www.spinics.net/lists/linux-samsung-soc/msg44790.html


Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
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
> v5: fixes NULL CRTC crash on planes updates (reported by Inki and Tobias)
> 
> v6: rebase on latest exynos_drm_next
> 
> Gustavo Padovan (12):
>   drm/exynos: atomic phase 1: use drm_plane_helper_update()
>   drm/exynos: atomic phase 1: use drm_plane_helper_disable()
>   drm/exynos: atomic phase 1: add .mode_set_nofb() callback
>   drm/exynos: atomic phase 2: wire up state reset(), duplicate() and
>     destroy()
>   drm/exynos: atomic phase 2: keep track of framebuffer pointer
>   drm/exynos: atomic phase 3: atomic updates of planes
>   drm/exynos: atomic phase 3: use atomic .set_config helper
>   drm/exynos: atomic phase 3: convert page flips
>   drm/exynos: remove exported functions from exynos_drm_plane
>   drm/exynos: don't disable unused functions at init
>   drm/exynos: atomic dpms support
>   drm/exynos: remove unnecessary calls to disable_plane()
> 
>  drivers/gpu/drm/bridge/ps8622.c             |   6 +-
>  drivers/gpu/drm/bridge/ptn3460.c            |   6 +-
>  drivers/gpu/drm/exynos/exynos_dp_core.c     |   6 +-
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c    | 215 ++++++++--------------------
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c     |   6 +-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c     |   2 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h     |   4 +-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c     |   6 +-
>  drivers/gpu/drm/exynos/exynos_drm_encoder.c |  35 +----
>  drivers/gpu/drm/exynos/exynos_drm_fb.c      |  12 +-
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c   |   3 -
>  drivers/gpu/drm/exynos/exynos_drm_plane.c   | 120 +++++++++-------
>  drivers/gpu/drm/exynos/exynos_drm_plane.h   |  11 --
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c    |   6 +-
>  drivers/gpu/drm/exynos/exynos_hdmi.c        |  10 +-
>  15 files changed, 184 insertions(+), 264 deletions(-)
> 
