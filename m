From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/7] ARM: S5P6440: Add support for Samsung's S5P6440 SoC
Date: Fri, 11 Dec 2009 18:56:46 +0900
Message-ID: <002101ca7a48$40670dd0$c1352970$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54641 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753229AbZLKJyw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2009 04:54:52 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KUH00E7TFJLOA@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Dec 2009 18:54:58 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KUH004Q7FJKC8@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 11 Dec 2009 18:54:57 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 'Ben Dooks' <ben-linux@fluff.org>, =?ks_c_5601-1987?B?seixucH4L0FQsLO538bAKFNZUy5MU0kpL0U1KMOlwNMpLw==?= =?ks_c_5601-1987?B?u++8usD8wNo=?= <kgene.kim@samsung.com>

Hi all,

This patches add basic support for Samsung's S5P6440 SoC.
The feature set that is added are clock, timer, uart and interrupts.

The clock changes are based on Harald Welte's patch. This patch is
also based on Ben's plat-samsung patch.

[PATCH 1/7] ARM: S5P6440: Kconfigs and Makefiles
[PATCH 2/7] ARM: S5P6440: CPU initialization
[PATCH 3/7] ARM: S5P6440: Clock and PLL support
[PATCH 4/7] ARM: S5P6440: IRQ support
[PATCH 5/7] ARM: S5P6440: Timer support
[PATCH 6/7] ARM: S5P6440: Board and configuration file
[PATCH 7/7] ARM: S5P6440: Serial port support

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
---
 arch/arm/Kconfig                                 |   14 +-
 arch/arm/Makefile                                |    2 +
 arch/arm/configs/s5p6440_defconfig               |  893
++++++++++++++++++++++
 arch/arm/mach-s5p6440/Kconfig                    |   21 +
 arch/arm/mach-s5p6440/Makefile                   |   19 +
 arch/arm/mach-s5p6440/Makefile.boot              |    2 +
 arch/arm/mach-s5p6440/cpu.c                      |  120 +++
 arch/arm/mach-s5p6440/include/mach/debug-macro.S |   37 +
 arch/arm/mach-s5p6440/include/mach/entry-macro.S |   42 +
 arch/arm/mach-s5p6440/include/mach/gpio-core.h   |   19 +
 arch/arm/mach-s5p6440/include/mach/gpio.h        |   79 ++
 arch/arm/mach-s5p6440/include/mach/hardware.h    |   18 +
 arch/arm/mach-s5p6440/include/mach/idle.h        |   23 +
 arch/arm/mach-s5p6440/include/mach/irqs.h        |  111 +++
 arch/arm/mach-s5p6440/include/mach/map.h         |  100 +++
 arch/arm/mach-s5p6440/include/mach/memory.h      |   22 +
 arch/arm/mach-s5p6440/include/mach/pwm-clock.h   |   58 ++
 arch/arm/mach-s5p6440/include/mach/regs-clock.h  |  207 +++++
 arch/arm/mach-s5p6440/include/mach/regs-irq.h    |   23 +
 arch/arm/mach-s5p6440/include/mach/system.h      |   40 +
 arch/arm/mach-s5p6440/include/mach/tick.h        |   24 +
 arch/arm/mach-s5p6440/include/mach/uncompress.h  |   24 +
 arch/arm/mach-s5p6440/mach-smdk6440.c            |  113 +++
 arch/arm/plat-s3c/include/plat/cpu.h             |    2 +
 arch/arm/plat-s3c/include/plat/devs.h            |    1 +
 arch/arm/plat-s3c/include/plat/regs-serial.h     |    1 +
 arch/arm/plat-s5p/Kconfig                        |   36 +
 arch/arm/plat-s5p/Makefile                       |   25 +
 arch/arm/plat-s5p/clock.c                        |  147 ++++
 arch/arm/plat-s5p/cpu.c                          |   88 +++
 arch/arm/plat-s5p/dev-uart.c                     |  165 ++++
 arch/arm/plat-s5p/include/plat/irqs.h            |   79 ++
 arch/arm/plat-s5p/include/plat/pll.h             |   74 ++
 arch/arm/plat-s5p/include/plat/s5p-clock.h       |   41 +
 arch/arm/plat-s5p/include/plat/s5p6440.h         |   33 +
 arch/arm/plat-s5p/irq.c                          |  251 ++++++
 arch/arm/plat-s5p/s5p6440-clock.c                |  703 +++++++++++++++++
 arch/arm/plat-s5p/s5p6440-init.c                 |   23 +
 arch/arm/plat-s5p/setup-i2c0.c                   |   23 +
 arch/arm/plat-s5p/time.c                         |  227 ++++++
 arch/arm/plat-samsung/include/plat/clock.h       |    1 +
 drivers/serial/Kconfig                           |    9 +-
 drivers/serial/Makefile                          |    1 +
 43 files changed, 3939 insertions(+), 2 deletions(-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
