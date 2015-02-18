From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH 0/9] ARM: samsung: randconfig build fixes
Date: Wed, 18 Feb 2015 09:21:26 +0900
Message-ID: <0b2901d04b10$d571f680$8055e380$@kernel.org>
References: <1423769746-582629-1-git-send-email-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:16100 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751554AbbBRAV3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Feb 2015 19:21:29 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJX00K5SYBQ2K10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Feb 2015 09:21:26 +0900 (KST)
In-reply-to: <1423769746-582629-1-git-send-email-arnd@arndb.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Kukjin Kim' <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, arm@kernel.org

Arnd Bergmann wrote:
> 
> This is a set of mostly trivial build fixes for bugs I have encountered
> in random configurations. I'm sending them separate from the other
> platforms since we have a lot of them for the various samsung platforms
> here.
> 
> Kukjin, please pick them up into a fixes branch for 3.20 or send
> an Ack so we can apply them directly.
> 
Sure, I will create a branch for them in this week. IMO, would be better if I
could make a non-critical fixes branch for v3.20 in Samsung tree for further
other Samsung stuff for v3.20 ;)

> Let me know if anything looks wrong with some of the patches.

OK, if anything I'll let you know.

Thanks for your pointing out.
Happy new year again! (Actually it's the Lunar New Year holidays now)

- Kukjin

> Arnd Bergmann (9):
>   ARM: s3c64xx: add I2C dependencies where needed
>   ARM: s3c64xx: fix building without CONFIG_PM_SLEEP
>   ARM: s3c64xx: fix __initdata section mismatch
>   ARM: s3c24xx: use SAMSUNG_WAKEMASK for s3c2416
>   ARM: s3c24xx: fix building without PM_SLEEP
>   ARM: s3c24xx: fix header file inclusions
>   ARM: s3c24xx: avoid a Kconfig warning
>   ARM: EXYNOS: suspend requires regulator access
>   ARM: EXYNOS: make exynos 4210 cpuidle build without SMP
> 
>  arch/arm/mach-exynos/Kconfig                 |  1 +
>  arch/arm/mach-exynos/pm.c                    | 19 +++++++++++++++----
>  arch/arm/mach-s3c24xx/Kconfig                | 19 ++++++++++---------
>  arch/arm/mach-s3c24xx/Makefile               |  3 ++-
>  arch/arm/mach-s3c24xx/include/mach/pm-core.h | 24 ++++++++++++++++++++++--
>  arch/arm/mach-s3c24xx/pm-s3c2416.c           |  3 ++-
>  arch/arm/mach-s3c24xx/pm.c                   |  6 ++++--
>  arch/arm/mach-s3c24xx/s3c2410.c              |  2 +-
>  arch/arm/mach-s3c24xx/s3c2412.c              |  2 +-
>  arch/arm/mach-s3c24xx/s3c2416.c              |  2 +-
>  arch/arm/mach-s3c24xx/s3c2440.c              |  4 ++--
>  arch/arm/mach-s3c24xx/s3c2442.c              |  4 ++--
>  arch/arm/mach-s3c24xx/s3c244x.c              |  7 ++-----
>  arch/arm/mach-s3c64xx/Kconfig                |  4 +++-
>  arch/arm/mach-s3c64xx/Makefile               |  3 ++-
>  arch/arm/mach-s3c64xx/mach-smdk6410.c        |  2 +-
>  arch/arm/mach-s3c64xx/pm.c                   |  2 ++
>  arch/arm/plat-samsung/include/plat/pm.h      | 14 +++++++++++---
>  arch/arm/plat-samsung/pm-debug.c             |  1 +
>  arch/arm/plat-samsung/pm.c                   | 20 --------------------
>  20 files changed, 85 insertions(+), 57 deletions(-)
> 
> --
