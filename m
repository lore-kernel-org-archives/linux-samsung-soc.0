From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] Add Samsung S5PC110 SoC support
Date: Wed, 18 Nov 2009 14:32:55 +0100
Message-ID: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:22391 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757007AbZKRNdo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Nov 2009 08:33:44 -0500
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KTB003154CCJT90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Nov 2009 13:33:48 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KTB00ETE4CBC9@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Nov 2009 13:33:48 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org

Hello,

This preliminary patch series adds support for Samsung S5PC110 SoC.
S5PC110 belongs to S5PC1XX family (CortexA8 ARM core), but differs in
many places from the S5PC100 SoC: new memory map, different clock
hierarchy, new gpio banks and much more powerful integrated peripherals.
Such differences cannot be easily handled in the current Samsung
machine&platform framework. To avoid duplication of code and adding yet
another plat-* directory, we decided to introduce sub-platforms in
the current s5pc1xx platform.

First 8 patches prepare s5pc1xx platform code for introduction of the
new sub-platform approach. Then in the next 11 patches all core
functions and drivers are subsequently added, so S5PC110 sub-platform
gets similar level of support as S5PC100.

This patch series has been prepared against latest ARM Kernel tree from
http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-2.6-arm.git/

I know that Ben is working hard on new Samsung SoC platform framework,
but stabilizing it and porting all the existing Samsung platforms would
take time. This sub-platform solution is already prepared and until the
new framework will be available and merged, we would like to use our
approach.

This patch series includes:

[PATCH 01/19] ARM: S5PC100: use 0x30008000 as memory base
[PATCH 02/19] ARM: S5PC1XX: create sub-platform for S5PC100 SoCs
[PATCH 03/19] ARM: S5PC1XX: prepare common cpu&clocks code for S5PC110 sub-platform
[PATCH 04/19] ARM: S5PC1XX: prepare common gpiolib code for S5PC110 sub-platform
[PATCH 05/19] ARM: S5PC1XX: move common s5pc1xx mach/* includes to plat-s5pc1xx/include/mach
[PATCH 06/19] ARM: S5PC1XX: cleanup of s5pc1xx common code
[PATCH 07/19] ARM: S5PC1XX: move s5pc100 specific device helpers to mach-s5pc100 dir
[PATCH 08/19] ARM: S5PC1XX: move common s5pc1xx s3c-fb regs to platform directory
[PATCH 09/19] drivers: serial: add support for Samsung S5PC110 SoC uart
[PATCH 10/19] ARM: S5PC1XX: add S5PC110 memory map
[PATCH 11/19] ARM: S5PC1XX: add S5PC110 cpu initialization code
[PATCH 12/19] ARM: S5PC1XX: add support for s5pc110 plls and clocks
[PATCH 13/19] ARM: S5PC1XX: add support for s5pc110 irqs
[PATCH 14/19] ARM: S5PC1XX: add support for s5pc110 gpio
[PATCH 15/19] ARM: S5PC1XX: add i2c platform helpers on s5pc110 sub-platform
[PATCH 16/19] ARM: S5PC1XX: enable S5PC110 sub-platform
[PATCH 17/19] ARM: S5PC1XX: add sdhci platform helpers for s5pc110 sub-platform
[PATCH 18/19] ARM: S5PC1XX: add framebuffer platform helpers for s5pc110 sub-platform
[PATCH 19/19] ARM: S5PC1XX: add support for SMDKC110 board
