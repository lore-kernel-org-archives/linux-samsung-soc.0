From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH 3/3] ARM: dts: exynos5422-odroidxu3: Added UHS-I bus speed support
Date: Sun, 11 Oct 2015 15:46:04 +0000
Message-ID: <1444578364-1384-3-git-send-email-linux.amoon@gmail.com>
References: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f65.google.com ([209.85.220.65]:34372 "EHLO
	mail-pa0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752070AbbJKPqn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Oct 2015 11:46:43 -0400
In-Reply-To: <1444578364-1384-1-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Anand Moon <linux.amoon@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Added support for UHS-I bus speed 50MB/s (SDR50, DDR50) 104MB/s (SDR104)

Signed-off-by: Anand Moon <linux.amoon@gmail.com>

---
Changes based on git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git v4.4-next/dt-samsung branch

Changes Fixed the UHS-I bus speed detedtion on cold boot.

[    2.439806] mmc_host mmc1: Bus speed (slot 0) = 100000000Hz (slot req 100000000Hz, actual 100000000HZ div = 0)
[    2.449729] mmc1: new ultra high speed SDR50 SDHC card at address aaaa
[    2.455984] mmcblk0: mmc1:aaaa SL32G 29.7 GiB
[    2.461743]  mmcblk0: p1 p2
---
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 58c06d3..ba4a87b 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -364,6 +364,10 @@
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus4>;
 	bus-width = <4>;
 	cap-sd-highspeed;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 };
 
 &pinctrl_0 {
-- 
2.1.4
