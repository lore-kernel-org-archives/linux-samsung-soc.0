Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B816C55178
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 18:45:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA86A2078E
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 18:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604601933;
	bh=yfJReOY6CeXVHrBZ3v/mygMv5nCGl0Sohaw6pOitVBk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=B0KEXb6IGadhODJSuAJriU+SHUxH6HMj6YUMkX7YLdhaZoWYfQT31G2x066Rdb+0d
	 m728NApwYnn7UgQe5QwPTUEUdI+G2nhMmozYJmI+0IGLbtN/paPlTBSk5o3soWiZRf
	 q5pxFrFAp7Xryir+9CMXUdTBjaXkcqY68oguX9wA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731952AbgKESpT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 13:45:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:50276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731919AbgKESpS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 13:45:18 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D2DED2078E;
        Thu,  5 Nov 2020 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604601917;
        bh=yfJReOY6CeXVHrBZ3v/mygMv5nCGl0Sohaw6pOitVBk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=M2tNOGDej8skwBBUnLRMAIA/GXKF+Oz1ZgyXTNEF4wxwsvErtubz6Ng+fs/0Rtvxl
         TG9sbPZHbd6gt91ushLHbfj8lHs+1JDJX+1N8lly4Cjb5Z4jfurJjT1XMiMMjU/uae
         /xqWFEXh6j4xV3xh6PwuHUeSLuGoMDuAmoIr5ucI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] ARM: dts: exynos: use hyphens in Exynos5 node names
Date:   Thu,  5 Nov 2020 19:45:04 +0100
Message-Id: <20201105184506.215648-4-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105184506.215648-1-krzk@kernel.org>
References: <20201105184506.215648-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use hyphens instead of underscores in the Exynos5250 and Exynos542x node
names which is expected by naming convention, multiple dtschema files
and pointed out by dtc W=2 builds.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5250.dtsi             |  2 +-
 arch/arm/boot/dts/exynos5420.dtsi             | 36 +++++++++----------
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 32 ++++++++---------
 3 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index bd2d8835dd36..9bdca8ef9c7e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -70,7 +70,7 @@ cpu1: cpu@1 {
 		};
 	};
 
