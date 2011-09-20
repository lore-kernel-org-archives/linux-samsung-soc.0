From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung cleanup for v3.2
Date: Tue, 20 Sep 2011 22:22:41 +0200
Message-ID: <201109202222.41747.arnd@arndb.de>
References: <001901cc76b8$018d4fc0$04a7ef40$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:54846 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871Ab1ITUWu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Sep 2011 16:22:50 -0400
In-Reply-To: <001901cc76b8$018d4fc0$04a7ef40$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Russell King' <rmk+kernel@arm.linux.org.uk>, 'Ben Dooks' <ben-linux@fluff.org>

On Monday 19 September 2011, Kukjin Kim wrote:
> This is Samsung cleanup for v3.2.
> 
> Please pull from:
>   git://github.com/kgene/linux-samsung.git next-samsung-cleanup

Pulled into arm-soc/next/cleanup.

> If any problems, please let me know.

One tiny conflict with Nico's cross-platform series:

+ 
+ MACHINE_START(SMDKC210, "SMDKC210")
+       /* Maintainer: Kukjin Kim <kgene.kim@samsung.com> */
 -      .boot_params    = S5P_PA_SDRAM + 0x100,
++      .atag_offset    = 0x100,
+       .init_irq       = exynos4_init_irq,
+       .map_io         = smdkv310_map_io,
+       .init_machine   = smdkv310_machine_init,
+       .timer          = &exynos4_timer,
+ MACHINE_END

I'll handle this in the upstream submission.

Thanks,

	Arnd
