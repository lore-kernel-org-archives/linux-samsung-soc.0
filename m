Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C271C27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:46:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235433AbjAYJqI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:46:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235368AbjAYJp6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:45:58 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D9353990
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:33 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id k16so13283155wms.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO3ucTGqD/ix4ndExgNRNXl/hsBeLLGaA9nsTdp6GJ4=;
        b=NQF9KRFqMopZQOTtSrIgQqPMWmn2Z/aUf0/zTVwRA7fiHBpPYif6U/quoWRpDu6bam
         hq4MIrSh6RtdVQLUqWdvdY1ibnSJlTuyU4Q+iwY54LVt39nNQMg0HQJfdx/sJCAkT5K5
         LdQxtw2OrUCp4Fud6W2zT8B4W++DIKhS6U+/QpzotgnU/Cfq9fQk03koswz73yUbMbbC
         jUZjcIbeXHmbfgE6lcjJhAthVPSqN5T5ObczbEHHcDJ65KOKOpmzO+WAWOnULORrPZix
         3n51n96DoqoiULCjm3wR0Lgo61K1mAJJJprZf82GgjHcYO7Z0s/hyqJN37RITXiRFHMH
         5L2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO3ucTGqD/ix4ndExgNRNXl/hsBeLLGaA9nsTdp6GJ4=;
        b=TJ14SGGVWDcaaFRoUf7AF+MEYaSjw8UhAmLEitXsk1s31qa+8RMjzYDOMIN1jrtrgA
         87NAzqec8NUyrkzVU2Qswhvf1R31NpzLUPVacfTxzg1n2ErYDE49gyju8jr2GQ560lZB
         oJf8228Oz3N5+tyL4oxV8PnWVVTv60C8tZrNwlRsfv/3bgkeJazS0LqFUzKrfpUyCYhF
         5GWmmosNL1EXF8qeQCCMBdbgyPrXzyexhaioOlxGYZ2j4qNp/YmYtpdgUYbI3nlBR/yT
         /A8igpwoB7+t6fJ13BHcm1NrF4QY8nWU9vhXeCpdknsaaSn2EGY9F2GYFJxnZG+5x7qy
         1Utw==
X-Gm-Message-State: AFqh2kqZDUSLMRszUVcpJPLiWsYP6V2hqSGv/wunhrBfmZVYfZDQH+0d
        7EiNtWXipIYeLiapvTK58TJ/kg==
X-Google-Smtp-Source: AMrXdXvuxvlPOCYsQLvuL/+vuXy+DGjLlfgFAlqheXCR7T6eMBnI6aXJRMNEd+Ei5VHR1tzkMfhbzw==
X-Received: by 2002:a05:600c:1c23:b0:3db:b9f:f2e with SMTP id j35-20020a05600c1c2300b003db0b9f0f2emr29029156wms.14.1674639928371;
        Wed, 25 Jan 2023 01:45:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fl22-20020a05600c0b9600b003d1e3b1624dsm1419238wmb.2.2023.01.25.01.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:45:27 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/9] ARM: dts: exynos: move exynos-bus nodes out of soc in Exynos4412
Date:   Wed, 25 Jan 2023 10:45:09 +0100
Message-Id: <20230125094513.155063-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The soc node is supposed to have only device nodes with MMIO addresses,
as reported by dtc W=1:

  exynos4412.dtsi:407.20-413.5:
    Warning (simple_bus_reg): /soc/bus-acp: missing or empty reg/ranges property

and dtbs_check:

  exynos4412-i9300.dtb: soc: bus-acp:
    {'compatible': ['samsung,exynos-bus'], 'clocks': [[7, 456]], 'clock-names': ['bus'], 'operating-points-v2': [[132]], 'status': ['okay'], 'devfreq': [[117]]} should not be valid under {'type': 'object'}

Move the bus nodes and their OPP tables out of SoC to fix this.
Re-order them alphabetically while moving and put some of the OPP tables
in device nodes (if they are not shared).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412.dtsi | 351 +++++++++++++++---------------
 1 file changed, 175 insertions(+), 176 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index c02865ff0761..f34c7400475b 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -31,6 +31,134 @@ aliases {
 		mshc0 = &mshc_0;
 	};
 
