From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH 26/27] ARM: dts: exynos3250: Add power domain dt nodes
Date: Thu, 10 Apr 2014 19:06:16 +0900
Message-ID: <1397124377-16969-18-git-send-email-cw00.choi@samsung.com>
References: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1397122658-16013-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: kgene.kim@samsung.com, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, cw00.choi@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, hyunhee.kim@samsung.com, yj44.cho@samsung.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Inki Dae <inki.dae@samsung.com>

This patch add CAM/MFC/G3D/LCD0/ISP power domain nodes for Exynos3250.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
[add CAM/MFC power domain node by Bartlomiej Zolnierkiewicz]
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
[add ISP power domain node by Bartlomiej Zolnierkiewicz]
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index a61940f..192770a 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -82,6 +82,31 @@
 		reg = <0x10010000 0x400>;
 	};
 
+	pd_cam: cam-power-domain@10023C00 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023C00 0x20>;
+	};
+
+	pd_mfc: mfc-power-domain@10023C40 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023C40 0x20>;
+	};
+
+	pd_g3d: g3d-power-domain@10023C60 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023C60 0x20>;
+	};
+
+	pd_lcd0: lcd0-power-domain@10023C80 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023C80 0x20>;
+	};
+
+	pd_isp: isp-power-domain@10023CA0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023CA0 0x20>;
+	};
+
 	cmu: clock-controller@10030000 {
 		compatible = "samsung,exynos3250-cmu";
 		reg = <0x10030000 0x20000>;
-- 
1.8.0
