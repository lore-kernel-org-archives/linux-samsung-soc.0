Return-Path: <SRS0=idU0=EL=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC99C55179
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 18:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6015A2224B
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Nov 2020 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604601923;
	bh=YmUtnlzOKXqutUN2ZjrNmQslRqCKCYAcop10QvbuLgA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=gdWiU4bgi/ouPmXE3WYtHmGsMMarhfT6wf12Kn0rgl0Hho+j08plNi2WQOSoEeBYo
	 jxZ2mLmQ3DOw93hGO5Y0ctYjJA4zBLtaLlilIiMPigrH9dEfbXcAClIGdWoImjaTL7
	 raHR/QumboFYhONwCakqGBtKfDJjjmA1lCimgIqk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731955AbgKESpW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Nov 2020 13:45:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:50408 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732000AbgKESpV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Nov 2020 13:45:21 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BC3A62074B;
        Thu,  5 Nov 2020 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604601921;
        bh=YmUtnlzOKXqutUN2ZjrNmQslRqCKCYAcop10QvbuLgA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Dl4aY1r2ypcTj0Utg+cdIdmIID+TO0jjXRQ62mficNiK94tYmbm9Oh1S/kc7v5ph/
         fi1HJPXGon61VfR5AJn0PiIwvebI7AqPm9vUjcWJ3zKXlZr1DjkGzqe2254p/OPZ0k
         erLTeYpECdfzAxUnMiGVjKiy2a5MBS1FLz7BPiP0=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: exynos: use hyphens in Exynos5433 node names
Date:   Thu,  5 Nov 2020 19:45:06 +0100
Message-Id: <20201105184506.215648-6-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105184506.215648-1-krzk@kernel.org>
References: <20201105184506.215648-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use hyphens instead of underscores in the Exynos5433 node names which is
expected by naming convention, multiple dtschema files and pointed out
by dtc W=2 builds.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi        | 10 +++++-----
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi |  4 ++--
 arch/arm64/boot/dts/exynos/exynos5433.dtsi            |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
index d77b88af9582..8997f8f2b96c 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi
@@ -87,7 +87,7 @@ bus_noc2: bus9 {
 		status = "disabled";
 	};
 
-	bus_g2d_400_opp_table: opp_table2 {
+	bus_g2d_400_opp_table: opp-table2 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -117,7 +117,7 @@ opp-100000000 {
 		};
 	};
 
-	bus_g2d_266_opp_table: opp_table3 {
+	bus_g2d_266_opp_table: opp-table3 {
 		compatible = "operating-points-v2";
 
 		opp-267000000 {
@@ -137,7 +137,7 @@ opp-100000000 {
 		};
 	};
 
-	bus_gscl_opp_table: opp_table4 {
+	bus_gscl_opp_table: opp-table4 {
 		compatible = "operating-points-v2";
 
 		opp-333000000 {
@@ -151,7 +151,7 @@ opp-166500000 {
 		};
 	};
 
-	bus_hevc_opp_table: opp_table5 {
+	bus_hevc_opp_table: opp-table5 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -175,7 +175,7 @@ opp-100000000 {
 		};
 	};
 
-	bus_noc2_opp_table: opp_table6 {
+	bus_noc2_opp_table: opp-table6 {
 		compatible = "operating-points-v2";
 
 		opp-400000000 {
diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 97a2f0c7c0cf..7269275c7cef 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -860,7 +860,7 @@ pmic@66 {
 		muic: max77843-muic {
 			compatible = "maxim,max77843-muic";
 
-			musb_con: musb_connector {
+			musb_con: musb-connector {
 				compatible = "samsung,usb-connector-11pin",
 					     "usb-b-connector";
 				label = "micro-USB";
@@ -1064,7 +1064,7 @@ initial_alive: initial-state {
 		PIN(INPUT, gpf5-7, DOWN, FAST_SR1);
 	};
 
-	te_irq: te_irq {
+	te_irq: te-irq {
 		samsung,pins = "gpf1-3";
 		samsung,pin-function = <0xf>;
 	};
diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 8eb4576da8f3..4ee40ead44e4 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -23,7 +23,7 @@ / {
 
 	interrupt-parent = <&gic>;
 
-	arm_a53_pmu {
+	arm-a53-pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
@@ -32,7 +32,7 @@ arm_a53_pmu {
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
 	};
 
-	arm_a57_pmu {
+	arm-a57-pmu {
 		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
@@ -137,7 +137,7 @@ cpu7: cpu@3 {
 		};
 	};
 
-	cluster_a53_opp_table: opp_table0 {
+	cluster_a53_opp_table: opp-table0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
@@ -183,7 +183,7 @@ opp-1300000000 {
 		};
 	};
 
-	cluster_a57_opp_table: opp_table1 {
+	cluster_a57_opp_table: opp-table1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
-- 
2.25.1

