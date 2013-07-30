From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 3/7] ARM: dts: Add basic PM domains for EXYNOS5420
Date: Tue, 30 Jul 2013 16:49:34 +0530
Message-ID: <1375183178-8201-4-git-send-email-vikas.sajjan@linaro.org>
References: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:62820 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753105Ab3G3LUJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Jul 2013 07:20:09 -0400
Received: by mail-pb0-f44.google.com with SMTP id wy7so5853697pbc.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 04:20:08 -0700 (PDT)
In-Reply-To: <1375183178-8201-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree@vger.kernel.org, jg1.han@samsung.com, inki.dae@samsung.com, ajaynumb@gmail.com, patches@linaro.org, linaro-kernel@lists.linaro.org

From: Yadwinder Singh Brar <yadi.brar@samsung.com>

Add DT nodes for gsc, isp, mfc, disp, mau, g2d and msc PM domains.

Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8c54c4b..884d8f4 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -90,6 +90,41 @@
 		};
 	};
 
+	gsc_pd: power-domain@10044000 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044000 0x20>;
+	};
+
+	isp_pd: power-domain@10044020 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044020 0x20>;
+	};
+
+	mfc_pd: power-domain@10044060 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044060 0x20>;
+	};
+
+	disp_pd: power-domain@100440C0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x100440C0 0x20>;
+	};
+
+	mau_pd: power-domain@100440E0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x100440E0 0x20>;
+	};
+
+	g2d_pd: power-domain@10044100 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044100 0x20>;
+	};
+
+	msc_pd: power-domain@10044120 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044120 0x20>;
+	};
+
 	pinctrl_0: pinctrl@13400000 {
 		compatible = "samsung,exynos5420-pinctrl";
 		reg = <0x13400000 0x1000>;
-- 
1.7.9.5
