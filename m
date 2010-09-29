From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 2/3] ARM: S5PC210: Place the common SPARSEMEM at
	ARCH_S5PV310
Date: Wed, 29 Sep 2010 10:24:57 +0900
Message-ID: <010201cb5f75$24c42dc0$6e4c8940$%kim@samsung.com>
References: <20100929003907.GA495@july>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34306 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753211Ab0I2BYp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Sep 2010 21:24:45 -0400
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9H00D2MIL7SVC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 10:24:43 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9H009I9IL861@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Sep 2010 10:24:44 +0900 (KST)
In-reply-to: <20100929003907.GA495@july>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, linux-arm-kernel@lists.infradead.org
Cc: rmk@arm.linux.org.uk, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Kyungmin Park wrote:
> 
> From: Kyungmin Park <kyungmin.park@samsung.com>
> 
> In case of s5pc210 CPU. It uses the SPARSEMEM as default memory
> configuration
> So move to ARCH_S5PV310 config.
> 
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/Kconfig              |    1 +
>  arch/arm/mach-s5pv310/Kconfig |    2 --
>  2 files changed, 1 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index e112987..d10099d 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -731,6 +731,7 @@ config ARCH_S5PV210
>  config ARCH_S5PV310
>  	bool "Samsung S5PV310/S5PC210"
>  	select CPU_V7
> +	select ARCH_SPARSEMEM_ENABLE
>  	select GENERIC_GPIO
>  	select HAVE_CLK
>  	select GENERIC_CLOCKEVENTS
> diff --git a/arch/arm/mach-s5pv310/Kconfig b/arch/arm/mach-s5pv310/Kconfig
> index 331b5bd..ec8b350 100644
> --- a/arch/arm/mach-s5pv310/Kconfig
> +++ b/arch/arm/mach-s5pv310/Kconfig
> @@ -30,14 +30,12 @@ config S5PV310_SETUP_I2C2
>  config MACH_SMDKV310
>  	bool "SMDKV310"
>  	select CPU_S5PV310
> -	select ARCH_SPARSEMEM_ENABLE
>  	help
>  	  Machine support for Samsung SMDKV310
> 
>  config MACH_UNIVERSAL_C210
>  	bool "Mobile UNIVERSAL_C210 Board"
>  	select CPU_S5PV310
> -	select ARCH_SPARSEMEM_ENABLE
>  	help
>  	  Machine support for Samsung Mobile Universal S5PC210 Reference
>  	  Board. S5PC210(MCP) is one of package option of S5PV310
> --

Ok..will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
