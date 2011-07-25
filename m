From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V2 0/7] ARM: S5P64X0: Add Framebuffer support
Date: Mon, 25 Jul 2011 16:00:18 -0400
Message-ID: <1311624025-2643-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:20863 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751178Ab1GYOIz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jul 2011 10:08:55 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOW0003Z7ATM8F0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 23:08:53 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOW00ITF7ANNI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Jul 2011 23:08:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com, m.szyprowski@samsung.com

  The patches are created against "for-next" branch of Kukjin Kim's tree at:
  git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git


  Changes since V1:
	- Remove mach/regs-fb.h, instead use plat/regs-fb.h.
	- Add common pdata for FB and LCD in SMDK6440 and SMDK6450.
	- Modify names(s5p-->smdk), max_bpp and refresh rate.
	- Modify variable name(cfg-->chipid).
	- Use __raw_readl, __raw_writel instead of readl and writel.


  [Patch RESEND 1/7]
	- Add "s5p64x0-fb" type driver_data(s3c_fb_driverdata).
	- Display controller in S5P64X0 supports 3 windows.

  [Patch V2 2/7]
	- Resource definitions(_MEM, _IRQ).

  [Patch RESEND 3/7]
	- Set s3c_device_fb name as "s5p64x0-fb".

  [Patch V2 4/7]
	- GPIO settings for LCD in S5P6440 and S5P6450.
	- Select LCD interface (RGB/i80).

  [Patch V2 5/7]
	- Creates a file to hold common FB and LCD code.
	- Add Basic FB window definition with default_bpp=24.
	- Add platform data for FB and LCD.
	- platform_device support for LCD.

  [Patch V2 6/7]
	- Enables FB support and platform-lcd support for SMDK6440.

  [Patch V2 7/7]
	- Enables FB support and platform-lcd support for SMDK6450.

  o To Paul Mundt, Jingoo han
  [Patch RESEND 1/7] video: s3c-fb: Add S5P64X0 specific s3c_fb_driverdata
 
  o To Kukjin Kim
  [Patch V2 2/7] ARM: S5P64X0: Add register base and IRQ for Framebuffer
  [Patch RESEND 3/7] ARM: S5P64X0: Set s3c_device_fb name
  [Patch V2 4/7] ARM: S5P64X0: Add GPIO and SPCON settings for LCD
  [Patch V2 5/7] ARM: S5P64X0: Add file to hold common Framebuffer and LCD code
  [Patch V2 6/7] ARM: S5P6440: Enable LCD-LTE480 and Framebuffer support
  [Patch V2 7/7] ARM: S5P6450: Enable LCD-LTE480 and Framebuffer support


 arch/arm/mach-s5p64x0/Kconfig                  |   17 +++++
 arch/arm/mach-s5p64x0/Makefile                 |    4 +
 arch/arm/mach-s5p64x0/common-fb.c              |   92 ++++++++++++++++++++++++
 arch/arm/mach-s5p64x0/cpu.c                    |    3 +
 arch/arm/mach-s5p64x0/include/mach/common-fb.h |   26 +++++++
 arch/arm/mach-s5p64x0/include/mach/irqs.h      |    4 +
 arch/arm/mach-s5p64x0/include/mach/map.h       |    3 +
 arch/arm/mach-s5p64x0/include/mach/regs-gpio.h |    4 +
 arch/arm/mach-s5p64x0/mach-smdk6440.c          |    5 ++
 arch/arm/mach-s5p64x0/mach-smdk6450.c          |    5 ++
 arch/arm/mach-s5p64x0/setup-fb.c               |   48 ++++++++++++
 arch/arm/plat-samsung/include/plat/fb.h        |   14 ++++
 drivers/video/s3c-fb.c                         |   27 +++++++
 13 files changed, 252 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/common-fb.c
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/common-fb.h
 create mode 100644 arch/arm/mach-s5p64x0/setup-fb.c
