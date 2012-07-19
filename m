From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: S3C64XX: Add header file protection macros in
 pm-core.h
Date: Thu, 19 Jul 2012 15:39:08 +0900
Message-ID: <184001cd6579$335cf270$9a16d750$%kim@samsung.com>
References: <1342516420-30188-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33984 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751450Ab2GSGjL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jul 2012 02:39:11 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7E00BWAAGYGQP0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:39:09 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M7E000ALAH92DI0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jul 2012 15:39:09 +0900 (KST)
In-reply-to: <1342516420-30188-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Adds header file protection macros.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-s3c64xx/include/mach/pm-core.h |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c64xx/include/mach/pm-core.h b/arch/arm/mach-
> s3c64xx/include/mach/pm-core.h
> index fcf3dca..c9be9dd 100644
> --- a/arch/arm/mach-s3c64xx/include/mach/pm-core.h
> +++ b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
> @@ -12,6 +12,9 @@
>   * published by the Free Software Foundation.
>   */
> 
> +#ifndef __S3C64XX_PM_CORE_H
> +#define __S3C64XX_PM_CORE_H __FILE__
> +
>  #include <mach/regs-gpio.h>
> 
>  static inline void s3c_pm_debug_init_uart(void)
> @@ -113,3 +116,4 @@ static inline void samsung_pm_saved_gpios(void)
> 
>  	__raw_writel(S3C64XX_SLPEN_USE_xSLP, S3C64XX_SLPEN);
>  }
> +#endif /* __S3C64XX_PM_CORE_H */
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
