From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 4th 1/2 v2] Samsung Exynos multiplatform for 3.16
Date: Wed, 28 May 2014 07:07:41 +0900
Message-ID: <53850CAD.6080102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f51.google.com ([209.85.160.51]:60436 "EHLO
	mail-pb0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752071AbaE0WHq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 May 2014 18:07:46 -0400
Received: by mail-pb0-f51.google.com with SMTP id ma3so10069004pbc.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 May 2014 15:07:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi,

I sorted out the branch as per Olof's suggestion and sending v2 
pull-request for that (4th pull-request). Also sent multi_v7_defconfig 
update patch to arm@kernel.org.

Please pull this for 3.16.
If any problems, please kindly let me know.

Thanks,
Kukjin

The following changes since commit dfacdfef06090ca0c131f45dfd3f3ca3452a8ed3:

   Merge branch 'v3.16-next/dt-samsung' into v3.16-next/multiplatform 
(2014-05-26 06:19:01 +0900)

are available in the git repository at:


   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/exynos-multiplatform-v2

for you to fetch changes up to f7b163d16d412e14be49f47240ffaba328aaab6c:

   cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM 
(2014-05-27 23:52:50 +0900)

----------------------------------------------------------------
Exynos mutiplatform support for 3.16

Here is enabling the exynos platform as part of a multiplatform
kernel. This is including ARCH_EXYNOS related Kconfig entries
consolidation. And fixes exynos-cpufreq driver compilation with
ARCH_MULTIPLATFORM.

Note that this is based on tags/exynos-soc. And tags/samsung-dt,
tags/samsung-clk are merged on top of that.

----------------------------------------------------------------
Arnd Bergmann (1):
       ARM: EXYNOS: Enable multi-platform build support

Sachin Kamat (1):
       ARM: EXYNOS: Consolidate Kconfig entries

Tomasz Figa (1):
       cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM

  arch/arm/Kconfig                     | 20 ---------
  arch/arm/mach-exynos/Kconfig         | 81 
++++++++++++------------------------
  arch/arm/mach-exynos/Makefile        |  2 +
  arch/arm/plat-samsung/Makefile       |  3 ++
  drivers/cpufreq/Kconfig.arm          |  6 +--
  drivers/cpufreq/exynos-cpufreq.c     |  2 -
  drivers/cpufreq/exynos-cpufreq.h     | 30 +++++++------
  drivers/cpufreq/exynos4210-cpufreq.c | 39 ++++++++++++++---
  drivers/cpufreq/exynos4x12-cpufreq.c | 40 +++++++++++++++---
  drivers/cpufreq/exynos5250-cpufreq.c | 43 +++++++++++++++----
  10 files changed, 151 insertions(+), 115 deletions(-)
