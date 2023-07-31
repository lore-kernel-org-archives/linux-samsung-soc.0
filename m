Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29F2FC001DE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 09:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbjGaJ7G (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232606AbjGaJ6g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:58:36 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4F32107
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:37 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99bf9252eddso351754766b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797456; x=1691402256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3Vi3YksCGCOpys5s2S1isiXjJ58pK8I2do3CJIG8is=;
        b=qXD0FZMJApl4Mp3Bmbcu1JKQXXzNDllLdrv529BiQqs99pL1pEfemp3T/ZTVBeORKJ
         iMjJPNgpf0DaYxxpkwu+5hLIWI6Y47Lw2ebBfav9aS40MERd9ZH5ZlwU4H/wa11SaTpM
         /le8FItPRToM0N/gtmfT2BNlIKfZCTs3eWGkr42uR0hh0BhF0g6W0u5kuYMTlMylhSSs
         okY3TB1gd/IoPIE/w3GCXNdfqkvdNSc1Daw+LDpMn82Fhw8I02hR7ZjIKsmYkGPFeB3V
         UVQT7iBtd4G2bhDeLu45mMn7OqLSuvHpwvzF6ob3mlheQGImCyDdinCmMw45BD1QYMsu
         cdpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797456; x=1691402256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3Vi3YksCGCOpys5s2S1isiXjJ58pK8I2do3CJIG8is=;
        b=gmlq4anv1Vwy2u06XLmWSc6knNG9N91VICAX1xxXv9FgKxBA91hQvo5dO5RT66T/WG
         BnjYdkXa5T1RgmDYJ1UoJ/3o2Bn41UxBrZC4Ih1AVmznG/9WcFWQbODgxL6Ld3eKQz4X
         0VxgO4wYz6t5dbVwC6QydkNkHULfSst95jBdPnYpDC1As6f3ZaqAsHXqTlCLXIkoJtOS
         CXtnOx5Yj2VZ+vmlFYDnI10C+Jhowf0TU3ahj0kHpVXIrmd7SUrgY0yNxwOpEWA6WU9B
         Ipvzer1kh6q5jtAlTT82y/7KZIdCcRWI/GH3rx3oUvtr42cX03c6FWedzxVnmF60vujC
         PJDA==
X-Gm-Message-State: ABy/qLanI2JsFviwJomGUnFfbKX6NvI1GztKqKqPfhCaz6wpkMye7NTp
        FjFy0s0WrIVyJYtsv9CKWR+D6A==
X-Google-Smtp-Source: APBJJlFQZZi4RBD7sSRP3CH9OMsVajRevarlT6gCxGV11wtdzKkHMAmUDGAIaGoJ2+cHAVtBTT5K7g==
X-Received: by 2002:a17:907:7743:b0:99b:f392:10b0 with SMTP id kx3-20020a170907774300b0099bf39210b0mr6514452ejc.37.1690797456264;
        Mon, 31 Jul 2023 02:57:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170906abc600b009828e26e519sm5860678ejb.122.2023.07.31.02.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:57:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/8] ARM: dts: samsung: exynos4412-galaxy-s3: switch sound card to audio-routing
Date:   Mon, 31 Jul 2023 11:57:25 +0200
Message-Id: <20230731095730.204567-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731095730.204567-1-krzysztof.kozlowski@linaro.org>
References: <20230731095730.204567-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"samsung,audio-routing" property is being deprecated, so switch to
generic "audio-routing".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../dts/samsung/exynos4412-galaxy-s3.dtsi     | 43 +++++++++----------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
index 94122e9c6625..54e1a57ae886 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-galaxy-s3.dtsi
@@ -173,36 +173,35 @@ &s5c73m3 {
 };
 
 &sound {
-	samsung,audio-routing =
-		"HP", "HPOUT1L",
-		"HP", "HPOUT1R",
+	audio-routing = "HP", "HPOUT1L",
+			"HP", "HPOUT1R",
 
-		"SPK", "SPKOUTLN",
-		"SPK", "SPKOUTLP",
-		"SPK", "SPKOUTRN",
-		"SPK", "SPKOUTRP",
+			"SPK", "SPKOUTLN",
+			"SPK", "SPKOUTLP",
+			"SPK", "SPKOUTRN",
+			"SPK", "SPKOUTRP",
 
-		"RCV", "HPOUT2N",
-		"RCV", "HPOUT2P",
+			"RCV", "HPOUT2N",
+			"RCV", "HPOUT2P",
 
-		"HDMI", "LINEOUT1N",
-		"HDMI", "LINEOUT1P",
+			"HDMI", "LINEOUT1N",
+			"HDMI", "LINEOUT1P",
 
-		"LINE", "LINEOUT2N",
-		"LINE", "LINEOUT2P",
+			"LINE", "LINEOUT2N",
+			"LINE", "LINEOUT2P",
 
-		"IN1LP", "MICBIAS1",
-		"IN1LN", "MICBIAS1",
-		"Main Mic", "MICBIAS1",
+			"IN1LP", "MICBIAS1",
+			"IN1LN", "MICBIAS1",
+			"Main Mic", "MICBIAS1",
 
-		"IN1RP", "Sub Mic",
-		"IN1RN", "Sub Mic",
+			"IN1RP", "Sub Mic",
+			"IN1RN", "Sub Mic",
 
-		"IN2LP:VXRN", "MICBIAS2",
-		"Headset Mic", "MICBIAS2",
+			"IN2LP:VXRN", "MICBIAS2",
+			"Headset Mic", "MICBIAS2",
 
-		"IN2RN", "FM In",
-		"IN2RP:VXRP", "FM In";
+			"IN2RN", "FM In",
+			"IN2RP:VXRP", "FM In";
 };
 
 &submic_bias_reg {
-- 
2.34.1

