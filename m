From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Samsung cleanup-1 for v3.6
Date: Tue, 10 Jul 2012 12:11:07 +0000
Message-ID: <201207101211.07905.arnd@arndb.de>
References: <0c4901cd5e3e$aa970660$ffc51320$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:58824 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752460Ab2GJML3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jul 2012 08:11:29 -0400
In-Reply-To: <0c4901cd5e3e$aa970660$ffc51320$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tuesday 10 July 2012, Kukjin Kim wrote:
>  arch/arm/mach-exynos/common.c                   |   25 ------
>  arch/arm/mach-exynos/include/mach/spi-clocks.h  |   16 ----
>  arch/arm/mach-exynos/mach-nuri.c                |    1 -
>  arch/arm/mach-exynos/mach-origen.c              |    1 -
>  arch/arm/mach-exynos/mach-smdkv310.c            |    1 -
>  arch/arm/mach-exynos/mach-universal_c210.c      |    1 -
>  arch/arm/mach-s3c24xx/common.c                  |    1 -
>  arch/arm/mach-s3c24xx/include/mach/bast-pmu.h   |   40 ----------
>  arch/arm/mach-s3c64xx/include/mach/spi-clocks.h |   18 ----
>  arch/arm/mach-s5p64x0/dma.c                     |    2 -
>  arch/arm/mach-s5p64x0/include/mach/spi-clocks.h |   20 -----
>  arch/arm/mach-s5pc100/dma.c                     |    2 -
>  arch/arm/mach-s5pc100/include/mach/spi-clocks.h |   18 ----
>  arch/arm/mach-s5pv210/include/mach/spi-clocks.h |   17 ----
>  arch/arm/plat-samsung/Kconfig                   |    8 --
>  arch/arm/plat-samsung/Makefile                  |    4 -
>  arch/arm/plat-samsung/include/plat/devs.h       |    1 -
>  arch/arm/plat-samsung/include/plat/fb.h         |    1 -
>  arch/arm/plat-samsung/include/plat/pd.h         |   30 -------
>  arch/arm/plat-samsung/pd.c                      |   95
> -----------------------
>  arch/arm/plat-samsung/pwm.c                     |    4 -
>  21 files changed, 0 insertions(+), 306 deletions(-)

Great diffstat!

Pulled into next/cleanup, thanks,

	Arnd
