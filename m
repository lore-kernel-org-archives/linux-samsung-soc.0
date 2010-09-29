From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 1/3] ARM: S5PC110: Place the common SPARSEMEM at
	ARCH_S5PV210
Date: Wed, 29 Sep 2010 10:24:12 +0900
Message-ID: <010101cb5f75$09ecd740$1dc685c0$%kim@samsung.com>
References: <20100929003901.GA491@july>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:53750 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753211Ab0I2BYA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 21:24:00 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9H00E1MIJYHMC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 10:23:59 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9H004CBIJYTL@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 10:23:58 +0900 (KST)
In-reply-to: <20100929003901.GA491@july>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: rmk@arm.linux.org.uk, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> 
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> In case of s5pc110 CPU. It uses the SPARSEMEM as default memory
> configuration.
> So move to ARCH_S5PV210 config.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/Kconfig              |    1 +
>  arch/arm/mach-s5pv210/Kconfig |    4 ----
>  2 files changed, 1 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 553b7cf..e112987 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -717,6 +717,7 @@ config ARCH_S5PC100
>  config ARCH_S5PV210
>  	bool "Samsung S5PV210/S5PC110"
>  	select CPU_V7
> +	select ARCH_SPARSEMEM_ENABLE
>  	select GENERIC_GPIO
>  	select HAVE_CLK
>  	select ARM_L1_CACHE_SHIFT_6
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index d3a3895..97e4f11 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -63,7 +63,6 @@ menu "S5PC110 Machines"
>  config MACH_AQUILA
>  	bool "Aquila"
>  	select CPU_S5PV210
> -	select ARCH_SPARSEMEM_ENABLE
>  	select S3C_DEV_FB
>  	select S5P_DEV_FIMC0
>  	select S5P_DEV_FIMC1
> @@ -80,7 +79,6 @@ config MACH_AQUILA
>  config MACH_GONI
>  	bool "GONI"
>  	select CPU_S5PV210
> -	select ARCH_SPARSEMEM_ENABLE
>  	select S3C_DEV_FB
>  	select S5P_DEV_FIMC0
>  	select S5P_DEV_FIMC1
> @@ -98,7 +96,6 @@ config MACH_GONI
>  config MACH_SMDKC110
>  	bool "SMDKC110"
>  	select CPU_S5PV210
> -	select ARCH_SPARSEMEM_ENABLE
>  	select S3C_DEV_I2C1
>  	select S3C_DEV_I2C2
>  	select S3C_DEV_RTC
> @@ -118,7 +115,6 @@ menu "S5PV210 Machines"
>  config MACH_SMDKV210
>  	bool "SMDKV210"
>  	select CPU_S5PV210
> -	select ARCH_SPARSEMEM_ENABLE
>  	select S3C_DEV_HSMMC
>  	select S3C_DEV_HSMMC1
>  	select S3C_DEV_HSMMC2
> --

Looks ok to me..will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
