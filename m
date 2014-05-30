From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 5/5] Samsung drivers-2 for 3.16
Date: Sat, 31 May 2014 05:00:14 +0900
Message-ID: <5388E34E.5050703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:54746 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754167AbaE3UAS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 16:00:18 -0400
Received: by mail-pd0-f170.google.com with SMTP id g10so1298831pdj.29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 13:00:18 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 9dfa92ec4033c348aae6bafc1881e07229fabaa6:

   ARM: EXYNOS: Enable multi-platform build support (2014-05-31 02:43:51 
+0900)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-drivers-2

for you to fetch changes up to 4c8d819343461d3c3b8d99874cb2ae0ec59ad34a:

   cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM 
(2014-05-31 03:00:25 +0900)

----------------------------------------------------------------
Samsung 2nd drivers for 3.16

This is including fix exynos cpufreq driver compilation with
ARCH_MULTIPLATFORM. Even though this is a work around, this
is required for support exynos multiplatform for a while and
will be updated in near future.

This is based on tags/samsung-exynos.

----------------------------------------------------------------
Tomasz Figa (1):
       cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM

  drivers/cpufreq/Kconfig.arm          |  6 ++---
  drivers/cpufreq/exynos-cpufreq.c     |  2 --
  drivers/cpufreq/exynos-cpufreq.h     | 30 ++++++++++++-------------
  drivers/cpufreq/exynos4210-cpufreq.c | 39 +++++++++++++++++++++++++++-----
  drivers/cpufreq/exynos4x12-cpufreq.c | 40 
++++++++++++++++++++++++++++-----
  drivers/cpufreq/exynos5250-cpufreq.c | 43 
+++++++++++++++++++++++++++++-------
  6 files changed, 119 insertions(+), 41 deletions(-)
