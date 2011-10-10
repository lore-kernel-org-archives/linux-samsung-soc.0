From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 0/4]: ARM: SAMSUNG: Add SPI clkdev support
Date: Mon, 10 Oct 2011 13:33:05 +0530
Message-ID: <1318233789-19882-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25996 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751027Ab1JJH6W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Oct 2011 03:58:22 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LSU00LUYBH8CVR0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 16:58:21 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTPA id <0LSU00CW6BH3TN20@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2011 16:58:20 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: padma.v@samsung.com, padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com

This patchset modifies the existing clkdev to make SPI driver
independent of the clock names send from platform data. This
patches enables the SPI driver to request SPI bus clocks
using generic connection ID.

V1 patch series are:
	http://www.spinics.net/lists/arm-kernel/msg141671.html

Changes since V1:
	-Add newly introduced CLKDEV_INIT macro for creating clk_lookup
	structure as suggested by Russell King
	V2 patches series are:
	http://www.spinics.net/lists/arm-kernel/msg142733.html

Changes since V2:
	-Reworked the patches as per the following link. Patch series in
	the following link removed & and , from the macro declaration and added
	in the macro defination. 
	http://www.spinics.net/lists/arm-kernel/msg143663.html

Padmavathi Venna (4):
  ARM: S3C64XX: Add SPI clkdev support
  ARM: S5PC100: Add SPI clkdev support
  ARM: S5P64X0: Add SPI clkdev support
  ARM: S5PV210: Add SPI clkdev support

 arch/arm/mach-s3c64xx/clock.c         |   98 ++++++++++++++++--------
 arch/arm/mach-s5p64x0/clock-s5p6440.c |   57 +++++++++-----
 arch/arm/mach-s5p64x0/clock-s5p6450.c |   57 +++++++++-----
 arch/arm/mach-s5pc100/clock.c         |  132 ++++++++++++++++++++-------------
 arch/arm/mach-s5pv210/clock.c         |   58 ++++++++++-----
 5 files changed, 259 insertions(+), 143 deletions(-)

-- 
1.7.4.4
