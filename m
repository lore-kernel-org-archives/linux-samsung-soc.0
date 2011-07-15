From: Banajit Goswami <banajit.g@samsung.com>
Subject: [PATCH 0/8] ARM: SAMSUNG: Add common PWM Backlight support
Date: Fri, 15 Jul 2011 20:12:40 +0530
Message-ID: <1310740968-26722-1-git-send-email-banajit.g@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:26816 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752498Ab1GOOmV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 10:42:21 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOD00GRWQ6IZSB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2011 23:42:20 +0900 (KST)
Received: from banajit.sisodomain.com ([107.108.83.226])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOD00F3JQ6EZC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 15 Jul 2011 23:42:19 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, jg1.han@samsung.com

 The patches are created against "for-next" branch of Kukjin Kim's tree at:
 git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

 Patch [1/8]
  -- add a common infrastructure to support PWM backlight for various 
     Samsung boards.

 Patch [2/8]
  -- Add support for PWM backlight for SMDKV310 board.

 Patch [3/8]
  -- Add support for PWM backlight for SMDKC210 board.

 Patch [4/8]
  -- Add support for PWM backlight for SMDKV210 board.

 Patch [5/8]
  -- Add support for PWM backlight for SMDKC100 board.

 Patch [6/8]
  -- Add support for PWM backlight for SMDK6440 board.

Patch [7/8]
  -- Add support for PWM backlight for SMDK6450 board.

 Patch [8/8]
  -- Add support for PWM backlight for SMDK6410 board.

 Patch 3 with PWM Backlight support for SMDKC210 is only compile tested.

   [Patch 1/8] ARM: SAMSUNG: Create a common infrastructure for PWM backlight support
   [Patch 2/8] ARM: EXYNOS4: Add PWM backlight support on Samsung SMDKV310 board
   [Patch 3/8] ARM: EXYNOS4: Add PWM backlight support on Samsung SMDKC210 board
   [Patch 4/8] ARM: S5PV210: Add PWM backlight support on Samsung SMDKV210 board
   [Patch 5/8] ARM: S5PC100: Add PWM backlight support on Samsung SMDKC100 board
   [Patch 6/8] ARM: S5P64X0: Add PWM backlight support on Samsung SMDK6440 board
   [Patch 7/8] ARM: S5P64X0: Add PWM backlight support on Samsung SMDK6450 board
   [Patch 8/8] ARM: S3C64XX: Add PWM backlight support on Samsung SMDK6410 board

 arch/arm/mach-exynos4/Kconfig                  |    4 +
 arch/arm/mach-exynos4/mach-smdkc210.c          |   16 +++
 arch/arm/mach-exynos4/mach-smdkv310.c          |   16 +++
 arch/arm/mach-s3c64xx/Kconfig                  |    1 +
 arch/arm/mach-s3c64xx/mach-smdk6410.c          |   15 ++-
 arch/arm/mach-s5p64x0/Kconfig                  |    2 +
 arch/arm/mach-s5p64x0/mach-smdk6440.c          |   54 ++-------
 arch/arm/mach-s5p64x0/mach-smdk6450.c          |   54 ++-------
 arch/arm/mach-s5pc100/Kconfig                  |    1 +
 arch/arm/mach-s5pc100/mach-smdkc100.c          |   55 ++-------
 arch/arm/mach-s5pv210/Kconfig                  |    1 +
 arch/arm/mach-s5pv210/mach-smdkv210.c          |   54 ++-------
 arch/arm/plat-samsung/Kconfig                  |    6 +
 arch/arm/plat-samsung/Makefile                 |    1 +
 arch/arm/plat-samsung/dev-backlight.c          |  151 ++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/backlight.h |   26 ++++
 16 files changed, 291 insertions(+), 166 deletions(-)
 create mode 100644 arch/arm/plat-samsung/dev-backlight.c
 create mode 100644 arch/arm/plat-samsung/include/plat/backlight.h

-- 
1.7.2.3
