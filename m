From: Kukjin Kim <kgene@kernel.org>
Subject: [GIT PULL] Samsung 2nd fixes for v4.0
Date: Thu, 02 Apr 2015 02:23:55 +0900
Message-ID: <551C29AB.7030306@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:42947 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752189AbbDARYM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Apr 2015 13:24:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof, Kevin,

Here is 2nd Samsung fixes for v4.0 and it fixes arm allmodconfig build
breakage and exynos5250-spring lid, power-pin and mmc nodes dt updates.

Please pull and sorry for pretty late pull-request for v4.0.

Thanks,
Kukjin


The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-fixes-2

for you to fetch changes up to cfdda3535f87e752780ca18a57d13db58f6a6913:

  ARM: EXYNOS: Fix build breakage cpuidle on !SMP (2015-03-18 03:26:11
+0900)

----------------------------------------------------------------
Samsung 2nd fixes for v4.0

- Fix build breakage exynos cpuidle driver on !SMP
  because it is coupled built-in so added check for SMP.

- Fix lid, power pin-functions and mmc node updates
  for exynos5250-spring: Fixes commit ID 53dd4138bb0a
  ("ARM: dts: Add exynos5250-spring device tree")

----------------------------------------------------------------
Andreas Faerber (2):
      ARM: dts: fix mmc node updates for exynos5250-spring
      ARM: dts: fix lid and power pin-functions for exynos5250-spring

Bartlomiej Zolnierkiewicz (1):
      ARM: EXYNOS: Fix build breakage cpuidle on !SMP

 arch/arm/boot/dts/exynos5250-spring.dts | 20 ++++++--------------
 arch/arm/mach-exynos/exynos.c           |  2 +-
 arch/arm/mach-exynos/pm.c               |  2 ++
 drivers/cpuidle/cpuidle-exynos.c        |  3 ++-
 4 files changed, 11 insertions(+), 16 deletions(-)
