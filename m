From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: Kconfig.debug: Update Samsung UART config options
Date: Wed, 25 Jun 2014 20:41:13 +0900
Message-ID: <03dd01cf906a$5e22b620$1a682260$@samsung.com>
References: <1403605171-31805-1-git-send-email-sachin.kamat@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:40905 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756063AbaFYLlQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 07:41:16 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Q0087K34P9Y80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 20:41:14 +0900 (KST)
In-reply-to: <1403605171-31805-1-git-send-email-sachin.kamat@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@samsung.com>, linux-arm-kernel@lists.infradead.org, Russell King <rmk+kernel@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux@arm.linux.org.uk, arnd@arndb.de, spk.linux@gmail.com

Sachin Kamat wrote:
> 
+ Russell

> In a multiplatform config, the low level debug option shows several
> UART port entries. Improve the user visible string so that it becomes
> clear to the user about Samsung UART ports.
> While at it also remove some lines from the help text that are no
> longer applicable across all Samsung platforms.
> 
Looks good to me and will apply into cleanup.

Thanks,
Kukjin

> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
> ---
>  arch/arm/Kconfig.debug |   20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
> index 3548612b0bfe..b92993e59a12 100644
> --- a/arch/arm/Kconfig.debug
> +++ b/arch/arm/Kconfig.debug
> @@ -617,53 +617,41 @@ choice
>  		depends on PLAT_SAMSUNG
>  		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>  		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
> -		bool "Use S3C UART 0 for low-level debug"
> +		bool "Use Samsung S3C UART 0 for low-level debug"
>  		help
>  		  Say Y here if you want the debug print routines to direct
>  		  their output to UART 0. The port must have been initialised
>  		  by the boot-loader before use.
> 
> -		  The uncompressor code port configuration is now handled
> -		  by CONFIG_S3C_LOWLEVEL_UART_PORT.
> -
>  	config DEBUG_S3C_UART1
>  		depends on PLAT_SAMSUNG
>  		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>  		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
> -		bool "Use S3C UART 1 for low-level debug"
> +		bool "Use Samsung S3C UART 1 for low-level debug"
>  		help
>  		  Say Y here if you want the debug print routines to direct
>  		  their output to UART 1. The port must have been initialised
>  		  by the boot-loader before use.
> 
> -		  The uncompressor code port configuration is now handled
> -		  by CONFIG_S3C_LOWLEVEL_UART_PORT.
> -
>  	config DEBUG_S3C_UART2
>  		depends on PLAT_SAMSUNG
>  		select DEBUG_EXYNOS_UART if ARCH_EXYNOS
>  		select DEBUG_S3C24XX_UART if ARCH_S3C24XX
> -		bool "Use S3C UART 2 for low-level debug"
> +		bool "Use Samsung S3C UART 2 for low-level debug"
>  		help
>  		  Say Y here if you want the debug print routines to direct
>  		  their output to UART 2. The port must have been initialised
>  		  by the boot-loader before use.
> 
> -		  The uncompressor code port configuration is now handled
> -		  by CONFIG_S3C_LOWLEVEL_UART_PORT.
> -
>  	config DEBUG_S3C_UART3
>  		depends on PLAT_SAMSUNG && ARCH_EXYNOS
>  		select DEBUG_EXYNOS_UART
> -		bool "Use S3C UART 3 for low-level debug"
> +		bool "Use Samsung S3C UART 3 for low-level debug"
>  		help
>  		  Say Y here if you want the debug print routines to direct
>  		  their output to UART 3. The port must have been initialised
>  		  by the boot-loader before use.
> 
> -		  The uncompressor code port configuration is now handled
> -		  by CONFIG_S3C_LOWLEVEL_UART_PORT.
> -
>  	config DEBUG_S3C2410_UART0
>  		depends on ARCH_S3C24XX
>  		select DEBUG_S3C2410_UART
> --
> 1.7.9.5
