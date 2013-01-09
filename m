From: Prasanna Kumar <prasanna.ps@samsung.com>
Subject: [PATCH 0/2] ARM: Exynos5 : Add Power domain device tree support for
 MFC and GSC
Date: Wed, 09 Jan 2013 17:45:31 +0530
Message-ID: <1357733733-18769-1-git-send-email-prasanna.ps@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:15345 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757532Ab3AIMLS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Jan 2013 07:11:18 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MGC00IKCXURZ6G0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:11:17 +0900 (KST)
Received: from user-ubuntu.sisodomain.com ([107.108.83.235])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MGC00D24XT4IT90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Jan 2013 21:11:17 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com
Cc: Prasanna Kumar <prasanna.ps@samsung.com>

Hello all,

This patch set adds device tree support for power domains (Gscaler and
MFC) of exynos5

Prasanna Kumar (2):
  arm: exynos5: Enable PM generic domain support in Kconfig
  ARM: dts: exynos5: Set up power domain for  MFC and G-scaler

 arch/arm/boot/dts/exynos5250.dtsi |   15 +++++++++++++++
 arch/arm/mach-exynos/Kconfig      |    1 +
 2 files changed, 16 insertions(+), 0 deletions(-)

-- 
1.7.5.4
