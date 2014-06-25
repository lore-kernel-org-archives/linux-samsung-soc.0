From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH 2/3] ARM: dts: exynos5420: Add sysreg phandle to FIMD node
Date: Wed, 25 Jun 2014 19:45:51 +0530
Message-ID: <1403705752-24469-3-git-send-email-ajaykumar.rs@samsung.com>
References: <1403705752-24469-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55336 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757215AbaFYOTN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 10:19:13 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7Q008N8AFZ0WD0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 25 Jun 2014 23:19:11 +0900 (KST)
In-reply-to: <1403705752-24469-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, joshi@samsung.com, prashanth.g@samsung.com, vikas.sajjan@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Add sysreg phandle to FIMD node so that we are able
to control DISP1BLK configuration in FIMD driver.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index e385322..4be3090 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -521,6 +521,7 @@
 		samsung,power-domain = <&disp_pd>;
 		clocks = <&clock CLK_SCLK_FIMD1>, <&clock CLK_FIMD1>;
 		clock-names = "sclk_fimd", "fimd";
+		samsung,sysreg-phandle = <&sysreg_system_controller>;
 	};
 
 	adc: adc@12D10000 {
-- 
1.7.9.5
