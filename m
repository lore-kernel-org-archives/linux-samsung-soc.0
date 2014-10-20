From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/3] 1st Round of Samsung PM updates for v3.19
Date: Tue, 21 Oct 2014 00:54:27 +0900
Message-ID: <54453033.6050004@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:61657 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbaJTPyd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 20 Oct 2014 11:54:33 -0400
Received: by mail-pa0-f41.google.com with SMTP id eu11so5511254pac.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Oct 2014 08:54:33 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

Same, I've just rebased for Samsung PM updates for v3.19.
Please pull.

Thanks,
Kukjin

---

The following changes since commit f114040e3ea6e07372334ade75d1ee0775c355e1:

   Linux 3.18-rc1 (2014-10-19 18:08:38 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-pm

for you to fetch changes up to b588aaec6d0d846c88bfa2ba95e76147386a4cd6:

   ARM: EXYNOS: SWRESET is needed to boot secondary CPU on exynos3250 
(2014-10-21 00:06:36 +0900)

----------------------------------------------------------------
Samsung PM updates for v3.19

- Refactor the pm code to use DT based lookup instead of
   using "soc_is_exynosxxxx"

- Firmware supporting suspend and resume to excute of low
   level operations to enter and leave power mode for exynos
   : introduce suspend() and resume() firmware operations

- Fix AFTR mode on boards with secure firmware enabled and
   allows exynos cpuidle driver usage on exynos4x12 SoCs

- Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=y

- SWRESET is needed to boot secondary CPU on exynos3250

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (6):
       ARM: EXYNOS: replace EXYNOS_BOOT_VECTOR_* macros by static inlines
       ARM: firmware: add AFTR mode support to firmware do_idle method
       ARM: EXYNOS: add secure firmware support to AFTR mode code
       ARM: EXYNOS: fix register setup for AFTR mode code
       ARM: EXYNOS: allow driver usage on Exynos4x12 SoCs
       ARM: EXYNOS: Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=y

Krzysztof Kozlowski (1):
       ARM: EXYNOS: SWRESET is needed to boot secondary CPU on exynos3250

Tomasz Figa (2):
       ARM: firmware: Introduce suspend and resume operations
       ARM: EXYNOS: Add support for firmware-assisted suspend/resume

Vikas Sajjan (2):
       ARM: EXYNOS: Move Disabling of JPEG USE_RETENTION for exynos5250 
to pmu.c
       ARM: EXYNOS: Refactor the pm code to use DT based lookup

  Documentation/arm/firmware.txt         |  28 +--
  arch/arm/include/asm/firmware.h        |  10 +-
  arch/arm/mach-exynos/Kconfig           |   5 +
  arch/arm/mach-exynos/Makefile          |   6 +-
  arch/arm/mach-exynos/common.h          |  13 ++
  arch/arm/mach-exynos/exynos.c          |   5 +-
  arch/arm/mach-exynos/firmware.c        |  65 +++++-
  arch/arm/mach-exynos/platsmp.c         |  23 +++
  arch/arm/mach-exynos/pm.c              | 310 ++++------------------------
  arch/arm/mach-exynos/pmu.c             |   1 +
  arch/arm/mach-exynos/regs-pmu.h        |   3 +
  arch/arm/mach-exynos/sleep.S           |  28 +++
  arch/arm/mach-exynos/smc.h             |   4 +
  arch/arm/mach-exynos/suspend.c         | 356 
+++++++++++++++++++++++++++++++++
  arch/arm/mach-tegra/cpuidle-tegra114.c |   2 +-
  arch/arm/plat-samsung/Makefile         |   1 +
  16 files changed, 559 insertions(+), 301 deletions(-)
  create mode 100644 arch/arm/mach-exynos/suspend.c
