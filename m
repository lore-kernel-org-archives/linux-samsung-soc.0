From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3/5] Samsung Exynos updates for 3.16
Date: Sat, 31 May 2014 04:59:39 +0900
Message-ID: <5388E32B.3010908@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:61555 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751525AbaE3T7o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 15:59:44 -0400
Received: by mail-pd0-f170.google.com with SMTP id g10so1298407pdj.29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 12:59:44 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit fced6dee29f6fb143fe16ea90331176ff77e6120:

   Merge branch 'v3.16-next/cleanup-samsung' into 
v3.16-next/platform-exynos (2014-05-31 02:36:49 +0900)

are available in the git repository at:


   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-exynos

for you to fetch changes up to 9dfa92ec4033c348aae6bafc1881e07229fabaa6:

   ARM: EXYNOS: Enable multi-platform build support (2014-05-31 02:43:51 
+0900)

----------------------------------------------------------------
Samsung Exynos updates for 3.16

- add new SoCs support
   : exynos3250, 5260, 5410 and 5800

- enable multi-platform on exynos
   : consolidate exynos related Kconfig entries

Note that this requires tags/samsung-cleanup and tags/samsung-clk-2
because of mostly migration exynos specific macros into mach-exynos
and exynos related Kconfig entries.

One more merge conflict happens in arch/arm/Kconfig for ARCH_EXYNOS
due to SRAM stuff, even though tried to sort them out. Since just
resolving it would be better I think, please remove ARCH_EXYNOS in
arch/arm/Kconfig when merge conflict happens.

----------------------------------------------------------------
Arnd Bergmann (1):
       ARM: EXYNOS: Enable multi-platform build support

Arun Kumar K (1):
       ARM: EXYNOS: Add 5800 SoC support

Chanwoo Choi (2):
       ARM: EXYNOS: Add Exynos3250 SoC ID
       ARM: EXYNOS: Support secondary CPU boot of Exynos3250

Pankaj Dubey (1):
       ARM: EXYNOS: initial board support for exynos5260 SoC

Sachin Kamat (1):
       ARM: EXYNOS: Consolidate Kconfig entries

Tarek Dakhran (1):
       ARM: EXYNOS: Add support for EXYNOS5410 SoC

  arch/arm/Kconfig                | 19 ---------
  arch/arm/mach-exynos/Kconfig    | 92 
+++++++++++++++++++++++------------------
  arch/arm/mach-exynos/Makefile   |  2 +
  arch/arm/mach-exynos/common.h   | 29 ++++++++++++-
  arch/arm/mach-exynos/exynos.c   |  3 ++
  arch/arm/mach-exynos/firmware.c |  9 +++-
  arch/arm/mach-exynos/platsmp.c  |  2 +-
  arch/arm/plat-samsung/Makefile  |  3 ++
  8 files changed, 96 insertions(+), 63 deletions(-)
