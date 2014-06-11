From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: exynos: cleanup kconfig option display
Date: Wed, 11 Jun 2014 22:04:36 +0900
Message-ID: <07fc01cf8575$b4fbc360$1ef34a20$@samsung.com>
References: <1402409170-1314-1-git-send-email-robherring2@gmail.com>
 <1402409170-1314-2-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:40801 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755290AbaFKNEn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 09:04:43 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N700047E9NTCZ00@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Jun 2014 22:04:41 +0900 (KST)
In-reply-to: <1402409170-1314-2-git-send-email-robherring2@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Rob Herring' <robherring2@gmail.com>, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'Ben Dooks' <ben-linux@fluff.org>, 'Rob Herring' <robh@kernel.org>, linux-samsung-soc@vger.kernel.org

Rob Herring wrote:
> 
> From: Rob Herring <robh@kernel.org>
> 
> The addition of Exynos to multi-platform configs creates a mess of config
> options with options appearing before the Exynos config option. This is
> due to arch/arm/plat-samsung/Kconfig being included out of order with the
> other Samsung platform kconfig files. Reorder the kconfig files and move
> all the options into a sub-menu. Some of the options are dead, so remove
> those as well.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Cc: Kukjin Kim <kgene.kim@samsung.com>

Looks nice to me :-)

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks,
Kukjin

> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  arch/arm/Kconfig              |  3 +--
>  arch/arm/plat-samsung/Kconfig | 17 +++--------------
>  2 files changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 87b63fd..cbf0c37 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1009,8 +1009,6 @@ source "arch/arm/mach-rockchip/Kconfig"
> 
>  source "arch/arm/mach-sa1100/Kconfig"
> 
> -source "arch/arm/plat-samsung/Kconfig"
> -
>  source "arch/arm/mach-socfpga/Kconfig"
> 
>  source "arch/arm/mach-spear/Kconfig"
> @@ -1028,6 +1026,7 @@ source "arch/arm/mach-s5pc100/Kconfig"
>  source "arch/arm/mach-s5pv210/Kconfig"
> 
>  source "arch/arm/mach-exynos/Kconfig"
> +source "arch/arm/plat-samsung/Kconfig"
> 
>  source "arch/arm/mach-shmobile/Kconfig"
> 
> diff --git a/arch/arm/plat-samsung/Kconfig b/arch/arm/plat-samsung/Kconfig
> index 243dfcb..ac032cd 100644
> --- a/arch/arm/plat-samsung/Kconfig
> +++ b/arch/arm/plat-samsung/Kconfig
> @@ -35,27 +35,15 @@ config SAMSUNG_PM
>  	  Base platform power management code for samsung code
> 
>  if PLAT_SAMSUNG
> +menu "Samsung Common options"
> 
>  # boot configurations
> 
>  comment "Boot options"
> 
> -config S3C_BOOT_ERROR_RESET
> -	bool "S3C Reboot on decompression error"
> -	help
> -	  Say y here to use the watchdog to reset the system if the
> -	  kernel decompressor detects an error during decompression.
> -
> -config S3C_BOOT_UART_FORCE_FIFO
> -       bool "Force UART FIFO on during boot process"
> -       default y
> -       help
> -         Say Y here to force the UART FIFOs on during the kernel
> -	 uncompressor
> -
> -
>  config S3C_LOWLEVEL_UART_PORT
>  	int "S3C UART to use for low-level messages"
> +	depends on ARCH_S3C64XX
>  	default 0
>  	help
>  	  Choice of which UART port to use for the low-level messages,
> @@ -503,4 +491,5 @@ config DEBUG_S3C_UART
>  	default "2" if DEBUG_S3C_UART2
>  	default "3" if DEBUG_S3C_UART3
> 
> +endmenu
>  endif
> --
> 1.9.1
