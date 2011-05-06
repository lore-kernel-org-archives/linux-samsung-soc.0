From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add to support ORIGEN board
Date: Fri, 06 May 2011 14:19:51 +0900
Message-ID: <00fd01cc0bad$3b961100$b2c23300$%kim@samsung.com>
References: <1303796228-9729-1-git-send-email-snow.jhkim@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:52265 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751400Ab1EFFT4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 May 2011 01:19:56 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LKR0015BDGZIWG0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 May 2011 14:19:54 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LKR00GO0DH6BL@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 May 2011 14:19:54 +0900 (KST)
In-reply-to: <1303796228-9729-1-git-send-email-snow.jhkim@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'JeongHyeon Kim' <snow.jhkim@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'JeongHyeon Kim' <jhkim@insignal.co.kr>

JeongHyeon Kim wrote:
> 
> From: JeongHyeon Kim <jhkim@insignal.co.kr>
> 
> This patch adds to support Insignal's ORIGEN board.
> 
> Signed-off-by: JeongHyeon Kim <jhkim@insignal.co.kr>
> ---
>  arch/arm/mach-exynos4/Kconfig       |   10 +++
>  arch/arm/mach-exynos4/Makefile      |    1 +
>  arch/arm/mach-exynos4/mach-origen.c |  108
> +++++++++++++++++++++++++++++++++++
>  3 files changed, 119 insertions(+), 0 deletions(-)
>  create mode 100644 arch/arm/mach-exynos4/mach-origen.c
> 
Hi Jeonghyeon,

Basically, adding board file cannot be merged(applied) into regarding ARM
maintainer tree now even though your patch has no problem. You can easily
find the reason when you read some threads in here.

So I'm not sure when your patch can be merged.

There is comment. But no need to re-submit, if required, I can fix it when I
apply this.

> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
> index e849f67..0a61cf3 100644
> --- a/arch/arm/mach-exynos4/Kconfig
> +++ b/arch/arm/mach-exynos4/Kconfig
> @@ -177,6 +177,16 @@ config MACH_NURI
>  	help
>  	  Machine support for Samsung Mobile NURI Board.
> 
> +config MACH_ORIGEN
> +        bool "ORIGEN"
   ^^^^^^^^
> +        select CPU_EXYNOS4210
   ^^^^^^^^
> +        select S3C_DEV_RTC
   ^^^^^^^^
> +        select S3C_DEV_WDT
   ^^^^^^^^
> +        select S3C_DEV_HSMMC2
   ^^^^^^^^
> +        select EXYNOS4_SETUP_SDHCI
   ^^^^^^^^
> +        help
   ^^^^^^^^
> +          Machine support for ORIGEN based on Samsung S5PV310
   ^^^^^^^^

Should be tab...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
