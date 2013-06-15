From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 20/28] ARM: EXYNOS: Remove setup-i2c0.c
Date: Sat, 15 Jun 2013 14:03:04 +0200
Message-ID: <3865087.4szuhyUgFI@flatron>
References: <1371238384-1504-1-git-send-email-t.figa@samsung.com> <1371238384-1504-21-git-send-email-t.figa@samsung.com> <171f01ce696b$43b38a20$cb1a9e60$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:63441 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753460Ab3FOMDG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Jun 2013 08:03:06 -0400
Received: by mail-bk0-f46.google.com with SMTP id na10so602613bkb.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jun 2013 05:03:04 -0700 (PDT)
In-Reply-To: <171f01ce696b$43b38a20$cb1a9e60$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Marek Szyprowski' <m.szyprowski@samsung.com>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Kyungmin Park' <kyungmin.park@samsung.com>

On Saturday 15 of June 2013 10:54:25 Kukjin Kim wrote:
> Tomasz Figa wrote:
> > Now since SAMSUNG_ATAGS is no longer selected for ARCH_EXYNOS, we can
> > safely remove the remaining setup code.
> > 
> > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> > 
> >  arch/arm/mach-exynos/Makefile     |  3 ---
> >  arch/arm/mach-exynos/setup-i2c0.c | 19 -------------------
> >  2 files changed, 22 deletions(-)
> >  delete mode 100644 arch/arm/mach-exynos/setup-i2c0.c
> > 
> > diff --git a/arch/arm/mach-exynos/Makefile
> > b/arch/arm/mach-exynos/Makefile index 5fc6cfd..66c9788 100644
> > --- a/arch/arm/mach-exynos/Makefile
> > +++ b/arch/arm/mach-exynos/Makefile
> > @@ -35,6 +35,3 @@ AFLAGS_exynos-smc.o		:=-Wa,-
march=armv7-
> > a$(plus_sec)
> > 
> >  obj-$(CONFIG_MACH_EXYNOS4_DT)		+= mach-exynos4-dt.o
> >  obj-$(CONFIG_MACH_EXYNOS5_DT)		+= mach-exynos5-dt.o
> 
> No need last empty line with removing below, But you don't need
> re-posting, because let me fix.

OK, thanks.

Best regards,
Tomasz

> 
> - Kukjin
> 
> > -# device support
> > -
> > -obj-$(CONFIG_ARCH_EXYNOS)		+= setup-i2c0.o
> > diff --git a/arch/arm/mach-exynos/setup-i2c0.c b/arch/arm/mach-
> > exynos/setup-i2c0.c
> > deleted file mode 100644
> > index ede6ceb..0000000
> > --- a/arch/arm/mach-exynos/setup-i2c0.c
> > +++ /dev/null
> > @@ -1,19 +0,0 @@
> > -/*
> > - * Copyright (c) 2009-2012 Samsung Electronics Co., Ltd.
> > - *		http://www.samsung.com/
> > - *
> > - * I2C0 GPIO configuration.
> > - *
> > - * Based on plat-s3c64xx/setup-i2c0.c
> > - *
> > - * This program is free software; you can redistribute it and/or
> > modify - * it under the terms of the GNU General Public License
> > version 2 as - * published by the Free Software Foundation.
> > -*/
> > -
> > -struct platform_device; /* don't need the contents */
> > -
> > -void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> > -{
> > -
> > -}
> > --
> > 1.8.2.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-samsung-soc" in the body of a message to
> majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
