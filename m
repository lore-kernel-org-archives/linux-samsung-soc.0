From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/4] ARM: dts: exynos4210-origen: Device tree fixes
Date: Mon, 19 Nov 2012 15:46:32 +0100
Message-ID: <1353336396-21161-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:38090 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751994Ab2KSOqs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Nov 2012 09:46:48 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDQ00039P1ZFY40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:46:47 +0900 (KST)
Received: from mcdsrvbld02.digital.local ([106.116.37.23])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDQ009FTP1R53A0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Nov 2012 23:46:47 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, jhkim@insignal.co.kr, m.szyprowski@samsung.com, t.figa@samsung.com, tomasz.figa@gmail.com

This patch series fixes device tree support for Origen board:
 - memory is defined using sections of maximum allowed size
 - any pin configuration is modified to use pinctrl
 - invalid properties in sdhci nodes are replaced according to current
   mmc bindings
 - a fixed vmmc voltage regulator is added

Tested on Origen board.

Depends on:
[PATCH v2 0/2] mmc: host: sdhci-s3c: Add support for pinctrl interface

Tomasz Figa (4):
  ARM: dts: exynos4210-origen: Split memory sections
  ARM: dts: exynos4210-origen: Update for pinctrl-samsung driver
  ARM: dts: exynos4210-origen: Update sdhci nodes for current bindings
  ARM: dts: exynos4210-origen: Add vmmc fixed voltage regulator

 arch/arm/boot/dts/exynos4210-origen.dts | 54 ++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

-- 
1.8.0
