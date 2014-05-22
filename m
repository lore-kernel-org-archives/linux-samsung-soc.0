From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 4/5] Samsung DT updates for 3.16
Date: Wed, 21 May 2014 22:45:47 -0700
Message-ID: <20140522054547.GA4021@quad.lixom.net>
References: <014701cf73c8$752a65c0$5f7f3140$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:57401 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750924AbaEVFpi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 May 2014 01:45:38 -0400
Received: by mail-pa0-f46.google.com with SMTP id kq14so2136014pab.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 22:45:38 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <014701cf73c8$752a65c0$5f7f3140$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, May 20, 2014 at 10:11:41AM +0900, Kukjin Kim wrote:

> Sachin Kamat (4):
>       ARM: EXYNOS: Map SYSRAM through generic DT bindings

This patch has a conflict with your own fixes. You should have based this
branch on top of the fixes to avoid it.

Not only that, but it seems to break 4212, which the other fix was meant to
take care of.

I think I've fixed it in my merge, please double check. You really have to
be more careful than this in the future.

My resolution is:

index aa01c4222b40,483dfcd69065..000000000000
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@@ -18,8 -18,7 +18,9 @@@
  
  #include <mach/map.h>
  
 +#include <plat/cpu.h>
 +
+ #include "common.h"
  #include "smc.h"
  
  static int exynos_do_idle(void)
@@@ -44,10 -35,12 +45,15 @@@ static int exynos_cpu_boot(int cpu
  
  static int exynos_set_cpu_boot_addr(int cpu, unsigned long boot_addr)
  {
-       void __iomem *boot_reg = S5P_VA_SYSRAM_NS + 0x1c;
+       void __iomem *boot_reg;
+ 
+       if (!sysram_ns_base_addr)
+               return -ENODEV;
+ 
 -      boot_reg = sysram_ns_base_addr + 0x1c + 4*cpu;
++      boot_reg = sysram_ns_base_addr + 0x1c;
 +
 +      if (!soc_is_exynos4212())
 +              boot_reg += 4*cpu;
  


-Olof
