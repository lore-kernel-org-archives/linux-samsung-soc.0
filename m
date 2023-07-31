Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3DCC001DE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 09:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231890AbjGaJ7A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232572AbjGaJ6c (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:58:32 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6743B10C8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:35 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99bdcade7fbso558633566b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797454; x=1691402254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ge5Y7e80bFTSfkAsJqtzum36Yq9ImlNuV8r4LpCez9Q=;
        b=iF7H4X5LMK2f9JBc7gEO1OHfCB2DE0uzwiR3fLL3hC3P0P7He8K+uJhUKT6O7qvg4J
         hisqSpRSyLdr1sZfkEDCiWtKset4HpCUul75BrBxg5qqgaJHB0hkANumnlHXu63Bnznq
         Qv42a/7bGRyjiqXVXnyXwUNpS+AHlzvhJYYFYq64g5UFQCE6031+EaWJ3ek7V44eyOe9
         8ngDibUCNh+ysNYoQsogznIZEXqPfeXRcbOGp7qTZO9rOGts0al6r9iF++dXGfe0SNQk
         Okh2HEcXRWW3fyWg4yFTUjdi1yo4/LEWNxFPFNVEHeG67O2/MfMSyK3suorDrh6pjcIe
         vy/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797454; x=1691402254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ge5Y7e80bFTSfkAsJqtzum36Yq9ImlNuV8r4LpCez9Q=;
        b=g+B80Vf0tpWFsz7h+t5mvg6HUzbrKfmkghSlZPa/EaXWe7jBkxqOqaC/2XmQgnZjhI
         8z+mJkDT037NUBoD4Vle4r465kyLsjQsPIXUM61zKNhNH3Pe4QS/ooc+oVpuBFcZoDgP
         O2tClBBOlNvMjEDKOkH8NAJTZGNtVP/MfpmdBunjKvMSEbEqYH/LjkL3YRrtg5GdnV/B
         a8eAqMqfkkq64g3kP6HSYCfTd/Q3dsUv7rofiBWasQxhBNCUcliZhECOLVM4LjYt+txZ
         KJ5/h96NLAbmxUrSjeSqsgQewjdItFUXSMq7XS+eAgp3xfZmP/RA05o35Bx7vTDfllvi
         XC0A==
X-Gm-Message-State: ABy/qLawesqnx8Iqcob2xDd+zKnaHVaz35wY3Mlkhz6vU16vRd5mPFPz
        8CUSLFkmzWNhxpTzguKIcJMj1g==
X-Google-Smtp-Source: APBJJlEjATbEhOL4PmJ/hRm1ugmxVneNd5jaJ1KdIV7BKfcULd2kVvlLBr+9XK92p3JR8op4koslyg==
X-Received: by 2002:a17:907:b13:b0:99b:5574:7d0f with SMTP id h19-20020a1709070b1300b0099b55747d0fmr5889800ejl.23.1690797453930;
        Mon, 31 Jul 2023 02:57:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170906abc600b009828e26e519sm5860678ejb.122.2023.07.31.02.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:57:33 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/8] arm64: dts: exynos: exynos5433-tm2: switch sound card to audio-routing
Date:   Mon, 31 Jul 2023 11:57:23 +0200
Message-Id: <20230731095730.204567-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"samsung,audio-routing" property is being deprecated, so switch to
generic "audio-routing".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Change depends on ASoC:
https://lore.kernel.org/linux-devicetree/20230731094303.185067-1-krzysztof.kozlowski@linaro.org/T/#t
---
 .../dts/exynos/exynos5433-tm2-common.dtsi     | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index d163891cd399..2a4dc560252e 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -124,19 +124,18 @@ sound {
 		audio-amplifier = <&max98504>;
 		mic-bias-gpios = <&gpr3 2 GPIO_ACTIVE_HIGH>;
 		model = "wm5110";
-		samsung,audio-routing =
-			/* Headphone */
-			"HP", "HPOUT1L",
-			"HP", "HPOUT1R",
+		audio-routing = /* Headphone */
+				"HP", "HPOUT1L",
+				"HP", "HPOUT1R",
 
-			/* Speaker */
-			"SPK", "SPKOUT",
-			"SPKOUT", "HPOUT2L",
-			"SPKOUT", "HPOUT2R",
+				/* Speaker */
+				"SPK", "SPKOUT",
+				"SPKOUT", "HPOUT2L",
+				"SPKOUT", "HPOUT2R",
 
-			/* Receiver */
-			"RCV", "HPOUT3L",
-			"RCV", "HPOUT3R";
+				/* Receiver */
+				"RCV", "HPOUT3L",
+				"RCV", "HPOUT3R";
 	};
 };
 
-- 
2.34.1

