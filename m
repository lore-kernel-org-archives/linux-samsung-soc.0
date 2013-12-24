From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH RFC 10/11] ARM: dts: exynos4: Add node for L2 cache controller
Date: Tue, 24 Dec 2013 15:14:33 +0100
Message-ID: <1387894474-14428-10-git-send-email-t.figa@samsung.com>
References: <1387894474-14428-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:45225 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752085Ab3LXOPK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Dec 2013 09:15:10 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MYB00A6CE99GC60@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Dec 2013 14:15:09 +0000 (GMT)
In-reply-to: <1387894474-14428-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index a73eeb5..e721bdb 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -99,6 +99,12 @@
 		reg = <0x10440000 0x1000>;
 	};
 
+	cache-controller@10502000 {
+		compatible = "arm,pl310-cache";
+		reg = <0x10502000 0x1000>;
+		arm,tag-latency = <1 1 0>;
+	};
+
 	sys_reg: sysreg {
 		compatible = "samsung,exynos4-sysreg", "syscon";
 		reg = <0x10010000 0x400>;
-- 
1.8.4.3
