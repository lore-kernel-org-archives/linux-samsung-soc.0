Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D66A3C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C140261058
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239938AbhI1Iwg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 04:52:36 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48496
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239900AbhI1IwN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 04:52:13 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A73504082A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 08:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632819016;
        bh=7tIJ+clHqy+CZwai/Om4gGD+ttDWFFGGGFnCE/+PWi8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=rvuAxQLbNhId7yW/E3zmIp8gS3uhwWq88vVidv7/rPvSZVOY003vi+MypE5ljDeCH
         ARWJCAySJGTV5AGeS67gwoyTHYj8AOgHBo2/0NTK04Kzzwac5EHDKh503n6RTY06lx
         SU5cnnmF6YCgeLa2d4RjZHWLKIBXHrYV2kvoKHwciYSWBDlZHYhGSl9m919jewxxf7
         HmiXkGMcEjR+M5Z84mJl++XcRfwSXx0EN95ksIQKn8IjdBcM9hYulKGZP76rqI6dlx
         imhQeK2TfDbUTnn18wfmn7/Gs38wCp3HxkqfSQ52Gxb+jplVhgmA61ELdKv5vv8duG
         tDwMhLsd8NjxA==
Received: by mail-lf1-f69.google.com with SMTP id 12-20020ac2484c000000b003fcb3298d00so15525082lfy.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 01:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7tIJ+clHqy+CZwai/Om4gGD+ttDWFFGGGFnCE/+PWi8=;
        b=axgNOXfET3BWp3vxBLYFt8e06F5S5MO3+I/41DGwc68dYjbr2rsH6dEX8n4PWOq/sL
         R+dZ4XdEODjvfywl1Y2v3+hxVh2OcDmHzhX0tcX/4dXtbsfI36CASltZOH8OJ30UmUKP
         dsL4Z4c7Q2copyrFUIOa6X3ZX8EL3DgfT6lKVaS2zX4KjrcoH9azIaaKBvv0fSASk7D8
         ThSiViZNO3zp8q8bwgbW3y+23LfnNcLCPQoweoy7hXBc5qcbmLxcMd1IFO0H5bUZQpME
         3Fl2Wu0gi00m1jqF/FmzaGsTKqhbWte8iNNCWXA9s04xjoDjpCP1cHshutZWQT1cfiN8
         wMqw==
X-Gm-Message-State: AOAM530LHay+H6ihAyy7lmFflt4LbLKap91p5o5zcgD+Jm8feFICMWk7
        UT1uhOukjcUB/vwbE51T4zRTb1SVqUBoBIdYEMe0rq+Y57vNMXBpjOWk4IEPhz4yCjqhyQVu3sB
        HE0Chhp1y6nWtYx6jdlLbpEl0VFF5clTWriBQwlVCiNzyHYyF
X-Received: by 2002:a2e:bba0:: with SMTP id y32mr4729605lje.135.1632819013557;
        Tue, 28 Sep 2021 01:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXNIsIC74EHEhcaaIOoTj5Amse61yM2/pmnchBnUI0iS1c3lanOpAQelzFzUvbyrrH5gtK6Q==
X-Received: by 2002:a2e:bba0:: with SMTP id y32mr4729585lje.135.1632819013368;
        Tue, 28 Sep 2021 01:50:13 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:50:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 12/12] ARM: dts: exynos: use spaces instead of tabs around '='
Date:   Tue, 28 Sep 2021 10:49:49 +0200
Message-Id: <20210928084949.27939-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use spaces in Origen boards instead of tabs around '=' for simple
property assignments, to match coding style.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos4210-origen.dts | 24 ++++++++++++------------
 arch/arm/boot/dts/exynos4412-origen.dts | 14 +++++++-------
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index 1c5394152561..435fda60e86d 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -206,74 +206,74 @@ ldo3_reg: LDO3 {
 			ldo4_reg: LDO4 {
 				regulator-name = "VDD_RTC_1.8V";
 				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt	= <1800000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 			};
 
 			ldo6_reg: LDO6 {
 				regulator-name = "VMIPI_1.8V";
 				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt	= <1800000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 			};
 
 			ldo7_reg: LDO7 {
 				regulator-name = "VDD_AUD_1.8V";
 				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt	= <1800000>;
+				regulator-max-microvolt = <1800000>;
 			};
 
 			ldo8_reg: LDO8 {
 				regulator-name = "VADC_3.3V";
 				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt	= <3300000>;
+				regulator-max-microvolt = <3300000>;
 			};
 
 			ldo9_reg: LDO9 {
 				regulator-name = "DVDD_SWB_2.8V";
 				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt	= <2800000>;
+				regulator-max-microvolt = <2800000>;
 				regulator-always-on;
 			};
 
 			ldo10_reg: LDO10 {
 				regulator-name = "VDD_PLL_1.1V";
 				regulator-min-microvolt = <1100000>;
-				regulator-max-microvolt	= <1100000>;
+				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
 			};
 
 			ldo11_reg: LDO11 {
 				regulator-name = "VDD_AUD_3V";
 				regulator-min-microvolt = <3000000>;
-				regulator-max-microvolt	= <3000000>;
+				regulator-max-microvolt = <3000000>;
 			};
 
 			ldo14_reg: LDO14 {
 				regulator-name = "AVDD18_SWB_1.8V";
 				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt	= <1800000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 			};
 
 			ldo17_reg: LDO17 {
 				regulator-name = "VDD_SWB_3.3V";
 				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt	= <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			ldo21_reg: LDO21 {
 				regulator-name = "VDD_MIF_1.2V";
 				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt	= <1200000>;
+				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 			};
 
 			buck1_reg: BUCK1 {
 				regulator-name = "VDD_ARM_1.2V";
 				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt	= <1350000>;
+				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
@@ -281,7 +281,7 @@ buck1_reg: BUCK1 {
 			buck2_reg: BUCK2 {
 				regulator-name = "VDD_INT_1.1V";
 				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt	= <1100000>;
+				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index 5479ef09f9f3..e6aec5facabf 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -382,7 +382,7 @@ ldo28_reg: LDO28 {
 			buck1_reg: BUCK1 {
 				regulator-name = "VDD_MIF";
 				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt	= <1100000>;
+				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -391,7 +391,7 @@ buck1_reg: BUCK1 {
 			buck2_reg: BUCK2 {
 				regulator-name = "VDD_ARM";
 				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt	= <1350000>;
+				regulator-max-microvolt = <1350000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -400,7 +400,7 @@ buck2_reg: BUCK2 {
 			buck3_reg: BUCK3 {
 				regulator-name = "VDD_INT";
 				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt	= <1200000>;
+				regulator-max-microvolt = <1200000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -409,7 +409,7 @@ buck3_reg: BUCK3 {
 			buck4_reg: BUCK4 {
 				regulator-name = "VDD_G3D";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <1500000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -418,7 +418,7 @@ buck4_reg: BUCK4 {
 			buck5_reg: BUCK5 {
 				regulator-name = "VDD_M12";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <1500000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -427,7 +427,7 @@ buck5_reg: BUCK5 {
 			buck6_reg: BUCK6 {
 				regulator-name = "VDD12_5M";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <1500000>;
+				regulator-max-microvolt = <1500000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
@@ -436,7 +436,7 @@ buck6_reg: BUCK6 {
 			buck9_reg: BUCK9 {
 				regulator-name = "VDDF28_EMMC";
 				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt	= <3000000>;
+				regulator-max-microvolt = <3000000>;
 				regulator-always-on;
 				regulator-boot-on;
 				op_mode = <1>; /* Normal Mode */
-- 
2.30.2

