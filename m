From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3/5] Samsung exynos cpuidle update for v3.17
Date: Sat, 19 Jul 2014 09:52:41 +0900
Message-ID: <53C9C159.4070305@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:46409 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754022AbaGSAwr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jul 2014 20:52:47 -0400
Received: by mail-pd0-f179.google.com with SMTP id ft15so5906996pdb.38
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Jul 2014 17:52:46 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Chander Kashyap <chander.kashyap@linaro.org>

The following changes since commit 1795cd9b3a91d4b5473c97f491d63892442212ab:

   Linux 3.16-rc5 (2014-07-13 14:04:33 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/exynos-cpuidle

for you to fetch changes up to fc2cac41ebbfb16da8b036cba6ec6714ab780a6d:

   ARM: EXYNOS: populate suspend and powered_up callbacks for mcpm 
(2014-07-19 03:36:00 +0900)

----------------------------------------------------------------
exynos cpuidle update for v3.17

- add callbacks exynos_suspend() and exynos_powered_up()
   for support cpuidle through mcpm
- skip exynos_cpuidle for exynos5420 because is uses
   cpuidle-big-liggle generic cpuidle driver
- add generic functions to calculate cpu number is used
   for pmu and this is required for exynos5420 multi-cluster
- add of_device_id structure for big.LITTLE cpuidle and
   add "samsung,exynos5420" compatible string for exynos5420

----------------------------------------------------------------
Chander Kashyap (6):
       cpuidle: big.LITTLE: add of_device_id structure
       ARM: EXYNOS: add generic function to calculate cpu number
       cpuidle: big.LITTLE: Add ARCH_EXYNOS entry in config
       cpuidle: big.LITTLE: init driver for exynos5420
       ARM: EXYNOS: do not allow cpuidle registration for exynos5420
       ARM: EXYNOS: populate suspend and powered_up callbacks for mcpm

  arch/arm/mach-exynos/exynos.c        |  4 +++-
  arch/arm/mach-exynos/mcpm-exynos.c   | 36 
++++++++++++++++++++++++++++++++++++
  arch/arm/mach-exynos/regs-pmu.h      |  9 +++++++++
  drivers/cpuidle/Kconfig.arm          |  2 +-
  drivers/cpuidle/cpuidle-big_little.c | 12 +++++++++++-
  5 files changed, 60 insertions(+), 3 deletions(-)
