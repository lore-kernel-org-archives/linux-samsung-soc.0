From: Kamil Debski <k.debski@samsung.com>
Subject: RE: [PATCH v2 3/8] ARM: S5PV310: Add memory map support for MFC v5.1
Date: Mon, 14 Mar 2011 09:28:28 +0100
Message-ID: <002801cbe221$cd328770$67979650$%debski@samsung.com>
References: <1299676567-14194-1-git-send-email-jtp.park@samsung.com>
 <1299676567-14194-4-git-send-email-jtp.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:42318 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752284Ab1CNI7V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Mar 2011 04:59:21 -0400
In-reply-to: <1299676567-14194-4-git-send-email-jtp.park@samsung.com>
Content-language: en-gb
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jeongtae Park' <jtp.park@samsung.com>, linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: jaeryul.oh@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org, jonghun.han@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>

Hi,

It looks ok for me. Thanks for fixing the patch.

> From: Jeongtae Park [mailto:jtp.park@samsung.com]
> Subject: [PATCH v2 3/8] ARM: S5PV310: Add memory map support for MFC
> v5.1
> 
> This patch adds memroy map support for MFC v5.1.
> 
> Reviewed-by: Peter Oh <jaeryul.oh@samsung.com>
> Signed-off-by: Jeongtae Park <jtp.park@samsung.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Kamil Debski <k.debski@samsung.com>

Acked-by: Kamil Debski <k.debski@samsung.com>

Best regards,
--
Kamil Debski
Linux Platform Group
Samsung Poland R&D Center

> ---
>  arch/arm/mach-s5pv310/include/mach/map.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv310/include/mach/map.h b/arch/arm/mach-
> s5pv310/include/mach/map.h
> index 74d4006..fa7866a 100644
> --- a/arch/arm/mach-s5pv310/include/mach/map.h
> +++ b/arch/arm/mach-s5pv310/include/mach/map.h
> @@ -73,6 +73,8 @@
>  #define S5PV310_PA_SROMC		(0x12570000)
>  #define S5P_PA_SROMC			S5PV310_PA_SROMC
> 
> +#define S5PV310_PA_MFC			0x13400000
> +
>  /* S/PDIF */
>  #define S5PV310_PA_SPDIF	0xE1100000
> 
> @@ -145,5 +147,6 @@
>  #define S3C_PA_WDT			S5PV310_PA_WATCHDOG
>  #define S5P_PA_MIPI_CSIS0		S5PV310_PA_MIPI_CSIS0
>  #define S5P_PA_MIPI_CSIS1		S5PV310_PA_MIPI_CSIS1
> +#define S5P_PA_MFC			S5PV310_PA_MFC
> 
>  #endif /* __ASM_ARCH_MAP_H */
> --
> 1.7.1
