From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 0/5] Avoid passing clks through platform data
Date: Tue, 06 Nov 2012 10:18:32 +0530
Message-ID: <1352177317-16395-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:49086 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753297Ab2KFEqF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 5 Nov 2012 23:46:05 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD1002HOUKL4H10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:46:03 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MD100EM1UJ3W290@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 06 Nov 2012 13:46:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: padma.v@samsung.com, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com

Changes since v2: 
	- Rebased on 3.7-rc3

I2S controller has an internal mux for RCLK source clks. The list
of source clk names were passed through platform data in non-dt case.
The variable holding the list of RCLK source clk names is not
required, as the list of clks need to be registered with clkdev
using generic connection id. This is required as part of adding DT
support for I2S controller driver.

In the below series of patches, registered the existed clks with
clkdev using generic connection id and removed the variable which
holds those clk names. This is done for s3c64xx,s5pc100,s5p64x0,
s5pv210 and exynos4 series. But tested the sound card detection
only on smdk6410 board. On remaining all platforms it was just
build tested.

Padmavathi Venna (5):
  ARM: S3C64XX: Add I2S clkdev support
  ARM: S5PC100: Add I2S clkdev support
  ARM: S5P64x0: Add I2S clkdev support
  ARM: S5PV210: Avoid passing the clks through platform data
  ARM: Exynos: Avoid passing the clks through platform data

 arch/arm/mach-exynos/dev-audio.c      |   12 ---
 arch/arm/mach-s3c64xx/clock.c         |  126 ++++++++++++++++++++-------------
 arch/arm/mach-s3c64xx/dev-audio.c     |   11 ---
 arch/arm/mach-s5p64x0/clock-s5p6440.c |   49 +++++++++----
 arch/arm/mach-s5p64x0/clock-s5p6450.c |   61 +++++++++++-----
 arch/arm/mach-s5p64x0/dev-audio.c     |   12 ---
 arch/arm/mach-s5pc100/clock.c         |   48 ++++++++-----
 arch/arm/mach-s5pc100/dev-audio.c     |   16 ----
 arch/arm/mach-s5pv210/dev-audio.c     |   16 ----
 9 files changed, 182 insertions(+), 169 deletions(-)

-- 
1.7.4.4
