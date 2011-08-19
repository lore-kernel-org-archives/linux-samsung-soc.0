From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3] ARM: Samsung: fix watchdog reset issue with clk_get()
Date: Fri, 19 Aug 2011 22:06:26 +0900
Message-ID: <002a01cc5e70$ce51d7c0$6af58740$%kim@samsung.com>
References: <1313663117-29191-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:34913 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751277Ab1HSNG3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 09:06:29 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ600L4OF2O4DB0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 22:06:28 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ600MLAF2SHM@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 22:06:28 +0900 (KST)
In-reply-to: <1313663117-29191-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Angus Ainslie' <angus.ainslie@linaro.org>

Marek Szyprowski wrote:
> 
> clkdev framework uses global mutex to protect clock tree, so it is not
> possible to call clk_get() in interrupt context. This patch fixes this
> issue and makes system reset by watchdog call working again.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/clock.c                      |   11 +++++++++++
>  arch/arm/plat-samsung/include/plat/clock.h         |    3 +++
>  .../arm/plat-samsung/include/plat/watchdog-reset.h |   10 +++-------
>  3 files changed, 17 insertions(+), 7 deletions(-)
> 
> 
> history:
> v3:
> - moved initialization to arch_initcall, cleaned the code
> 
> v2:
> - added missing '__init' section modifiers
> 
> diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
> index 302c426..3b44519 100644
> --- a/arch/arm/plat-samsung/clock.c
> +++ b/arch/arm/plat-samsung/clock.c
> @@ -64,6 +64,17 @@ static LIST_HEAD(clocks);
>   */
>  DEFINE_SPINLOCK(clocks_lock);
> 
> +/* Global watchdog clock used by arch_wtd_reset() callback */
> +struct clk *s3c2410_wdtclk;
> +static int __init s3c_wdt_reset_init(void)
> +{
> +	s3c2410_wdtclk = clk_get(NULL, "watchdog");
> +	if (IS_ERR(s3c2410_wdtclk))
> +		printk(KERN_WARNING "%s: warning: cannot get watchdog
> clock\n", __func__);
> +	return 0;
> +}
> +arch_initcall(s3c_wdt_reset_init);
> +
>  /* enable and disable calls for use with the clk struct */
> 
>  static int clk_null_enable(struct clk *clk, int enable)
> diff --git a/arch/arm/plat-samsung/include/plat/clock.h b/arch/arm/plat-
> samsung/include/plat/clock.h
> index 87d5b38..8f95700 100644
> --- a/arch/arm/plat-samsung/include/plat/clock.h
> +++ b/arch/arm/plat-samsung/include/plat/clock.h
> @@ -121,3 +121,6 @@ extern int s3c64xx_sclk_ctrl(struct clk *clk, int
enable);
> 
>  extern void s3c_pwmclk_init(void);
> 
> +/* Global watchdog clock used by arch_wtd_reset() callback */
> +
> +extern struct clk *s3c2410_wdtclk;
> diff --git a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
b/arch/arm/plat-
> samsung/include/plat/watchdog-reset.h
> index 54b762a..40dbb2b 100644
> --- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
> +++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
> @@ -10,6 +10,7 @@
>   * published by the Free Software Foundation.
>  */
> 
> +#include <plat/clock.h>
>  #include <plat/regs-watchdog.h>
>  #include <mach/map.h>
> 
> @@ -19,17 +20,12 @@
> 
>  static inline void arch_wdt_reset(void)
>  {
> -	struct clk *wdtclk;
> -
>  	printk("arch_reset: attempting watchdog reset\n");
> 
>  	__raw_writel(0, S3C2410_WTCON);	  /* disable watchdog, to be safe
*/
> 
> -	wdtclk = clk_get(NULL, "watchdog");
> -	if (!IS_ERR(wdtclk)) {
> -		clk_enable(wdtclk);
> -	} else
> -		printk(KERN_WARNING "%s: warning: cannot get watchdog
> clock\n", __func__);
> +	if (s3c2410_wdtclk)
> +		clk_enable(s3c2410_wdtclk);
> 
>  	/* put initial values into count and data */
>  	__raw_writel(0x80, S3C2410_WTCNT);
> --
> 1.7.1.569.g6f426

Looks good but happens following:

Hmm...
With s3c2410_defconfig:

In file included from arch/arm/plat-s3c24xx/cpu.c:48:
arch/arm/plat-samsung/include/plat/clock.h:32: error: redefinition of
'struct clk_ops'
arch/arm/plat-samsung/include/plat/clock.h:39: error: redefinition of
'struct clk'
arch/arm/plat-samsung/include/plat/clock.h:60: error: conflicting types for
's3c24xx_dclk0'
arch/arm/plat-samsung/include/plat/clock.h:60: note: previous declaration of
's3c24xx_dclk0' was here
arch/arm/plat-samsung/include/plat/clock.h:61: error: conflicting types for
's3c24xx_dclk1'
arch/arm/plat-samsung/include/plat/clock.h:61: note: previous declaration of
's3c24xx_dclk1' was here
arch/arm/plat-samsung/include/plat/clock.h:62: error: conflicting types for
's3c24xx_clkout0'
arch/arm/plat-samsung/include/plat/clock.h:62: note: previous declaration of
's3c24xx_clkout0' was here

(snip)

arch/arm/plat-samsung/include/plat/clock.h:101: error: conflicting types for
's3c_disable_clocks'
arch/arm/plat-samsung/include/plat/clock.h:101: note: previous declaration
of 's3c_disable_clocks' was here
arch/arm/plat-samsung/include/plat/clock.h:118: error: conflicting types for
's3c64xx_sclk_ctrl'
arch/arm/plat-samsung/include/plat/clock.h:118: note: previous declaration
of 's3c64xx_sclk_ctrl' was here
arch/arm/plat-samsung/include/plat/clock.h:126: error: conflicting types for
's3c2410_wdtclk'
arch/arm/plat-samsung/include/plat/clock.h:126: note: previous declaration
of 's3c2410_wdtclk' was here
make[1]: *** [arch/arm/plat-s3c24xx/cpu.o] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [arch/arm/plat-s3c24xx] Error 2
make: *** Waiting for unfinished jobs....

And, with s5p64x0_defconfig:

  CHK     include/linux/version.h
  CHK     include/generated/utsrelease.h
make[1]: `include/generated/mach-types.h' is up to date.
  CALL    scripts/checksyscalls.sh
  CHK     include/generated/compile.h
  KSYM    .tmp_kallsyms1.S
  AS      .tmp_kallsyms1.o
  LD      .tmp_vmlinux2
  KSYM    .tmp_kallsyms2.S
  AS      .tmp_kallsyms2.o
  LD      vmlinux
  SYSMAP  System.map
  SYSMAP  .tmp_System.map
Inconsistent kallsyms data
This is a bug - please report about it
Try make KALLSYMS_EXTRA_PASS=1 as a workaround
make: *** [vmlinux] Error 1


The building error of s3c2410_defconfig can be fixed with below.
---
commit c5f80e2eb419437a7e4272d28bc7258b650b0934
Author: Kukjin Kim <kgene.kim@samsung.com>
Date:   Fri Aug 19 21:12:19 2011 +0900

    ARM: SAMSUNG: fix to prevent declaring duplicated

    The plat/clock.h revised to prevent declaring duplicated.

    Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

diff --git a/arch/arm/plat-samsung/include/plat/clock.h
b/arch/arm/plat-samsung/include/plat/clock.h
index 8f95700..092be14 100644
--- a/arch/arm/plat-samsung/include/plat/clock.h
+++ b/arch/arm/plat-samsung/include/plat/clock.h
@@ -9,6 +9,9 @@
  * published by the Free Software Foundation.
 */

+#ifndef __ASM_PLAT_CLOCK_H
+#define __ASM_PLAT_CLOCK_H __FILE__
+
 #include <linux/spinlock.h>
 #include <linux/clkdev.h>

@@ -124,3 +127,5 @@ extern void s3c_pwmclk_init(void);
 /* Global watchdog clock used by arch_wtd_reset() callback */

 extern struct clk *s3c2410_wdtclk;
+
+#endif /* __ASM_PLAT_CLOCK_H */
---

But, the error of s5p64x0_defconfig happens still :(

I know, the 'watchdog reset issue' should be fixed however, we need to sort
this out again.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
