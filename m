Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCDBC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Dec 2021 16:43:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231320AbhL1QnO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Dec 2021 11:43:14 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49406
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232911AbhL1QnN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Dec 2021 11:43:13 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 812E33F1A5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Dec 2021 16:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640709792;
        bh=5OFsFqaSGsjPv5sIh7p3C4dzVLnGHorZakfLh7myIfQ=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Z+ifqaxKWUPnEeUgUGnotji4zwpQVOjdmyVFkcIjfwtZgonLYzPFVBkmQjUvMXU/+
         /ue3rq15HH+7K1OWhM6TA28Ov7rk+w8lPZK/Sh7dxHzqRmje7H3qhaKF57G9dsbYUH
         +SQ+IR/hds3xmOn2SqsrnjR3pcvspNYV9SRBAp6CjGf/IFwt4SIcuUxZLYSbnqKpgy
         vHzsNInq/jNswfNQWp4YY7w/Tx78TU28L0/mFVx8IEx3fzPay20l6s53CZNJsax7io
         EduAfXar313iBwicFlGx8AjkNMHMAY3qlWN3YbP8+L4+0eCSLoXnV8rkA0nAb9viL3
         3wgLh0+itynYw==
Received: by mail-lf1-f69.google.com with SMTP id b35-20020a0565120ba300b0042604bb4857so4200228lfv.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Dec 2021 08:43:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5OFsFqaSGsjPv5sIh7p3C4dzVLnGHorZakfLh7myIfQ=;
        b=0c+Ruy6rHn0fenLgw05b35rH3mUG3PkKP9beI66hk1nMiVOnGN7lni1RZwnL2hVyik
         iWXTkltiNB8vTqrai3YF4Qva8t0e9X0VWJuuk64OjlaZClGWa//fL0FiPIU8UeSkJUJ7
         WR+W6+h7+jxlJSU4UeEYXRoFGcw2gSy+sW/x6WML6OsEpOiyXw86H53z5RuEn58oSXkw
         2lQu1LU5pJMIr/+Xem2IVpwROu/C+hnZO2YIQ2wV/JyGh0LUkHETfVMBR8hUbMQTJmIX
         OIjSrgFsFq+BpTUWvIcnGlsvZDeAtVmlhgh37fprRowYy4eueC0PCoaJHRfywVmJmRL9
         n1Qg==
X-Gm-Message-State: AOAM530685SqYcoFca0BrXw0u6ZF5/Ew8ADAvK+coAuYHHEO8rt46qlw
        jmb4pUzP8GRBfzY/HXtlYvH8JqiJOjn5YVTmHxD9iV2pRNeWb0Cuc/tMbpepn2yB1QPw3ShY6pa
        T58LBIvnWhHBHhDcI2Ziw9Ds5FsJ6f+9wv8ZwkPI2II49yh4H
X-Received: by 2002:a19:7902:: with SMTP id u2mr19792375lfc.512.1640709791948;
        Tue, 28 Dec 2021 08:43:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQ/rn6qxMTI3Tjk19c1umU0DPNGMBgrso02fway7KgHERuxbrNFI343SLKCOLNwxZHtJmq2g==
X-Received: by 2002:a19:7902:: with SMTP id u2mr19792363lfc.512.1640709791801;
        Tue, 28 Dec 2021 08:43:11 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u5sm968701lja.36.2021.12.28.08.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 08:43:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/3] ARM: dts: exynos: drop unsupported MAX77802 regulators on Odroid XU
Date:   Tue, 28 Dec 2021 17:43:03 +0100
Message-Id: <20211228164305.35877-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211228164305.35877-1-krzysztof.kozlowski@canonical.com>
References: <20211228164305.35877-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The numbering of regulators is not continuous and the MAX77802 does not
support regulators LDO16, LDO22 and LDO31.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 884fef55836c..356d5f15dbb6 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -394,10 +394,6 @@ ldo15_reg: LDO15 {
 				regulator-always-on;
 			};
 
-			ldo16_reg: LDO16 {
-				regulator-name = "ldo16";
-			};
-
 			ldo17_reg: LDO17 {
 				regulator-name = "cam_sensor_core";
 				regulator-min-microvolt = <1200000>;
@@ -427,10 +423,6 @@ ldo21_reg: LDO21 {
 				regulator-max-microvolt = <2850000>;
 			};
 
-			ldo22_reg: LDO22 {
-				regulator-name = "ldo22";
-			};
-
 			ldo23_reg: LDO23 {
 				regulator-name = "dp_p3v3";
 				regulator-min-microvolt = <3300000>;
@@ -477,10 +469,6 @@ ldo30_reg: LDO30 {
 				regulator-always-on;
 			};
 
-			ldo31_reg: LDO31 {
-				regulator-name = "ldo31";
-			};
-
 			/* On revisions with ti,ina231 this is sensor VS */
 			ldo32_reg: LDO32 {
 				regulator-name = "vs_power_meter";
-- 
2.32.0

