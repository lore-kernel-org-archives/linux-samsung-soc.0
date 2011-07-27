From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 0/7] ARM: S5P64X0: Add Framebuffer support
Date: Wed, 27 Jul 2011 13:31:11 -0400
Message-ID: <1311787878-16193-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38544 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753031Ab1G0Lj0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 07:39:26 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOZ00LYMPPNEJQ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 20:39:25 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOZ0092EPPJ2V@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Jul 2011 20:39:25 +0900 (KST)
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

  Changes since V2:
	-Change name of the config-COMMON_FB to SMDK64X0_COMMON_FB.
	-Change filename common-fb.h to smdk64x0-common-fb.h.
	-Change filename common-fb.c to smdk64x0-common-fb.c.

  [Patch RESEND V3 1/7]
	- Add "s5p64x0-fb" type driver_data(s3c_fb_driverdata).
	- Display controller in S5P64X0 supports 3 windows.

  [Patch RESEND V3 2/7]
	- Resource definitions(_MEM, _IRQ).

  [Patch RESEND V3 3/7]
	- Set s3c_device_fb name as "s5p64x0-fb".

  [Patch RESEND V3 4/7]
	- GPIO settings for LCD in S5P6440 and S5P6450.
	- Select LCD interface (RGB/i80).

  [Patch V3 5/7]
	- Creates a file to hold common FB and LCD code.
	- Add Basic FB window definition with default_bpp=24.
	- Add platform data for FB and LCD.
	- platform_device support for LCD.

  [Patch V3 6/7]
	- Enables FB support and platform-lcd support for SMDK6440.

  [Patch V3 7/7]
	- Enables FB support and platform-lcd support for SMDK6450.

  o To Paul Mundt, Jingoo han
  [Patch RESEND V3 1/7] video: s3c-fb: Add S5P64X0 specific s3c_fb_driverdata

  o To Kukjin Kim
  [Patch RESEND V3 2/7] ARM: S5P64X0: Add register base and IRQ for Framebuffer
  [Patch RESEND V3 3/7] ARM: S5P64X0: Set s3c_device_fb name
  [Patch RESEND V3 4/7] ARM: S5P64X0: Add GPIO and SPCON settings for LCD
  [Patch V3 5/7] ARM: S5P64X0: Add file to hold common Framebuffer and LCD code
  [Patch V3 6/7] ARM: S5P6440: Enable LCD-LTE480 and Framebuffer support
  [Patch V3 7/7] ARM: S5P6450: Enable LCD-LTE480 and Framebuffer support


 arch/arm/mach-s5p64x0/Kconfig                      |   17 ++++
 arch/arm/mach-s5p64x0/Makefile                     |    4 +
 arch/arm/mach-s5p64x0/cpu.c                        |    3 +
 arch/arm/mach-s5p64x0/include/mach/irqs.h          |    4 +
 arch/arm/mach-s5p64x0/include/mach/map.h           |    3 +
 arch/arm/mach-s5p64x0/include/mach/regs-gpio.h     |    4 +
 .../mach-s5p64x0/include/mach/smdk64x0-common-fb.h |   26 ++++++
 arch/arm/mach-s5p64x0/mach-smdk6440.c              |    5 +
 arch/arm/mach-s5p64x0/mach-smdk6450.c              |    5 +
 arch/arm/mach-s5p64x0/setup-fb.c                   |   48 ++++++++++
 arch/arm/mach-s5p64x0/smdk64x0-common-fb.c         |   92 ++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/fb.h            |   14 +++
 drivers/video/s3c-fb.c                             |   27 ++++++
 13 files changed, 252 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/include/mach/smdk64x0-common-fb.h
 create mode 100644 arch/arm/mach-s5p64x0/setup-fb.c
 create mode 100644 arch/arm/mach-s5p64x0/smdk64x0-common-fb.c
