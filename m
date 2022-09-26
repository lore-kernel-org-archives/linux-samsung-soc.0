Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C08BC6FA86
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Sep 2022 14:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234602AbiIZOit (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Sep 2022 10:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234779AbiIZOiZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 10:38:25 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC666C127
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Sep 2022 05:58:34 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id x29so7369088ljq.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Sep 2022 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=w6V4EDGBi7bc0hFey/MeSVbaztlhpHUML/SAzePq6Ps=;
        b=s3T/OeCEjWcCz7Xde265NAXhd7T92aAzYkDD+yKiPpScRmSd7Z4y2P82OY2M8nHASJ
         vQ8AcpgWf6saxJ3NSt/KnIRozgerqP2P2jqVxa7KEecSIF9bIIQwcbuJoGIeQmHfvCnx
         NvexNjf7ezbHy/MylH1N15/injexr/BCIZOt4fethBLaTvM/H+kqm6p9F/feqNUaxHMc
         IdiIi7dRkww+j0Cf7tswoUT+dDQCzF9FVv+54eqMsYYAvF+Wwpq3wJOwrl1ntA0Vzmv0
         +dkSHUrqakgRkAN46UrUm8HEI4MAjypOFH4wTZPHqUZyN/ewgxhbZU5nKs3yyR+HPzuI
         Jf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=w6V4EDGBi7bc0hFey/MeSVbaztlhpHUML/SAzePq6Ps=;
        b=8H4hjSJ1VyWWebkktjhUDRfl6zE0R7UQaXJM94UmDMnPAZ26ya1z2Sy86Z8pSoax29
         Yg+yyHS1a1qS+Vzlv0vj3qDAkzaWWBOAQerBpLSzdolphlCPiW2eJ+alEbt9ZD/IPZPE
         qgPlQBgdTNt3w0O1qWD7qL80S4MC43y6dXDLlHoKOokkTi1uFTmHe9Yu65sn76V53QEA
         +sqD5Jhn5RUp7lj354fMtFcOohtW0QmivG4HDhholuQovgpqOw3Ar1R+1Fsm6ItoBFWp
         TCcPVuItiah0xCeNTZ5hbDCerJR7WioqyiTI0W5mfaqd+aRwTZI+L3lG0Zj5OY8pj8zk
         RZ9w==
X-Gm-Message-State: ACrzQf1kAWBV2HRvFr3YEBQnT1kN6MGqbNMnjexTC4g0LutHziIKRSPm
        taWdqNZAQGlNJDU5fniUR4ZmfQ==
X-Google-Smtp-Source: AMsMyM4LA+tL4Jz/ex7fkTi1ACk8iXZOpCcJWqZscXaQxyNRSe9Ac633TD2N2XyvQSlagF944m2FUg==
X-Received: by 2002:a2e:be24:0:b0:26d:9942:dfe with SMTP id z36-20020a2ebe24000000b0026d99420dfemr1721034ljq.16.1664197112498;
        Mon, 26 Sep 2022 05:58:32 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q2-20020a19a402000000b00492d7a7b4e3sm2528790lfc.4.2022.09.26.05.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 05:58:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: s5pv210: correct double "pins" in pinmux node
Date:   Mon, 26 Sep 2022 14:58:24 +0200
Message-Id: <20220926125824.477920-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Drop second "pins" suffix from pin configuration/mux nodes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/s5pv210-aries.dtsi  | 4 ++--
 arch/arm/boot/dts/s5pv210-galaxys.dts | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5pv210-aries.dtsi
index 5541df4df628..964c5fe51755 100644
--- a/arch/arm/boot/dts/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
@@ -738,7 +738,7 @@ wifi_wake: wifi-wake-pins {
 		samsung,pin-pud = <S5PV210_PIN_PULL_NONE>;
 	};
 
-	magnetometer_i2c_pins: yas529-i2c-pins-pins {
+	magnetometer_i2c_pins: yas529-i2c-pins {
 		samsung,pins = "gpj0-0", "gpj0-1";
 		samsung,pin-pud = <S5PV210_PIN_PULL_NONE>;
 		samsung,pin-drv = <S5PV210_PIN_DRV_LV1>;
@@ -788,7 +788,7 @@ accel_i2c_pins: accel-i2c-pins {
 		samsung,pin-drv = <S5PV210_PIN_DRV_LV1>;
 	};
 
-	pmic_i2c_pins: pmic-i2c-pins-pins {
+	pmic_i2c_pins: pmic-i2c-pins {
 		samsung,pins = "gpj4-0", "gpj4-3";
 		samsung,pin-pud = <S5PV210_PIN_PULL_NONE>;
 		samsung,pin-drv = <S5PV210_PIN_DRV_LV1>;
diff --git a/arch/arm/boot/dts/s5pv210-galaxys.dts b/arch/arm/boot/dts/s5pv210-galaxys.dts
index cdd3653d487f..532d3f5bceb1 100644
--- a/arch/arm/boot/dts/s5pv210-galaxys.dts
+++ b/arch/arm/boot/dts/s5pv210-galaxys.dts
@@ -150,7 +150,7 @@ &pinctrl0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&sleep_cfg>;
 
-	fm_i2c_pins: fm-i2c-pins-pins {
+	fm_i2c_pins: fm-i2c-pins {
 		samsung,pins = "gpd1-2", "gpd1-3";
 		samsung,pin-pud = <S5PV210_PIN_PULL_NONE>;
 		samsung,pin-drv = <S5PV210_PIN_DRV_LV1>;
-- 
2.34.1

