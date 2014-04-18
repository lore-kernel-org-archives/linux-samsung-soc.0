From: Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 2/5] ARM: dts: exynos4210-universal: add super device node for
 exynos drm
Date: Fri, 18 Apr 2014 15:41:07 +0900
Message-ID: <1397803270-5377-3-git-send-email-inki.dae@samsung.com>
References: <1397803270-5377-1-git-send-email-inki.dae@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16062 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751039AbaDRGlN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Apr 2014 02:41:13 -0400
In-reply-to: <1397803270-5377-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, inki.dae@samsung.com, linux@arm.linux.org.uk, a.hajda@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4210-universal_c210.dts |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-universal_c210.dts b/arch/arm/boot/dts/exynos4210-universal_c210.dts
index 0a80a72..5351ac4 100644
--- a/arch/arm/boot/dts/exynos4210-universal_c210.dts
+++ b/arch/arm/boot/dts/exynos4210-universal_c210.dts
@@ -409,6 +409,11 @@
 		};
 	};
 
+	display-subsystem {
+		compatible = "samsung,exynos-display-subsystem";
+		ports = <&fimd>;
+	};
+
 	pwm@139D0000 {
 		compatible = "samsung,s5p6440-pwm";
 		status = "okay";
-- 
1.7.9.5
