From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2]  ARM: S5PC210: I2C devices updates
Date: Thu, 07 Oct 2010 14:46:38 +0200
Message-ID: <1286455601-25360-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:46599 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755418Ab0JGMqq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Oct 2010 08:46:46 -0400
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L9X00G307HW1520@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 13:46:44 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L9X00CVO7HVP1@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Oct 2010 13:46:44 +0100 (BST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

Hello,

This is an updated version of I2C patches posted by Kyungmin Park in
'[PATCH 0/7] ARM: S5PC210: I2C devices support and Universal board
updates' thread.

All issues related to i2c device definitions reported by Kukjin Kim have
been fixed. We also merged some of the patches together to avoid build
breaks.

Best regards
-- 
Marek Szyprowski
Samsung Poland R&D Center

---

Patch summary:

Kyungmin Park (3):
  ARM: S5PC110: Fix wrong interrupt I2C2 and I2C3 number
  ARM: S5PC210: Define address & interrupt for all I2C blocks
  ARM: S5PC210: add I2C{3, 4, 5, 6, 7} device support

 arch/arm/mach-s5pv210/include/mach/irqs.h |    4 +-
 arch/arm/mach-s5pv310/Kconfig             |   25 +++++++++++
 arch/arm/mach-s5pv310/Makefile            |    5 ++
 arch/arm/mach-s5pv310/include/mach/irqs.h |    7 +++
 arch/arm/mach-s5pv310/include/mach/map.h  |   11 ++++-
 arch/arm/mach-s5pv310/setup-i2c3.c        |   25 +++++++++++
 arch/arm/mach-s5pv310/setup-i2c4.c        |   25 +++++++++++
 arch/arm/mach-s5pv310/setup-i2c5.c        |   25 +++++++++++
 arch/arm/mach-s5pv310/setup-i2c6.c        |   25 +++++++++++
 arch/arm/mach-s5pv310/setup-i2c7.c        |   25 +++++++++++
 arch/arm/plat-samsung/Kconfig             |   25 +++++++++++
 arch/arm/plat-samsung/Makefile            |    5 ++
 arch/arm/plat-samsung/dev-i2c2.c          |    4 +-
 arch/arm/plat-samsung/dev-i2c3.c          |   68 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/dev-i2c4.c          |   68 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/dev-i2c5.c          |   68 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/dev-i2c6.c          |   68 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/dev-i2c7.c          |   68 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/iic.h  |    5 ++
 19 files changed, 550 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/mach-s5pv310/setup-i2c3.c
 create mode 100644 arch/arm/mach-s5pv310/setup-i2c4.c
 create mode 100644 arch/arm/mach-s5pv310/setup-i2c5.c
 create mode 100644 arch/arm/mach-s5pv310/setup-i2c6.c
 create mode 100644 arch/arm/mach-s5pv310/setup-i2c7.c
 create mode 100644 arch/arm/plat-samsung/dev-i2c3.c
 create mode 100644 arch/arm/plat-samsung/dev-i2c4.c
 create mode 100644 arch/arm/plat-samsung/dev-i2c5.c
 create mode 100644 arch/arm/plat-samsung/dev-i2c6.c
 create mode 100644 arch/arm/plat-samsung/dev-i2c7.c

-- 
1.7.1.569.g6f426
