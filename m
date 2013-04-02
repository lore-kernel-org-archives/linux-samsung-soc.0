From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 10/23] [media] exynos: remove unnecessary header inclusions
Date: Tue, 02 Apr 2013 15:08:07 +0200
Message-ID: <515AD837.1060106@samsung.com>
References: <1362505353-8873-1-git-send-email-arnd@arndb.de>
 <1362505353-8873-11-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:17491 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760072Ab3DBNIL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Apr 2013 09:08:11 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MKM00C99PK6R880@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 02 Apr 2013 14:08:08 +0100 (BST)
In-reply-to: <1362505353-8873-11-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Deepak Saxena <dsaxena@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>

On 03/05/2013 06:42 PM, Arnd Bergmann wrote:
> In multiplatform configurations, we cannot include headers
> provided by only the exynos platform. Fortunately a number
> of drivers that include those headers do not actually need
> them, so we can just remove the inclusions.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/exynos-gsc/gsc-regs.c | 1 -
>  drivers/media/platform/s5p-tv/sii9234_drv.c  | 3 ---

Cc: linux-media@vger.kernel.org

Thanks Arnd. I have applied this patch to my tree for 3.10.

>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/media/platform/exynos-gsc/gsc-regs.c b/drivers/media/platform/exynos-gsc/gsc-regs.c
> index 6f5b5a4..e22d147 100644
> --- a/drivers/media/platform/exynos-gsc/gsc-regs.c
> +++ b/drivers/media/platform/exynos-gsc/gsc-regs.c
> @@ -12,7 +12,6 @@
>  
>  #include <linux/io.h>
>  #include <linux/delay.h>
> -#include <mach/map.h>
>  
>  #include "gsc-core.h"
>  
> diff --git a/drivers/media/platform/s5p-tv/sii9234_drv.c b/drivers/media/platform/s5p-tv/sii9234_drv.c
> index d90d228..39b77d2 100644
> --- a/drivers/media/platform/s5p-tv/sii9234_drv.c
> +++ b/drivers/media/platform/s5p-tv/sii9234_drv.c
> @@ -23,9 +23,6 @@
>  #include <linux/regulator/machine.h>
>  #include <linux/slab.h>
>  
> -#include <mach/gpio.h>
> -#include <plat/gpio-cfg.h>
> -
>  #include <media/sii9234.h>
>  #include <media/v4l2-subdev.h>

--

Regards,
Sylwester
