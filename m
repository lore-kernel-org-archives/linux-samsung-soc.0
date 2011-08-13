From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Fix build break in PM debug
Date: Sat, 13 Aug 2011 10:50:48 +0900
Message-ID: <000101cc595b$6e8c3480$4ba49d80$%kim@samsung.com>
References: <1313144754-30485-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:30323 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752747Ab1HMBux (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Aug 2011 21:50:53 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LPU0087YFSM2090@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Aug 2011 10:50:52 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LPU00FFRFSSDX@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 13 Aug 2011 10:50:52 +0900 (KST)
In-reply-to: <1313144754-30485-1-git-send-email-a.kesavan@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Abhilash Kesavan wrote:
> 
> When S3C_PM_DEBUG_LED_SMDK is enabled for suspend/resume debugging,
> the following
> compilation error occurs:
> 
> arch/arm/mach-s3c64xx/pm.c: In function 's3c_pm_debug_smdkled':
> arch/arm/mach-s3c64xx/pm.c:41: error: implicit declaration of function
> 'gpio_set_value'
> arch/arm/mach-s3c64xx/pm.c:41: error: implicit declaration of function
> 'S3C64XX_GPN'
> arch/arm/mach-s3c64xx/pm.c: In function 's3c64xx_pm_init':
> arch/arm/mach-s3c64xx/pm.c:184: error: implicit declaration of function
> 'gpio_request'
> arch/arm/mach-s3c64xx/pm.c:188: error: implicit declaration of function
> 'gpio_direction_output'
> 
> Fix the error by including linux/gpio.h
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  arch/arm/mach-s3c64xx/pm.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/pm.c b/arch/arm/mach-s3c64xx/pm.c
> index 8bad643..055e285 100644
> --- a/arch/arm/mach-s3c64xx/pm.c
> +++ b/arch/arm/mach-s3c64xx/pm.c
> @@ -16,6 +16,7 @@
>  #include <linux/suspend.h>
>  #include <linux/serial_core.h>
>  #include <linux/io.h>
> +#include <linux/gpio.h>
> 
>  #include <mach/map.h>
>  #include <mach/irqs.h>
> --
> 1.6.6.1

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
