Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D32BC55179
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 18:45:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9E0C21D46
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 18:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604601918;
	bh=pWCRd8bGCpztWPRmwFKx1CnazULALGVUSVDPVCCUlKs=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=BeWJjujq6qVcHB9B6O4Kq56bHXZXjuwXLGXDfVq23ll1u9HzDhY0re73xjaZM5esC
	 EkKDPPSgQHHXJQ/d9WiLH4ogo6TDwleiv76pCYdzaUCzlrtZIHw6LT5qZTXuuMhQo4
	 +810dcMucouDlm3V3o1oeUaja4v+DDO1nJHCRbug=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731880AbgKESpQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 13:45:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:50150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726801AbgKESpP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 13:45:15 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D0C72087D;
        Thu,  5 Nov 2020 18:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604601913;
        bh=pWCRd8bGCpztWPRmwFKx1CnazULALGVUSVDPVCCUlKs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kLAyYCJQZK2g25wZx5TkOvaIacgIxS7n1SXBA5yTFwlea1Fy0iaAyXKSwuuhQ9FY4
         sZBWXwX/ViEEAYF87v/u1QNnttsBLr/JfvNXMTQF8MvtQpH7PmzzdprHT/zA5XnR12
         xy3SasW4XQUiXoF06xhLDgfwTOB6bsOLo1HN7ums=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] ARM: dts: exynos: use hyphens in Exynos4 node names
Date:   Thu,  5 Nov 2020 19:45:02 +0100
Message-Id: <20201105184506.215648-2-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105184506.215648-1-krzk@kernel.org>
References: <20201105184506.215648-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use hyphens instead of underscores in the Exynos4210 and Exynos4412 node
names which is expected by naming convention, multiple dtschema files
and pointed out by dtc W=2 builds.  Use also generic "ppmu" node name
for PPMU nodes to match Devicetree specification.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4.dtsi    | 26 +++++++++++-----------
 arch/arm/boot/dts/exynos4210.dtsi | 36 +++++++++++++++----------------
 arch/arm/boot/dts/exynos4412.dtsi | 18 ++++++++--------
 3 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index a1e54449f33f..eab77a66ae8f 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -782,7 +782,7 @@ mixer: mixer@12c10000 {
 			status = "disabled";
 		};
 
