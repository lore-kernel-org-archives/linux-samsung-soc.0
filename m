Return-Path: <SRS0=+yz4=AN=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B42C433DF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jul 2020 15:52:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D598B20771
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jul 2020 15:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1593705148;
	bh=f3jw5rMigz0VXRLsyRbxlza6WnZVLOfNkdJzdKSGuxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=oNxbUeuaMveiX+7K+U7Ao4lMXeSjC7Mg3dMrU4tpzYz9LlEydUkS+HX2RrDX74XVB
	 QKqeCr+NEBVnj1FbRxuf0YYJDwEnElW7gjg+0rxnMI7IB8DXKHrzzS8U0UyhztLEjG
	 iy8qNrV/3ydOtDy4VSO5c/7Lx2il3TDV67jFt+5I=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgGBPwY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jul 2020 11:52:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:33918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbgGBPwY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 11:52:24 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7CD3720885;
        Thu,  2 Jul 2020 15:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593705143;
        bh=f3jw5rMigz0VXRLsyRbxlza6WnZVLOfNkdJzdKSGuxo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SEdQWkAqqbX4bEtkWc2oFaPoZj0a2hbWZL3ZnXLCorazulU10Z65Yc5S3AlqyuJYh
         Uk91AkqOjWvAROPSjSO1BQt3WXh9BU+yWeloZxudUKJN0p+vak4ytXIT96vg4nl+Ga
         srBufV2/ubelolN12RhybEH28RGQ5iwBf/rhJPvc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 7/8] ARM: dts: exynos: Define fixed regulators in root node for consistency in Arndale
Date:   Thu,  2 Jul 2020 17:51:48 +0200
Message-Id: <20200702155149.12854-7-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200702155149.12854-1-krzk@kernel.org>
References: <20200702155149.12854-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove the regulators node and define fixed regulators directly under
the root node.  This makes Exynos5250 Arndale board consistent with
other Exynos boards.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 92 +++++++++++-------------
 1 file changed, 43 insertions(+), 49 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index c4cc7611898c..7ccb3814bab6 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -84,60 +84,54 @@
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		main_dc_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "MAIN_DC";
-			regulator-always-on;
-		};
+	main_dc_reg: regulator-0 {
+		compatible = "regulator-fixed";
+		reg = <0>;
+		regulator-name = "MAIN_DC";
+		regulator-always-on;
+	};
 
-		mmc_reg: regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "VDD_MMC";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			regulator-always-on;
-		};
+	mmc_reg: regulator-1 {
+		compatible = "regulator-fixed";
+		reg = <1>;
+		regulator-name = "VDD_MMC";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
 
-		reg_hdmi_en: regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "hdmi-en";
-			regulator-always-on;
-		};
+	reg_hdmi_en: regulator-2 {
+		compatible = "regulator-fixed";
+		reg = <2>;
+		regulator-name = "hdmi-en";
+		regulator-always-on;
+	};
 
-		vcc_1v2_reg: regulator@3 {
-			compatible = "regulator-fixed";
-			reg = <3>;
-			regulator-name = "VCC_1V2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-always-on;
-		};
+	vcc_1v2_reg: regulator-3 {
+		compatible = "regulator-fixed";
+		reg = <3>;
+		regulator-name = "VCC_1V2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
 
-		vcc_1v8_reg: regulator@4 {
-			compatible = "regulator-fixed";
-			reg = <4>;
-			regulator-name = "VCC_1V8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
+	vcc_1v8_reg: regulator-4 {
+		compatible = "regulator-fixed";
+		reg = <4>;
+		regulator-name = "VCC_1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
 
-		vcc_3v3_reg: regulator@5 {
-			compatible = "regulator-fixed";
-			reg = <5>;
-			regulator-name = "VCC_3V3";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	vcc_3v3_reg: regulator-5 {
+		compatible = "regulator-fixed";
+		reg = <5>;
+		regulator-name = "VCC_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
 	};
 
 	sound {
-- 
2.17.1

