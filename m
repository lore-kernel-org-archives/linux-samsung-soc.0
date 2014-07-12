From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung fixes-3 for 3.16
Date: Sun, 13 Jul 2014 07:23:05 +0900
Message-ID: <53C1B549.1060706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:39694 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751691AbaGLWX1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Jul 2014 18:23:27 -0400
Received: by mail-pa0-f44.google.com with SMTP id rd3so3352042pab.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jul 2014 15:23:26 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit cd3de83f147601356395b57a8673e9c5ff1e59d1:

   Linux 3.16-rc4 (2014-07-06 12:37:51 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes-3

for you to fetch changes up to bed7118988ef48063c72f67cc2701c72663b3870:

   ARM: EXYNOS: Register cpuidle device only on exynos4210 and 5250 
(2014-07-11 08:15:32 +0900)

----------------------------------------------------------------
Samsung fixes-3 for v3.16
- update the parent for Auudss clock because kernel will be hang
   during late boot if the parent clock is disabled in bootloader.
- enable clk handing in power domain because while power domain
   on/off, its regarding clock source will be reset and it causes
   a problem so need to handle it.
- add mux clocks to be used by power domain for exynos5420-mfc
   during power domain on/off and property in device tree also.
- register cpuidle only for exynos4210 and exynos5250 because a
   system failure will be happened on other exynos SoCs.

----------------------------------------------------------------
Arun Kumar K (2):
       clk: exynos5420: Add IDs for clocks used in PD mfc
       ARM: dts: Add clock property for mfc_pd in exynos5420

Prathyush K (1):
       ARM: EXYNOS: Add support for clock handling in power domain

Tomasz Figa (1):
       ARM: EXYNOS: Register cpuidle device only on exynos4210 and 5250

Tushar Behera (1):
       ARM: dts: Update the parent for Audss clocks in Exynos5420

  .../bindings/arm/exynos/power_domain.txt           | 20 +++++++
  arch/arm/boot/dts/exynos5420.dtsi                  |  5 +-
  arch/arm/mach-exynos/exynos.c                      |  6 +--
  arch/arm/mach-exynos/pm_domains.c                  | 61 
+++++++++++++++++++++-
  drivers/clk/samsung/clk-exynos5420.c               |  6 ++-
  include/dt-bindings/clock/exynos5420.h             |  2 +
  6 files changed, 92 insertions(+), 8 deletions(-)
