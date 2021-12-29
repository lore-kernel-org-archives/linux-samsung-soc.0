Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC793C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Dec 2021 12:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238771AbhL2MrK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Dec 2021 07:47:10 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39738
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238663AbhL2MrH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 07:47:07 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2F2143FFDF
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640782026;
        bh=r9HPg3JSAEOg9NmbHzzSoR6SujxmeJ0M4OI/ixjeZrc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=fnUNrjX3Z8YThMizjVjXe9+YvCWVdW1crqKGMEp9vC9lrtHTwQcTB8BFYjB89v7aj
         aKHsmQgPttoHq5CL9q5TeuwRWElUGxqvI/BX9ZV5RWQPT/VOqkwkawH/o3gOMlJj3G
         Yok5kI1cQFkac4dMwWoRPgkgU6TFMr7zhU5YhSXQsWW19coYMwgaj5II4+U4ucStBV
         11/Emup20ofDxI90rH1s7TqfVxeelLB2JEL7FFGaI/VwMjEvzn6KXkeVSn4Ogvy4vu
         6eB4zbRbTHsdmysHdACID5rL4uoF/BHuO6GkZtXm3ormEUrqeop9ByTtFDB3DOiBjs
         s5lmYewgNgQwQ==
Received: by mail-lj1-f197.google.com with SMTP id j15-20020a2e6e0f000000b0022db2724332so4878693ljc.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 04:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9HPg3JSAEOg9NmbHzzSoR6SujxmeJ0M4OI/ixjeZrc=;
        b=k/IQCcoXzC0dtrB0U4sF8l2t4QutsE7gE6cd7H27BvyrG+zzACboyDaC7zA2x1FYDc
         colusXBHGCiiwpKOEsBmA5sAEcrTCFY/J7j7FyvOaMegBw3a+j//uuhePWddLx+F/1TE
         LOYmC7yvFhRvI2E65r6E+MRgZfn23kdfosnWllYs18PhlwqKFlgeJdYaCWY0sqVegY9U
         6xKO70V4oGBxAG0LUZK3k4pAj3m9W4oWwgk4yP7SJpMQJNcig3J6qc9F659LJpDgGgCs
         QItC3DDkSIpBQs/aI+2RXbgX4XPnS6iWYLEHSfZF17xVpuz32d/0gnkgl4i8VtLJXYbI
         6D9g==
X-Gm-Message-State: AOAM531Y7uNFnIN2rjZORY8xFnFqi5hsR2FB9rYX8G2+12otltZqEqDs
        3AMLvkm/Da0o/BsBi7GmcD5tpdXaz+kRWk8PCCVcCrgsRaxqc4+eH7xFz7vnJSh7uYCFLcRxFqG
        TBMTVgSJFMGngPQlbfs5NT7IGrkl44kolkc8Gss+sJxj+v68i
X-Received: by 2002:a05:651c:54f:: with SMTP id q15mr16468113ljp.319.1640782021622;
        Wed, 29 Dec 2021 04:47:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxQ5KP8xCMo76zySy7IgcVerWkV4lDnBlSblfUvCTCSfXuM2Uh2jh+Nf/55i9Fuz7F9pVdknQ==
X-Received: by 2002:a05:651c:54f:: with SMTP id q15mr16468087ljp.319.1640782021346;
        Wed, 29 Dec 2021 04:47:01 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id e11sm711158ljn.73.2021.12.29.04.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 04:47:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 1/5] arm64: dts: exynos: Align MAX77843 nodes with dtschema on TM2
Date:   Wed, 29 Dec 2021 13:46:27 +0100
Message-Id: <20211229124631.21576-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
References: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The newly introduced dtschema for MAX77843 MUIC require the children to
have proper naming and a port@0 property.

This should not have actual impact on MFD children driver binding,
because the max77843 MFD driver uses compatibles.  The port@0 is
disabled to avoid any impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Please kindly test or even better - fix the DTS and extcon driver.
---
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index cbcc01a66aab..03f7c9acaacb 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -858,10 +858,10 @@ pmic@66 {
 		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
 		reg = <0x66>;
 
-		muic: max77843-muic {
+		muic: extcon {
 			compatible = "maxim,max77843-muic";
 
-			musb_con: musb-connector {
+			musb_con: connector {
 				compatible = "samsung,usb-connector-11pin",
 					     "usb-b-connector";
 				label = "micro-USB";
@@ -871,6 +871,17 @@ ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
 
+					port@0 {
+						/*
+						 * TODO: The DTS this is based on does not have
+						 * port@0 which is a required property. The ports
+						 * look incomplete and need fixing.
+						 * Add a disabled port just to satisfy dtschema.
+						 */
+						reg = <0>;
+						status = "disabled";
+					};
+
 					port@3 {
 						reg = <3>;
 						musb_con_to_mhl: endpoint {
@@ -910,7 +921,7 @@ charger_reg: CHARGER {
 			};
 		};
 
-		haptic: max77843-haptic {
+		haptic: motor-driver {
 			compatible = "maxim,max77843-haptic";
 			haptic-supply = <&ldo38_reg>;
 			pwms = <&pwm 0 33670 0>;
-- 
2.32.0

