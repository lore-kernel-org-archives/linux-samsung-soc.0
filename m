From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 0/3] Consolidate uncompress code for Samsung platform
Date: Fri, 31 May 2013 17:19:01 +0530
Message-ID: <1370000944-19786-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:40019 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753555Ab3EaMDI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 May 2013 08:03:08 -0400
Received: by mail-pd0-f170.google.com with SMTP id x10so2080435pdj.29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2013 05:03:08 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: arnd@arndb.de, kgene.kim@samsung.com, olof@lixom.net, patches@linaro.org

The patches are based on v3.10-rc3.

They are build tested for s3c2410_defconfig, s3c6400_defconfig,
s5p64x0_defconfig, s5pc100_defconfig, s5pv210_defconfig,
exynos4_defconfig and exynos_defconfig.

Since they affect all the Samsung boards, testing them on different
machines would be essential. Unfortunately I can only test on Exynos here.

Tested on Exynos5250 based Arndale board.

Tushar Behera (3):
  ARM: EXYNOS: uncompress - print debug messages if DEBUG_LL is defined
  ARM: SAMSUNG: Consolidate uncompress subroutine
  ARM: S5P64X0: Remove duplicate uncompress code

 arch/arm/mach-exynos/include/mach/uncompress.h  |   14 +-
 arch/arm/mach-s3c24xx/include/mach/uncompress.h |    7 +
 arch/arm/mach-s3c64xx/include/mach/uncompress.h |    7 +
 arch/arm/mach-s5p64x0/include/mach/uncompress.h |  163 ++---------------------
 arch/arm/mach-s5pc100/include/mach/uncompress.h |    6 +
 arch/arm/mach-s5pv210/include/mach/uncompress.h |    6 +
 arch/arm/plat-samsung/include/plat/uncompress.h |   16 ++-
 7 files changed, 53 insertions(+), 166 deletions(-)

-- 
1.7.9.5
