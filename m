From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/2] Samsung fixes for v3.18
Date: Wed, 15 Oct 2014 08:26:11 +0900
Message-ID: <543DB113.1080108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:54184 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755437AbaJNX0S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 14 Oct 2014 19:26:18 -0400
Received: by mail-pd0-f174.google.com with SMTP id y13so121908pdi.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Oct 2014 16:26:18 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 7d1311b93e58ed55f3a31cc8f94c4b8fe988a2b9:

   Linux 3.17-rc1 (2014-08-16 10:40:26 -0600)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes

for you to fetch changes up to f6f1ae82bd288bceed5a93594a8a081845f11b41:

   ARM: mm: Fix ifdef around cpu_*_do_[suspend, resume] ops (2014-09-24 
02:47:44 +0900)

----------------------------------------------------------------
Samsung fixes for v3.18
- fix ifdef around cpu_*_do_[suspend, resume] ops to check
   CONFIG_ARM_CPU_SUSPEND and not CONFIG_PM_SLEEP
- fix exynos_defconfig build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=n
- fix enabling Samsung PM debug functionality due to recently merged
   patches and previous merge conflicts
- fix pull-up setting in sd4_width8 pin group for exynos4x12

----------------------------------------------------------------
Bartlomiej Zolnierkiewicz (2):
       ARM: EXYNOS: Fix build with PM_SLEEP=n and ARM_EXYNOS_CPUIDLE=n
       ARM: mm: Fix ifdef around cpu_*_do_[suspend, resume] ops

Tomasz Figa (2):
       ARM: dts: Fix pull setting in sd4_width8 pin group for exynos4x12
       ARM: SAMSUNG: Restore Samsung PM Debug functionality

  arch/arm/boot/dts/exynos4x12-pinctrl.dtsi | 2 +-
  arch/arm/mach-exynos/exynos.c             | 2 ++
  arch/arm/mm/proc-macros.S                 | 2 +-
  arch/arm/plat-samsung/Kconfig             | 5 +++--
  arch/arm/plat-samsung/pm-debug.c          | 1 +
  5 files changed, 8 insertions(+), 4 deletions(-)
