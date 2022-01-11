Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B00C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 20:15:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244184AbiAKUPm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:15:42 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:59808
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243311AbiAKUP1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 15:15:27 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BD75340AA0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 20:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932123;
        bh=Yb4exiilZ6fWGtkNHAgUE2yCKFhigxo195C0Xf7w5qk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=TyuDncoHJZFBh82qg72dSrn4PAsPQbq5YLEasQlqBfA/rJ3TkkkREeWdbxqqW5OPI
         nTtHY4NCo2r182rMQb8Viz/gxo1d5AA9FrUiq/ZkO0SO0EVH5WoYunWYvRpmSIIBFu
         r9K3uQB2bglAxKI54lMEsGY4z1tNbs0BE+TOn6fuEoH6fYMqq6C4V8Hb9yltgK2Fjo
         y2PMK+QHWFhwYbHrpxHIt/trgLJfX6uUrjH0KKr0HN+WmNUgaFhp7+5c4kKA9Xffww
         k/zFHYr8/No9RcShit/OhxZUnGY7MggrTxuTopb7j/OH0wu21YAGXjt66KKpND15a9
         gZE7AlGyVyBrA==
Received: by mail-ed1-f72.google.com with SMTP id q15-20020a056402518f00b003f87abf9c37so169344edd.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 12:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yb4exiilZ6fWGtkNHAgUE2yCKFhigxo195C0Xf7w5qk=;
        b=eQn+gaSfo19hMD7x97fHbMYVoqu4tuXL8vEdDowbYLrP5Mx6WU4IAmeZFAzE8sd0xt
         LHa0fRzT52OKQOfu3r22dUtzvX1pJhw7jfTOgkmT0WqXXLn4NSbANIvfCDRqsV5UZc3u
         SL0RvJA0P5y0SObkqzE2ltdbH676PsORhrj1XzSS/+PjTZUQGSe4tZZ65HzzLUwug4nV
         IYIF5FDDB4afFUgOaF3XEbJ/uVCYfci0ZwLTFqIcy+MlaDUzxOAxVSPDnfa1Z39BHbRW
         qduaW+ahaTAt/smlakAr5tdyTvoqVcWD2pNwJDpNB32c/+VbdjY99MnQ1QX+h7fojDYS
         VcxA==
X-Gm-Message-State: AOAM531WVt2MuG/oIghf7A7IxkgJdvdiv5hSum/X9I6Q/zWVOO0QRAj8
        7wiF7KyEPeQuNRV7jnce4JaqKrJYTlBs4wWg/9lkOhS/pL3BGnaK/hqQHbUYevO7kdTONhyTytZ
        lpp7VKMRxIOEh5TC0zs2TAYJaakAXYDoN7MHI2Vfw7DqZUQlI
X-Received: by 2002:a05:6402:4249:: with SMTP id g9mr3571709edb.321.1641932121425;
        Tue, 11 Jan 2022 12:15:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKM89NfIORT3ha11SDkyVnHYgokbq+oykjhh4MT8WCGODxHOOwQN7VsX2r9dpD4YcqNBYMyw==
X-Received: by 2002:a05:6402:4249:: with SMTP id g9mr3571696edb.321.1641932121287;
        Tue, 11 Jan 2022 12:15:21 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f23sm3852212ejj.128.2022.01.11.12.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:15:20 -0800 (PST)
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
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 04/28] ARM: dts: exynos: simplify PMIC DVS pin configuration in Odroid XU
Date:   Tue, 11 Jan 2022 21:14:02 +0100
Message-Id: <20220111201426.326777-5-krzysztof.kozlowski@canonical.com>
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
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 884fef55836c..9f2200dd5b43 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -188,8 +188,7 @@ max77802: pmic@9 {
 		interrupt-parent = <&gpx0>;
 		interrupts = <4 IRQ_TYPE_NONE>;
 		pinctrl-names = "default";
-		pinctrl-0 = <&max77802_irq>, <&pmic_dvs_1>, <&pmic_dvs_2>,
-			    <&pmic_dvs_3>;
+		pinctrl-0 = <&max77802_irq>, <&pmic_dvs_1>, <&pmic_dvs_2>;
 		wakeup-source;
 		#clock-cells = <1>;
 
@@ -563,15 +562,8 @@ sd2_wp: sd2-wp {
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV4>;
 	};
 
-	pmic_dvs_3: pmic-dvs-3 {
-		samsung,pins = "gpx0-0";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-	};
-
 	pmic_dvs_2: pmic-dvs-2 {
-		samsung,pins = "gpx0-1";
+		samsung,pins = "gpx0-0", "gpx0-1";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-- 
2.32.0

