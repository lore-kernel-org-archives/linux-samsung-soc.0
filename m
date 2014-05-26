From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2nd 1/2] Samsung cleanup for 3.16
Date: Mon, 26 May 2014 11:29:19 +0900
Message-ID: <032f01cf788a$4bfebf40$e3fc3dc0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56116 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750901AbaEZC3W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 25 May 2014 22:29:22 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6500DN5TKVAED0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 May 2014 11:29:20 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Arnd, Olof, Kevin

Here is 2nd Samsung updates for 3.16 and including cleanup and 2nd dt
updates.

When pulling cleanup, merge conflict will be happened like following.

diff --cc arch/arm/mach-exynos/firmware.c
index 4135edb,f6cb510..0000000
--- a/arch/arm/mach-exynos/firmware.c
+++ b/arch/arm/mach-exynos/firmware.c
@@@ -18,8 -18,6 +18,11 @@@

  #include <mach/map.h>

++<<<<<<< HEAD
 +#include <plat/cpu.h>
 +
++=======
++>>>>>>> v3.16-next/cleanup-samsung
  #include "common.h"
  #include "smc.h"

And its resolution is 'removing inclusion of <plat/cpu.h>', sorry about
that.

Note that now exynos cpuidle, soc and multiplatform is waiting for cpufreq
related ack...
One more, I re-tagged "samsung-cleanup" and "exynos-cpuidle", so please
ignore previous tags if you fetched samsung tree.

If any problems, please kindly let me know.

Thanks,
Kukjin


The following changes since commit b5783dcaed065ae6622a9795a19a4eda748b64f8:

  Merge branch 'v3.16-next/clk-s3c24xx-3' into v3.16-next/cleanup-samsung
(2014-05-26 04:04:47 +0900)

are available in the git repository at:


  http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-cleanup

for you to fetch changes up to be1f7c8d7e2bc8b8c76846aa6f276e8d2ef8975a:

  cpufreq: exynos: Fix the compile error (2014-05-26 04:05:01 +0900)

----------------------------------------------------------------
Samsung cleanup for v3.16

- use a common macro v7_exit_coherency_flush macro instead of local function
- cleanup mach-exynos/Makefile and remove inclusion plat/cpu.h in
mach-exynos
- migrate exynos macros from plat-samsung to mach-exynos
- cleanup s3c24xx debug macro/earlyprintk to remove arch dependency
- fixed compilation error for cpufreq due to moving header in this branch
  : use of_machine_is_compatible() instead of soc_is_exynos...()

Note that based on tags/samsung-clk and tags/samsung-fixes.

----------------------------------------------------------------
Heiko Stuebner (4):
      ARM: compressed/head.S: remove s3c24xx special case
      ARM: S3C24XX: trim down debug uart handling
      ARM: S3C24XX: use generic DEBUG_UART_PHY/_VIRT in debug macro
      ARM: S3C24XX: move debug-macro.S into the common space

Jonghwan Choi (1):
      cpufreq: exynos: Fix the compile error

Leela Krishna Amudala (1):
      ARM: EXYNOS: use v7_exit_coherency_flush macro for cache disabling

Sachin Kamat (4):
      ARM: EXYNOS: Remove duplicate lines in Makefile
      ARM: EXYNOS: Remove exynos_subsys registration
      ARM: EXYNOS: Migrate Exynos specific macros from plat to mach
      ARM: EXYNOS: Remove unnecessary inclusion of cpu.h

 arch/arm/Kconfig.debug                           |   54 +++++++++++-
 arch/arm/boot/compressed/head.S                  |    5 --
 arch/arm/include/debug/s3c24xx.S                 |   46 ++++++++++
 arch/arm/mach-exynos/Makefile                    |    7 +-
 arch/arm/mach-exynos/common.h                    |   72 +++++++++++++++
 arch/arm/mach-exynos/cpuidle.c                   |    1 -
 arch/arm/mach-exynos/exynos.c                    |   13 ---
 arch/arm/mach-exynos/firmware.c                  |    3 +-
 arch/arm/mach-exynos/hotplug.c                   |   65 +-------------
 arch/arm/mach-exynos/platsmp.c                   |    2 -
 arch/arm/mach-exynos/pm.c                        |    1 -
 arch/arm/mach-exynos/pmu.c                       |    2 -
 arch/arm/mach-s3c24xx/Kconfig                    |   28 ------
 arch/arm/mach-s3c24xx/include/mach/debug-macro.S |  101
----------------------
 arch/arm/plat-samsung/include/plat/cpu.h         |   61 -------------
 drivers/cpufreq/exynos-cpufreq.c                 |   19 ++--
 drivers/cpufreq/exynos-cpufreq.h                 |    8 ++
 drivers/cpufreq/exynos4x12-cpufreq.c             |   11 +--
 18 files changed, 199 insertions(+), 300 deletions(-)
 create mode 100644 arch/arm/include/debug/s3c24xx.S
 delete mode 100644 arch/arm/mach-s3c24xx/include/mach/debug-macro.S
