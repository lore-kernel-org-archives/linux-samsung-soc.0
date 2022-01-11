Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D378AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 20:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243433AbiAKUSH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:18:07 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38012
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243160AbiAKUSD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:03 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D9DCC40048
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 20:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932282;
        bh=PGhCGHIzXCQK8AryrRyQ6DVaFN8DyDgbyb7ebCRERqc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=CFWj/QnnUY3b9BLfoiu44U6/Po34Eu0ZY0T4uBWf0APhFEJya2rpkadhMmcsgA4rr
         iepWjmoMiV10hUzckfc0vSsTiWmYFaZEUh0j3rgimneom9VYb6g8SbFaV1N/585HZJ
         7ZSG4CxYHJmNjWC1PjPp+R52KIdRVobm0uaCwPxJiM2IfTsBbwEd5Vn7mRPJWPsw7D
         D3ORpI1a04nOOFWPjA3sVavu6FPwo0nXmqj6OBbbI70V5wVxUue63ycC/SG9JAitRy
         2xvbgVFOgmPInAOcEb9P4WR5bZbRKK7RAFOICJE9vPzLERgEUir+24Ib8qYq1wjwIS
         azMCJ0Cl+ickw==
Received: by mail-ed1-f72.google.com with SMTP id z9-20020a05640240c900b003fea688a17eso192292edb.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 12:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PGhCGHIzXCQK8AryrRyQ6DVaFN8DyDgbyb7ebCRERqc=;
        b=jyNTx4D+TkzxXAs2n4tKjGbDj3vcU3IBYvBDjOGwtFXebUbPkVlKM3/20kIo4bBoCC
         X6LwSrVQqChZO2k7x1t2heJyM1qbuU3b7kZb/EduadZ13ceot3IgVtX7YtmV9lsWb6uK
         dvWYHYhJ7gc4lk0CjB6U++/pio5teVyOhUL2Y2S+du7AVbAWRAMkgXnYut0ErqQk700h
         SvXpBq0k8UWn7ME/+mbCgQBLRrPPcA1+br4m7bs5NZg/CpU8Q8pWzeViHruvo9RBA9iZ
         d9gkioxntjVASdf7JQDOOfcsFfCRkmCHbHX8mzkKmT1uAsM3nmVUsCZgDV/DuzhmMbMz
         m8Mw==
X-Gm-Message-State: AOAM533B72eqlAsvs6bw/XBxt9K5YFhP9jZUq20qWRRNdvl08ScMmd7O
        tnf1Ir0PU+gdojEMpToMe+BAz2/6duzxS4ZuSX6txwfPUKw/ygnQqZ68jhpxg3pCOmDmVSiKTGp
        3bcFeIg8tVtje+hxPljRmTKQy7+EJ9PUXfwSpQYqhqjYhfCJd
X-Received: by 2002:a17:907:3d94:: with SMTP id he20mr4852840ejc.339.1641932281207;
        Tue, 11 Jan 2022 12:18:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIdiGqTjRdbhrmv0zfCRs9CSoyD6hQUgu9NLRHIRRugCvqFsamAAB93Nka0c4uArWKniPbzQ==
X-Received: by 2002:a17:907:3d94:: with SMTP id he20mr4852831ejc.339.1641932281047;
        Tue, 11 Jan 2022 12:18:01 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 08/28] ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pi
Date:   Tue, 11 Jan 2022 21:17:02 +0100
Message-Id: <20220111201722.327219-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The pin configuration for PMIC DVS (pmic-dvs-2 and pmic-dvs-3) are
exactly the same, so merge them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 01f310f387d6..eca805b83816 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -221,7 +221,7 @@ max77802: pmic@9 {
 		interrupts = <1 IRQ_TYPE_NONE>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max77802_irq>, <&pmic_selb>,
-			    <&pmic_dvs_1>, <&pmic_dvs_2>, <&pmic_dvs_3>;
+			    <&pmic_dvs_1>, <&pmic_dvs_2>;
 		wakeup-source;
 		reg = <0x9>;
 		#clock-cells = <1>;
@@ -874,14 +874,7 @@ &sd1_cmd {
 
 &pinctrl_2 {
 	pmic_dvs_2: pmic-dvs-2 {
-		samsung,pins = "gpj4-2";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-	};
-
-	pmic_dvs_3: pmic-dvs-3 {
-		samsung,pins = "gpj4-3";
+		samsung,pins = "gpj4-2", "gpj4-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-- 
2.32.0

