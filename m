Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1264BC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 20:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243325AbiAKUP0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:15:26 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37746
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243012AbiAKUPY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 15:15:24 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7E293F175
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 20:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932123;
        bh=yMRg5bpikDO180MsuJoGQbsc7amvRmcUNEN2QLw9x1s=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=BlVjFCFEDEqxUu4C8Rj3D0gmwrrmo2eO80CEE2ggoiXOMSSNPnbvHkAwOoMatLW7Z
         V/h30LRjs6P4QRgyAd2uT7WGlccQM3uH8ElWnKp+P/kv9b5OA418QCAJNSOl9jAcgO
         9mnY1cGInaXgdcIk1kyeiDNRQN46LwrwPV4m3irrUOIeYO/GTUIGmNlOFMw7jGPmXH
         HRvTH6zb7htgwVEMYFuRRmlfjFxwtkXrZUicvdxb7JrIPPOZOZ6QgDu058TgDJ/X2c
         hdIjmW7ZN30e9IWyEzArqfHnTMMKXELEqxYiNr13Nd7hOO2TYj2bcvZ74Pv6Xqyzq5
         rPpH9RVyyAVPQ==
Received: by mail-ed1-f72.google.com with SMTP id t1-20020a056402524100b003f8500f6e35so192916edd.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 12:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yMRg5bpikDO180MsuJoGQbsc7amvRmcUNEN2QLw9x1s=;
        b=GGyKOQ3RQIEIKZiQ17kX/qpw6z7IWUd2ayTjcPiRTXFqOvEeHEKowU+HRNQLP/cfna
         TU/lNWaexrdTDfZ0YNk8WiPtyHINCrcOBa9KyIROnFKyMP5YttM3nonAojwCEjnBjOS3
         bx7Gr9ab15H/uVjy7F9rAse8kjspKF+ZrVnJjiSZF30bYhmV4vUd3OJxTpsgbpEqThkr
         uNe+cjEc/TQW/1lngY22yvPXtw4kn3A5IH+UMcHqEkHQpoKj4ehHcmaEvXesZ+B/FW1P
         gr8Depy6uCnrORGC66Jt1vzGb1qdHpHfT8wg5/unC/bpkxsk81FvpqrL98Vpr5HEq65O
         piZQ==
X-Gm-Message-State: AOAM531U4oGGkE8fpFo60VRm4tMaupWWzhWtO2qzur2Da1YzkSmzyEZB
        aZr7ohxJWo7jMkJiBmw4Ajz1LpQeh4b95/ecz9ffikvn3ZUo3o0K35pkpsTHEd8iUwaEnH70YfD
        y0J55pTIP+NHqiXPMSk56KFKdvtUuTjuh6ZiqjU4rjF/iCuUf
X-Received: by 2002:a17:906:e92:: with SMTP id p18mr4852327ejf.616.1641932122793;
        Tue, 11 Jan 2022 12:15:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxy0jhY+ruxR5/A+E+ypB8QX7lhJyLehZkmqyLuFS2EyP4zC5Ct+Xt3e8pj1XNa67xaH8Jh9A==
X-Received: by 2002:a17:906:e92:: with SMTP id p18mr4852317ejf.616.1641932122648;
        Tue, 11 Jan 2022 12:15:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f23sm3852212ejj.128.2022.01.11.12.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:15:22 -0800 (PST)
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
Subject: [PATCH v2 05/28] ARM: dts: exynos: override pins by label in Peach Pit
Date:   Tue, 11 Jan 2022 21:14:03 +0100
Message-Id: <20220111201426.326777-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
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
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
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

