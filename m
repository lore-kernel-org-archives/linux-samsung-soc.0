From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 13/19] arm64: exynos5433: Enable ARMv8-based Exynos5433 SoC
 support
Date: Tue, 02 Dec 2014 17:49:50 +0900
Message-ID: <1417510196-6714-14-git-send-email-cw00.choi@samsung.com>
References: <1417510196-6714-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13699 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751388AbaLBIuI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 2 Dec 2014 03:50:08 -0500
In-reply-to: <1417510196-6714-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kgene.kim@samsung.com, mark.rutland@arm.com, marc.zyngier@arm.com, arnd@arndb.de, olof@lixom.net, catalin.marinas@arm.com, will.deacon@arm.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com, kyungmin.park@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, geunsik.lim@samsung.com, sw0312.kim@samsung.com, jh80.chung@samsung.com, cw00.choi@samsung.com, a.kesavan@samsung.com, pankaj.dubey@samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patch adds the necessary Kconfig entries to enable
support for the ARMv8 based Exynos5433 SoC.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will.deacon@arm.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Geunsik Lim <geunsik.lim@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
---
 arch/arm64/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fa708a0..3fa5d91 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -146,6 +146,16 @@ config ARCH_EXYNOS
 	help
 	  This enables support for Samsung Exynos SoC family
 
+config ARCH_EXYNOS5433
+	bool "ARMv8 based Samsung Exynos5433"
+	select ARCH_EXYNOS
+	select COMMON_CLK_SAMSUNG
+	select PINCTRL
+	select PINCTRL_EXYNOS
+
+	help
+	  This enables support for Samsung Exynos5433 SoC family
+
 config ARCH_EXYNOS7
 	bool "ARMv8 based Samsung Exynos7"
 	select ARCH_EXYNOS
-- 
1.8.5.5
