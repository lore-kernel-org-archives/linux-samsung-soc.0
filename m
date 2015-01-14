From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH v3 05/16] thermal: dts: Enable TMU at Exynos4412 based Odroid
 U3 device
Date: Wed, 14 Jan 2015 14:41:03 +0100
Message-ID: <1421242874-3425-6-git-send-email-l.majewski@samsung.com>
References: <1412872737-624-1-git-send-email-l.majewski@samsung.com>
 <1421242874-3425-1-git-send-email-l.majewski@samsung.com>
Return-path: <linux-pm-owner@vger.kernel.org>
In-reply-to: <1421242874-3425-1-git-send-email-l.majewski@samsung.com>
Sender: linux-pm-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>, Zhang Rui <rui.zhang@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Linux PM list <linux-pm@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lukasz Majewski <l.majewski@majess.pl>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This commit enables TMU IP block on the Exynos4412 Odroid U3
device.

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
---
Changes for v2:
- None
Changes for v3:
- None
---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 0adb57c..c7517fc 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -396,6 +396,11 @@
 	ehci: ehci@12580000 {
 		status = "okay";
 	};
+
+	tmu@100C0000 {
+		vtmu-supply = <&ldo10_reg>;
+		status = "okay";
+	};
 };
 
 &pinctrl_1 {
-- 
2.0.0.rc2