+	bus_acp: bus-acp {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_ACP>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_acp_opp_table>;
+		status = "disabled";
+
+		bus_acp_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+			};
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+			};
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+			};
+			opp-267000000 {
+				opp-hz = /bits/ 64 <267000000>;
+			};
+		};
+	};
+
+	bus_c2c: bus-c2c {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_C2C>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_dmc_opp_table>;
+		status = "disabled";
+	};
+
+	bus_dmc: bus-dmc {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_DMC>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_dmc_opp_table>;
+		samsung,data-clock-ratio = <4>;
+		#interconnect-cells = <0>;
+		status = "disabled";
+	};
+
+	bus_display: bus-display {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_ACLK160>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_display_opp_table>;
+		interconnects = <&bus_leftbus &bus_dmc>;
+		#interconnect-cells = <0>;
+		status = "disabled";
+
+		bus_display_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-160000000 {
+				opp-hz = /bits/ 64 <160000000>;
+			};
+			opp-200000000 {
+				opp-hz = /bits/ 64 <200000000>;
+			};
+		};
+	};
+
+	bus_fsys: bus-fsys {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_ACLK133>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_fsys_opp_table>;
+		status = "disabled";
+
+		bus_fsys_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+			};
+			opp-134000000 {
+				opp-hz = /bits/ 64 <134000000>;
+			};
+		};
+	};
+
+	bus_leftbus: bus-leftbus {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_GDL>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_leftbus_opp_table>;
+		interconnects = <&bus_dmc>;
+		#interconnect-cells = <0>;
+		status = "disabled";
+	};
+
+	bus_mfc: bus-mfc {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_SCLK_MFC>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_leftbus_opp_table>;
+		status = "disabled";
+	};
+
+	bus_peri: bus-peri {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_ACLK100>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_peri_opp_table>;
+		status = "disabled";
+
+		bus_peri_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-50000000 {
+				opp-hz = /bits/ 64 <50000000>;
+			};
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+			};
+		};
+	};
+
+	bus_rightbus: bus-rightbus {
+		compatible = "samsung,exynos-bus";
+		clocks = <&clock CLK_DIV_GDR>;
+		clock-names = "bus";
+		operating-points-v2 = <&bus_leftbus_opp_table>;
+		status = "disabled";
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -171,6 +299,53 @@ cpu0_opp_1500: opp-1500000000 {
 		};
 	};
 
