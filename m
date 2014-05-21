From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 0/3] Exynos multi-platform support
Date: Wed, 21 May 2014 12:22:46 +0530
Message-ID: <1400655169-21683-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:47098 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751073AbaEUGzA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 02:55:00 -0400
Received: by mail-pb0-f51.google.com with SMTP id ma3so1130164pbc.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 May 2014 23:55:00 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, arnd@arndb.de, sachin.kamat@linaro.org

The patches in this series were earlier sent as part of other
series. Now that the other patches have been merged, re-sending
these after rebasing them on linux-next (20140519).
Tested on Exynos4210, 4412, 5250 and 5420 based boards.

A particular change in this series is the removal of single platform
support for Exynos as suggested by Arnd and Olof (patch 2/3). With
this change certain features (drivers) which are not yet multi-platform
aware like cpufreq, devfreq and DRM based gscaler will not be available
now.

Arnd Bergmann (1):
  ARM: EXYNOS: Enable multi-platform build support

Sachin Kamat (2):
  ARM: EXYNOS: Consolidate Kconfig entries
  ARM: multi_v7_defconfig: Enable Exynos platform

 arch/arm/Kconfig                    |   20 ----------
 arch/arm/configs/multi_v7_defconfig |   12 ++++++
 arch/arm/mach-exynos/Kconfig        |   73 +++++++++++++++--------------------
 arch/arm/mach-exynos/Makefile       |    2 +
 arch/arm/plat-samsung/Makefile      |    3 ++
 5 files changed, 49 insertions(+), 61 deletions(-)

-- 
1.7.9.5
