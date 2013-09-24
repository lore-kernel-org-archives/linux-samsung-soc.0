From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [GIT PULL 1/2] Samsung Common CLK for S3C64XX
Date: Tue, 24 Sep 2013 09:39:59 +0900
Message-ID: <0c4401ceb8be$99274df0$cb75e9d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28196 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752832Ab3IXAkA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Sep 2013 20:40:00 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MTL001T7TTTPNF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Sep 2013 09:39:59 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>, 'Kevin Hilman' <khilman@linaro.org>
Cc: arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Tomasz Figa' <tomasz.figa@gmail.com>, 'Mike Turquette' <mturquette@ti.com>

The following changes since commit 272b98c6455f00884f0350f775c5342358ebb73f:

  Linux 3.12-rc1 (2013-09-16 16:17:51 -0400)

are available in the git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
tags/samsung-clk-s3c64xx

for you to fetch changes up to 66fcbe6b7c2827866100837611c9838298a28486:

  ARM: S3C64XX: Remove old clock management code (2013-09-17 06:47:36 +0900)

----------------------------------------------------------------
Common clk support for S3C64XX
- add PLL for S3C64XX
- add s3c64xx clock driver
- update drivers to use CCF of s3c64xx

----------------------------------------------------------------
Tomasz Figa (5):
      ARM: SAMSUNG: Add soc_is_s3c6400/s3c6410 macros
      ARM: S3C64XX: Use clk_prepare_enable/clk_disable_unprepare in dma.c
      usb: ohci-s3c2410.c: Use clk_prepare_enable/clk_disable_unprepare
      ARM: S3C64XX: Migrate clock handling to Common Clock Framework
      ARM: S3C64XX: Remove old clock management code

 arch/arm/Kconfig                                |    2 +-
 arch/arm/mach-s3c64xx/Makefile                  |    2 +-
 arch/arm/mach-s3c64xx/clock.c                   | 1007
-----------------------
 arch/arm/mach-s3c64xx/common.c                  |   21 +-
 arch/arm/mach-s3c64xx/common.h                  |   12 +-
 arch/arm/mach-s3c64xx/dma.c                     |    4 +-
 arch/arm/mach-s3c64xx/include/mach/regs-clock.h |  132 +--
 arch/arm/mach-s3c64xx/mach-anw6410.c            |    2 +-
 arch/arm/mach-s3c64xx/mach-crag6410.c           |    2 +-
 arch/arm/mach-s3c64xx/mach-hmt.c                |    2 +-
 arch/arm/mach-s3c64xx/mach-mini6410.c           |    2 +-
 arch/arm/mach-s3c64xx/mach-ncp.c                |    2 +-
 arch/arm/mach-s3c64xx/mach-smartq.c             |   11 +-
 arch/arm/mach-s3c64xx/mach-smdk6400.c           |    2 +-
 arch/arm/mach-s3c64xx/mach-smdk6410.c           |    2 +-
 arch/arm/mach-s3c64xx/pm.c                      |   21 -
 arch/arm/mach-s3c64xx/s3c6400.c                 |    6 -
 arch/arm/mach-s3c64xx/s3c6410.c                 |    7 -
 arch/arm/plat-samsung/include/plat/cpu.h        |    4 +
 drivers/clk/samsung/Makefile                    |    2 -
 drivers/usb/host/ohci-s3c2410.c                 |    8 +-
 21 files changed, 47 insertions(+), 1206 deletions(-)
 delete mode 100644 arch/arm/mach-s3c64xx/clock.c
