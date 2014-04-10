From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 12/27] ARM: dts: exynos3250: Add default interrupt-parent
 connected with GIC
Date: Thu, 10 Apr 2014 19:06:02 +0900
Message-ID: <1397124377-16969-4-git-send-email-cw00.choi@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53305 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965744AbaDJKGv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Apr 2014 06:06:51 -0400
In-reply-to: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patch add interrupt-parent node to connected with GIC.
All interrupt-related dt nodes need default interrupt-parent node.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index fe8960e..13efdbed 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -21,6 +21,7 @@
 
 / {
 	compatible = "samsung,exynos3250";
+	interrupt-parent = <&gic>;
 
 	chipid@10000000 {
 		compatible = "samsung,exynos4210-chipid";
-- 
1.8.0
