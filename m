From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung Cleanup EXYNOS clock for v3.4
Date: Thu, 08 Mar 2012 03:13:56 -0800
Message-ID: <4F589474.8050609@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-tul01m020-f174.google.com ([209.85.214.174]:40890 "EHLO
	mail-tul01m020-f174.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752679Ab2CHLN6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 06:13:58 -0500
Received: by obbuo6 with SMTP id uo6so512725obb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Mar 2012 03:13:58 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>

Hi Arnd, Olof,

Here is cleanup clock part for EXYNOS SoCs from:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-exynos-clock

Please pull and if any problems, please kindly let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit b01543dfe67bb1d191998e90d20534dc354de059:

   Linux 3.3-rc4 (2012-02-18 15:53:33 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-exynos-clock

Kukjin Kim (2):
       ARM: EXYNOS: cleanup clock part for new EXYNOS SoCs
       PM / devfreq: update the name of EXYNOS clock register

  arch/arm/mach-exynos/Makefile                     |    3 +-
  arch/arm/mach-exynos/clock-exynos4.c              | 1564 
+++++++++++++++++++++
  arch/arm/mach-exynos/clock-exynos4.h              |   32 +
  arch/arm/mach-exynos/clock-exynos4210.c           |   46 +-
  arch/arm/mach-exynos/clock-exynos4212.c           |   30 +-
  arch/arm/mach-exynos/clock.c                      | 1564 
---------------------
  arch/arm/mach-exynos/common.h                     |    9 +
  arch/arm/mach-exynos/include/mach/exynos4-clock.h |   43 -
  arch/arm/mach-exynos/include/mach/regs-clock.h    |  364 +++---
  arch/arm/mach-exynos/pm.c                         |   40 +-
  drivers/devfreq/exynos4_bus.c                     |  224 ++--
  11 files changed, 1959 insertions(+), 1960 deletions(-)
  create mode 100644 arch/arm/mach-exynos/clock-exynos4.c
  create mode 100644 arch/arm/mach-exynos/clock-exynos4.h
  delete mode 100644 arch/arm/mach-exynos/clock.c
  delete mode 100644 arch/arm/mach-exynos/include/mach/exynos4-clock.h
