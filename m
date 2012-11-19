From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/5] ARM: dts: exynos4210-trats: Device tree extension
Date: Mon, 19 Nov 2012 15:45:24 +0100
Message-ID: <1353336329-20818-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:11389 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994Ab2KSOpn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 09:45:43 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDQ008X7P05ZPJ0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:45:41 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDQ009O9OZWSZ80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:45:41 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch series extends device tree support for Trats board.

It adds support for pinctrl, GPIO keys and touchscreen to Trats dts file.

Tested on Trats board.

Depends on:
[PATCH] i2c: i2c-s3c2410: Add support for pinctrl
[PATCH v2 0/2] mmc: host: sdhci-s3c: Add support for pinctrl interface

Tomasz Figa (5):
  ARM: dts: exynos4210-trats: Update for pinctrl-samsung driver
  ARM: dts: exynos4210-trats: Add nodes for GPIO keys available on
    Trats
  ARM: dts: exynos4210-trats: Add node for i2c3 bus
  ARM: dts: exynos4210-trats: Add node for touchscreen voltage
    regulator
  ARM: dts: exynos4210-trats: Add node for touchscreen

 arch/arm/boot/dts/exynos4210-trats.dts | 86 +++++++++++++++++++++++++++-------
 1 file changed, 70 insertions(+), 16 deletions(-)

-- 
1.8.0
