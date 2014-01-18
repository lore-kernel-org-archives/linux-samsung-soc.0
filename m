From: Alex Ling <kasimling@gmail.com>
Subject: [PATCH 2/2] ARM: dts: Add AT24C08 EEPROM support to TINY4412
Date: Sat, 18 Jan 2014 22:24:43 +0800
Message-ID: <1390055084-27483-2-git-send-email-kasimling@gmail.com>
References: <1390055084-27483-1-git-send-email-kasimling@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:39227 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752066AbaAROZq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 18 Jan 2014 09:25:46 -0500
In-Reply-To: <1390055084-27483-1-git-send-email-kasimling@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, swarren@wwwdotorg.org, ijc+devicetree@hellion.org.uk, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alex Ling <kasimling@gmail.com>

This patch adds support for AT24C08 EEPROM found on TINY4412 board.

Signed-off-by: Alex Ling <kasimling@gmail.com>
---
 arch/arm/boot/dts/exynos4412-tiny4412.dts |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index 2c6bfe3..9f63664 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -109,4 +109,16 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	i2c@13860000 {
+		status = "okay";
+		samsung,i2c-sda-delay = <100>;
+		samsung,i2c-max-bus-freq = <200000>;
+
+		eeprom@50 {
+			compatible = "atmel,24c08";
+			reg = <0x50>;
+			pagesize = <16>;
+		};
+	};
 };
-- 
1.7.9.5
