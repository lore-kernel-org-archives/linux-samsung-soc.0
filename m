From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH V2 0/2] ARM: EXYNOS: cpuidle: fixes in exynos cpuidle/PM
Date: Wed, 12 Jun 2013 16:58:44 +0530
Message-ID: <1371036526-16589-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:48738 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753513Ab3FLL3E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 07:29:04 -0400
Received: by mail-pd0-f177.google.com with SMTP id p10so4181001pdj.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 04:29:03 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Thomas Abraham <thomas.abraham@linaro.org>, Abhilash Kesavan <a.kesavan@samsung.com>

This patch series contains a couple of fixes in cpuidle/PM due to
1) exynos5440 platform which does not support cpuidle C1 state.
2) Compilations error when generic PM options are enabled.

This patch series depends on earlier posted patch
http://www.spinics.net/lists/arm-kernel/msg248831.html

Changes in V2:
* Rebase against samsung maintainer's for next tree.

Amit Daniel Kachhap (2):
  ARM: SAMSUNG: Add SAMSUNG_PM config option to select pm
  ARM: EXYNOS: cpuidle: Allow C1 state only in supported SOC's.

 arch/arm/mach-exynos/Makefile           |    2 +-
 arch/arm/mach-exynos/common.c           |    2 +-
 arch/arm/mach-exynos/common.h           |    1 -
 arch/arm/mach-exynos/cpuidle.c          |    5 ++++-
 arch/arm/plat-samsung/Kconfig           |    7 +++++++
 arch/arm/plat-samsung/Makefile          |    3 +--
 arch/arm/plat-samsung/include/plat/pm.h |    8 ++++----
 7 files changed, 18 insertions(+), 10 deletions(-)
