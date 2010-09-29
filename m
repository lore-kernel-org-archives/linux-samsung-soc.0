From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 3/3] ARM: S5PC100/S5PC110/S5PC210: Remove duplicated
	selete PLAT_S5P at each ARCH_S5P series
Date: Wed, 29 Sep 2010 21:36:59 +0900
Message-ID: <001c01cb5fd3$0506a1d0$0f13e570$%kim@samsung.com>
References: <20100929014724.GA823@july>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:34438 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755386Ab0I2Mgp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Sep 2010 08:36:45 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9I00H55DP7CA80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 21:36:43 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9I003WPDP7YN@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 21:36:43 +0900 (KST)
In-reply-to: <20100929014724.GA823@july>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: rmk@arm.linux.org.uk, ben-linux@fluff.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>

Kyungmin Park wrote:
> 
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> It's already selected whtn S5P series. So remove it.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pc100/Kconfig |    1 -
>  arch/arm/mach-s5pv210/Kconfig |    1 -
>  arch/arm/mach-s5pv310/Kconfig |    1 -
>  3 files changed, 0 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/Kconfig b/arch/arm/mach-s5pc100/Kconfig
> index 77ae4bf..b8fbf2f 100644
> --- a/arch/arm/mach-s5pc100/Kconfig
> +++ b/arch/arm/mach-s5pc100/Kconfig
> @@ -9,7 +9,6 @@ if ARCH_S5PC100
> 
>  config CPU_S5PC100
>  	bool
> -	select PLAT_S5P
>  	select S5P_EXT_INT
>  	select S3C_PL330_DMA
>  	help
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 97e4f11..6ddc232 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -11,7 +11,6 @@ if ARCH_S5PV210
> 
>  config CPU_S5PV210
>  	bool
> -	select PLAT_S5P
>  	select S3C_PL330_DMA
>  	select S5P_EXT_INT
>  	help
> diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
> index ec8b350..4839fef 100644
> --- a/arch/arm/mach-s5pv310/Kconfig
> +++ b/arch/arm/mach-s5pv310/Kconfig
> @@ -11,7 +11,6 @@ if ARCH_S5PV310
> 
>  config CPU_S5PV310
>  	bool
> -	select PLAT_S5P
>  	help
>  	  Enable S5PV310 CPU support
> 
> --

Ok..will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
