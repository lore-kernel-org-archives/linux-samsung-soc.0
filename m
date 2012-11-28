From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 3/7] Samsung pm updates for v3.8
Date: Wed, 28 Nov 2012 09:15:34 +0900
Message-ID: <50B557A6.8010504@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:57243 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752428Ab2K1APk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 19:15:40 -0500
Received: by mail-pa0-f46.google.com with SMTP id bh2so6334984pad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Nov 2012 16:15:40 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Arnd, Olof

This is including properly enabling pm for exynos5 and I created topic 
branch as per previous Olof's suggestion

It doesn't work without this, please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/pm-samsung

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

The following changes since commit f4a75d2eb7b1e2206094b901be09adb31ba63681:

   Linux 3.7-rc6 (2012-11-16 17:42:40 -0800)

are available in the git repository at:
   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/pm-samsung

Abhilash Kesavan (3):
       ARM: EXYNOS: fix the hotplug for Cortex-A15
       ARM: EXYNOS: Remove scu_enable from cpuidle
       ARM: EXYNOS: Add flush_cache_all in suspend finisher

Inderpal Singh (2):
       ARM: EXYNOS: Add support for rtc wakeup
       ARM: EXYNOS: Fix soft reboot hang after suspend/resume

  arch/arm/mach-exynos/common.c           |    2 +
  arch/arm/mach-exynos/cpuidle.c          |    3 +-
  arch/arm/mach-exynos/hotplug.c          |   45 
++++++++++++++++++++++++++++--
  arch/arm/mach-exynos/pm.c               |    7 +++++
  arch/arm/plat-samsung/include/plat/pm.h |    2 +
  5 files changed, 55 insertions(+), 4 deletions(-)
