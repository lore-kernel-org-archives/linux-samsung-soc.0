Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DAEC38159
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 06:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjATGrc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 01:47:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjATGrb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 01:47:31 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D4F545217
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 22:47:29 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id g10so3257928wmo.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 22:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kj70Oi456AeT83mbD6n6j58lwOKWTxzRHXa2j71b6ag=;
        b=ofqEY9W8Q78xpTz2/JaIcifeRd55GdYkOKiHq9Vd7i20zEefB/k0ToT47mqpJ61dDa
         2CLtJGxI1fcMYK2CbDoFWBAzswtDEvKORRMU3dU6zWSJeH4vEt7yaD1i1ZjDuB1HvuCO
         IKfewDId6bMii4b3BKj8+AtnMZ4ib0JRO0xDMWXUcJXAFSXRMq1rzSNn16h1a5J7SQN+
         Zj80eLa5c4wmkybplnpv09ttkw0/qs5dSpy9NaIm496yrkWWJ8CAikXn+SPBNQDdY4v3
         0czgi+eQku/jqfeIPatrF0QLwRK4TPUiKAmD6PaN5Pkv3UE2ljWOYbyc+JXM0OqcA1vg
         XHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kj70Oi456AeT83mbD6n6j58lwOKWTxzRHXa2j71b6ag=;
        b=AOrq7Oob4RhV5q4NdqYQB8kuKVYYiWExvI5zf4wHodOZ3/Zl0isEx7AmUXSQ5JhpQe
         wyeqYf470PvFTws1Fwwb1/Hc7yTDgeryPcWzSJptzv/N8g0kx7iqU+8G2Tp4Qn2eoQ5n
         g3YiV/lx8sWiMPl0cfM6X6gItisoitfx3OIXG1sfRlfbudPlzAGVaw4FBy1L1K90ohLg
         jBOG/wcdaHVurr1GVMxhJx7fItFh5B9KGn/BMZv0OPp6mfF80dlPCAmZ0/f+56BoBM0x
         d6oUSIBFT/3WVbZSOV0xK7qiteID6bjG7uOcGNZmTjNgK9Jm1uqKGvHUrMAfFmxIWFaf
         K4PA==
X-Gm-Message-State: AFqh2kq7Gh+GqGnmiocLFfKt6l0VCC4PGU/5mvqwuMXB28/vAHu4vyqY
        xHoaHqeTTwQ2zsLZWvQqZXzTMQ==
X-Google-Smtp-Source: AMrXdXvFV1iMrvlHkQfVzfVgo+1OuS7pBr1VVRZ7uvgDtQoP+BC9fU3iWCYGwAUbJhMGe8mKpgDQZA==
X-Received: by 2002:a05:600c:538e:b0:3da:516:19ed with SMTP id hg14-20020a05600c538e00b003da051619edmr12839779wmb.29.1674197247621;
        Thu, 19 Jan 2023 22:47:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f6-20020adffcc6000000b002bbdcd15e44sm31209991wrs.37.2023.01.19.22.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 22:47:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: exynos: align OPP table names with DT schema
Date:   Fri, 20 Jan 2023 07:47:24 +0100
Message-Id: <20230120064724.40621-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DT schema expects names of operating points tables to match certain
pattern:

  exynos5422-odroidxu3-lite.dtb: opp-table0: $nodename:0: 'opp-table0' does not match '^opp-table(-[a-z0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos3250.dtsi             | 10 +++---
 arch/arm/boot/dts/exynos4210.dtsi             | 12 +++----
 arch/arm/boot/dts/exynos4412.dtsi             | 14 ++++----
 arch/arm/boot/dts/exynos5250.dtsi             |  2 +-
 arch/arm/boot/dts/exynos5420.dtsi             |  4 +--
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 32 +++++++++----------
 6 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index a2d6ee7fff08..9b25449d5311 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -780,7 +780,7 @@ bus_dmc: bus-dmc {
 			status = "disabled";
 		};
 
