From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 4th 1/2] Samsung Exynos multiplatform for 3.16
Date: Tue, 27 May 2014 07:12:50 +0900
Message-ID: <5383BC62.6040005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:37417 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752259AbaEZWM6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 18:12:58 -0400
Received: by mail-pa0-f48.google.com with SMTP id rd3so8056934pab.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 May 2014 15:12:58 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Arnd, Olof, Kevin

Sorry for late support multiplatform on exynos and now it's possible. 
Thanks for many guys' effort and time :-)

BRs,
Kukjin

The following changes since commit dfacdfef06090ca0c131f45dfd3f3ca3452a8ed3:

   Merge branch 'v3.16-next/dt-samsung' into v3.16-next/multiplatform 
(2014-05-26 06:19:01 +0900)

are available in the git repository at:


   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/exynos-multiplatform

for you to fetch changes up to 43baa7dcb5fa0c95b1e443d2a739c14de1fbbe07:

   cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM 
(2014-05-27 06:22:53 +0900)

----------------------------------------------------------------
Exynos mutiplatform support for 3.16

Here is enabling the exynos platform as part of a multiplatform
kernel. This is including ARCH_EXYNOS related Kconfig entries
consolidation and update multi_v7_defconfig accordingly. And
fixes exynos-cpufreq driver compilation with ARCH_MULTIPLATFORM.

Note that this is based on tags/exynos-soc. And tags/samsung-dt,
tags/samsung-clk are merged on top of that.

----------------------------------------------------------------
Arnd Bergmann (1):
       ARM: EXYNOS: Enable multi-platform build support

Sachin Kamat (2):
       ARM: EXYNOS: Consolidate Kconfig entries
       ARM: multi_v7_defconfig: Enable Exynos platform

Tomasz Figa (1):
       cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM

  arch/arm/Kconfig                     | 20 ---------
  arch/arm/configs/multi_v7_defconfig  | 12 ++++++
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
  11 files changed, 163 insertions(+), 115 deletions(-)