+	bus_dmc_opp_table: opp-table-1 {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <900000>;
+		};
+		opp-134000000 {
+			opp-hz = /bits/ 64 <134000000>;
+			opp-microvolt = <900000>;
+		};
+		opp-160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+			opp-microvolt = <900000>;
+		};
+		opp-267000000 {
+			opp-hz = /bits/ 64 <267000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1050000>;
+			opp-suspend;
+		};
+	};
+
+	bus_leftbus_opp_table: opp-table-2 {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <900000>;
+		};
+		opp-134000000 {
+			opp-hz = /bits/ 64 <134000000>;
+			opp-microvolt = <925000>;
+		};
+		opp-160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+			opp-microvolt = <950000>;
+		};
+		opp-200000000 {
+			opp-hz = /bits/ 64 <200000000>;
+			opp-microvolt = <1000000>;
+			opp-suspend;
+		};
+	};
 
 	soc: soc {
 
@@ -393,182 +568,6 @@ sysmmu_fimc_lite1: sysmmu@123c0000 {
 				 <&isp_clock CLK_ISP_FIMC_LITE1>;
 			#iommu-cells = <0>;
 		};
-
-		bus_dmc: bus-dmc {
-			compatible = "samsung,exynos-bus";
-			clocks = <&clock CLK_DIV_DMC>;
-			clock-names = "bus";
-			operating-points-v2 = <&bus_dmc_opp_table>;
-			samsung,data-clock-ratio = <4>;
-			#interconnect-cells = <0>;
-			status = "disabled";
-		};
-
-		bus_acp: bus-acp {
-			compatible = "samsung,exynos-bus";
-			clocks = <&clock CLK_DIV_ACP>;
-			clock-names = "bus";
-			operating-points-v2 = <&bus_acp_opp_table>;
-			status = "disabled";
-		};
-
-		bus_c2c: bus-c2c {
-			compatible = "samsung,exynos-bus";
-			clocks = <&clock CLK_DIV_C2C>;
-			clock-names = "bus";
-			operating-points-v2 = <&bus_dmc_opp_table>;
-			status = "disabled";
-		};
-
-		bus_dmc_opp_table: opp-table-1 {
-			compatible = "operating-points-v2";
-
-			opp-100000000 {
-				opp-hz = /bits/ 64 <100000000>;
-				opp-microvolt = <900000>;
-			};
-			opp-134000000 {
-				opp-hz = /bits/ 64 <134000000>;
-				opp-microvolt = <900000>;
-			};
-			opp-160000000 {
-				opp-hz = /bits/ 64 <160000000>;
-				opp-microvolt = <900000>;
-			};
-			opp-267000000 {
-				opp-hz = /bits/ 64 <267000000>;
-				opp-microvolt = <950000>;
-			};
-			opp-400000000 {
-				opp-hz = /bits/ 64 <400000000>;
-				opp-microvolt = <1050000>;
-				opp-suspend;
-			};
-		};
-
-		bus_acp_opp_table: opp-table-2 {
-			compatible = "operating-points-v2";
-
-			opp-100000000 {
-				opp-hz = /bits/ 64 <100000000>;
-			};
-			opp-134000000 {
-				opp-hz = /bits/ 64 <134000000>;
-			};
-			opp-160000000 {
-				opp-hz = /bits/ 64 <160000000>;
-			};
-			opp-267000000 {
-				opp-hz = /bits/ 64 <267000000>;
-			};
-		};
-
-		bus_leftbus: bus-leftbus {
-			compatible = "samsung,exynos-bus";
-			clocks = <&clock CLK_DIV_GDL>;
-			clock-names = "bus";
-			operating-points-v2 = <&bus_leftbus_opp_table>;
-			interconnects = <&bus_dmc>;
-			#interconnect-cells = <0>;
-			status = "disabled";
-		};
-
-		bus_rightbus: bus-rightbus {
-			compatible = "samsung,exynos-bus";
-			clocks = <&clock CLK_DIV_GDR>;
-			clock-names = "bus";
-			operating-points-v2 = <&bus_leftbus_opp_table>;
-			status = "disabled";
-		};
-
-		bus_display: bus-display {
-			compatible = "samsung,exynos-bus";
-			clocks = <&clock CLK_ACLK160>;
-			clock-names = "bus";
-			operating-points-v2 = <&bus_display_opp_table>;
-			interconnects = <&bus_leftbus &bus_dmc>;
-			#interconnect-cells = <0>;
-			status = "disabled";
-		};
-
-		bus_fsys: bus-fsys {
-			compatible = "samsung,exynos-bus";
-			clocks = <&clock CLK_ACLK133>;
-			clock-names = "bus";
-			operating-points-v2 = <&bus_fsys_opp_table>;
-			status = "disabled";
-		};
-
-		bus_peri: bus-peri {
-			compatible = "samsung,exynos-bus";
-			clocks = <&clock CLK_ACLK100>;
-			clock-names = "bus";
-			operating-points-v2 = <&bus_peri_opp_table>;
-			status = "disabled";
-		};
-
-		bus_mfc: bus-mfc {
-			compatible = "samsung,exynos-bus";
-			clocks = <&clock CLK_SCLK_MFC>;
-			clock-names = "bus";
-			operating-points-v2 = <&bus_leftbus_opp_table>;
-			status = "disabled";
-		};
-
-		bus_leftbus_opp_table: opp-table-3 {
-			compatible = "operating-points-v2";
-
-			opp-100000000 {
-				opp-hz = /bits/ 64 <100000000>;
-				opp-microvolt = <900000>;
-			};
-			opp-134000000 {
-				opp-hz = /bits/ 64 <134000000>;
-				opp-microvolt = <925000>;
-			};
-			opp-160000000 {
-				opp-hz = /bits/ 64 <160000000>;
-				opp-microvolt = <950000>;
-			};
-			opp-200000000 {
-				opp-hz = /bits/ 64 <200000000>;
-				opp-microvolt = <1000000>;
-				opp-suspend;
-			};
-		};
-
-		bus_display_opp_table: opp-table-4 {
-			compatible = "operating-points-v2";
-
-			opp-160000000 {
-				opp-hz = /bits/ 64 <160000000>;
-			};
-			opp-200000000 {
-				opp-hz = /bits/ 64 <200000000>;
-			};
-		};
-
-		bus_fsys_opp_table: opp-table-5 {
-			compatible = "operating-points-v2";
-
-			opp-100000000 {
-				opp-hz = /bits/ 64 <100000000>;
-			};
-			opp-134000000 {
-				opp-hz = /bits/ 64 <134000000>;
-			};
-		};
-
-		bus_peri_opp_table: opp-table-6 {
-			compatible = "operating-points-v2";
-
-			opp-50000000 {
-				opp-hz = /bits/ 64 <50000000>;
-			};
-			opp-100000000 {
-				opp-hz = /bits/ 64 <100000000>;
-			};
-		};
 	};
 };
 
-- 
2.34.1