-		bus_dmc_opp_table: opp-table1 {
+		bus_dmc_opp_table: opp-table-1 {
 			compatible = "operating-points-v2";
 
 			opp-50000000 {
@@ -869,7 +869,7 @@ bus_mfc: bus-mfc {
 			status = "disabled";
 		};
 
-		bus_leftbus_opp_table: opp-table2 {
+		bus_leftbus_opp_table: opp-table-2 {
 			compatible = "operating-points-v2";
 
 			opp-50000000 {
@@ -894,7 +894,7 @@ opp-200000000 {
 			};
 		};
 
-		bus_mcuisp_opp_table: opp-table3 {
+		bus_mcuisp_opp_table: opp-table-3 {
 			compatible = "operating-points-v2";
 
 			opp-50000000 {
@@ -914,7 +914,7 @@ opp-400000000 {
 			};
 		};
 
-		bus_isp_opp_table: opp-table4 {
+		bus_isp_opp_table: opp-table-4 {
 			compatible = "operating-points-v2";
 
 			opp-50000000 {
@@ -934,7 +934,7 @@ opp-300000000 {
 			};
 		};
 
-		bus_peril_opp_table: opp-table5 {
+		bus_peril_opp_table: opp-table-5 {
 			compatible = "operating-points-v2";
 
 			opp-50000000 {
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 2c25cc37934e..d11cbe03770d 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -287,7 +287,7 @@ bus_mfc: bus-mfc {
 			status = "disabled";
 		};
 
-		bus_dmc_opp_table: opp-table1 {
+		bus_dmc_opp_table: opp-table-1 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -306,7 +306,7 @@ opp-400000000 {
 			};
 		};
 
-		bus_acp_opp_table: opp-table2 {
+		bus_acp_opp_table: opp-table-2 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -321,7 +321,7 @@ opp-200000000 {
 			};
 		};
 
-		bus_peri_opp_table: opp-table3 {
+		bus_peri_opp_table: opp-table-3 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -333,7 +333,7 @@ opp-100000000 {
 			};
 		};
 
-		bus_fsys_opp_table: opp-table4 {
+		bus_fsys_opp_table: opp-table-4 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -345,7 +345,7 @@ opp-134000000 {
 			};
 		};
 
-		bus_display_opp_table: opp-table5 {
+		bus_display_opp_table: opp-table-5 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
@@ -360,7 +360,7 @@ opp-160000000 {
 			};
 		};
 
-		bus_leftbus_opp_table: opp-table6 {
+		bus_leftbus_opp_table: opp-table-6 {
 			compatible = "operating-points-v2";
 			opp-shared;
 
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index aa0b61b59970..c02865ff0761 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -93,7 +93,7 @@ cpu3: cpu@a03 {
 		};
 	};
 
-	cpu0_opp_table: opp-table0 {
+	cpu0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -420,7 +420,7 @@ bus_c2c: bus-c2c {
 			status = "disabled";
 		};
 
-		bus_dmc_opp_table: opp-table1 {
+		bus_dmc_opp_table: opp-table-1 {
 			compatible = "operating-points-v2";
 
 			opp-100000000 {
@@ -446,7 +446,7 @@ opp-400000000 {
 			};
 		};
 
-		bus_acp_opp_table: opp-table2 {
+		bus_acp_opp_table: opp-table-2 {
 			compatible = "operating-points-v2";
 
 			opp-100000000 {
@@ -515,7 +515,7 @@ bus_mfc: bus-mfc {
 			status = "disabled";
 		};
 
-		bus_leftbus_opp_table: opp-table3 {
+		bus_leftbus_opp_table: opp-table-3 {
 			compatible = "operating-points-v2";
 
 			opp-100000000 {
@@ -537,7 +537,7 @@ opp-200000000 {
 			};
 		};
 
-		bus_display_opp_table: opp-table4 {
+		bus_display_opp_table: opp-table-4 {
 			compatible = "operating-points-v2";
 
 			opp-160000000 {
@@ -548,7 +548,7 @@ opp-200000000 {
 			};
 		};
 
-		bus_fsys_opp_table: opp-table5 {
+		bus_fsys_opp_table: opp-table-5 {
 			compatible = "operating-points-v2";
 
 			opp-100000000 {
@@ -559,7 +559,7 @@ opp-134000000 {
 			};
 		};
 
-		bus_peri_opp_table: opp-table6 {
+		bus_peri_opp_table: opp-table-6 {
 			compatible = "operating-points-v2";
 
 			opp-50000000 {
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 4708dcd575a7..f82f82fc803f 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -81,7 +81,7 @@ cpu1: cpu@1 {
 		};
 	};
 
-	cpu0_opp_table: opp-table0 {
+	cpu0_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 9f2523a873d9..12168f3fa732 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -42,7 +42,7 @@ aliases {
 	 * by exynos5420-cpus.dtsi or exynos5422-cpus.dtsi.
 	 */
 
-	cluster_a15_opp_table: opp-table0 {
+	cluster_a15_opp_table: opp-table-0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -108,7 +108,7 @@ opp-700000000 {
 		};
 	};
 
-	cluster_a7_opp_table: opp-table1 {
+	cluster_a7_opp_table: opp-table-1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 35818c4cd852..06103dd37265 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -35,7 +35,7 @@ oscclk {
 		};
 	};
 
-	bus_wcore_opp_table: opp-table2 {
+	bus_wcore_opp_table: opp-table-2 {
 		compatible = "operating-points-v2";
 
 		/* derived from 532MHz MPLL */
@@ -61,7 +61,7 @@ opp04 {
 		};
 	};
 
-	bus_noc_opp_table: opp-table3 {
+	bus_noc_opp_table: opp-table-3 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -79,7 +79,7 @@ opp03 {
 		};
 	};
 
-	bus_fsys_apb_opp_table: opp-table4 {
+	bus_fsys_apb_opp_table: opp-table-4 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -91,7 +91,7 @@ opp01 {
 		};
 	};
 
-	bus_fsys2_opp_table: opp-table5 {
+	bus_fsys2_opp_table: opp-table-5 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -106,7 +106,7 @@ opp02 {
 		};
 	};
 
-	bus_mfc_opp_table: opp-table6 {
+	bus_mfc_opp_table: opp-table-6 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -127,7 +127,7 @@ opp04 {
 		};
 	};
 
-	bus_gen_opp_table: opp-table7 {
+	bus_gen_opp_table: opp-table-7 {
 		compatible = "operating-points-v2";
 
 		/* derived from 532MHz MPLL */
@@ -145,7 +145,7 @@ opp03 {
 		};
 	};
 
-	bus_peri_opp_table: opp-table8 {
+	bus_peri_opp_table: opp-table-8 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -154,7 +154,7 @@ opp00 {
 		};
 	};
 
-	bus_g2d_opp_table: opp-table9 {
+	bus_g2d_opp_table: opp-table-9 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -175,7 +175,7 @@ opp04 {
 		};
 	};
 
-	bus_g2d_acp_opp_table: opp-table10 {
+	bus_g2d_acp_opp_table: opp-table-10 {
 		compatible = "operating-points-v2";
 
 		/* derived from 532MHz MPLL */
@@ -193,7 +193,7 @@ opp03 {
 		};
 	};
 
-	bus_jpeg_opp_table: opp-table11 {
+	bus_jpeg_opp_table: opp-table-11 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -211,7 +211,7 @@ opp03 {
 		};
 	};
 
-	bus_jpeg_apb_opp_table: opp-table12 {
+	bus_jpeg_apb_opp_table: opp-table-12 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -229,7 +229,7 @@ opp03 {
 		};
 	};
 
-	bus_disp1_fimd_opp_table: opp-table13 {
+	bus_disp1_fimd_opp_table: opp-table-13 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -241,7 +241,7 @@ opp01 {
 		};
 	};
 
-	bus_disp1_opp_table: opp-table14 {
+	bus_disp1_opp_table: opp-table-14 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -256,7 +256,7 @@ opp02 {
 		};
 	};
 
-	bus_gscl_opp_table: opp-table15 {
+	bus_gscl_opp_table: opp-table-15 {
 		compatible = "operating-points-v2";
 
 		/* derived from 600MHz DPLL */
@@ -271,7 +271,7 @@ opp02 {
 		};
 	};
 
-	bus_mscl_opp_table: opp-table16 {
+	bus_mscl_opp_table: opp-table-16 {
 		compatible = "operating-points-v2";
 
 		/* derived from 666MHz CPLL */
@@ -292,7 +292,7 @@ opp04 {
 		};
 	};
 
-	dmc_opp_table: opp-table17 {
+	dmc_opp_table: opp-table-17 {
 		compatible = "operating-points-v2";
 
 		opp00 {
-- 
2.34.1

