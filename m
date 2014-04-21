From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [RFC v2 PATCH v2 06/14] drm/exynos: support MIPI DSI command mode
Date: Tue, 22 Apr 2014 00:52:02 +0200
Message-ID: <1460689.BVNsEv5Rlh@avalon>
References: <1398083321-8668-1-git-send-email-yj44.cho@samsung.com> <1398083321-8668-7-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:41992 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754527AbaDUWvx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Apr 2014 18:51:53 -0400
In-Reply-To: <1398083321-8668-7-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: YoungJun Cho <yj44.cho@samsung.com>, airlied@linux.ie, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sachin.kamat@linaro.org, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com

Hi YoungJun,

Thank you for the patch.

On Monday 21 April 2014 21:28:33 YoungJun Cho wrote:
> This patch adds I80 interface for FIMD to support command mode panel.
> 
> For this, the below features are added:
> - Sets display interface mode relevant registers properly according to the
>   interface type from DT
> - Adds drm_panel_cpu_timings structure
>  . The command mode panel sets them as the private attributes in struct
>    drm_display_mode and FIMD gets them by fimd_mode_set().
> - Adds TE interrupt handler
>   . FIMD driver should know TE signal from lcd panel to avoid tearing issue.
> - Adds trigger feature
>   . In case of command mode panel, FIMD should set trigger bit,
>     so that image data has to be transferred to display bus or lcd panel.
> 
> Changelog v2:
> - Moves CPU timings relevant properties to panel DT
>   (commented by Laurent Pinchart, Andrzej Hajda)
> 
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/Kconfig           |    1 +
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c |   11 ++
>  drivers/gpu/drm/exynos/exynos_drm_crtc.h |    2 +
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |    2 +
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c  |   13 ++
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |  280 ++++++++++++++++++++++-----
>  include/drm/drm_mipi_dsi.h               |    2 +
>  include/drm/drm_panel.h                  |    7 +

Could you please split the DRM core changes into two separate standalone 
patches (as they're unrelated to each other) ?

>  include/video/samsung_fimd.h             |    3 +-
>  9 files changed, 277 insertions(+), 44 deletions(-)

[snip]

-- 
Regards,

Laurent Pinchart
