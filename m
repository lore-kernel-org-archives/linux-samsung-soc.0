Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD862C43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Dec 2021 16:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhLaQWO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Dec 2021 11:22:14 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46762
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229669AbhLaQWN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Dec 2021 11:22:13 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 24F843F044
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 16:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967732;
        bh=mL18Z39QPfc2IdUN6x6/1fiaINT8SrvvNdTfHBPZ9SY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=eEOXei/QJGf2tVKnMtCC3Q+qoiY20JIWY9fTyzXrfkjqYZATHL+lntqFYCTLZ85Hw
         v61eR3WIF++Wqr95NzxRVxcb/9h0LEXJU0zsfGuUrP5Mq/izma6GN6YjVA5343B+rn
         dNJ8QMLGvP4mSCQHoYCEcZZPIqR2oqRUdcK5ohPAw/uyVBRXCY1MPNmwGHjY33SNXl
         OeLSwEYep8Q7Yslril7fnkqo/ecyMD4w6CB6IuzkmI5XF4/MQ3Pl6SCqqmxKEf/vPc
         OD0IsX2CoRrZy0pwQe5Auti8Hwbvnjyn5yUsJFGO6gHPMzmqpYSLx3oxBLcrvk4oFC
         OsGZti3RblsWw==
Received: by mail-lj1-f199.google.com with SMTP id k11-20020a05651c0a0b00b0022dc4d55f14so6495808ljq.22
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 08:22:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mL18Z39QPfc2IdUN6x6/1fiaINT8SrvvNdTfHBPZ9SY=;
        b=QEgvIMb06qH3UniJbACdZBo/QaKAU3il5voij1K4wozGymsPY8hXvdzAwoFetxJJFK
         rsXyEHSXa6PnVxX1XJOtXYi9qiHDGp5LLxyqEDpMBY7gmGaTT54zVQn9g87+bEJSNA3p
         U891rGlZffN3WfGtIfE7Ug9khj1tKNPCURhgMuWoiOZagqsXZ+4+ivUF09MF0PmxOjkl
         LH8Qq7J0XgFzSnBMwKdy9wOt4Vzyv8muylFC7VcCtnf8SqnNN3Rz2p5JxoxIVsdAJQ9T
         VJWOR3RCjUepEHklw6cC1HlTRT0LkgNMzu75PhiReuSsUy6+YwRQbYRUJpBbBL79SIM+
         qdSg==
X-Gm-Message-State: AOAM531BtfRqMpQfRGwbC6zryz803bRkqP9lvDPxARr5Yq5HqB8i9i7y
        fq4dq3zrKnzn2LuqY9no6+0mJdN58N+3TWIPDKqnDPpeWHITKiptHBE0fGbIkr8Wo4WTARcRmHS
        bg10xfeqEW8G38svywitqzsF1/aGSKoiRky4dftL33WZgOnf3
X-Received: by 2002:ac2:59c8:: with SMTP id x8mr31058741lfn.573.1640967731670;
        Fri, 31 Dec 2021 08:22:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/FEr/wtUJWGC4oNBA2IyurE7WGnn0VSObMCIEkjcLZxN8PTJEPz+4mBcWEG+Cstck2ChusA==
X-Received: by 2002:ac2:59c8:: with SMTP id x8mr31058720lfn.573.1640967731503;
        Fri, 31 Dec 2021 08:22:11 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y36sm2796514lfa.75.2021.12.31.08.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:22:11 -0800 (PST)
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
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 08/24] ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pi
Date:   Fri, 31 Dec 2021 17:21:51 +0100
Message-Id: <20211231162207.257478-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The pin configuration for PMIC DVS (pmic-dvs-2 and pmic-dvs-3) are
exactly the same, so merge them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 6bf3fd37fb2b..eca805b83816 100644
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
@@ -874,26 +874,20 @@ &sd1_cmd {
 
 &pinctrl_2 {
 	pmic_dvs_2: pmic-dvs-2 {
-		samsung,pins = "gpj4-2";
+		samsung,pins = "gpj4-2", "gpj4-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
+};
 
-	pmic_dvs_3: pmic-dvs-3 {
-		samsung,pins = "gpj4-3";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-	};
+/* pinctrl_3*/
+/* Drive SPI lines at x2 for better integrity */
+&spi2_bus {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
 };
 
 &pinctrl_3 {
-	/* Drive SPI lines at x2 for better integrity */
-	spi2-bus {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
-
 	/* Drive SPI chip select at x2 for better integrity */
 	ec_spi_cs: ec-spi-cs {
 		samsung,pins = "gpb1-2";
-- 
2.32.0

