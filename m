From: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 12/30] video/exynos: remove unnecessary header inclusions
Date: Thu, 11 Apr 2013 14:07:02 +0900
Message-ID: <003201ce3672$66f72e50$34e58af0$%han@samsung.com>
References: <1365638712-1028578-1-git-send-email-arnd@arndb.de>
 <1365638712-1028578-13-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9150 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751225Ab3DKFHE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Apr 2013 01:07:04 -0400
In-reply-to: <1365638712-1028578-13-git-send-email-arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
Cc: 'Tomi Valkeinen' <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, 'Inki Dae' <inki.dae@samsung.com>, 'Donghwa Lee' <dh09.lee@samsung.com>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Thursday, April 11, 2013 9:05 AM, Arnd Bergmann wrote:
> 
> In multiplatform configurations, we cannot include headers
> provided by only the exynos platform. Fortunately a number
> of drivers that include those headers do not actually need
> them, so we can just remove the inclusions.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: Jingoo Han <jg1.han@samsung.com>

CC'ed Tomi Valkeinen, Inki Dae, Donghwa Lee, Kyungmin Park


Acked-by: Jingoo Han <jg1.han@samsung.com>

Best regards,
Jingoo Han

> ---
>  drivers/video/exynos/exynos_mipi_dsi.c          | 2 --
>  drivers/video/exynos/exynos_mipi_dsi_common.c   | 2 --
>  drivers/video/exynos/exynos_mipi_dsi_lowlevel.c | 2 --
>  3 files changed, 6 deletions(-)
> 
> diff --git a/drivers/video/exynos/exynos_mipi_dsi.c b/drivers/video/exynos/exynos_mipi_dsi.c
> index fac7df6..3dd43ca 100644
> --- a/drivers/video/exynos/exynos_mipi_dsi.c
> +++ b/drivers/video/exynos/exynos_mipi_dsi.c
> @@ -35,8 +35,6 @@
> 
>  #include <video/exynos_mipi_dsim.h>
> 
> -#include <plat/fb.h>
> -
>  #include "exynos_mipi_dsi_common.h"
>  #include "exynos_mipi_dsi_lowlevel.h"
> 
> diff --git a/drivers/video/exynos/exynos_mipi_dsi_common.c
> b/drivers/video/exynos/exynos_mipi_dsi_common.c
> index c70cb89..520fc9b 100644
> --- a/drivers/video/exynos/exynos_mipi_dsi_common.c
> +++ b/drivers/video/exynos/exynos_mipi_dsi_common.c
> @@ -31,8 +31,6 @@
>  #include <video/mipi_display.h>
>  #include <video/exynos_mipi_dsim.h>
> 
> -#include <mach/map.h>
> -
>  #include "exynos_mipi_dsi_regs.h"
>  #include "exynos_mipi_dsi_lowlevel.h"
>  #include "exynos_mipi_dsi_common.h"
> diff --git a/drivers/video/exynos/exynos_mipi_dsi_lowlevel.c
> b/drivers/video/exynos/exynos_mipi_dsi_lowlevel.c
> index 95cb99a..15c5abd 100644
> --- a/drivers/video/exynos/exynos_mipi_dsi_lowlevel.c
> +++ b/drivers/video/exynos/exynos_mipi_dsi_lowlevel.c
> @@ -26,8 +26,6 @@
> 
>  #include <video/exynos_mipi_dsim.h>
> 
> -#include <mach/map.h>
> -
>  #include "exynos_mipi_dsi_regs.h"
> 
>  void exynos_mipi_dsi_func_reset(struct mipi_dsim_device *dsim)
> --
> 1.8.1.2
