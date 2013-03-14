From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS: cpuidle: Several fixes in exynos cpuidle/PM
Date: Thu, 14 Mar 2013 11:32:56 +0530
Message-ID: <1363240979-1939-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f170.google.com ([209.85.210.170]:51731 "EHLO
	mail-ia0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753399Ab3CNGDP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Mar 2013 02:03:15 -0400
Received: by mail-ia0-f170.google.com with SMTP id h8so1749141iaa.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Mar 2013 23:03:14 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>

This patch series contains a couple of fixes in cpuidle/PM due to
1) clock migration in driver folder.
2) exynos5440 platform which does not support cpuidle C1 state.
3) Compilations error when generic PM options are enabled.

All these patches are based on Samsung maintainer's for-next tree.
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git for-next

Amit Daniel Kachhap (3):
  ARM: EXYNOS: Move arm core power down clock to exynos5250 common
    clock
  ARM: SAMSUNG: Add SAMSUNG_PM config option to select pm
  ARM: EXYNOS: cpuidle: Allow C1 state only in supported SOC's.

 arch/arm/mach-exynos/Makefile           |    2 +-
 arch/arm/mach-exynos/common.c           |    2 +-
 arch/arm/mach-exynos/common.h           |    1 -
 arch/arm/mach-exynos/cpuidle.c          |   40 +++--------------------------
 arch/arm/plat-samsung/Kconfig           |    7 +++++
 arch/arm/plat-samsung/Makefile          |    3 +-
 arch/arm/plat-samsung/include/plat/pm.h |    8 +++---
 drivers/clk/samsung/clk-exynos5250.c    |   42 +++++++++++++++++++++++++++++++
 8 files changed, 60 insertions(+), 45 deletions(-)
