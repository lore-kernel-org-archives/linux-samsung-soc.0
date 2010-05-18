From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: (unknown)
Date: Tue, 18 May 2010 12:38:38 +0200
Message-ID: <1274179129-14659-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12693 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752059Ab0ERKiz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 06:38:55 -0400
Received: from eu_spt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2M003X42WSMB@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 11:38:52 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2M00F0D2WRKI@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 11:38:52 +0100 (BST)
Subject: 
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Hello,

This patch series perform a general cleanup in Samsung S5PC100 SoC support.
This chip is moved from custom s5pc1xx platform framework to new plat-s5p
framework, so more common code can be easily reused in upcomming extensions
for S5PV210/S5PC110 SoCs.

This patch series is prepared against next-samsung tree, with assumption
that the "[PATCH v3] ARM: S5PC100: Pre-requisite clock patch for
plat-s5pc1xx to plat-s5p" has been applied as well as the '[PATCH v6]
ARM: S5PV210: Add Ext interrupt support' (with additional bug fixes).

I've tried to split my changes as much as possible to clearly show how the
transition from plat-s5pc1xx to plat-s5p is being done.

Changes since v2:
- fixed some whitespace/tabs errors
- removed external interrupt code, a common code from plat-s5p will be used
- moved SMDKC100 fixes to separate patch series

Changes since v1:
- bases on completely new clock code provided by Kukjin Kim
- added some plat-s5p fixes required for transition
- removed custom functions from gpiolib implementation (now uses common
  code from plat-samsung)
- restructured the changes to avoid breaking the functionality beteen the
  patches
- some other minor cleanups (mainly c1xx to c100 renames)

This patch series includes:

[PATCH 01/11] drivers: serial: S5PC100 serial driver cleanup
[PATCH 02/11] ARM: S5PC100: Use common functions for gpiolib implementation
[PATCH 03/11] ARM: S5PC100: Move gpio support from plat-s5pc1xx to mach-s5pc100
[PATCH 04/11] ARM: S5PC100: gpio.h cleanup
[PATCH 05/11] ARM: S5PC100: Move frame buffer helpers from plat-s5pc1xx to mach-s5pc100
[PATCH 06/11] ARM: S5PC100: Move i2c helpers from plat-s5pc1xx to mach-s5pc100
[PATCH 07/11] ARM: S5PC100: Move sdhci helpers from plat-s5pc1xx to mach-s5pc100
[PATCH 08/11] ARM: Samsung: move S5PC100 support from plat-s5pc1xx to plat-s5p framework
[PATCH 09/11] ARM: S5PC100: Add support for gpio interrupt
[PATCH 10/11] ARM: S5PC100: use common plat-s5p external interrupt code
[PATCH 11/11] ARM: remove obsolete plat-s5pc1xx directory

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
