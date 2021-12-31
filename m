Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73974C43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Dec 2021 16:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhLaQUY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Dec 2021 11:20:24 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46598
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231299AbhLaQUW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Dec 2021 11:20:22 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 59ECD3F1A5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 16:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967621;
        bh=TH0oF15Kc0CqVuAFXtLabbq4xKOXn0YXSWaECUHYifY=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ohQsEGxu6dujPF8hDVfREz1EEvvQnEnyhJVwDbWg0uxA95gQl7q3cfRBPOKa/R6Dn
         Uvt8fbMTyknOlQU9QBQxCu4FnZjkA9DvLtLp3SrhO/bL/JmyXWzjnCU1mv8OM9ZSwx
         WKpC5Ov/10nU1ttIvgJEYV2dSLCJphkFcF2QN+KDgLDCkOO6YZlhpP0/UiVCuRWxYg
         9a+3xrryVwXFXfDv1PSPT6pSU/oKTituxnfZud0hUE+mUXxRnjj1qASNwF6i/1WIKh
         Bbr/Se5i2LiNazEc5E1t5DpAfivHyCNM2Mjb2rqMleDgVXnKX3qG1XDGyuhV+gt34z
         DfPwVBKZF2NyA==
Received: by mail-lj1-f199.google.com with SMTP id o11-20020a2e90cb000000b0022dd251d30aso5854625ljg.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 08:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TH0oF15Kc0CqVuAFXtLabbq4xKOXn0YXSWaECUHYifY=;
        b=SDfHdLw7Jj4TwSqqQ4PaKIXuClI9ENNAmSfWM6MswqjoM7fFE8VAYn+Cmgm0Gn+FQx
         YOjWqEKmqHspf5MXwtGFCW7mZcCQCm/eXSBENP/hS4uryIWltK94ZoKhmYkp+YD/Jhwp
         ms6lELO0oIWXZaa75aNTj2KXMIVp8twf/m03un62i4gzrguyRi2vQaSATvoLEshH3zJx
         mTbTkNDCvPoDaunx2OXpcLQ4FYlZltC0C52u+4+KOtyv+lFekBKagutVCusWNG/31iwR
         qt/VzzkD/XwHyXQgN+XivOVWKo0oQX6LoK/LlyDLDnGwK5yD3F6BX7zFsWrojAaEoiI7
         Rb3A==
X-Gm-Message-State: AOAM533ObBs6wc+HBjRy1kfj4F8M1Pvjxn3EH/K/3oMObmKDzL0Q9B/X
        RUYxOptpLvSDdSgRMapvTL1bqucTlES0mTjmFUtYUPffkHGN1Y2Z0ICNgmGcmGsc5/0K4wAPkzw
        aMac5QYanIyW9rhC0i/Uxns6z2SNYLcYLVbk6GqPdZY7pXNZh
X-Received: by 2002:a05:6512:50c:: with SMTP id o12mr31325052lfb.41.1640967620201;
        Fri, 31 Dec 2021 08:20:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMqE/akwbQRGAl1EyK9nwLMn8n/FHmUvm7r3qWQZB4T8laq8h6qcWctul6RIR1PWEOXiId6w==
X-Received: by 2002:a05:6512:50c:: with SMTP id o12mr31325047lfb.41.1640967620036;
        Fri, 31 Dec 2021 08:20:20 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bx10sm2817607ljb.3.2021.12.31.08.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:20:19 -0800 (PST)
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
Subject: [PATCH 05/24] ARM: dts: exynos: override pins by label in Peach Pit
Date:   Fri, 31 Dec 2021 17:19:11 +0100
Message-Id: <20211231161930.256733-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Using node paths to extend or override a device tree node is error
prone.  If there was a typo error, a new node will be created instead of
extending the existing node.  This will lead to run-time errors that
could be hard to detect.

A mistyped label on the other hand, will cause a dtc compile error
(during build time).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 44 +++++++++++-----------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index e76fb104db19..1ae5528e9ebf 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -868,27 +868,26 @@ pmic_dvs_1: pmic-dvs-1 {
 	};
 };
 
-&pinctrl_1 {
-	/* Adjust WiFi drive strengths lower for EMI */
-	sd1_clk: sd1-clk {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+/* pinctrl_1 */
+/* Adjust WiFi drive strengths lower for EMI */
+&sd1_bus1 {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_cmd: sd1-cmd {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_bus4 {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_bus1: sd1-bus-width1 {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_bus8 {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_bus4: sd1-bus-width4 {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_clk {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
-	sd1_bus8: sd1-bus-width8 {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+&sd1_cmd {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
 };
 
 &pinctrl_2 {
@@ -907,12 +906,13 @@ pmic_dvs_3: pmic-dvs-3 {
 	};
 };
 
-&pinctrl_3 {
-	/* Drive SPI lines at x2 for better integrity */
-	spi2-bus {
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
-	};
+/* pinctrl_3*/
+/* Drive SPI lines at x2 for better integrity */
+&spi2_bus {
+	samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
+};
 
+&pinctrl_3 {
 	/* Drive SPI chip select at x2 for better integrity */
 	ec_spi_cs: ec-spi-cs {
 		samsung,pins = "gpb1-2";
-- 
2.32.0

