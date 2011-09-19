From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7 (RE-SEND)] gpio/s3c24xx: move gpio driver into
 drivers/gpio/
Date: Mon, 19 Sep 2011 20:13:12 +0900
Message-ID: <001f01cc76bd$1ebad900$5c308b00$%kim@samsung.com>
References: <1314707249-12241-1-git-send-email-kgene.kim@samsung.com>
 <1314707249-12241-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:55379 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752558Ab1ISLNN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Sep 2011 07:13:13 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRR002CPOHLEM60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 20:13:12 +0900 (KST)
Received: from kgenekim (12-23-120-114.csky.net [12.23.120.114])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRR00DW1OI0BH@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 20:13:12 +0900 (KST)
In-reply-to: <1314707249-12241-2-git-send-email-kgene.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, 'Grant Likely' <grant.likely@secretlab.ca>

Kukjin Kim wrote:
>

(snip)...

Hi Grant,

I didn't get any comments on this series, gpio-samsung patches for
consolidation of Samsung gpiolib. Please let me know whether this is ok to
you or not. And I think, if you're ok, this should be sent to upstream via
both gpio tree and arm(samsung) tree to avoid conflicts...

As a note, following is its status...

Kukjin Kim (9):
      ARM: SAMSUNG: Move map header file into plat-samsung
      gpio/s3c24xx: move gpio driver into drivers/gpio/
      gpio/s3c64xx: move gpio driver into drivers/gpio/
      gpio/s5p64x0: move gpio driver into drivers/gpio/
      gpio/samsung: Remove useless old Samsung related GPIO drivers
      gpio/samsung: Added gpio-samsung.c to support Samsung GPIOs
      ARM: SAMSUNG: Update the name of regarding Samsung GPIO
      ARM: SAMSUNG: Remove useless Samsung GPIO related CONFIGs
      Merge branch 'next/topic-plat-samsung-1' into next/topic-gpio-samsung

 arch/arm/Kconfig                                   |    3 -
 arch/arm/mach-exynos4/include/mach/pm-core.h       |    2 +-
 arch/arm/mach-s3c2410/Kconfig                      |    7 -
 arch/arm/mach-s3c2410/Makefile                     |    1 -
 arch/arm/mach-s3c2410/include/mach/gpio-fns.h      |   99 +-
 arch/arm/mach-s3c2410/include/mach/gpio-track.h    |    6 +-
 arch/arm/mach-s3c2410/include/mach/map.h           |   52 +-
 arch/arm/mach-s3c2410/include/mach/pm-core.h       |    2 +-
 arch/arm/mach-s3c2410/s3c2410.c                    |    4 +-
 arch/arm/mach-s3c2412/Kconfig                      |    1 -
 arch/arm/mach-s3c2412/Makefile                     |    1 -
 arch/arm/mach-s3c2412/gpio.c                       |    2 +-
 arch/arm/mach-s3c2416/Kconfig                      |    1 -
 arch/arm/mach-s3c2416/s3c2416.c                    |    4 +-
 arch/arm/mach-s3c2440/Kconfig                      |    4 -
 arch/arm/mach-s3c2440/s3c2440.c                    |    4 +-
 arch/arm/mach-s3c2440/s3c2442.c                    |    4 +-
 arch/arm/mach-s3c2443/Kconfig                      |    1 -
 arch/arm/mach-s3c2443/s3c2443.c                    |    4 +-
 arch/arm/mach-s3c64xx/Makefile                     |    1 -
 arch/arm/mach-s3c64xx/gpiolib.c                    |  290 ---
 arch/arm/mach-s3c64xx/include/mach/map.h           |    9 +-
 arch/arm/mach-s3c64xx/include/mach/pm-core.h       |    2 +-
 arch/arm/mach-s5p64x0/Makefile                     |    2 +-
 arch/arm/mach-s5p64x0/gpiolib.c                    |  511 ----
 arch/arm/mach-s5pv210/include/mach/pm-core.h       |    2 +-
 arch/arm/plat-s3c24xx/Kconfig                      |    1 -
 arch/arm/plat-s3c24xx/Makefile                     |    2 -
 arch/arm/plat-s3c24xx/gpio.c                       |   96 -
 arch/arm/plat-s3c24xx/gpiolib.c                    |  229 --
 arch/arm/plat-s3c24xx/include/plat/map.h           |  100 -
 arch/arm/plat-s5p/Kconfig                          |    3 -
 arch/arm/plat-s5p/irq-gpioint.c                    |   10 +-
 arch/arm/plat-samsung/Kconfig                      |   27 -
 arch/arm/plat-samsung/Makefile                     |    2 -
 arch/arm/plat-samsung/gpio-config.c                |  431 ----
 arch/arm/plat-samsung/gpio.c                       |  167 --
 .../plat-samsung/include/plat/gpio-cfg-helpers.h   |  172 +-
 arch/arm/plat-samsung/include/plat/gpio-cfg.h      |   34 +-
 arch/arm/plat-samsung/include/plat/gpio-core.h     |   97 +-
 arch/arm/plat-samsung/include/plat/gpio-fns.h      |   98 +
 arch/arm/plat-samsung/include/plat/map-s3c.h       |   84 +
 .../include/plat/map-s5p.h                         |    6 +-
 arch/arm/plat-samsung/include/plat/pm.h            |   10 +-
 arch/arm/plat-samsung/pm-gpio.c                    |   72 +-
 arch/arm/plat-samsung/pm.c                         |    6 +-
 drivers/gpio/Kconfig                               |   16 -
 drivers/gpio/Makefile                              |    7 +-
 drivers/gpio/gpio-exynos4.c                        |  385 ---
 drivers/gpio/gpio-plat-samsung.c                   |  205 --
 drivers/gpio/gpio-s5pc100.c                        |  354 ---
 drivers/gpio/gpio-s5pv210.c                        |  287 ---
 drivers/gpio/gpio-samsung.c                        | 2686
++++++++++++++++++++
 53 files changed, 3072 insertions(+), 3534 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/gpiolib.c
 delete mode 100644 arch/arm/mach-s5p64x0/gpiolib.c
 delete mode 100644 arch/arm/plat-s3c24xx/gpio.c
 delete mode 100644 arch/arm/plat-s3c24xx/gpiolib.c
 delete mode 100644 arch/arm/plat-s3c24xx/include/plat/map.h
 delete mode 100644 arch/arm/plat-samsung/gpio-config.c
 delete mode 100644 arch/arm/plat-samsung/gpio.c
 create mode 100644 arch/arm/plat-samsung/include/plat/gpio-fns.h
 create mode 100644 arch/arm/plat-samsung/include/plat/map-s3c.h
 rename arch/arm/{plat-s5p => plat-samsung}/include/plat/map-s5p.h (94%)
 delete mode 100644 drivers/gpio/gpio-exynos4.c
 delete mode 100644 drivers/gpio/gpio-plat-samsung.c
 delete mode 100644 drivers/gpio/gpio-s5pc100.c
 delete mode 100644 drivers/gpio/gpio-s5pv210.c
 create mode 100644 drivers/gpio/gpio-samsung.c

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
