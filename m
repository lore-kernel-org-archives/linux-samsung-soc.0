From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 2/7] Samsung cleanup-3 for v3.8
Date: Wed, 28 Nov 2012 09:15:16 +0900
Message-ID: <50B55794.2050902@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:42716 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751299Ab2K1APY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 27 Nov 2012 19:15:24 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so4478992dak.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Nov 2012 16:15:24 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Arnd, Olof

This is for Samsung cleanup for unused codes now.

Please pull from:
git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
next/cleanup-samsung-3

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
next/cleanup-samsung-3

Thomas Abraham (2):
       ARM: EXYNOS: Remove unused non-dt support for dwmci controller
       ARM: EXYNOS: Remove unused regs-mem.h file

  arch/arm/mach-exynos/Kconfig                 |    5 --
  arch/arm/mach-exynos/Makefile                |    1 -
  arch/arm/mach-exynos/dev-dwmci.c             |   75 
--------------------------
  arch/arm/mach-exynos/include/mach/dwmci.h    |   20 -------
  arch/arm/mach-exynos/include/mach/regs-mem.h |   23 --------
  arch/arm/plat-samsung/include/plat/devs.h    |    1 -
  6 files changed, 0 insertions(+), 125 deletions(-)
  delete mode 100644 arch/arm/mach-exynos/dev-dwmci.c
  delete mode 100644 arch/arm/mach-exynos/include/mach/dwmci.h
  delete mode 100644 arch/arm/mach-exynos/include/mach/regs-mem.h
