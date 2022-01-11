Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775F9C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 17:48:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344241AbiAKRsu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 12:48:50 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:32880
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242307AbiAKRss (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 12:48:48 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C683140049
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 17:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641923327;
        bh=r9HPg3JSAEOg9NmbHzzSoR6SujxmeJ0M4OI/ixjeZrc=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=uweeDv3Tr4UYFCN765rKwoesYJQyUyr7Mkd2j03NfyH4J5Beitn6hdi9XHVEGyFXX
         KMMnS0UiL3BmEnYun/JqaUQf1OjxYPy7B/oqsXewjL1IPNIPYamFhQ2gebmSwQSafW
         YxdwahtI5Byt+Rfhi8TWX2zcKPnZu8d4oED3k5ihKKBMoeJ0MNrSmNeF3d0HoxbGp0
         mPfDZO7tHf2DyvsPeFjEbcyiX1ebEir7b5j28iXVG1bXH44NXQnij912ygeUB7PVJQ
         pQQIUyvEtM8UoAPEvuS/+RZOcW/L3mXu2weITAkYk8q84WEbOy+aiUXd6R4vJg20Ch
         r4UZ1/7i2XabQ==
Received: by mail-ed1-f69.google.com with SMTP id t1-20020a056402524100b003f8500f6e35so14053590edd.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 09:48:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r9HPg3JSAEOg9NmbHzzSoR6SujxmeJ0M4OI/ixjeZrc=;
        b=W5id92wzEn3GSMVBeCGAwNK6YpGVz+GsBF64+jQzhd5PxoPf2qRIopEY02uoqaGOq4
         Dm4LYfBvBIvcMcz079oqV0iDs+GZ/r3KQw6DxfB9Igfo+W0h6/YMZhTttLDlo2vfbpxR
         hkJY4hsohzEyc5yIOq2L5rcXm+dTZq7XfBnwUOnlUQjDLpAUHvcW85bnozubfVlxZ6sc
         zGjaqkHMphQ9Z/ujvG9Z1ckVjBfwvVpbMVymsYdY2jRCb9Tlji5lSe8WUzorgQPzsC/W
         c9hAKZUhKXEWDW7mFGLsy2gos2kSnTYgYegkhhTt/f81P9l4b7xrHtOlyMKwB+ZFZWNf
         d84Q==
X-Gm-Message-State: AOAM533pSlssa6eqW7RLTa0EdQ7wPJMgYBP8TyTN3TScTtMa4BudO3pJ
        l0Sj0DQAkv6MB5Bkic+lsjUWHOh/JQRR7xCaa225f6J7AewRmabTmQTmk/0eMYoVXmC2KG7DDoH
        li5APiwg8QlAdMaYO31dFNNP0eqooi25RLbSWrt47DCQEz1jl
X-Received: by 2002:a05:6402:2926:: with SMTP id ee38mr5359075edb.213.1641923327464;
        Tue, 11 Jan 2022 09:48:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+p+O24kX8sPC/HNYpy64NZDAo6pLYgZcq2YV7Eo6ROyfYbvEElF6pogK2B2ET8YMiBcR5aA==
X-Received: by 2002:a05:6402:2926:: with SMTP id ee38mr5358977edb.213.1641923325879;
        Tue, 11 Jan 2022 09:48:45 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id i23sm5224489edt.93.2022.01.11.09.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:48:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 1/5] arm64: dts: exynos: Align MAX77843 nodes with dtschema on TM2
Date:   Tue, 11 Jan 2022 18:48:01 +0100
Message-Id: <20220111174805.223732-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
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

