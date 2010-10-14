From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 1/2] ARM: S5P: Add initial map for GPIO2 and GPIO3
Date: Thu, 14 Oct 2010 14:24:10 +0900
Message-ID: <006601cb6b60$0a0e4190$1e2ac4b0$%kim@samsung.com>
References: <1286868876-3748-1-git-send-email-sbkim73@samsung.com>
 <1286868876-3748-2-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:13093 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754399Ab0JNFXx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 01:23:53 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA9005YXLNRUV20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 14:23:51 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA9006CELNRAL@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 14:23:51 +0900 (KST)
In-reply-to: <1286868876-3748-2-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Jongpill Lee' <boyko.lee@samsung.com>

Sangbeom Kim wrote:
> 
> From: Jongpill Lee <boyko.lee@samsung.com>
> 
> This patch adds initial map for GPIO2 and GPIO3.
> S5PV310/S5PC210 has separated GPIO1, GPIO2 and GPIO3.
> 
> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---
> Changes since v1:
> - Rebased on latest for-next from Kukjin Kim's git tree
> - Added S5P_VA_GPIO1 according to S5PV310_PA_GPIO1
> 
>  arch/arm/mach-s5pv310/cpu.c              |   12 +++++++++++-
>  arch/arm/plat-s5p/include/plat/map-s5p.h |    3 +++
>  2 files changed, 14 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv310/cpu.c b/arch/arm/mach-s5pv310/cpu.c
> index 3345cf6..ffed262 100644
> --- a/arch/arm/mach-s5pv310/cpu.c
> +++ b/arch/arm/mach-s5pv310/cpu.c
> @@ -57,11 +57,21 @@ static struct map_desc s5pv310_iodesc[] __initdata = {
>  		.length		= SZ_4K,
>  		.type		= MT_DEVICE,
>  	}, {
> -		.virtual	= (unsigned long)S5P_VA_GPIO,
> +		.virtual	= (unsigned long)S5P_VA_GPIO1,
>  		.pfn		= __phys_to_pfn(S5PV310_PA_GPIO1),
>  		.length		= SZ_4K,
>  		.type		= MT_DEVICE,
>  	}, {
> +		.virtual	= (unsigned long)S5P_VA_GPIO2,
> +		.pfn		= __phys_to_pfn(S5PV310_PA_GPIO2),
> +		.length		= SZ_4K,
> +		.type		= MT_DEVICE,
> +	}, {
> +		.virtual	= (unsigned long)S5P_VA_GPIO3,
> +		.pfn		= __phys_to_pfn(S5PV310_PA_GPIO3),
> +		.length		= SZ_256K,
> +		.type		= MT_DEVICE,
> +	}, {
>  		.virtual	= (unsigned long)S5P_VA_DMC0,
>  		.pfn		= __phys_to_pfn(S5PV310_PA_DMC0),
>  		.length		= SZ_4K,
> diff --git a/arch/arm/plat-s5p/include/plat/map-s5p.h b/arch/arm/plat-
> s5p/include/plat/map-s5p.h
> index ec96a19..fef353d 100644
> --- a/arch/arm/plat-s5p/include/plat/map-s5p.h
> +++ b/arch/arm/plat-s5p/include/plat/map-s5p.h
> @@ -16,6 +16,9 @@
>  #define S5P_VA_CHIPID		S3C_ADDR(0x02000000)
>  #define S5P_VA_CMU		S3C_ADDR(0x02100000)
>  #define S5P_VA_GPIO		S3C_ADDR(0x02200000)
> +#define S5P_VA_GPIO1		S5P_VA_GPIO
> +#define S5P_VA_GPIO2		S3C_ADDR(0x02240000)
> +#define S5P_VA_GPIO3		S3C_ADDR(0x02280000)
> 
>  #define S5P_VA_SYSRAM		S3C_ADDR(0x02400000)
>  #define S5P_VA_DMC0		S3C_ADDR(0x02440000)
> --

Looks ok to me...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
