From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel-2 for v3.5
Date: Wed, 16 May 2012 15:20:34 +0900
Message-ID: <092f01cd332c$00df3c60$029db520$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:12702 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754611Ab2EPGUi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 May 2012 02:20:38 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4300I0FQWHXBO0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 May 2012 15:20:36 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4300J9CQY61A70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 16 May 2012 15:20:36 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd and Olof,

Here is Samsung devel-2 for v3.5 and it is including update support for
EXYNOS5250 SoC.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/devel-exynos5250-1

Note, this branch has a dependency on next/cleanup-plat-s5p which is already
in next/cleanup2 of arm-soc.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit 0f58487b1e313e6abf500431e05f4d54f61736f2:

  Merge branch 'next/cleanup-plat-s5p' into next/devel-exynos5250-1
(2012-05-15 15:55:25 +0900)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/devel-exynos5250-1

Changhwan Youn (2):
      ARM: EXYNOS: Modify the GIC physical address for static io-mapping
      ARM: EXYNOS: Redefine IRQ_MCT_L0,1 definition

Kisoo Yu (1):
      ARM: EXYNOS: Add pre-divider and fout mux clocks for bpll and mpll

Kukjin Kim (1):
      ARM: EXYNOS: update irqs for EXYNOS5250 SoC

Sangsu Park (1):
      ARM: EXYNOS: add GPC4 bank instance

Thomas Abraham (6):
      ARM: EXYNOS: Add watchdog timer clock instance
      ARM: EXYNOS: Remove a new bus_type instance for EXYNOS5
      ARM: EXYNOS: Add irq_domain support for interrupt combiner
      ARM: EXYNOS: Add device tree support for interrupt combiner
      ARM: dts: Update device tree source files for EXYNOS5250
      ARM: EXYNOS: Add AUXDATA for i2c controllers

 .../bindings/arm/samsung/interrupt-combiner.txt    |   52 ++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   48 ++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |   60 ++++----
 arch/arm/mach-exynos/clock-exynos5.c               |   51 ++++++-
 arch/arm/mach-exynos/common.c                      |  178
+++++++++++++-------
 arch/arm/mach-exynos/include/mach/gpio.h           |    9 +-
 arch/arm/mach-exynos/include/mach/irqs.h           |   40 +++--
 arch/arm/mach-exynos/include/mach/map.h            |    4 +-
 arch/arm/mach-exynos/include/mach/regs-clock.h     |    2 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    4 +
 arch/arm/mach-exynos/mct.c                         |   17 ++-
 arch/arm/mach-exynos/pm.c                          |    2 +-
 arch/arm/plat-samsung/include/plat/cpu.h           |    2 +-
 arch/arm/plat-samsung/include/plat/s5p-clock.h     |    4 +
 arch/arm/plat-samsung/s5p-clock.c                  |   30 ++++
 drivers/gpio/gpio-samsung.c                        |   11 +-
 16 files changed, 389 insertions(+), 125 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/arm/samsung/interrupt-combiner.txt
