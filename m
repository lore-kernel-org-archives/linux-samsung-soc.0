From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v4 5/5] ARM: dts: enable hdmi for exynos5800 based peach-pi
 board
Date: Wed, 14 May 2014 08:16:02 +0530
Message-ID: <1400035562-16832-6-git-send-email-rahul.sharma@samsung.com>
References: <1400035562-16832-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:43100 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752507AbaENCrA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 22:47:00 -0400
In-reply-to: <1400035562-16832-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Rahul Sharma <Rahul.Sharma@samsung.com>

Enable hdmi for peach-pi board.

Signed-off-by: Rahul Sharma <Rahul.Sharma@samsung.com>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 742655b..2a6f23b8 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -134,6 +134,25 @@
 	};
 };
 
+&i2c_2 {
+	status = "okay";
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-max-bus-freq = <66000>;
+	samsung,i2c-slave-addr = <0x50>;
+
+	hdmiddc@50 {
+		reg = <0x50>;
+	};
+};
+
+&hdmi {
+	status = "okay";
+	hpd-gpio = <&gpx3 7 2>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&hdmi_hpd_irq>;
+	ddc = <&i2c_2>;
+};
+
 /*
  * Use longest HW watchdog in SoC (32 seconds) since the hardware
  * watchdog provides no debugging information (compared to soft/hard
-- 
1.7.9.5
