From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 4/5] Samsung DT updates for 3.16
Date: Thu, 22 May 2014 20:36:07 +0900
Message-ID: <031701cf75b2$05572760$10057620$@samsung.com>
References: <014701cf73c8$752a65c0$5f7f3140$@samsung.com>
 <20140522054547.GA4021@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:35871 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752584AbaEVLgJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 07:36:09 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5Z008XK4876370@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 22 May 2014 20:36:07 +0900 (KST)
In-reply-to: <20140522054547.GA4021@quad.lixom.net>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Tue, May 20, 2014 at 10:11:41AM +0900, Kukjin Kim wrote:
> 
> > Sachin Kamat (4):
> >       ARM: EXYNOS: Map SYSRAM through generic DT bindings
> 
> This patch has a conflict with your own fixes. You should have based this
> branch on top of the fixes to avoid it.
> 
Oops, I forgot the previous my fixes. Sorry about that...

> Not only that, but it seems to break 4212, which the other fix was meant
> to
> take care of.
> 
> I think I've fixed it in my merge, please double check. You really have to
> be more careful than this in the future.
> 
OK, I checked and it should be fine. BTW, another cleanup branch in my tree
has dependency with following and s3c24xx-clk already queued in arm-soc so I
need to sort out the branch before sending pull-request...

Anyway thanks for your pulling.

- Kukjin

> My resolution is:
> 
> index aa01c4222b40,483dfcd69065..000000000000
> --- a/arch/arm/mach-exynos/firmware.c
> +++ b/arch/arm/mach-exynos/firmware.c
> @@@ -18,8 -18,7 +18,9 @@@
> 
>   #include <mach/map.h>
> 
>  +#include <plat/cpu.h>
>  +
> + #include "common.h"
>   #include "smc.h"
> 
>   static int exynos_do_idle(void)
> @@@ -44,10 -35,12 +45,15 @@@ static int exynos_cpu_boot(int cpu
> 
>   static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
>   {
> -       void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
> +       void __iomem *boot_reg;
> +
> +       if (!sysram_ns_base_addr)
> +               return -ENODEV;
> +
>  -      boot_reg = sysram_ns_base_addr + 0x1c + 4*cpu;
> ++      boot_reg = sysram_ns_base_addr + 0x1c;
>  +
>  +      if (!soc_is_exynos4212())
>  +              boot_reg += 4*cpu;
> 
