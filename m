From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 2/5] ARM: S5P: Added default pll values for APLL
 800/1000MHz
Date: Fri, 16 Jul 2010 21:22:08 +0900
Message-ID: <012f01cb24e1$85628920$90279b60$%kim@samsung.com>
References: <1279267277-6804-1-git-send-email-myungjoo.ham@samsung.com>
 <1279267277-6804-2-git-send-email-myungjoo.ham@samsung.com>
 <1279267277-6804-3-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:31451 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965280Ab0GPMWF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 16 Jul 2010 08:22:05 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5N000BLH0RJH20@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Jul 2010 21:22:03 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5N00447H0RZM@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 16 Jul 2010 21:22:03 +0900 (KST)
In-reply-to: <1279267277-6804-3-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

MyungJoo Ham wrote:
> 
> CPUFREQ of S5PV210 uses different APLL settings and we provide
> such values for CPUFREQ at pll.h. We have been using differently
> between EVT0 and EVT1 machines. Although this version of kernel
> assumes that the CPU is EVT1, users may use code for EVT0 later.
> 
> Note that at 1GHz of ARMCLK, APLL should be 1GHz and for other lower
> ARMCLK, APLL should be 800MHz.
> 
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-s5p/include/plat/pll.h |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-s5p/include/plat/pll.h
b/arch/arm/plat-s5p/include/plat/pll.h
> index 7db3227..3112aba 100644
> --- a/arch/arm/plat-s5p/include/plat/pll.h
> +++ b/arch/arm/plat-s5p/include/plat/pll.h
> @@ -21,6 +21,14 @@
> 
>  #include <asm/div64.h>
> 
> +#ifdef CONFIG_CPU_S5PC110_EVT0_ERRATA

Actually, EVT0 is not real chip and not for mass production.
So don't use in here.

> +#define PLL45XX_APLL_VAL_1000	(1 << 31) | (0xfa<<16) | (0x6<<8) |
(0x1)
> +#define PLL45XX_APLL_VAL_800	(1 << 31) | (0xc8<<16) | (0x6<<8) | (0x1)
> +#else
> +#define PLL45XX_APLL_VAL_1000	(1 << 31) | (125<<16) | (3<<8) | (1)
> +#define PLL45XX_APLL_VAL_800	(1 << 31) | (100<<16) | (3<<8) | (1)
> +#endif
> +
>  enum pll45xx_type_t {
>  	pll_4500,
>  	pll_4502,
> --

And...I got the below result from scripts/checkpatch.pl.

--

ERROR: Macros with complex values should be enclosed in parenthesis
#27: FILE: arch/arm/plat-s5p/include/plat/pll.h:25:
+#define PLL45XX_APLL_VAL_1000  (1 << 31) | (0xfa<<16) | (0x6<<8) | (0x1)

ERROR: Macros with complex values should be enclosed in parenthesis
#28: FILE: arch/arm/plat-s5p/include/plat/pll.h:26:
+#define PLL45XX_APLL_VAL_800   (1 << 31) | (0xc8<<16) | (0x6<<8) | (0x1)

ERROR: Macros with complex values should be enclosed in parenthesis
#30: FILE: arch/arm/plat-s5p/include/plat/pll.h:28:
+#define PLL45XX_APLL_VAL_1000  (1 << 31) | (125<<16) | (3<<8) | (1)

ERROR: Macros with complex values should be enclosed in parenthesis
#31: FILE: arch/arm/plat-s5p/include/plat/pll.h:29:
+#define PLL45XX_APLL_VAL_800   (1 << 31) | (100<<16) | (3<<8) | (1)

total: 4 errors, 0 warnings, 14 lines checked

--

I already said to you about that :-(
See the Documentation/SubmittingPatches...

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
