From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 2/2] ARM: dts: Add node for GPIO keys on SMDK5420
Date: Mon, 16 Dec 2013 17:31:11 +0530
Message-ID: <1387195271-3613-2-git-send-email-a.kesavan@samsung.com>
References: <1387195271-3613-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:51366 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753285Ab3LPMAk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Dec 2013 07:00:40 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MXW00CP6EP3P490@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 16 Dec 2013 21:00:39 +0900 (KST)
In-reply-to: <1387195271-3613-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, tomasz.figa@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dianders@chromium.org, olof@lixom.net, Abhilash Kesavan <a.kesavan@samsung.com>

Add support for the suspend/resume button (SW7) on SMDK5420 using
gpio-keys driver.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts |   11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index fb5a1e2..015e8b7 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -120,4 +120,15 @@
 			reg = <0x50>;
 		};
 	};
+
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
 };
-- 
1.7.9.5
