From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 5/6] remove non-DT for exynos
Date: Wed, 12 Jun 2013 06:09:03 +0900
Message-ID: <51B791EF.9070904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:44897 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755904Ab3FKVJH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Jun 2013 17:09:07 -0400
Received: by mail-pa0-f54.google.com with SMTP id kx10so3594444pab.41
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jun 2013 14:09:07 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:

   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/remove-nondt-exynos

for you to fetch changes up to 8661bc149b95b5d4298b4ffd55c298972c4820d1:

   ARM: exynos4_defconfig: remove non-DT configuration (2013-06-10 
18:37:01 +0900)

----------------------------------------------------------------
remove non DT support for exynos

----------------------------------------------------------------
Kukjin Kim (2):
       ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
       ARM: exynos4_defconfig: remove non-DT configuration

  arch/arm/configs/exynos4_defconfig |  68 --------
  arch/arm/mach-exynos/Kconfig       | 320 
+-----------------------------------
  arch/arm/mach-exynos/Makefile      |  26 ---
  arch/arm/mach-exynos/common.c      |  10 --
  arch/arm/mach-exynos/dev-ahci.c    | 255 -----------------------------
  arch/arm/mach-exynos/dev-ohci.c    |  52 ------
  arch/arm/mach-exynos/dma.c         | 322 
-------------------------------------
  arch/arm/mach-exynos/pm_domains.c  |   7 -
  8 files changed, 1 insertion(+), 1059 deletions(-)
  delete mode 100644 arch/arm/configs/exynos4_defconfig
  delete mode 100644 arch/arm/mach-exynos/dev-ahci.c
  delete mode 100644 arch/arm/mach-exynos/dev-ohci.c
  delete mode 100644 arch/arm/mach-exynos/dma.c
