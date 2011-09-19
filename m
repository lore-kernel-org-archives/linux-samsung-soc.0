From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V5 0/6] ARM: S5P64X0: Add Framebuffer support
Date: Mon, 19 Sep 2011 13:53:55 -0400
Message-ID: <1316454841-20869-1-git-send-email-ajaykumar.rs@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:65014 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754519Ab1ISLwn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Sep 2011 07:52:43 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRR00MKEQB1EU80@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 20:52:19 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LRR00G4JQAZ9R@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 20:52:19 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com

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

 Changes since V3:
	-Add FB and LCD plat-data in corresponding machine files
	 instead of creating common file smdk64x0-common-fb.c.
	-Modify name S5P64X0_SETUP_FB to S5P64X0_SETUP_FB_24BPP.
	-Modify file name setup-fb.c to setup-fb-24bpp.c.
	-Move SPCON settings to machine file.
	-Use soc_is_s5p6440()/soc_is_s5p6450() to check CPU ID.

 Changes since V4:
	-Removed refresh rate from plat data(s3c_fb_pd_win)
	-Fixed complation warning:"function declaration isn't a prototype"
	 for s5p6440_set_lcd_interface() and s5p6450_set_lcd_interface().


  These patches have dependency on the patch:
  "ARM: S5P64X0: Fix mask value for S5P64X0 CPU IDs",
  at http://www.spinics.net/lists/arm-kernel/msg138990.html

o To Kukjin,
  [PATCH RESEND V5 1/6] video: s3c-fb: Add S5P64X0 specific s3c_fb_driverdata
  [PATCH RESEND V5 2/6] ARM: S5P64X0: Add register base and IRQ for Framebuffer
  [PATCH RESEND V5 3/6] ARM: S5P64X0: Set s3c_device_fb name
  [PATCH RESEND V5 4/6] ARM: S5P64X0: Add GPIO setup for LCD
  [PATCH V5 5/6]ARM: S5P6440: Add LCD-LTE480 and enable Framebuffer support
  [PATCH V5 6/6]ARM: S5P6450: Add LCD-LTE480 and enable Framebuffer support

 arch/arm/mach-s5p64x0/Kconfig                  |   10 +++
 arch/arm/mach-s5p64x0/Makefile                 |    1 +
 arch/arm/mach-s5p64x0/cpu.c                    |    3 +
 arch/arm/mach-s5p64x0/include/mach/irqs.h      |    4 +
 arch/arm/mach-s5p64x0/include/mach/map.h       |    3 +
 arch/arm/mach-s5p64x0/include/mach/regs-gpio.h |    4 +
 arch/arm/mach-s5p64x0/mach-smdk6440.c          |   74 +++++++++++++++++++++++
 arch/arm/mach-s5p64x0/mach-smdk6450.c          |   75 ++++++++++++++++++++++++
 arch/arm/mach-s5p64x0/setup-fb-24bpp.c         |   29 +++++++++
 arch/arm/plat-samsung/include/plat/fb.h        |    7 ++
 drivers/video/s3c-fb.c                         |   27 +++++++++
 11 files changed, 237 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/mach-s5p64x0/setup-fb-24bpp.c
