From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-1 for 3.16
Date: Sun, 22 Jun 2014 17:22:16 +0900
Message-ID: <53A69238.5070709@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:60627 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751679AbaFVIWW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Jun 2014 04:22:22 -0400
Received: by mail-pb0-f42.google.com with SMTP id ma3so4653668pbc.29
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Jun 2014 01:22:22 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 7171511eaec5bf23fb06078f59784a3a0626b38f:

   Linux 3.16-rc1 (2014-06-15 17:45:28 -1000)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-1

for you to fetch changes up to 7cbcb9d46f9194eb1f88c253a08c0292b2883acc:

   ARM: EXYNOS: Don't rely on firmware's secondary_cpu_start for mcpm 
(2014-06-21 19:30:53 +0900)

----------------------------------------------------------------
Samsung fixes for 3.16

- use WFI macro in platform_do_lowpower because exynos cpuhotplug
   includes a hardcoded WFI instruction and it causes compile error
   in Thumb-2 mode.
- fix GIC reg sizes for exynos4 SoCs
- remove reset timer counter value during boot and resume for mct
   to fix a big jump in printk timestamps
- fix pm code to check cortex-A9 for another exynos SoCs
- don't rely on firmware's secondary_cpu_start for mcpm

----------------------------------------------------------------
Abhilash Kesavan (1):
       ARM: EXYNOS: fix pm code to check for cortex A9 rather than the SoC

Chirantan Ekbote (1):
       clocksource: exynos_mct: Don't reset the counter during boot and 
resume

Doug Anderson (1):
       ARM: EXYNOS: Don't rely on firmware's secondary_cpu_start for mcpm

Leela Krishna Amudala (1):
       ARM: EXYNOS: Use wfi macro in platform_do_lowpower

Tomasz Figa (1):
       ARM: dts: fix reg sizes of GIC for exynos4

  arch/arm/boot/dts/exynos4.dtsi     |  2 +-
  arch/arm/mach-exynos/hotplug.c     |  8 +-------
  arch/arm/mach-exynos/mcpm-exynos.c | 11 ++++++-----
  arch/arm/mach-exynos/pm.c          | 15 +++++++++------
  drivers/clocksource/exynos_mct.c   |  9 +++------
  5 files changed, 20 insertions(+), 25 deletions(-)
