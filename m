From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL] Samsung non-critical fixes for v3.15
Date: Tue, 18 Mar 2014 13:27:56 +0900
Message-ID: <5327CB4C.9070905@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:39245 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750835AbaCRE2H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 00:28:07 -0400
Received: by mail-pa0-f50.google.com with SMTP id kq14so6688987pab.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Mar 2014 21:28:07 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 38dbfb59d1175ef458d006556061adeaa8751b72:

   Linus 3.14-rc1 (2014-02-02 16:42:13 -0800)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-fixes

for you to fetch changes up to baf64abc468c7583592f67197ae23fa31414b4db:

   ARM: S3C64XX: mach-crag6410-module.c is not modular (2014-02-16 
02:05:44 +0900)

----------------------------------------------------------------
Samsung non-critical fixes for v3.15
- fix typo CONFIG_CPU_S3C2443 in Kconfig
- fix G3D regulator on because of entering low power mode
   for exynos5250-arndale
- fix CONFIG_USB_EHCI_EXYNOS for exynos_defconfig
- fix initcall of mach-crag6410-module.c

----------------------------------------------------------------
Paul Bolle (1):
       ARM: S3C24XX: Fix typo CONFIG_CPUS_3C2443

Paul Gortmaker (1):
       ARM: S3C64XX: mach-crag6410-module.c is not modular

Tomasz Figa (1):
       ARM: dts: Keep G3D regulator always on for exynos5250-arndale

Tushar Behera (1):
       ARM: exynos_defconfig: Update EHCI config entry

  arch/arm/boot/dts/exynos5250-arndale.dts     | 1 +
  arch/arm/configs/exynos_defconfig            | 2 +-
  arch/arm/mach-s3c24xx/common.c               | 2 +-
  arch/arm/mach-s3c64xx/mach-crag6410-module.c | 2 +-
  4 files changed, 4 insertions(+), 3 deletions(-)
