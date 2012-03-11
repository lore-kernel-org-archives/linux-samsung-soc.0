From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL v2] Samsung cleanup EXYNOS clock for v3.4
Date: Sun, 11 Mar 2012 00:32:16 -0800
Message-ID: <4F5C6310.5010402@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:37332 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770Ab2CKIcU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Mar 2012 04:32:20 -0400
Received: by iagz16 with SMTP id z16so5004571iag.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 11 Mar 2012 00:32:19 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi Arnd, Olof,

I rebased cleanup-exynos-clock on top of cleanup-use-static as per 
Olof's suggestion.

Please pull it from:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-exynos-clock

If any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit c15a04338b5a6d4305d107a5b6c0cd43418b7f3e:

   Merge branch 'next/cleanup-use-static' into next/cleanup-exynos-clock 
(2012-03-10 22:21:36 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-exynos-clock

Jaecheol Lee (1):
       ARM: EXYNOS: add clock registers for exynos4x12-cpufreq

Kukjin Kim (4):
       ARM: EXYNOS: replace clock.c for other new EXYNOS SoCs
       ARM: EXYNOS: use static declaration on regarding clock
       ARM: EXYNOS: change the prefix S5P_ to EXYNOS4_ for clock
       PM / devfreq: update the name of EXYNOS clock register

MyungJoo Ham (2):
       PM / devfreq: update the name of EXYNOS clock registers that were 
omitted
       ARM: EXYNOS: Add clock register addresses for EXYNOS4X12 bus 
devfreq driver

  arch/arm/mach-exynos/Makefile                     |    3 +-
  arch/arm/mach-exynos/clock-exynos4.c              | 1563 
++++++++++++++++++++
  arch/arm/mach-exynos/clock-exynos4.h              |   30 +
  arch/arm/mach-exynos/clock-exynos4210.c           |   46 +-
  arch/arm/mach-exynos/clock-exynos4212.c           |   30 +-
  arch/arm/mach-exynos/clock.c                      | 1564 
---------------------
  arch/arm/mach-exynos/common.h                     |    9 +
  arch/arm/mach-exynos/include/mach/exynos4-clock.h |   43 -
  arch/arm/mach-exynos/include/mach/regs-clock.h    |  416 +++---
  arch/arm/mach-exynos/pm.c                         |   40 +-
  drivers/devfreq/exynos4_bus.c                     |  230 ++--
  11 files changed, 2009 insertions(+), 1965 deletions(-)
  create mode 100644 arch/arm/mach-exynos/clock-exynos4.c
  create mode 100644 arch/arm/mach-exynos/clock-exynos4.h
  delete mode 100644 arch/arm/mach-exynos/clock.c
  delete mode 100644 arch/arm/mach-exynos/include/mach/exynos4-clock.h
