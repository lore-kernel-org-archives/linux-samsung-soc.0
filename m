From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 4/6] ARM: S5PC100: Move external interrupt defines
Date: Fri, 10 Sep 2010 21:00:20 +0900
Message-ID: <001001cb50df$c0ed7e30$42c87a90$%kim@samsung.com>
References: <1283764347-460-1-git-send-email-m.szyprowski@samsung.com>
 <1283764347-460-5-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38258 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753217Ab0IJMAK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Sep 2010 08:00:10 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L8J00KLU5C7VT20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 21:00:07 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L8J00K5E5C7JH@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Sep 2010 21:00:07 +0900 (KST)
In-reply-to: <1283764347-460-5-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, ben-linux@fluff.org, jy0922.shim@samsung.com

Marek Szyprowski wrote:
> 
> From: Joonyoung Shim <jy0922.shim@samsung.com>
> 
> This patch moves external interrupt defines from gpio.h to regs-gpio.h
> for consistency with s5pv210.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/mach-s5pc100/include/mach/gpio.h      |    7 -------
>  arch/arm/mach-s5pc100/include/mach/regs-gpio.h |    7 +++++++
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pc100/include/mach/gpio.h b/arch/arm/mach-
> s5pc100/include/mach/gpio.h
> index 71ae1f5..29a8a12 100644
> --- a/arch/arm/mach-s5pc100/include/mach/gpio.h
> +++ b/arch/arm/mach-s5pc100/include/mach/gpio.h
> @@ -146,13 +146,6 @@ enum s5p_gpio_number {
>  /* define the number of gpios we need to the one after the MP04() range
*/
>  #define ARCH_NR_GPIOS		(S5PC100_GPIO_END + 1)
> 
> -#define EINT_MODE		S3C_GPIO_SFN(0x2)
> -
> -#define EINT_GPIO_0(x)		S5PC100_GPH0(x)
> -#define EINT_GPIO_1(x)		S5PC100_GPH1(x)
> -#define EINT_GPIO_2(x)		S5PC100_GPH2(x)
> -#define EINT_GPIO_3(x)		S5PC100_GPH3(x)
> -
>  #include <asm-generic/gpio.h>
> 
>  #endif /* __ASM_ARCH_GPIO_H */
> diff --git a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
b/arch/arm/mach-
> s5pc100/include/mach/regs-gpio.h
> index dd6295e..6abe481 100644
> --- a/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
> +++ b/arch/arm/mach-s5pc100/include/mach/regs-gpio.h
> @@ -71,5 +71,12 @@
>  #define S5P_EXTINT_RISEEDGE		(0x03)
>  #define S5P_EXTINT_BOTHEDGE		(0x04)
> 
> +#define EINT_MODE		S3C_GPIO_SFN(0x2)
> +
> +#define EINT_GPIO_0(x)		S5PC100_GPH0(x)
> +#define EINT_GPIO_1(x)		S5PC100_GPH1(x)
> +#define EINT_GPIO_2(x)		S5PC100_GPH2(x)
> +#define EINT_GPIO_3(x)		S5PC100_GPH3(x)
> +
>  #endif /* __ASM_MACH_S5PC100_REGS_GPIO_H */
> 
> --

This is ok to me, will apply.

And will check other regarding gpio interrupt in this weekend ;-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
