From: Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCHv7 03/15] dts: exynos4412-odroid*: enable the HDMI CEC device
Date: Mon, 29 Jun 2015 12:14:48 +0200
Message-ID: <1435572900-56998-4-git-send-email-hans.verkuil@cisco.com>
References: <1435572900-56998-1-git-send-email-hans.verkuil@cisco.com>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <1435572900-56998-1-git-send-email-hans.verkuil@cisco.com>
Sender: linux-input-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, thomas@tommie-lie.de, sean@mess.org, dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, linux-samsung-soc@vger.kernel.org, lars@opdenkamp.eu, kamil@wypas.org
List-Id: linux-samsung-soc@vger.kernel.org

From: Kamil Debski <kamil@wypas.org>

Add a dts node entry and enable the HDMI CEC device present in the Exynos4
family of SoCs.

Signed-off-by: Kamil Debski <kamil@wypas.org>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index d6b49e5..a97362a 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -472,6 +472,10 @@
 		status = "okay";
 	};
 
+	cec@100B0000 {
+		status = "okay";
+	};
+
 	hdmi_ddc: i2c@13880000 {
 		status = "okay";
 		pinctrl-names = "default";
-- 
2.1.4

