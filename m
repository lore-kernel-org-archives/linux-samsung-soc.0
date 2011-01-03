From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/4] ARM: Kconfig: Add audio support dependency
Date: Mon, 03 Jan 2011 11:28:38 +0900
Message-ID: <019b01cbaaed$f0418d30$d0c4a790$%kim@samsung.com>
References: <1293171965-24416-1-git-send-email-sw.youn@samsung.com>
 <1293172569-21465-1-git-send-email-sw.youn@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:59476 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753169Ab1ACC2o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 2 Jan 2011 21:28:44 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LEF003RHDJUU280@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Jan 2011 11:28:42 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LEF0057GDJUR8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 03 Jan 2011 11:28:42 +0900 (KST)
In-reply-to: <1293172569-21465-1-git-send-email-sw.youn@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Seungwhan Youn' <sw.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org
Cc: linux@arm.linux.org.uk, ben-linux@fluff.org, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, jassi.brar@samsung.com

Seungwhan Youn wrote:
> 
> This patch adds Samsung ASoC audio support dependency for Samsung SoCs.
> 
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> ---
>  arch/arm/Kconfig |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index d56d21c..ef32a61 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -647,6 +647,7 @@ config ARCH_S3C2410
>  	select HAVE_CLK
>  	select ARCH_USES_GETTIMEOFFSET
>  	select HAVE_S3C2410_I2C if I2C
> +	select ASOC_SAMSUNG if SND_SOC
>  	help
>  	  Samsung S3C2410X CPU based systems, such as the Simtec Electronics
>  	  BAST (<http://www.simtec.co.uk/products/EB110ITX/>), the IPAQ 1940
> or
> @@ -678,6 +679,7 @@ config ARCH_S3C64XX
>  	select SAMSUNG_GPIOLIB_4BIT
>  	select HAVE_S3C2410_I2C if I2C
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> +	select ASOC_SAMSUNG if SND_SOC
>  	help
>  	  Samsung S3C64XX series based systems
> 
> @@ -690,6 +692,7 @@ config ARCH_S5P64X0
>  	select ARCH_USES_GETTIMEOFFSET
>  	select HAVE_S3C2410_I2C if I2C
>  	select HAVE_S3C_RTC if RTC_CLASS
> +	select ASOC_SAMSUNG if SND_SOC
>  	help
>  	  Samsung S5P64X0 CPU based systems, such as the Samsung SMDK6440,
>  	  SMDK6450.
> @@ -701,6 +704,7 @@ config ARCH_S5P6442
>  	select HAVE_CLK
>  	select ARCH_USES_GETTIMEOFFSET
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> +	select ASOC_SAMSUNG if SND_SOC
>  	help
>  	  Samsung S5P6442 CPU based systems
> 
> @@ -714,6 +718,7 @@ config ARCH_S5PC100
>  	select HAVE_S3C2410_I2C if I2C
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> +	select ASOC_SAMSUNG if SND_SOC
>  	help
>  	  Samsung S5PC100 series based systems
> 
> @@ -729,6 +734,7 @@ config ARCH_S5PV210
>  	select HAVE_S3C2410_I2C if I2C
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> +	select ASOC_SAMSUNG if SND_SOC
>  	help
>  	  Samsung S5PV210/S5PC110 series based systems
> 
> @@ -742,6 +748,7 @@ config ARCH_S5PV310
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select HAVE_S3C2410_I2C if I2C
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> +	select ASOC_SAMSUNG if SND_SOC
>  	help
>  	  Samsung S5PV310 series based systems
> 
> --

Hi everyone,

Wow it's 2011, I hope you're happy :-)

Hmm...sorry for late.
Looks ok to me..but I know, you changed the name 'ASOC_SAMSUNG' to
'SND_SOC_SAMSUNG'.

So I'm waiting for updated patch now.

Mr. Youn, could you please update your patch against on sound-2.6 tree?
Or...Mark, what's your plan about this, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
