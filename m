From: Vikas Sajjan <vikas.sajjan@samsung.com>
Subject: [PATCH V2 3/3] ARM: dts: Add node for GPIO keys on SMDK5420
Date: Thu, 27 Mar 2014 11:43:05 +0530
Message-ID: <1395900785-11334-4-git-send-email-vikas.sajjan@samsung.com>
References: <1395900785-11334-1-git-send-email-vikas.sajjan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35594 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751329AbaC0GNJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Mar 2014 02:13:09 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N32001JVZXVJ970@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 27 Mar 2014 15:13:07 +0900 (KST)
In-reply-to: <1395900785-11334-1-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, sajjan.linux@gmail.com, Abhilash Kesavan <a.kesavan@samsung.com>, Vikas Sajjan <vikas.sajjan@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

Add support for the suspend/resume button (SW7) on SMDK5420 using
gpio-keys driver.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 6910485..5ae0dd4 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -158,6 +158,17 @@
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		wakeup {
+			label = "SW7";
+			gpios = <&gpx0 0 1>;
+			linux,code = <143>;	/* KEY_WAKEUP */
+			gpio-key,wakeup;
+		};
+	};
+
 	hsi2c_4: i2c@12CA0000 {
 		status = "okay";
 
-- 
1.7.9.5
