Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7232FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Dec 2021 14:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240203AbhL2OPk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Dec 2021 09:15:40 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36568
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240171AbhL2OPf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 09:15:35 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 70B134074F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640787334;
        bh=HbKpfkrZUGdadD7XmgDwzNz9vUvDJVLjf2lMxGGzeCA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Es7GRG35Q2c9lUb1rOL3h00HWAww7hFFlh/y6OsLz4BGjY7k92kEtuHa5e3FZR7MA
         tg0IGF+sMJqu160hntY7BKEF0b7cl8yhplAkrNDl6arlCznffNz0vSkKlpo/sHqIdx
         8rFG/XhfrKxhgPUsjhNZFcRxpFvpFHVadN+4LvLsF1/J2tO95+awTSSutc4Wzb6vlO
         LBYJOBj6rwRsmIb8C0yZpiHPztPloMTxcZ+UIZCvIW/edb+Kmm0pPcj8wDy9LDPtHK
         gcmskskRyYJR3gltuCioN81Xy5qfn+IfbYCzVEOmNEYWsW4j7fRx7CYmnRe4XJpfZJ
         pcejCvzpd5XGQ==
Received: by mail-lj1-f200.google.com with SMTP id b20-20020a2e9894000000b0022dc5a5f841so4279714ljj.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 06:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HbKpfkrZUGdadD7XmgDwzNz9vUvDJVLjf2lMxGGzeCA=;
        b=RgcodL2YrCignzkbROI6t3YJqG7JP4CQ4d+l1ttCB5aIpKhRWhYk7DuYmyY46JReMi
         niiervUS7gIojpgcN6bfgMMUbHWDtxOuTB2yp9WghVC9m4jFXqbFhCcZcccsXtjGeRF3
         O8E6A9pdBlzk/iEVrugLLn9CUfhMTl0TU810F1qPMMt2WkOFnNOTljSgDsTbV36eXNO1
         tAhU5gK6LezSs1Vbq2VvERMwlVvKRpQ5wdNLRPk0CByUyvNVcuDBZAxvcyDFZ2Vxg2kZ
         3hbZtj1EMr/PgymM7GECLS9dooGdSGzvDSzOLH6llZ4UczeBsO5YMfFUBaUgXm28yr+O
         n56Q==
X-Gm-Message-State: AOAM533+F8KNzv7B3GOifXAGTw5mMTfEXDY6yHQ72WAtAUFcdEiQeOIx
        5dx71eAZ5UoGbUwStFOkUy/a1cr2JyBNry/1DHEUPqARFMymtZwG/GUGsudKgxThnNPwBRh+e37
        rep6yO4tLU35i9Om+ftho0p9Q54geOa/7z7XOtniaNG+SaA9C
X-Received: by 2002:a2e:8296:: with SMTP id y22mr16677139ljg.428.1640787333911;
        Wed, 29 Dec 2021 06:15:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjXxL7aKWt636pncf+xiaoHP44LWKxcavbqPXExP82pcMnBTYB6VgLf5x+PqOMV16O88Co8w==
X-Received: by 2002:a2e:8296:: with SMTP id y22mr16677129ljg.428.1640787333748;
        Wed, 29 Dec 2021 06:15:33 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a16sm1316164ljm.98.2021.12.29.06.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 06:15:32 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: exynos: Align MAX77836 nodes with dtschema on Monk and Rinato
Date:   Wed, 29 Dec 2021 15:15:21 +0100
Message-Id: <20211229141524.34174-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229141524.34174-1-krzysztof.kozlowski@canonical.com>
References: <20211229141524.34174-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The newly introduced dtschema for MAX77836 MUIC requires proper naming
of extcon child node.

This should not have actual impact on MFD children driver binding,
because the max77836 MFD driver uses compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos3250-monk.dts   | 2 +-
 arch/arm/boot/dts/exynos3250-rinato.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 8b41a9d5e2db..02a9dc479d34 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -69,7 +69,7 @@ max77836: pmic@25 {
 			reg = <0x25>;
 			wakeup-source;
 
-			muic: max77836-muic {
+			extcon {
 				compatible = "maxim,max77836-muic";
 			};
 
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 5f7f8fedfb92..6d2c7bb19184 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -70,7 +70,7 @@ max77836: pmic@25 {
 			reg = <0x25>;
 			wakeup-source;
 
-			muic: max77836-muic {
+			extcon {
 				compatible = "maxim,max77836-muic";
 			};
 
-- 
2.32.0

