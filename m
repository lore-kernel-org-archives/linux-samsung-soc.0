From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel for v3.6
Date: Tue, 17 Jul 2012 07:03:57 +0900
Message-ID: <143501cd639e$e6096390$b21c2ab0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:52466 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753005Ab2GPWD7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Jul 2012 18:03:59 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M7900245XALHI80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 07:03:57 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M79008I1XAL1350@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Jul 2012 07:03:57 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arnd@arndb.de, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof

This is general development for Samsung stuff for v3.6

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/devel-samsung

If any problems, please let me know.

NOTE: There are some patches I was reviewing and they will be sent to you
soon :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit bd0a521e88aa7a06ae7aabaed7ae196ed4ad867a:

  Linux 3.5-rc6 (2012-07-07 17:23:56 -0700)

are available in the git repository at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
next/devel-samsung

Jonghwan Choi (1):
      ARM: EXYNOS: Clear SYS_WDTRESET bit to use watchdog reset

Mark Brown (1):
      ARM: SAMSUNG: Introduce Kconfig variable for Samsung custom clk API

Sachin Kamat (3):
      ARM: EXYNOS: Update HSOTG PHY clock setting for EXYNOS4X12
      ARM: EXYNOS: Make combiner_init function static
      ARM: EXYNOS: Add missing static storage class specifier in pmu.c file

 arch/arm/mach-exynos/common.c                    |    3 +-
 arch/arm/mach-exynos/include/mach/regs-pmu.h     |    5 ++
 arch/arm/mach-exynos/include/mach/regs-usb-phy.h |   20 +++++--
 arch/arm/mach-exynos/pmu.c                       |   18 ++++++-
 arch/arm/mach-exynos/setup-usb-phy.c             |   60
++++++++++++++++------
 arch/arm/plat-samsung/Kconfig                    |    4 ++
 arch/arm/plat-samsung/Makefile                   |    4 +-
 arch/arm/plat-samsung/include/plat/cpu.h         |    4 ++
 8 files changed, 92 insertions(+), 26 deletions(-)
