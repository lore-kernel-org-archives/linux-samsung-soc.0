From: Tushar Behera <tushar.b@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable PL330 DMA
Date: Thu, 31 Jul 2014 11:12:39 +0530
Message-ID: <1406785359-21669-1-git-send-email-tushar.b@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14944 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262AbaGaFrF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 31 Jul 2014 01:47:05 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N9K00H2YAQFQ4A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 31 Jul 2014 14:47:03 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, olof@lixom.net, khilman@linaro.org, trblinux@gmail.com

We are getting a system hang on Arndale-Octa board if PL330_DMA is not
enabled. The issue is related to [1].

AUDSS block provides the clock for audio DMA controller. Any operation
on this clock requires that the clock to AUDSS block be enabled. In
current configuration, the clock is gated during late boot process when
all unused clocks are disabled.

When PL330_DMA is enabled, the 'apb_pclk' is enabled/disabled during
amba_probe(). Otherwise, this clock is also disabled during late boot.
If the AUDSS block clock is disabled by then, we get a system hang.

[1] https://lkml.org/lkml/2014/6/11/32

Signed-off-by: Tushar Behera <tushar.b@samsung.com>
---
 arch/arm/configs/exynos_defconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index e07a227..c5888e8 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -109,6 +109,8 @@ CONFIG_MMC_DW_IDMAC=y
 CONFIG_MMC_DW_EXYNOS=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_S3C=y
+CONFIG_DMADEVICES=y
+CONFIG_PL330_DMA=y
 CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-- 
1.7.9.5
