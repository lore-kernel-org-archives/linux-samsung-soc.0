From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH 05/23] drm/exynos: Kconfig: select DP if FIMD or DECON
 are selected
Date: Wed, 24 Jun 2015 12:00:36 +0200
Message-ID: <558A7FC4.8020805@samsung.com>
References: <1435095336-6196-1-git-send-email-gustavo@padovan.org> <1435095336-6196-6-git-send-email-gustavo@padovan.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:37229 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750882AbbFXKAn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jun 2015 06:00:43 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1Z7hU1-0006ok-Jv
	for linux-samsung-soc@vger.kernel.org; Wed, 24 Jun 2015 12:00:41 +0200
Received: from 217-67-201-162.itsa.net.pl ([217.67.201.162])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jun 2015 12:00:41 +0200
Received: from a.hajda by 217-67-201-162.itsa.net.pl with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jun 2015 12:00:41 +0200
In-Reply-To: <1435095336-6196-6-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org

Hi Gustavo,

On 06/23/2015 11:35 PM, Gustavo Padovan wrote:
> From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> 
> DP is required if either FIMD or DECON are selected so select it
> automatically.

It is not true, there are even SoCs with FIMD/DECON and without DP.

Regards
Andrzej

> 
> Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> ---
>  drivers/gpu/drm/exynos/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> index 8203283..2d86304 100644
> --- a/drivers/gpu/drm/exynos/Kconfig
> +++ b/drivers/gpu/drm/exynos/Kconfig
> @@ -20,6 +20,7 @@ config DRM_EXYNOS_FIMD
>  	bool "Exynos DRM FIMD"
>  	depends on DRM_EXYNOS && !FB_S3C
>  	select FB_MODE_HELPERS
> +	select DRM_EXYNOS_DP
>  	select MFD_SYSCON
>  	help
>  	  Choose this option if you want to use Exynos FIMD for DRM.
> @@ -28,6 +29,7 @@ config DRM_EXYNOS7_DECON
>  	bool "Exynos DRM DECON"
>  	depends on DRM_EXYNOS && !FB_S3C
>  	select FB_MODE_HELPERS
> +	select DRM_EXYNOS_DP
>  	help
>  	  Choose this option if you want to use Exynos DECON for DRM.
>  
> @@ -50,7 +52,7 @@ config DRM_EXYNOS_DSI
>  
>  config DRM_EXYNOS_DP
>  	bool "EXYNOS DRM DP driver support"
> -	depends on (DRM_EXYNOS_FIMD || DRM_EXYNOS7_DECON) && ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
> +	depends on ARCH_EXYNOS && (DRM_PTN3460=n || DRM_PTN3460=y || DRM_PTN3460=DRM_EXYNOS)
>  	default DRM_EXYNOS
>  	select DRM_PANEL
>  	help
> 
