From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/3] 3rd Round for Samsung-cleanup-2 for v3.18
Date: Fri, 26 Sep 2014 01:54:01 +0900
Message-ID: <542448A9.4000702@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:39105 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752533AbaIYQyI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Sep 2014 12:54:08 -0400
Received: by mail-pd0-f179.google.com with SMTP id ft15so11002604pdb.24
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2014 09:54:08 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit f6361c6b3880063c2248d4e453331e3dc1efbf83:

   ARM: S3C24XX: remove separate restart code (2014-09-14 02:43:09 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-cleanup-2

for you to fetch changes up to 5a1f0c6d3161a37da3a651f80b18febc2e5d7b75:

   ARM: EXYNOS: Fix CPU idle clock down after CPU off (2014-09-14 
02:49:32 +0900)

----------------------------------------------------------------
Samsung 2nd cleanup for v3.18

- Cleanup SMP/hotplug codes from hotplug.c to platsmp.c

- Remove unneeded __ref annotation for exynos_cpu_die()

- Fix the way to power down CPU on exynos4 and CPUidle
   clock down after power down some CPU

----------------------------------------------------------------
Krzysztof Kozlowski (3):
       ARM: EXYNOS: Move code from hotplug.c to platsmp.c
       ARM: EXYNOS: Remove unneeded __ref annotation for cpu_die function
       ARM: EXYNOS: Fix CPU idle clock down after CPU off

  arch/arm/mach-exynos/Makefile   |   3 --
  arch/arm/mach-exynos/common.h   |   2 -
  arch/arm/mach-exynos/hotplug.c  |  91 --------------------------------
  arch/arm/mach-exynos/platsmp.c  | 113 
++++++++++++++++++++++++++++++++++++++++
  arch/arm/mach-exynos/regs-pmu.h |   3 ++
  5 files changed, 116 insertions(+), 96 deletions(-)
  delete mode 100644 arch/arm/mach-exynos/hotplug.c
