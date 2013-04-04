From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/4] ARM: dts: update device tree for exynos5440
Date: Thu,  4 Apr 2013 19:46:43 +0900
Message-ID: <1365072407-4320-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:51160 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757619Ab3DDKrE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 06:47:04 -0400
Received: by mail-pd0-f181.google.com with SMTP id y10so1356231pdj.26
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2013 03:47:03 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org

This patch updates device tree for exynos5440 including for PMU, PDMA0 and GMAC.

 arch/arm/boot/dts/exynos5440-ssdk5440.dts |    6 +----
 arch/arm/boot/dts/exynos5440.dtsi         |   35 ++++++++++++++++++++++------
 2 files changed, 28 insertions(+), 13 deletions(-)

[PATCH 1/4] ARM: dts: Add node for GMAC for exynos5440
[PATCH 2/4] ARM: dts: add PDMA0 changes for exynos5440
[PATCH 3/4] ARM: dts: add PMU support in exynos5440
[PATCH 4/4] ARM: dts: update bootargs to boot from sda2 for
