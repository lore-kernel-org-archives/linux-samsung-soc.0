From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH 10/25] drm/exynos: move dma_addr attribute from exynos
 plane to exynos fb
Date: Thu, 12 Nov 2015 16:25:36 -0200
Message-ID: <20151112182536.GF2264@joana>
References: <1447161821-1877-1-git-send-email-m.szyprowski@samsung.com>
 <1447161821-1877-11-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f176.google.com ([209.85.160.176]:33153 "EHLO
	mail-yk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753564AbbKLSZn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2015 13:25:43 -0500
Received: by ykdv3 with SMTP id v3so106239759ykd.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Nov 2015 10:25:43 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1447161821-1877-11-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, Javier Martinez Canillas <javier@osg.samsung.com>

Hi Marek,

2015-11-10 Marek Szyprowski <m.szyprowski@samsung.com>:

> DMA address is a framebuffer attribute and the right place for it is
> exynos_drm_framebuffer not exynos_drm_plane. This patch also introduces
> helper function for getting dma address of the given framebuffer.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 13 ++++++++-----
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    | 16 +++++++++-------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h       |  3 ---
>  drivers/gpu/drm/exynos/exynos_drm_fb.c        | 16 ++++++----------
>  drivers/gpu/drm/exynos/exynos_drm_fb.h        |  3 +--
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 10 ++++++----
>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 18 ------------------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  5 ++++-
>  drivers/gpu/drm/exynos/exynos_mixer.c         |  7 ++++---
>  9 files changed, 38 insertions(+), 53 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