-		ppmu_dmc0: ppmu_dmc0@106a0000 {
+		ppmu_dmc0: ppmu@106a0000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x106a0000 0x2000>;
 			clocks = <&clock CLK_PPMUDMC0>;
@@ -790,7 +790,7 @@ ppmu_dmc0: ppmu_dmc0@106a0000 {
 			status = "disabled";
 		};
 
-		ppmu_dmc1: ppmu_dmc1@106b0000 {
+		ppmu_dmc1: ppmu@106b0000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x106b0000 0x2000>;
 			clocks = <&clock CLK_PPMUDMC1>;
@@ -798,7 +798,7 @@ ppmu_dmc1: ppmu_dmc1@106b0000 {
 			status = "disabled";
 		};
 
-		ppmu_cpu: ppmu_cpu@106c0000 {
+		ppmu_cpu: ppmu@106c0000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x106c0000 0x2000>;
 			clocks = <&clock CLK_PPMUCPU>;
@@ -806,7 +806,7 @@ ppmu_cpu: ppmu_cpu@106c0000 {
 			status = "disabled";
 		};
 
-		ppmu_rightbus: ppmu_rightbus@112a0000 {
+		ppmu_rightbus: ppmu@112a0000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x112a0000 0x2000>;
 			clocks = <&clock CLK_PPMURIGHT>;
@@ -814,7 +814,7 @@ ppmu_rightbus: ppmu_rightbus@112a0000 {
 			status = "disabled";
 		};
 
-		ppmu_leftbus: ppmu_leftbus0@116a0000 {
+		ppmu_leftbus: ppmu@116a0000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x116a0000 0x2000>;
 			clocks = <&clock CLK_PPMULEFT>;
@@ -822,7 +822,7 @@ ppmu_leftbus: ppmu_leftbus0@116a0000 {
 			status = "disabled";
 		};
 
-		ppmu_camif: ppmu_camif@11ac0000 {
+		ppmu_camif: ppmu@11ac0000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x11ac0000 0x2000>;
 			clocks = <&clock CLK_PPMUCAMIF>;
@@ -830,7 +830,7 @@ ppmu_camif: ppmu_camif@11ac0000 {
 			status = "disabled";
 		};
 
-		ppmu_lcd0: ppmu_lcd0@11e40000 {
+		ppmu_lcd0: ppmu@11e40000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x11e40000 0x2000>;
 			clocks = <&clock CLK_PPMULCD0>;
@@ -838,13 +838,13 @@ ppmu_lcd0: ppmu_lcd0@11e40000 {
 			status = "disabled";
 		};
 
-		ppmu_fsys: ppmu_g3d@12630000 {
+		ppmu_fsys: ppmu@12630000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x12630000 0x2000>;
 			status = "disabled";
 		};
 
-		ppmu_image: ppmu_image@12aa0000 {
+		ppmu_image: ppmu@12aa0000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x12aa0000 0x2000>;
 			clocks = <&clock CLK_PPMUIMAGE>;
@@ -852,7 +852,7 @@ ppmu_image: ppmu_image@12aa0000 {
 			status = "disabled";
 		};
 
-		ppmu_tv: ppmu_tv@12e40000 {
+		ppmu_tv: ppmu@12e40000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x12e40000 0x2000>;
 			clocks = <&clock CLK_PPMUTV>;
@@ -860,7 +860,7 @@ ppmu_tv: ppmu_tv@12e40000 {
 			status = "disabled";
 		};
 
-		ppmu_g3d: ppmu_g3d@13220000 {
+		ppmu_g3d: ppmu@13220000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x13220000 0x2000>;
 			clocks = <&clock CLK_PPMUG3D>;
@@ -868,7 +868,7 @@ ppmu_g3d: ppmu_g3d@13220000 {
 			status = "disabled";
 		};
 
-		ppmu_mfc_left: ppmu_mfc_left@13660000 {
+		ppmu_mfc_left: ppmu@13660000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x13660000 0x2000>;
 			clocks = <&clock CLK_PPMUMFC_L>;
@@ -876,7 +876,7 @@ ppmu_mfc_left: ppmu_mfc_left@13660000 {
 			status = "disabled";
 		};
 
-		ppmu_mfc_right: ppmu_mfc_right@13670000 {
+		ppmu_mfc_right: ppmu@13670000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x13670000 0x2000>;
 			clocks = <&clock CLK_PPMUMFC_R>;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index fddc661ded28..70baad9b11f0 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -168,13 +168,13 @@ g2d: g2d@12800000 {
 			iommus = <&sysmmu_g2d>;
 		};
 
-		ppmu_acp: ppmu_acp@10ae0000 {
+		ppmu_acp: ppmu@10ae0000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x10ae0000 0x2000>;
 			status = "disabled";
 		};
 
-		ppmu_lcd1: ppmu_lcd1@12240000 {
+		ppmu_lcd1: ppmu@12240000 {
 			compatible = "samsung,exynos-ppmu";
 			reg = <0x12240000 0x2000>;
 			clocks = <&clock CLK_PPMULCD1>;
@@ -204,7 +204,7 @@ sysmmu_fimd1: sysmmu@12220000 {
 			#iommu-cells = <0>;
 		};
 
-		bus_dmc: bus_dmc {
+		bus_dmc: bus-dmc {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DIV_DMC>;
 			clock-names = "bus";
@@ -212,7 +212,7 @@ bus_dmc: bus_dmc {
 			status = "disabled";
 		};
 
-		bus_acp: bus_acp {
+		bus_acp: bus-acp {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DIV_ACP>;
 			clock-names = "bus";
@@ -220,7 +220,7 @@ bus_acp: bus_acp {
 			status = "disabled";
 		};
 
-		bus_peri: bus_peri {
+		bus_peri: bus-peri {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_ACLK100>;
 			clock-names = "bus";
@@ -228,7 +228,7 @@ bus_peri: bus_peri {
 			status = "disabled";
 		};
 
-		bus_fsys: bus_fsys {
+		bus_fsys: bus-fsys {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_ACLK133>;
 			clock-names = "bus";
@@ -236,7 +236,7 @@ bus_fsys: bus_fsys {
 			status = "disabled";
 		};
 
-		bus_display: bus_display {
+		bus_display: bus-display {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_ACLK160>;
 			clock-names = "bus";
@@ -244,7 +244,7 @@ bus_display: bus_display {
 			status = "disabled";
 		};
 
-		bus_lcd0: bus_lcd0 {
+		bus_lcd0: bus-lcd0 {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_ACLK200>;
 			clock-names = "bus";
@@ -252,7 +252,7 @@ bus_lcd0: bus_lcd0 {
 			status = "disabled";
 		};
 
-		bus_leftbus: bus_leftbus {
+		bus_leftbus: bus-leftbus {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DIV_GDL>;
 			clock-names = "bus";
@@ -260,7 +260,7 @@ bus_leftbus: bus_leftbus {
 			status = "disabled";
 		};
 
-		bus_rightbus: bus_rightbus {
+		bus_rightbus: bus-rightbus {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DIV_GDR>;
 			clock-names = "bus";
@@ -268,7 +268,7 @@ bus_rightbus: bus_rightbus {
 			status = "disabled";
 		};
 
-		bus_mfc: bus_mfc {
+		bus_mfc: bus-mfc {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_SCLK_MFC>;
 			clock-names = "bus";
@@ -276,7 +276,7 @@ bus_mfc: bus_mfc {
 			status = "disabled";
 		};
 
-		bus_dmc_opp_table: opp_table1 {
+		bus_dmc_opp_table: opp-table1 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -295,7 +295,7 @@ opp-400000000 {
 			};
 		};
 
-		bus_acp_opp_table: opp_table2 {
+		bus_acp_opp_table: opp-table2 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -310,7 +310,7 @@ opp-200000000 {
 			};
 		};
 
-		bus_peri_opp_table: opp_table3 {
+		bus_peri_opp_table: opp-table3 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -322,7 +322,7 @@ opp-100000000 {
 			};
 		};
 
-		bus_fsys_opp_table: opp_table4 {
+		bus_fsys_opp_table: opp-table4 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -334,7 +334,7 @@ opp-134000000 {
 			};
 		};
 
-		bus_display_opp_table: opp_table5 {
+		bus_display_opp_table: opp-table5 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -349,7 +349,7 @@ opp-160000000 {
 			};
 		};
 
-		bus_leftbus_opp_table: opp_table6 {
+		bus_leftbus_opp_table: opp-table6 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -463,7 +463,7 @@ &gpu {
 			  "ppmmu3";
 	operating-points-v2 = <&gpu_opp_table>;
 
-	gpu_opp_table: opp_table {
+	gpu_opp_table: opp-table {
 		compatible = "operating-points-v2";
 
 		opp-160000000 {
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index e76881dc0014..6a9665c81b46 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -378,7 +378,7 @@ sysmmu_fimc_lite1: sysmmu@123c0000 {
 			#iommu-cells = <0>;
 		};
 
-		bus_dmc: bus_dmc {
+		bus_dmc: bus-dmc {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DIV_DMC>;
 			clock-names = "bus";
@@ -386,7 +386,7 @@ bus_dmc: bus_dmc {
 			status = "disabled";
 		};
 
-		bus_acp: bus_acp {
+		bus_acp: bus-acp {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DIV_ACP>;
 			clock-names = "bus";
@@ -394,7 +394,7 @@ bus_acp: bus_acp {
 			status = "disabled";
 		};
 
-		bus_c2c: bus_c2c {
+		bus_c2c: bus-c2c {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DIV_C2C>;
 			clock-names = "bus";
@@ -447,7 +447,7 @@ opp-267000000 {
 			};
 		};
 
-		bus_leftbus: bus_leftbus {
+		bus_leftbus: bus-leftbus {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DIV_GDL>;
 			clock-names = "bus";
@@ -455,7 +455,7 @@ bus_leftbus: bus_leftbus {
 			status = "disabled";
 		};
 
-		bus_rightbus: bus_rightbus {
+		bus_rightbus: bus-rightbus {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_DIV_GDR>;
 			clock-names = "bus";
@@ -463,7 +463,7 @@ bus_rightbus: bus_rightbus {
 			status = "disabled";
 		};
 
-		bus_display: bus_display {
+		bus_display: bus-display {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_ACLK160>;
 			clock-names = "bus";
@@ -471,7 +471,7 @@ bus_display: bus_display {
 			status = "disabled";
 		};
 
-		bus_fsys: bus_fsys {
+		bus_fsys: bus-fsys {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_ACLK133>;
 			clock-names = "bus";
@@ -479,7 +479,7 @@ bus_fsys: bus_fsys {
 			status = "disabled";
 		};
 
-		bus_peri: bus_peri {
+		bus_peri: bus-peri {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_ACLK100>;
 			clock-names = "bus";
@@ -487,7 +487,7 @@ bus_peri: bus_peri {
 			status = "disabled";
 		};
 
-		bus_mfc: bus_mfc {
+		bus_mfc: bus-mfc {
 			compatible = "samsung,exynos-bus";
 			clocks = <&clock CLK_SCLK_MFC>;
 			clock-names = "bus";
-- 
2.25.1

