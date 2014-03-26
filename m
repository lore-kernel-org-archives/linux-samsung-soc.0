From: Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 1/3] ARM: dts: fix incorrect compatible for exynos4412
Date: Wed, 26 Mar 2014 16:08:24 +0900
Message-ID: <53327CE8.4090309@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:53403 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751147AbaCZHIZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Mar 2014 03:08:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>

This patch fixed incorrect compatible for ak8975 magnetic sensor.
ak8975 magnetic sensor use compatible "ak8975" or "asahi-kasei,ak8975".

Signed-off-by: Beomho Seo <beomho.seo@samsung.com>
Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 3228506..42418e2 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -494,7 +494,7 @@
 		status = "okay";

 		ak8975@0c {
-			compatible = "ak,ak8975";
+			compatible = "ak8975";
 			reg = <0x0c>;
 			gpios = <&gpj0 7 0>;
 		};
-- 
1.7.9.5
