From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 3/7] ARM: dts: Add basic PM domains for EXYNOS5420
Date: Mon, 29 Jul 2013 19:19:27 +0530
Message-ID: <1375105771-8106-4-git-send-email-vikas.sajjan@linaro.org>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f173.google.com ([209.85.192.173]:61495 "EHLO
	mail-pd0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751453Ab3G2Nt7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 29 Jul 2013 09:49:59 -0400
Received: by mail-pd0-f173.google.com with SMTP id p11so1321047pdj.32
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jul 2013 06:49:58 -0700 (PDT)
In-Reply-To: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org

From: Yadwinder Singh Brar <yadi.brar@samsung.com>

Add DT nodes for gsc, isp, mfc, disp, mau, g2d and msc PM domains.

Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 8c54c4b..bd6b310 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -90,6 +90,41 @@
 		};
 	};
 
+	gsc_pd: pd@10044000 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044000 0x20>;
+	};
+
+	isp_pd: pd@10044020 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044020 0x20>;
+	};
+
+	mfc_pd: pd@10044060 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044060 0x20>;
+	};
+
+	disp_pd: pd@100440C0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x100440C0 0x20>;
+	};
+
+	mau_pd: pd@100440E0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x100440E0 0x20>;
+	};
+
+	g2d_pd: pd@10044100 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044100 0x20>;
+	};
+
+	msc_pd: pd@10044120 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10044120 0x20>;
+	};
+
 	pinctrl_0: pinctrl@13400000 {
 		compatible = "samsung,exynos5420-pinctrl";
 		reg = <0x13400000 0x1000>;
-- 
1.7.9.5
