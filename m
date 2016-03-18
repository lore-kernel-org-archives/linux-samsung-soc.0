From: Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCHv13 03/17] dts: exynos4412-odroid*: enable the HDMI CEC device
Date: Fri, 18 Mar 2016 15:07:02 +0100
Message-ID: <1458310036-19252-4-git-send-email-hans.verkuil@cisco.com>
References: <1458310036-19252-1-git-send-email-hans.verkuil@cisco.com>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1458310036-19252-1-git-send-email-hans.verkuil@cisco.com>
Sender: linux-input-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, lars@opdenkamp.eu, linux@arm.linux.org.uk, Marek Szyprowski <m.szyprowski@samsung.com>, Hans Verkuil <hans.verkuil@cisco.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Add a dts node entry and enable the HDMI CEC device present in the Exynos4
family of SoCs.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 395c3ca..c9b1425 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -500,3 +500,7 @@
 &watchdog {
 	status = "okay";
 };
+
+&hdmicec {
+	status = "okay";
+};
-- 
2.7.0

