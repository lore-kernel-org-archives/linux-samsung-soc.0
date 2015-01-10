From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 2/2] arm: dts: disable CCI on exynos420 based arndale-octa
Date: Sat, 10 Jan 2015 08:41:36 +0530
Message-ID: <1420859496-27533-2-git-send-email-a.kesavan@samsung.com>
References: <1420859496-27533-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:58091 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754088AbbAJDTN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jan 2015 22:19:13 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NHX0078KYJZC210@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 10 Jan 2015 12:19:11 +0900 (KST)
In-reply-to: <1420859496-27533-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, arm@kernel.org, arnd@arndb.de, khilman@kernel.org, olof@lixom.net
Cc: linux-samsung-soc@vger.kernel.org, kesavan.abhilash@gmail.com, sudeep.holla@arm.com, nicolas.pitre@linaro.org, Punit.Agrawal@arm.com, Will.Deacon@arm.com, Mark.Rutland@arm.com, k.kozlowski@samsung.com

The arndale-octa board was giving "imprecise external aborts" during
boot-up with MCPM enabled. CCI enablement of the boot cluster was found
to be the cause of these aborts (possibly because the secure f/w was not
allowing it). Hence, disable CCI for the arndale-octa board.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Tested-by: Kevin Hilman <khilman@linaro.org>
Tested-by: Tyler Baker <tyler.baker@linaro.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 4 ++++
 arch/arm/boot/dts/exynos5420.dtsi             | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index aa7a7d7..db2c1c4 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -372,3 +372,7 @@
 &usbdrd_dwc3_1 {
 	dr_mode = "host";
 };
+
+&cci {
+	status = "disabled";
+};
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 517e50f..0a82ae7 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -120,7 +120,7 @@
 		};
 	};
 
-	cci@10d20000 {
+	cci: cci@10d20000 {
 		compatible = "arm,cci-400";
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.2.0
