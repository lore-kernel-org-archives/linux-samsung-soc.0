From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V3] ARM: EXYNOS5: Add I2S SFR base addresse
Date: Sat, 24 Nov 2012 11:10:03 +0900
Message-ID: <122601cdc9e8$d0e9eec0$72bdcc40$%kim@samsung.com>
References: <1352176605-16153-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55907 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756809Ab2KXCKG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Nov 2012 21:10:06 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDY00DIQZCJ1ZD0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 11:10:04 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDY00AM8ZCR4F40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Nov 2012 11:10:03 +0900 (KST)
In-reply-to: <1352176605-16153-1-git-send-email-padma.v@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: sbkim73@samsung.com, ben-linux@fluff.org, olofj@google.com

Padmavathi Venna wrote:
> 
> This patch adds I2S controller0,1,2 base addresses
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
> 
> Changes since V2:
> 	- Rebased on 3.7-rc3
> 
> Changes since V1:
> 	- Rebased on 3.6-rc6
> 	- Reverted Exynos4 I2S1,2 address changes that are added in V1
> 	  as Exynos4 based boards have different I2S base addresses.
> 
>  arch/arm/mach-exynos/include/mach/map.h |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-
> exynos/include/mach/map.h
> index ef4958b..4192d23 100644
> --- a/arch/arm/mach-exynos/include/mach/map.h
> +++ b/arch/arm/mach-exynos/include/mach/map.h
> @@ -42,6 +42,9 @@
>  #define EXYNOS4_PA_I2S0			0x03830000
>  #define EXYNOS4_PA_I2S1			0xE3100000
>  #define EXYNOS4_PA_I2S2			0xE2A00000
> +#define EXYNOS5_PA_I2S0			0x03830000
> +#define EXYNOS5_PA_I2S1			0x12D60000
> +#define EXYNOS5_PA_I2S2			0x12D70000
> 
>  #define EXYNOS4_PA_PCM0			0x03840000
>  #define EXYNOS4_PA_PCM1			0x13980000
> --
> 1.7.4.4

I have 2 comments on this.

1. If above definitions are required, this patch can be squashed into the
patch which they are used ([PATCH V3 2/2] ARM: EXYNOS: Enable platform
support for I2S controllers) or this should be tied up one series with the
patch.

2. I think, we don't need this because the value can be used in auxdata
directly.

So, I don't apply this.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
