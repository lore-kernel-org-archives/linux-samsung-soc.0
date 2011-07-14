From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 0/6] ARM: S5P64X0: Add Framebuffer support
Date: Thu, 14 Jul 2011 09:27:10 -0400
Message-ID: <1310650036-28836-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:51324 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753712Ab1GNHhu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jul 2011 03:37:50 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOB00B5FBTPUHR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Jul 2011 16:37:48 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOB00FOKBUT2D@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Jul 2011 16:37:48 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lethal@linux-sh.org, jg1.han@samsung.com

	The patches are created against "for-next" branch of Kukjin Kim's tree at:
	git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git

	Patch [1/6]
	-- add "s5p64x0-fb" type driver_data(s3c_fb_driverdata).
	-- Display controller in S5P64X0 supports 3 windows.

	Patch [2/6]
	-- Resource definitions(_MEM, _IRQ).

	Patch [3/6]
	-- Set s3c_device_fb name as "s5p64x0-fb"
	   for S5P6440 and S5P6450.

	Patch [4/6]
	-- GPIO settings for LCD in S5P6440 and S5P6450.
	-- Select LCD interface type (RGB/i80)

	Patch [5/6]
	-- Add support for LCD-LTE480 platform device in SMDK6440.
	-- Platform data for FB and a basic window definition.
	-- Enables FB support and platform-lcd support.
	-- Add support for window 0 with 24 BPP.

	Patch [6/6]
	-- Add support for LCD-LTE480 platform device in SMDK6450.
	-- Platform data for FB and a basic window definition.
	-- Enables FB support and platform-lcd support.
	-- Add support for window 0 with 24 BPP.

 o To Paul Mundt, Jingoo Han
   [Patch 1/6] video: s3c-fb: Add S5P64X0 specific s3c_fb_driverdata

 o To Kukjin Kim
   [Patch 2/6] ARM: S5P64X0: Add register base and IRQ for Framebuffer
   [Patch 3/6] ARM: S5P64X0: Set s3c_device_fb name
   [Patch 4/6] ARM: S5P64X0: Add GPIO and SPCON settings for LCD
   [Patch 5/6] ARM: S5P6440: Add LCD-LTE480 and enable Framebuffer support
   [Patch 6/6] ARM: S5P6450: Add LCD-LTE480 and enable Framebuffer support


 arch/arm/mach-s5p64x0/Kconfig                  |   10 ++++
 arch/arm/mach-s5p64x0/Makefile                 |    1 +
 arch/arm/mach-s5p64x0/cpu.c                    |    3 +
 arch/arm/mach-s5p64x0/include/mach/irqs.h      |    4 ++
 arch/arm/mach-s5p64x0/include/mach/map.h       |    3 +
 arch/arm/mach-s5p64x0/include/mach/regs-fb.h   |   19 +++++++
 arch/arm/mach-s5p64x0/include/mach/regs-gpio.h |    4 ++
 arch/arm/mach-s5p64x0/mach-smdk6440.c          |   63 +++++++++++++++++++++++
 arch/arm/mach-s5p64x0/mach-smdk6450.c          |   63 +++++++++++++++++++++++
 arch/arm/mach-s5p64x0/setup-fb.c               |   48 ++++++++++++++++++
 arch/arm/plat-samsung/include/plat/fb.h        |   14 +++++
 drivers/video/s3c-fb.c                         |   64 ++++++++++++++++++++++++
 12 files changed, 296 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/regs-fb.h
 create mode 100644 arch/arm/mach-s5p64x0/setup-fb.c
