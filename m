From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 01/10] Samsung cleanup-1 for v3.11
Date: Wed, 19 Jun 2013 04:59:51 +0900
Message-ID: <51C0BC37.7090604@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:56798 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932908Ab3FRT7z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Jun 2013 15:59:55 -0400
Received: by mail-pd0-f180.google.com with SMTP id 10so4246510pdi.39
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2013 12:59:54 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, Tushar Behera <tushar.behera@linaro.org>


The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:

   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)

are available in the git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
tags/samsung-cleanup-1

for you to fetch changes up to db3824e6bf0b0f421b0d43f08d905935e826a965:

   ARM: SAMSUNG: Remove unused plat/regs-watchdog.h header (2013-06-19 
03:13:18 +0900)

----------------------------------------------------------------
- Consolidate uncompress subroutines and s5p64x0-uncompress
- Cleanup watchdog support on Samsung to support multiplatform

----------------------------------------------------------------
Tomasz Figa (7):
       ARM: S5P64X0: Use common uncompress.h part for plat-samsung
       watchdog: s3c2410_wdt: Use local register definitions
       ARM: SAMSUNG: Use local definitions of watchdog registers
       ARM: SAMSUNG: Add watchdog reset driver
       ARM: SAMSUNG: Let platforms use the new watchdog reset driver
       ARM: SAMSUNG: Remove legacy watchdog reset code
       ARM: SAMSUNG: Remove unused plat/regs-watchdog.h header

Tushar Behera (1):
       ARM: SAMSUNG: Consolidate uncompress subroutine

  arch/arm/Kconfig                                   |   3 +
  arch/arm/mach-exynos/include/mach/uncompress.h     |   3 -
  arch/arm/mach-s3c24xx/Kconfig                      |   2 +
  arch/arm/mach-s3c24xx/include/mach/uncompress.h    |   3 +
  arch/arm/mach-s3c24xx/s3c2410.c                    |   3 +-
  arch/arm/mach-s3c24xx/s3c244x.c                    |   3 +-
  arch/arm/mach-s3c64xx/common.c                     |   8 +-
  arch/arm/mach-s3c64xx/include/mach/uncompress.h    |   3 +
  arch/arm/mach-s5p64x0/common.c                     |   4 +-
  arch/arm/mach-s5p64x0/include/mach/uncompress.h    | 162 
+--------------------
  arch/arm/mach-s5pc100/common.c                     |   3 +-
  arch/arm/mach-s5pc100/include/mach/uncompress.h    |   2 +
  arch/arm/mach-s5pv210/include/mach/uncompress.h    |   2 +
  arch/arm/plat-samsung/Kconfig                      |   6 +
  arch/arm/plat-samsung/Makefile                     |   1 +
  arch/arm/plat-samsung/include/plat/regs-watchdog.h |  41 ------
  arch/arm/plat-samsung/include/plat/uncompress.h    |  21 ++-
  .../arm/plat-samsung/include/plat/watchdog-reset.h |  38 +----
  arch/arm/plat-samsung/watchdog-reset.c             |  97 ++++++++++++
  drivers/watchdog/s3c2410_wdt.c                     |  17 ++-
  20 files changed, 174 insertions(+), 248 deletions(-)
  delete mode 100644 arch/arm/plat-samsung/include/plat/regs-watchdog.h
  create mode 100644 arch/arm/plat-samsung/watchdog-reset.c
