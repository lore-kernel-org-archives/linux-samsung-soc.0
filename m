From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3] Update Samsung S5PC100 SoC support
Date: Tue, 17 Nov 2009 08:41:10 +0100
Message-ID: <1258443684-19525-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:11594 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754867AbZKQHmE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Nov 2009 02:42:04 -0500
Received: from eu_spt1 ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KT8003XWTE6AM00@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Nov 2009 07:42:06 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KT800KWITE5NB@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 17 Nov 2009 07:42:06 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

Hello,

This patch series updates Samsung S5PC100 SoC support. S5PC100 platform
core has been extended with new clocks hierarchy implementation, gpio lib,
support for external and gpio interrupts and some basics of power
management (cpu idle and system reset). Also platform helpers for
s3c framebuffer, i2c and hsmmc drivers has been added.

All these patches has been tested on SMDKC100 board.

This patch series has been prepared against latest ARM Kernel tree from
http://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-2.6-arm.git/

This is the third version of this patch series. I've tried to address all
the issues reported by Ben and Russel.

This patch series includes:

[PATCH 01/14] ARM: S5PC1XX: registers rename
[PATCH 02/14] ARM: S5PC1XX: clock registers rename
[PATCH 03/14] ARM: S5PC1XX: clocks reimplementation
[PATCH 04/14] ARM: S5PC1XX: add GPIO L banks to register definition
[PATCH 05/14] ARM: S5PC1XX: GPIO registers rename
[PATCH 06/14] ARM: S5PC1xx: add gpiolib and external/gpio interrupt support
[PATCH 07/14] ARM: S5PC1XX: add cpu idle and system reset support
[PATCH 08/14] ARM: S3C: Prepare s3c64xx-specific s3c-fb register definition for reuse
[PATCH 09/14] ARM: S5PC1xx: add platform helpers for s3c-fb device
[PATCH 10/14] SMDKC100: enable S3C FrameBuffer
[PATCH 11/14] ARM: S5PC1xx: add platform helpers for i2c adapter devices
[PATCH 12/14] SMDKC100: add I2C0 and I2C1 buses support
[PATCH 13/14] ARM: S5PC1xx: add platform helpers for SDHCI host controllers
[PATCH 14/14] SMDKC100: add SDHCI controllers 0, 1 and 2 support
