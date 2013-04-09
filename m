From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL v2 10/10] devel-samsung for v3.10
Date: Wed, 10 Apr 2013 00:30:45 +0900
Message-ID: <51643425.3070108@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:55013 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1765334Ab3DIPax (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 11:30:53 -0400
Received: by mail-pd0-f180.google.com with SMTP id q11so3840872pdj.39
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2013 08:30:52 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

Note, this is re-sending because of missed including fixes in previous 
pull-request [10/10]. Thanks.

- Kukjin

The following changes since commit 6dbe51c251a327e012439c4772097a13df43c5b8:

   Linux 3.9-rc1 (2013-03-03 15:11:05 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/devel-samsung-for-v3.10

for you to fetch changes up to 329afd264592f8d0e40fa063c089b35fba0014cc:

   ARM: EXYNOS: replace cpumask by the corresponding macro (2013-04-10 
00:12:27 +0900)

----------------------------------------------------------------
including various development for samsung for v3.10

----------------------------------------------------------------
Charles Keepax (2):
       ARM: S3C64XX: Clear DMA flags on channel request
       ARM: S3C64XX: Slow down mic detection rate for wm5102

Daniel Lezcano (3):
       ARM: EXYNOS: factor out the idle states
       ARM: EXYNOS: handle properly the return values
       ARM: EXYNOS: replace cpumask by the corresponding macro

Inderpal Singh (2):
       ARM: EXYNOS: Add support for rtc wakeup
       ARM: SAMSUNG: check processor type before cache restoration in resume

Jonathan Kliegman (2):
       ARM: EXYNOS: Remove hardcode wakeup unmask for EINT_0
       ARM: EXYNOS: Clear ENABLE_WAKEUP_SW bit when entering suspend

Sylwester Nawrocki (1):
       ARM: SAMSUNG: Export MIPI CSIS/DSIM PHY control functions

  arch/arm/mach-exynos/common.c                |  2 +
  arch/arm/mach-exynos/cpuidle.c               | 58 
+++++++++++++---------------
  arch/arm/mach-exynos/include/mach/pm-core.h  |  9 +----
  arch/arm/mach-s3c64xx/dma.c                  |  1 +
  arch/arm/mach-s3c64xx/mach-crag6410-module.c |  1 +
  arch/arm/plat-samsung/s5p-sleep.S            |  9 +++++
  arch/arm/plat-samsung/setup-mipiphy.c        |  3 ++
  7 files changed, 44 insertions(+), 39 deletions(-)
