From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH] drm/exynos: Add missing includes
Date: Tue, 13 Aug 2013 11:27:04 +0900
Message-ID: <005601ce97cc$995f3840$cc1da8c0$%dae@samsung.com>
References: <1376351200-23009-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28121 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756774Ab3HMC1H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 22:27:07 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MRG00JSZ6SYEN00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Aug 2013 11:27:04 +0900 (KST)
In-reply-to: <1376351200-23009-1-git-send-email-broonie@kernel.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@kernel.org>, 'David Airlie' <airlied@linux.ie>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, 'Mark Brown' <broonie@linaro.org>



> -----Original Message-----
> From: linux-samsung-soc-owner@vger.kernel.org [mailto:linux-samsung-soc-
> owner@vger.kernel.org] On Behalf Of Mark Brown
> Sent: Tuesday, August 13, 2013 8:47 AM
> To: David Airlie
> Cc: linux-samsung-soc@vger.kernel.org; dri-devel@lists.freedesktop.org;
> Mark Brown
> Subject: [PATCH] drm/exynos: Add missing includes
> 
> From: Mark Brown <broonie@linaro.org>
> 
> Ensure that all externally accessed functions are correctly prototyped
> when defined in each file by making sure the headers with the protoypes
> are included in the file with the definition.
> 

I definitely missed it. sorry about that. Actually I was going to try to
incur something such as compile warning. You mean that the warning could be
incurred by compiler in case that a external module includes a header of
Exynos drm but the prototype of the header file differs from the one of .c
file?

I will apply it to -next but I'd like to understand why this patch is needed
surely. And it seems like that other drivers have same issue also. :)

Thanks,
Inki Dae

> Signed-off-by: Mark Brown <broonie@linaro.org>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_connector.c | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_crtc.c      | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_dmabuf.c    | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_fbdev.c     | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_plane.c     | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 1 +
>  drivers/gpu/drm/exynos/exynos_drm_vidi.c      | 1 +
>  10 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_connector.c
> b/drivers/gpu/drm/exynos/exynos_drm_connector.c
> index 02a8bc5..3f80673 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_connector.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_connector.c
> @@ -17,6 +17,7 @@
>  #include <drm/exynos_drm.h>
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_encoder.h"
> +#include "exynos_drm_connector.h"
> 
>  #define to_exynos_connector(x)	container_of(x, struct
> exynos_drm_connector,\
>  				drm_connector)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> index 9a35d17..6b836c1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
> @@ -15,6 +15,7 @@
>  #include <drm/drmP.h>
>  #include <drm/drm_crtc_helper.h>
> 
> +#include "exynos_drm_crtc.h"
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_encoder.h"
>  #include "exynos_drm_plane.h"
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> index a0f997e..2b25ac8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dmabuf.c
> @@ -11,6 +11,7 @@
> 
>  #include <drm/drmP.h>
>  #include <drm/exynos_drm.h>
> +#include "exynos_drm_dmabuf.h"
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_gem.h"
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> index 8e60bd6..3199f5b 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
> @@ -19,6 +19,7 @@
> 
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_fb.h"
> +#include "exynos_drm_fbdev.h"
>  #include "exynos_drm_gem.h"
>  #include "exynos_drm_iommu.h"
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> index 6e047bd..a8ab4a4 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
> @@ -21,6 +21,7 @@
>  #include <drm/drmP.h>
>  #include <drm/exynos_drm.h>
>  #include "regs-fimc.h"
> +#include "exynos_drm_drv.h"
>  #include "exynos_drm_ipp.h"
>  #include "exynos_drm_fimc.h"
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> index eddea49..1262434 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
> @@ -23,6 +23,7 @@
>  #include <drm/drmP.h>
>  #include <drm/exynos_drm.h>
>  #include "exynos_drm_drv.h"
> +#include "exynos_drm_g2d.h"
>  #include "exynos_drm_gem.h"
>  #include "exynos_drm_iommu.h"
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> index 90b8a1a..e69d1d2 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -20,6 +20,7 @@
>  #include <drm/drmP.h>
>  #include <drm/exynos_drm.h>
>  #include "regs-gsc.h"
> +#include "exynos_drm_drv.h"
>  #include "exynos_drm_ipp.h"
>  #include "exynos_drm_gsc.h"
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> index 6ee55e6..98eb1f7 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
> @@ -16,6 +16,7 @@
>  #include "exynos_drm_encoder.h"
>  #include "exynos_drm_fb.h"
>  #include "exynos_drm_gem.h"
> +#include "exynos_drm_plane.h"
> 
>  #define to_exynos_plane(x)	container_of(x, struct exynos_plane,
> base)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> index 49669aa..54b7360 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
> @@ -21,6 +21,7 @@
>  #include <drm/exynos_drm.h>
>  #include "regs-rotator.h"
>  #include "exynos_drm.h"
> +#include "exynos_drm_drv.h"
>  #include "exynos_drm_ipp.h"
> 
>  /*
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> index c57c565..4400330 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
> @@ -23,6 +23,7 @@
>  #include "exynos_drm_drv.h"
>  #include "exynos_drm_crtc.h"
>  #include "exynos_drm_encoder.h"
> +#include "exynos_drm_vidi.h"
> 
>  /* vidi has totally three virtual windows. */
>  #define WINDOWS_NR		3
> --
> 1.8.4.rc1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-
> soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
