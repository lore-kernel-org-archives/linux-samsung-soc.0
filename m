From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung SoC EXYNOS5250 arch for v3.4
Date: Thu, 15 Mar 2012 07:17:49 -0700
Message-ID: <4F61FA0D.1050007@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:62849 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753490Ab2COOR5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Mar 2012 10:17:57 -0400
Received: by dadp12 with SMTP id p12so4949863dad.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Mar 2012 07:17:56 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Arnd, Olof,

Thank you for kindly review for EXYNOS5 and addressed comments.

Here are 'pull request' for supporting EXYNOS5250.

Please pull from:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/soc-exynos5250-arch

It is based on next/devel-samsung-dma which has been pulled into arm-soc 
to avoid merge conflicts, because they touches same files.
And it is including additional two commits, one commit for fix 
exynos4-dt build error which is caused by this series and one for 
supporting lcd clkdev.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit efd9960b0e1bdfe48490504a8166ffdbcc466dba:

   ARM: EXYNOS: add support DMA for EXYNOS4X12 SoC (2012-03-10 22:51:20 
-0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/soc-exynos5250-arch

Eunki Kim (1):
       ARM: EXYNOS: support EINT for EXYNOS4 and EXYNOS5

Kukjin Kim (11):
       ARM: EXYNOS: to declare static for mach-exynos/common.c
       ARM: EXYNOS: use exynos_init_uarts() instead of exynos4_init_uarts()
       ARM: EXYNOS: add clock part for EXYNOS5250 SoC
       ARM: EXYNOS: add initial setup-i2c0 for EXYNOS5
       ARM: EXYNOS: add support uart for EXYNOS4 and EXYNOS5
       ARM: EXYNOS: add support for EXYNOS5250 SoC
       ARM: EXYNOS: add interrupt definitions for EXYNOS5250
       ARM: EXYNOS: add support get_core_count() for EXYNOS5250
       ARM: EXYNOS: add support ARCH_EXYNOS5 for EXYNOS5 SoCs
       ARM: EXYNOS: add support device tree enabled board file for EXYNOS5
       ARM: dts: add initial dts file for EXYNOS5250, SMDK5250

Tushar Behera (2):
       ARM: EXYNOS: Add clkdev lookup entry for lcd clock
       ARM: EXYNOS: Fix compilation error with mach-exynos4-dt board

  arch/arm/Makefile                               |    1 +
  arch/arm/boot/dts/exynos5250-smdk5250.dts       |   26 +
  arch/arm/boot/dts/exynos5250.dtsi               |  413 ++++++++
  arch/arm/mach-exynos/Kconfig                    |   29 +-
  arch/arm/mach-exynos/Makefile                   |    5 +-
  arch/arm/mach-exynos/clock-exynos4.c            |   14 +-
  arch/arm/mach-exynos/clock-exynos5.c            | 1247 
+++++++++++++++++++++++
  arch/arm/mach-exynos/common.c                   |  449 +++++++--
  arch/arm/mach-exynos/common.h                   |   37 +-
  arch/arm/mach-exynos/dev-ahci.c                 |    4 +-
  arch/arm/mach-exynos/dev-audio.c                |    4 +-
  arch/arm/mach-exynos/dev-uart.c                 |   78 ++
  arch/arm/mach-exynos/dma.c                      |    6 +-
  arch/arm/mach-exynos/include/mach/debug-macro.S |    9 +-
  arch/arm/mach-exynos/include/mach/irqs.h        |  597 ++++++++---
  arch/arm/mach-exynos/include/mach/map.h         |   41 +-
  arch/arm/mach-exynos/include/mach/regs-clock.h  |   62 ++
  arch/arm/mach-exynos/include/mach/regs-gpio.h   |   20 +-
  arch/arm/mach-exynos/include/mach/regs-pmu.h    |    1 +
  arch/arm/mach-exynos/include/mach/uncompress.h  |   17 +-
  arch/arm/mach-exynos/mach-exynos4-dt.c          |    8 +-
  arch/arm/mach-exynos/mach-exynos5-dt.c          |   78 ++
  arch/arm/mach-exynos/mct.c                      |   23 +-
  arch/arm/mach-exynos/platsmp.c                  |    9 +-
  arch/arm/mach-exynos/setup-i2c0.c               |    9 +-
  arch/arm/plat-s5p/Kconfig                       |    8 +-
  arch/arm/plat-s5p/Makefile                      |    3 +-
  arch/arm/plat-s5p/clock.c                       |   36 +
  arch/arm/plat-s5p/irq-pm.c                      |   25 +-
  arch/arm/plat-samsung/include/plat/cpu.h        |   10 +
  arch/arm/plat-samsung/include/plat/devs.h       |    2 +
  arch/arm/plat-samsung/include/plat/s5p-clock.h  |    6 +
  arch/arm/plat-samsung/include/plat/uncompress.h |    2 +
  arch/arm/plat-samsung/irq-vic-timer.c           |   16 +
  34 files changed, 2954 insertions(+), 341 deletions(-)
  create mode 100644 arch/arm/boot/dts/exynos5250-smdk5250.dts
  create mode 100644 arch/arm/boot/dts/exynos5250.dtsi
  create mode 100644 arch/arm/mach-exynos/clock-exynos5.c
  create mode 100644 arch/arm/mach-exynos/dev-uart.c
  create mode 100644 arch/arm/mach-exynos/mach-exynos5-dt.c