-	cpu0_opp_table: opp_table0 {
+	cpu0_opp_table: opp-table0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 83580f076a58..c6ee83bee945 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -42,7 +42,7 @@ aliases {
 	 * by exynos5420-cpus.dtsi or exynos5422-cpus.dtsi.
 	 */
 
-	cluster_a15_opp_table: opp_table0 {
+	cluster_a15_opp_table: opp-table0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -108,7 +108,7 @@ opp-700000000 {
 		};
 	};
 
-	cluster_a7_opp_table: opp_table1 {
+	cluster_a7_opp_table: opp-table1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -1080,112 +1080,112 @@ sysmmu_fimd1_1: sysmmu@14680000 {
 			#iommu-cells = <0>;
 		};
 
-		bus_wcore: bus_wcore {
+		bus_wcore: bus-wcore {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK400_WCORE>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_noc: bus_noc {
+		bus_noc: bus-noc {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK100_NOC>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_fsys_apb: bus_fsys_apb {
+		bus_fsys_apb: bus-fsys-apb {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_PCLK200_FSYS>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_fsys: bus_fsys {
+		bus_fsys: bus-fsys {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK200_FSYS>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_fsys2: bus_fsys2 {
+		bus_fsys2: bus-fsys2 {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK200_FSYS2>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_mfc: bus_mfc {
+		bus_mfc: bus-mfc {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK333>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_gen: bus_gen {
+		bus_gen: bus-gen {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK266>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_peri: bus_peri {
+		bus_peri: bus-peri {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK66>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_g2d: bus_g2d {
+		bus_g2d: bus-g2d {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK333_G2D>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_g2d_acp: bus_g2d_acp {
+		bus_g2d_acp: bus-g2d-acp {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK266_G2D>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_jpeg: bus_jpeg {
+		bus_jpeg: bus-jpeg {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK300_JPEG>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_jpeg_apb: bus_jpeg_apb {
+		bus_jpeg_apb: bus-jpeg-apb {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK166>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_disp1_fimd: bus_disp1_fimd {
+		bus_disp1_fimd: bus-disp1-fimd {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK300_DISP1>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_disp1: bus_disp1 {
+		bus_disp1: bus-disp1 {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK400_DISP1>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_gscl_scaler: bus_gscl_scaler {
+		bus_gscl_scaler: bus-gscl-scaler {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK300_GSCL>;
 			clock-names = "bus";
 			status = "disabled";
 		};
 
-		bus_mscl: bus_mscl {
+		bus_mscl: bus-mscl {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DOUT_ACLK400_MSCL>;
 			clock-names = "bus";
diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 25fb6331c75e..d0df560eb0db 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -35,7 +35,7 @@ oscclk {
 		};
 	};
 
-	bus_wcore_opp_table: opp_table2 {
+	bus_wcore_opp_table: opp-table2 {
 		compatible = "operating-points-v2";
 
 		/* derived from 532MHz MPLL */
@@ -61,7 +61,7 @@ opp04 {
 		};
 	};
 
-	bus_noc_opp_table: opp_table3 {
+	bus_noc_opp_table: opp-table3 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -79,7 +79,7 @@ opp03 {
 		};
 	};
 
-	bus_fsys_apb_opp_table: opp_table4 {
+	bus_fsys_apb_opp_table: opp-table4 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -91,7 +91,7 @@ opp01 {
 		};
 	};
 
-	bus_fsys2_opp_table: opp_table5 {
+	bus_fsys2_opp_table: opp-table5 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -106,7 +106,7 @@ opp02 {
 		};
 	};
 
-	bus_mfc_opp_table: opp_table6 {
+	bus_mfc_opp_table: opp-table6 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -127,7 +127,7 @@ opp04 {
 		};
 	};
 
-	bus_gen_opp_table: opp_table7 {
+	bus_gen_opp_table: opp-table7 {
 		compatible = "operating-points-v2";
 
 		/* derived from 532MHz MPLL */
@@ -145,7 +145,7 @@ opp03 {
 		};
 	};
 
-	bus_peri_opp_table: opp_table8 {
+	bus_peri_opp_table: opp-table8 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -154,7 +154,7 @@ opp00 {
 		};
 	};
 
-	bus_g2d_opp_table: opp_table9 {
+	bus_g2d_opp_table: opp-table9 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -175,7 +175,7 @@ opp04 {
 		};
 	};
 
-	bus_g2d_acp_opp_table: opp_table10 {
+	bus_g2d_acp_opp_table: opp-table10 {
 		compatible = "operating-points-v2";
 
 		/* derived from 532MHz MPLL */
@@ -193,7 +193,7 @@ opp03 {
 		};
 	};
 
-	bus_jpeg_opp_table: opp_table11 {
+	bus_jpeg_opp_table: opp-table11 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -211,7 +211,7 @@ opp03 {
 		};
 	};
 
-	bus_jpeg_apb_opp_table: opp_table12 {
+	bus_jpeg_apb_opp_table: opp-table12 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -229,7 +229,7 @@ opp03 {
 		};
 	};
 
-	bus_disp1_fimd_opp_table: opp_table13 {
+	bus_disp1_fimd_opp_table: opp-table13 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -241,7 +241,7 @@ opp01 {
 		};
 	};
 
-	bus_disp1_opp_table: opp_table14 {
+	bus_disp1_opp_table: opp-table14 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -256,7 +256,7 @@ opp02 {
 		};
 	};
 
-	bus_gscl_opp_table: opp_table15 {
+	bus_gscl_opp_table: opp-table15 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -271,7 +271,7 @@ opp02 {
 		};
 	};
 
-	bus_mscl_opp_table: opp_table16 {
+	bus_mscl_opp_table: opp-table16 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -292,7 +292,7 @@ opp04 {
 		};
 	};
 
-	dmc_opp_table: opp_table17 {
+	dmc_opp_table: opp-table17 {
 		compatible = "operating-points-v2";
 
 		opp00 {
-- 
2.25.1

