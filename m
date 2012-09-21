From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 1/3] ARM: EXYNOS5: Add fimd node to the exynos5250 dtsi file
Date: Fri, 21 Sep 2012 18:29:55 +0530
Message-ID: <1348232397-2477-2-git-send-email-l.krishna@samsung.com>
References: <1348232397-2477-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43990 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132Ab2IUGgP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Sep 2012 02:36:15 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAO00GYRSZ7NEQ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 15:36:14 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAO00G6VT02A030@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Sep 2012 15:36:14 +0900 (KST)
In-reply-to: <1348232397-2477-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, jg1.han@samsung.com, thomas.abraham@linaro.org

This patch adds the fimd node with compatibility string, hardware address,
interrupt line numbers to the exynos5250 dtsi file.

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index b55794b..6401c94 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -488,4 +488,11 @@
 		reg = <0x13e30000 0x1000>;
 		interrupts = <0 88 0>;
 	};
+
+	fimd {
+		compatible = "samsung,exynos5-fimd";
+		interrupt-parent = <&combiner>;
+		reg = <0x14400000 0x40000>;
+		interrupts = <18 5>, <18 4>, <18 6>;
+	};
 };
-- 
1.7.0.4
