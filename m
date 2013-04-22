From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 0/2] ARM: Exynos: Add DT based I/O mapping for Chip-ID
 controller
Date: Mon, 22 Apr 2013 17:05:06 +0530
Message-ID: <1366630508-26101-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:9911 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751241Ab3DVLSn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Apr 2013 07:18:43 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MLN00M20M35CUE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Apr 2013 20:18:42 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org
Cc: grant.likely@secretlab.ca, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, t.figa@samsung.com, arnd@arndb.de

Changes since v1:
- Rebased to v3.9-rc8

This patch series allows device tree enabled platforms to setup a runtime
I/O mapping for the chip-id controller. This helps to remove statically
defined I/O mapping for the Chip-ID controller. This series is based on
linux-next master branch and tested for Exynos4210, Exynos5250 and
Exynos5440.

Thomas Abraham (2):
  ARM: Exynos: Create virtual I/O mapping for Chip-ID controller using device tree
  ARM: dts: Add chip-id controller node on Exynos4/5 SoC
