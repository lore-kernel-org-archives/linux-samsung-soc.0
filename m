From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v5 0/6] Cleanup patches for mach-exynos
Date: Wed, 25 Jun 2014 18:15:36 +0530
Message-ID: <1403700342-9678-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44823 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752596AbaFYMs0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 08:48:26 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, chow.kim@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

This series is doing code cleanup under arch/arm/mach-exynos.
These patches have been separated from main exynos pmu v4 patch
posted here [1].

[1]: https://lkml.org/lkml/2014/5/10/29

Changes Since v4:
 - Rebased on latest for-next of Kukjin Kim's tree.
 - Removing file path comment from mach-exynos/headsmp.S also.
 - Removed signed-off-by of Young-Gun Jang <yg1004.jang@samsung.com>,
   as this id is no more valid. Taking ownership of all his patches.
 - Separated these patches from main exynos pmu v4 patch series as
   suggested by Tomasz Figa.

Changes Since v3:
 - Addressed build fail issue in exynos.c as reported by Sachin Kamat.
 - Rebased on top of Sysram patches by Sachin Kamat.

Changes Since v2:
 - Rebased on top of Daniel Lezcano's Exynos cpuidle refactor patches.
 - Removed exynos_cpuidle_init and exynos_cpufreq_init code as suggested
   by Tomasz Figa.

Changes Since v1:
 - Rebased on latest for-next of Kukjin Kim's tree.
 - Added patch: "Make exynos machine_ops as static". 
	For making more cleanup in "mach-exynos/common.h"
	as suggested by Tomasz Figa.
 - Addressed comments of Tomasz Figa for cleaning "mach-exynos/common.h".
 - Updated patch: Remove file path from comment section
	As suggested by Michel Simek, instead of updating file path
	lets remove them from each file under "mach-exynos".
	Even though Kukjin pointed out that there is similar patch pending from
	Sachin/Tushar but since I could not find I have included this here. If
	I have missed something please point to any existing such patch.
 - Added patch: Remove "linux/bug.h" from pmu.c.
 - Added patch: Move "mach/map.h" inclusion from regs-pmu.h to platsmp.c

Pankaj Dubey (6):
  ARM: EXYNOS: Make exynos machine_ops as static
  ARM: EXYNOS: Move cpufreq and cpuidle device registration to
    init_machine
  ARM: EXYNOS: Move SYSREG definition into sys-reg specific file
  ARM: EXYNOS: Remove file path from comment section
  ARM: EXYNOS: Remove regs-pmu.h header dependency from pm_domain
  ARM: EXYNOS: Remove "linux/bug.h" from pmu.c

 arch/arm/mach-exynos/common.h              |    8 --------
 arch/arm/mach-exynos/exynos.c              |   26 ++++++++------------------
 arch/arm/mach-exynos/headsmp.S             |    1 -
 arch/arm/mach-exynos/hotplug.c             |    3 +--
 arch/arm/mach-exynos/include/mach/map.h    |    3 +--
 arch/arm/mach-exynos/include/mach/memory.h |    3 +--
 arch/arm/mach-exynos/platsmp.c             |    3 +--
 arch/arm/mach-exynos/pm.c                  |    1 +
 arch/arm/mach-exynos/pm_domains.c          |    8 ++++----
 arch/arm/mach-exynos/pmu.c                 |    1 -
 arch/arm/mach-exynos/regs-pmu.h            |    4 ----
 arch/arm/mach-exynos/regs-sys.h            |   22 ++++++++++++++++++++++
 12 files changed, 39 insertions(+), 44 deletions(-)
 create mode 100644 arch/arm/mach-exynos/regs-sys.h

-- 
1.7.9.5
