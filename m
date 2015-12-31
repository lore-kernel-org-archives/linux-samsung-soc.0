From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: s3c64xx: fix pm-debug compilation
Date: Thu, 31 Dec 2015 17:27:34 +0100
Message-ID: <2791852.KVKFoWj0aZ@wuerfel>
References: <5515725.ojLSny3TOX@wuerfel> <56809642.2060100@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:55060 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751021AbbLaQ2R (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Dec 2015 11:28:17 -0500
In-Reply-To: <56809642.2060100@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Monday 28 December 2015 10:54:10 Krzysztof Kozlowski wrote:
> On 18.12.2015 23:46, Arnd Bergmann wrote:
> > I got one randconfig build that failed to compile plat-samsung/pm-debug.c
> > on s3c64xx:
> > 
> > In file included from arch/arm/plat-samsung/pm-debug.c:27:0:
> > arch/arm/mach-s3c64xx/include/mach/pm-core.h: In function 's3c_pm_debug_init_uart':
> > arch/arm/mach-s3c64xx/include/mach/pm-core.h:25:25: error: 'S3C_VA_SYS' undeclared (first use in this function)
> >   u32 tmp = __raw_readl(S3C_PCLK_GATE);
> > arch/arm/mach-s3c64xx/include/mach/pm-core.h:25:25: note: each undeclared identifier is reported only once for each function it appears in
> > arch/arm/mach-s3c64xx/include/mach/pm-core.h:39:2: error: implicit declaration of function 'udelay' [-Werror=implicit-function-declaration]
> >   udelay(10);
> > 
> > I have not investigated why this does not show up much more often, I
> > guess the headers are usually included from elsewhere, but adding
> > explicit #include statements is an obvious fix.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> > I suspect this has been broken for a long time, so no rush, but please
> > apply this to a cleanup branch.
> > 
> 
> The dependencies for plat-samsung/SAMSUNG_PM_* symbols are little bit
> mixed up:
> 1. pm-common.o depends on PM_SLEEP,
> 2. pm.o and pm-debug.o depend on PM and sometimes they use stuff from
> pm-common.
> 
> It is possible to create a config with PM_SLEEP=n and PM=y so this is
> confusing (pm-common won't be linked).

Ok, thanks for taking a deeper look into this.

> I think this still compiles fine because of various #ifdefs but it would
> be nice to clean it up.
>
> Anyway your patch looks correct:
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I've applied both patches on top of next/multiplatform now, to avoid
conflicts with other changes in that branch.

	Arnd
