From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
Subject: Re: [PATCH v2 2/3] drm/exynos: remove chained calls to enable
Date: Mon, 15 Jun 2015 17:41:21 -0300
Message-ID: <20150615204121.GB4650@joana>
References: <1434097636-10709-1-git-send-email-jy0922.shim@samsung.com>
 <1434097636-10709-2-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:59109 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751392AbbFOUl3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 16:41:29 -0400
Content-Disposition: inline
In-Reply-To: <1434097636-10709-2-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, m.szyprowski@samsung.com, a.hajda@samsung.com

Hi Joonyoung,

2015-06-12 Joonyoung Shim <jy0922.shim@samsung.com>:

> With atomic modesetting all the control for CRTC, Planes, Encoders and
> Connectors should come from DRM core, so the driver is not allowed to
> enable or disable planes from inside the crtc_enable()/disable() call.
> 
> But it needs to disable planes with crtc_disable in exynos driver
> internally. Because crtc is disabled before plane is disabled, it means
> plane_disable just returns without any register changes, then we cannot
> be sure setting register to disable plane when crtc is disable.
> 
> This patch removes this chainned calls to enable plane from exynos hw
> drivers code letting only DRM core touch planes except to disable plane.
> Also it leads eliminable enabled and resume of struct exynos_drm_plane.
> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> This patch was modified from original patch of Gustavo Padovan - 
> http://www.spinics.net/lists/linux-samsung-soc/msg45351.html
> 
> v2 changes:
> - add 1/3 additional patch to remove waiting vblank in mixer.
> - rebase this from 1/3 patch.
> - add 3/3 additional patch to fix IOMMU page fault of fimd.
> 
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 63 +++---------------------------
>  drivers/gpu/drm/exynos/exynos_drm_drv.h    |  5 ---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c   | 63 +++---------------------------
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c   | 27 -------------
>  drivers/gpu/drm/exynos/exynos_mixer.c      | 38 ++----------------
>  5 files changed, 16 insertions(+), 180 deletions(-)

Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

	Gustavo
