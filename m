From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v2 2/5] ARM: dts: enable fimd for exynos5250 based snow board
Date: Thu, 08 May 2014 11:49:52 +0530
Message-ID: <1399529995-8656-3-git-send-email-rahul.sharma@samsung.com>
References: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:23798 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751103AbaEHGU6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 May 2014 02:20:58 -0400
In-reply-to: <1399529995-8656-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable fimd node for snow board.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5250-snow.dts |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-snow.dts b/arch/arm/boot/dts/exynos5250-snow.dts
index 1ce1088..796954c 100644
--- a/arch/arm/boot/dts/exynos5250-snow.dts
+++ b/arch/arm/boot/dts/exynos5250-snow.dts
@@ -206,4 +206,10 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	fimd@14400000 {
+		status = "okay";
+		samsung,invert-vclk;
+	};
+
 };
-- 
1.7.9.5
