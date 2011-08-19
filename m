From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/5] S5P64X0 PM Support
Date: Fri, 19 Aug 2011 23:02:34 +0900
Message-ID: <004401cc5e78$a54aa200$efdfe600$%kim@samsung.com>
References: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58215 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751810Ab1HSOCg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 10:02:36 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ600F9IHO9I3G0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 23:02:35 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ6000ILHOBTK@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 19 Aug 2011 23:02:35 +0900 (KST)
In-reply-to: <1313144787-30666-1-git-send-email-a.kesavan@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Abhilash Kesavan wrote:
> 
> The patchset adds Power Mangement support for S5P64X0. The first
> four patches lay the groundwork for adding PM support, while the
> final patch adds the SoC specific PM code.
> Tested using external interrupts as wake-up sources on SMDK6440
> and SMDK6450.
> 
> Abhilash Kesavan (5):
>   ARM: S5P: Make the common S5P PM code conditionally compile
>   ARM: SAMSUNG: Make the sleep code common for S3C64XX and newer SoCs
>   ARM: S5P64X0: Add pm save/restore functions for GPIO banks
>   ARM: S5P64X0: Fix incorrect serial clock name
>   ARM: S5P64X0: Add Power Management support
> 
>  arch/arm/Kconfig                                |    2 +-
>  arch/arm/mach-exynos4/Kconfig                   |    2 +
>  arch/arm/mach-exynos4/Makefile                  |    2 +-
>  arch/arm/mach-exynos4/sleep.S                   |   54 ------
>  arch/arm/mach-s3c64xx/Kconfig                   |    1 +
>  arch/arm/mach-s3c64xx/Makefile                  |    1 -
>  arch/arm/mach-s3c64xx/sleep.S                   |   72 --------
>  arch/arm/mach-s5p64x0/Kconfig                   |    4 +
>  arch/arm/mach-s5p64x0/Makefile                  |    1 +
>  arch/arm/mach-s5p64x0/clock-s5p6440.c           |    2 +-
>  arch/arm/mach-s5p64x0/clock-s5p6450.c           |    2 +-
>  arch/arm/mach-s5p64x0/gpiolib.c                 |    1 +
>  arch/arm/mach-s5p64x0/include/mach/map.h        |    1 +
>  arch/arm/mach-s5p64x0/include/mach/pm-core.h    |  117 +++++++++++++
>  arch/arm/mach-s5p64x0/include/mach/regs-clock.h |   33 ++++
>  arch/arm/mach-s5p64x0/include/mach/regs-gpio.h  |   19 ++
>  arch/arm/mach-s5p64x0/init.c                    |    2 +-
>  arch/arm/mach-s5p64x0/irq-eint.c                |    2 +
>  arch/arm/mach-s5p64x0/irq-pm.c                  |   92 ++++++++++
>  arch/arm/mach-s5p64x0/pm.c                      |  204
> +++++++++++++++++++++++
>  arch/arm/mach-s5pv210/Kconfig                   |    2 +
>  arch/arm/mach-s5pv210/Makefile                  |    2 +-
>  arch/arm/mach-s5pv210/sleep.S                   |   52 ------
>  arch/arm/plat-s5p/Kconfig                       |    6 +
>  arch/arm/plat-s5p/Makefile                      |    3 +-
>  arch/arm/plat-samsung/Kconfig                   |    7 +
>  arch/arm/plat-samsung/Makefile                  |    1 +
>  arch/arm/plat-samsung/sleep.S                   |   80 +++++++++
>  drivers/gpio/gpio-plat-samsung.c                |    4 +-
>  29 files changed, 583 insertions(+), 188 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos4/sleep.S
>  delete mode 100644 arch/arm/mach-s3c64xx/sleep.S
>  create mode 100644 arch/arm/mach-s5p64x0/include/mach/pm-core.h
>  create mode 100644 arch/arm/mach-s5p64x0/irq-pm.c
>  create mode 100644 arch/arm/mach-s5p64x0/pm.c
>  delete mode 100644 arch/arm/mach-s5pv210/sleep.S
>  create mode 100644 arch/arm/plat-samsung/sleep.S
> 
> --

Hi Abhilash,

As a note, I will be back on this in the next week :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
