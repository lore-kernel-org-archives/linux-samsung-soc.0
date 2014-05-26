From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3rd 1/3] Samsung Exynos cpuidle updates for 3.16
Date: Mon, 26 May 2014 13:03:17 +0900
Message-ID: <035601cf7897$6c959190$45c0b4b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62878 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751523AbaEZEDT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 00:03:19 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6500FK8XXHLK80@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 May 2014 13:03:17 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Daniel Lezcano' <daniel.lezcano@linaro.org>

Note: merge conflict will be happened when pulling this for
arch/arm/mach-exynos/cpuidle.
You may just fixup with 'git rm arch/arm/mach-exynos/cpuidle.', it is due to
'removing inclusion of <plat/cpu.h>' before moving cpuidle driver into
drivers/cpuidle...

- Kukjin

The following changes since commit 985326c9f65a4c1a3b5ab875e6ce0c97c39449ec:

  Merge branch 'v3.16-next/clk-samsung' into v3.16-next/cpuidle-exynos
(2014-05-26 05:20:25 +0900)

are available in the git repository at:


  http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/exynos-cpuidle

for you to fetch changes up to cd245f59aae5d6ef265f46aa6cea78354d61b629:

  ARM: EXYNOS: Fix kernel panic when unplugging CPU1 on exynos (2014-05-26
05:21:47 +0900)

----------------------------------------------------------------
Samsung exynos-cpuidle updates for v3.16

- From Daniel Lezcano:
 This patchset relies on the cpm_pm notifier to initiate the
 powerdown sequence operations from pm.c instead cpuidle.c.
 Thus the cpuidle driver is no longer dependent from arch
 specific code as everything is called from the pm.c file.

Note, this is based on tags/exnos-mcpm and tags/samsung-clk

----------------------------------------------------------------
Amit Daniel Kachhap (1):
      ARM: EXYNOS: Move arm core power down clock to exynos5250 common clock

Daniel Lezcano (20):
      ARM: EXYNOS: Prevent forward declaration for cpuidle
      ARM: EXYNOS: Use cpuidle_register
      ARM: EXYNOS: Change function name prefix for cpuidle
      ARM: EXYNOS: Encapsulate register access inside a function for pm
      ARM: EXYNOS: Move some code inside the idle_finisher for cpuidle
      ARM: EXYNOS: Fix S5P_WAKEUP_STAT call for cpuidle
      ARM: EXYNOS: Use the cpu_pm notifier for pm
      ARM: EXYNOS: Move scu_enable in the cpu_pm notifier
      ARM: EXYNOS: Remove ifdef for scu_enable in pm
      ARM: EXYNOS: Pass wakeup mask parameter to function for cpuidle
      ARM: EXYNOS: Encapsulate boot vector code into a function for cpuidle
      ARM: EXYNOS: Disable cpuidle for exynos5440
      ARM: EXYNOS: Encapsulate the AFTR code into a function
      ARM: EXYNOS: Move the AFTR state function into pm.c
      ARM: EXYNOS: Move the power sequence call in the cpu_pm notifier
      ARM: EXYNOS: Move S5P_CHECK_SLEEP into pm.c
      ARM: EXYNOS: Pass the AFTR callback to the platform_data
      ARM: EXYNOS: Cleanup all unneeded headers from cpuidle.c
      ARM: EXYNOS: Move the driver to drivers/cpuidle directory
      ARM: EXYNOS: Fix kernel panic when unplugging CPU1 on exynos

 arch/arm/mach-exynos/Makefile        |    1 -
 arch/arm/mach-exynos/common.h        |    2 +
 arch/arm/mach-exynos/cpuidle.c       |  256
----------------------------------
 arch/arm/mach-exynos/exynos.c        |    8 +-
 arch/arm/mach-exynos/platsmp.c       |    2 +-
 arch/arm/mach-exynos/pm.c            |  152 ++++++++++++++++----
 arch/arm/mach-exynos/regs-pmu.h      |    2 -
 drivers/clk/samsung/clk-exynos5250.c |   42 ++++++
 drivers/cpuidle/Kconfig.arm          |    6 +
 drivers/cpuidle/Makefile             |    1 +
 drivers/cpuidle/cpuidle-exynos.c     |   99 +++++++++++++
 11 files changed, 280 insertions(+), 291 deletions(-)
 delete mode 100644 arch/arm/mach-exynos/cpuidle.c
 create mode 100644 drivers/cpuidle/cpuidle-exynos.c
