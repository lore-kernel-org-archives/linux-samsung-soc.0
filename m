From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH v2 0/3] Exynos multi-platform support
Date: Fri, 23 May 2014 20:49:26 +0530
Message-ID: <1400858369-14357-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:43329 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751506AbaEWPVl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 May 2014 11:21:41 -0400
Received: by mail-pb0-f51.google.com with SMTP id ma3so4299606pbc.38
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 May 2014 08:21:41 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, arnd@arndb.de, sachin.kamat@linaro.org

The patches in this series were earlier sent as part of other
series. Now that the other patches have been merged, re-sending
these after rebasing them on linux-next (20140523).
Tested on Exynos4210, 4412, 5250 and 5420 based boards.

A particular change in this series is the removal of single platform
support for Exynos as suggested by Arnd and Olof (patch 2/3). With
this change certain features (drivers) which are not yet multi-platform
aware like cpufreq, devfreq and DRM based gscaler will not be available
now.

Changes since v1:
Patch 2/3: Dropped some duplicated config symbols as suggested by Arnd.


Arnd Bergmann (1):
  ARM: EXYNOS: Enable multi-platform build support

Sachin Kamat (2):
  ARM: EXYNOS: Consolidate Kconfig entries
  ARM: multi_v7_defconfig: Enable Exynos platform

 arch/arm/Kconfig                    |   20 -----------
 arch/arm/configs/multi_v7_defconfig |   12 +++++++
 arch/arm/mach-exynos/Kconfig        |   66 +++++++++++++----------------------
 arch/arm/mach-exynos/Makefile       |    2 ++
 arch/arm/plat-samsung/Makefile      |    3 ++
 5 files changed, 42 insertions(+), 61 deletions(-)

-- 
1.7.9.5
