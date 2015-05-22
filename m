From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [PATCH v6 00/12] drm/exynos: atomic modesetting support
Date: Fri, 22 May 2015 12:47:14 +0900
Message-ID: <555EA6C2.1030001@samsung.com>
References: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:14611 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753854AbbEVDrO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 23:47:14 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0NOQ008JNFUPM7D0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 22 May 2015 12:47:13 +0900 (KST)
In-reply-to: <1432238571-31621-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Gustavo Padovan <gustavo@padovan.org>, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

Hi Gustavo,

On 05/22/2015 05:02 AM, Gustavo Padovan wrote:
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

I commented about some patches, looks good to me except them.

Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>

Thanks.
