From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung devel-2 for v3.5
Date: Sun, 20 May 2012 07:39:26 +0900
Message-ID: <4FB8211E.6070905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:62269 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752551Ab2ESWjb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 May 2012 18:39:31 -0400
Received: by mail-pb0-f46.google.com with SMTP id rp8so5382496pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 15:39:31 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof

Here is second development of Samsung stuff for v3.5:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/devel-samsung-2

It is adding support second irq set for s3c2416, suspend/resume for 
exynos5250 and none of interrupt combiner controller for exynos5250.

Since above patches have dependencies with pm of exynos4412 is in 
next/devel-samsung and regarding dt update is in next/exynos5250-1 
branch, so I made this on top of them.

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.


The following changes since commit 2de05a57467c43f58802cdeaa547aee73396b6f3:

   Merge branch 'next/devel-exynos5250-1' into next/devel-samsung-2 
(2012-05-20 03:04:59 +0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/devel-samsung-2

Heiko Stuebner (1):
       ARM: S3C24XX: add support for second irq set of S3C2416

Jongpill Lee (5):
       ARM: EXYNOS: Remove GIC save & restore function
       ARM: EXYNOS: Rename of function for pm.c
       ARM: EXYNOS: Add PMU table for EXYNOS5250
       ARM: EXYNOS: Add Clock register list for save and restore
       ARM: EXYNOS: Support suspend and resume for EXYNOS5250

Thomas Abraham (1):
       ARM: dts: Add node for interrupt combiner controller on EXYNOS5250

  arch/arm/boot/dts/exynos5250.dtsi              |   16 ++
  arch/arm/mach-exynos/Kconfig                   |    2 +
  arch/arm/mach-exynos/Makefile                  |    2 +-
  arch/arm/mach-exynos/clock-exynos5.c           |   51 ++++++-
  arch/arm/mach-exynos/cpuidle.c                 |    2 +-
  arch/arm/mach-exynos/include/mach/pm-core.h    |    2 +-
  arch/arm/mach-exynos/include/mach/pmu.h        |    4 +-
  arch/arm/mach-exynos/include/mach/regs-clock.h |   18 ++-
  arch/arm/mach-exynos/include/mach/regs-pmu.h   |  141 +++++++++++++++-
  arch/arm/mach-exynos/pm.c                      |  223 
++++++++----------------
  arch/arm/mach-exynos/pmu.c                     |  200 
+++++++++++++++++++--
  arch/arm/mach-s3c24xx/include/mach/irqs.h      |   15 ++-
  arch/arm/mach-s3c24xx/irq-s3c2416.c            |   98 +++++++++++
  arch/arm/mach-s3c24xx/s3c2416.c                |    1 +
  arch/arm/plat-samsung/include/plat/s3c2416.h   |    3 +
  15 files changed, 602 insertions(+), 176 deletions(-)
