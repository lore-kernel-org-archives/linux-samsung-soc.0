From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/5] Samsung cleanup for v3.17
Date: Sat, 19 Jul 2014 09:52:09 +0900
Message-ID: <53C9C139.9090304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:55474 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753500AbaGSAwP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 20:52:15 -0400
Received: by mail-pa0-f50.google.com with SMTP id et14so6322328pad.23
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Jul 2014 17:52:14 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pankaj Dubey <pankaj.dubey@samsung.com>

Note that this is based on 3.16-rc5 because of dependency with previous 
samsung fixes already merged in mainline during -rc.

The following changes since commit 1795cd9b3a91d4b5473c97f491d63892442212ab:

   Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-cleanup

for you to fetch changes up to fce9e5bb25264153f9f002eada41757118d25ba9:

   ARM: EXYNOS: Add support for mapping PMU base address via DT 
(2014-07-15 08:40:32 +0900)

----------------------------------------------------------------
Samsung cleanup for v3.17
: Most of them are for exynos SoCs, remove useless
codes and update for PMU consolidation.

- remove unnecessary header file in mach-exynos/pmu.c
- remove unused code in mach-exynos/common.h
- remove mach-exynos/regs-pmu.h dependency from PD
- remove file path from comment section in mach-exynos

- move SYSREG definitions into mach-exynos/regs-sys.h

- add mapping PMU base address via DT for PMU cleanup

- use staic in mach-exynos/common.h
- update Samsung UART config options for low-level debug

----------------------------------------------------------------
Pankaj Dubey (6):
       ARM: EXYNOS: Make exynos machine_ops as static
       ARM: EXYNOS: Move SYSREG definition into sys-reg specific file
       ARM: EXYNOS: Remove file path from comment section
       ARM: EXYNOS: Remove regs-pmu.h header dependency from pm_domain
       ARM: EXYNOS: Remove "linux/bug.h" from pmu.c
       ARM: EXYNOS: Add support for mapping PMU base address via DT

Sachin Kamat (2):
       ARM: debug: Update Samsung UART config options
       ARM: EXYNOS: Remove unused code in common.h

  arch/arm/Kconfig.debug                     | 20 +++-----------
  arch/arm/mach-exynos/common.h              | 13 +--------
  arch/arm/mach-exynos/exynos.c              | 44 
++++++++++++++++++++++++++++--
  arch/arm/mach-exynos/headsmp.S             |  1 -
  arch/arm/mach-exynos/hotplug.c             |  3 +-
  arch/arm/mach-exynos/include/mach/map.h    |  3 +-
  arch/arm/mach-exynos/include/mach/memory.h |  3 +-
  arch/arm/mach-exynos/platsmp.c             |  3 +-
  arch/arm/mach-exynos/pm.c                  |  1 +
  arch/arm/mach-exynos/pm_domains.c          |  9 +++---
  arch/arm/mach-exynos/pmu.c                 |  1 -
  arch/arm/mach-exynos/regs-pmu.h            |  4 ---
  arch/arm/mach-exynos/regs-sys.h            | 22 +++++++++++++++
  13 files changed, 77 insertions(+), 50 deletions(-)
  create mode 100644 arch/arm/mach-exynos/regs-sys.h
