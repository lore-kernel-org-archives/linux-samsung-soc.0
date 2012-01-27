From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 02/13] ARM: SAMSUNG: allow the configuration of KERNEL HZ
 in plat-samsung
Date: Fri, 27 Jan 2012 11:15:33 +0900
Message-ID: <017c01ccdc99$8d027fc0$a7077f40$%kim@samsung.com>
References: <016f01ccdc95$30279500$9076bf00$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43791 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751589Ab2A0CPf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Jan 2012 21:15:35 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYF00E5GQ9VG180@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 11:15:34 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYF006PRQ9X9F00@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 27 Jan 2012 11:15:33 +0900 (KST)
In-reply-to: <016f01ccdc95$30279500$9076bf00$%kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rmk+kernel@arm.linux.org.uk

Kukjin Kim wrote:
> 
> 
Please kindly ignore the patch number[02/13] in subject.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/Kconfig              |    4 ++--
>  arch/arm/plat-samsung/Kconfig |    7 +++++++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 24626b0..f9d7c47 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1590,8 +1590,8 @@ source kernel/Kconfig.preempt
> 
>  config HZ
>  	int
> -	default 200 if ARCH_EBSA110 || ARCH_S3C2410 || ARCH_S5P64X0 || \
> -		ARCH_S5PV210 || ARCH_EXYNOS4
> +	default 200 if ARCH_EBSA110
> +	default SAMSUNG_TIMER_HZ if PLAT_SAMSUNG
>  	default OMAP_32K_TIMER_HZ if ARCH_OMAP && OMAP_32K_TIMER
>  	default AT91_TIMER_HZ if ARCH_AT91
>  	default SHMOBILE_TIMER_HZ if ARCH_SHMOBILE
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 6a2abe6..0a23b52 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -50,6 +50,13 @@ config S3C_LOWLEVEL_UART_PORT
>  	  this configuration should be between zero and two. The port
>  	  must have been initialised by the boot-loader before use.
> 
> +config SAMSUNG_TIMER_HZ
> +	int "Kernel HZ for Samsung Platform"
> +	range 32 1024
> +	default "200"
> +	help
> +	  Allows the configuration of the timer frequency for Samsung SoCs.
> +
>  # clock options
> 
>  config SAMSUNG_CLKSRC
> --
> 1.7.1
