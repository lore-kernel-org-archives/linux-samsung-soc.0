Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62914C001DE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 09:59:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232416AbjGaJ7K (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:59:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232615AbjGaJ6h (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:58:37 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09DE010DF
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:38 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c1f6f3884so53768866b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797457; x=1691402257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4xCUnvnajAMffo2tQXzXco0sqRw4y5MSAi7V6IpqSc=;
        b=ztFrXwmjIr3RyuCrEofPXVRRQ5k26Vo8kxVM8mq2xIsonEuDi9jI4txDcx15PjOrMq
         Xneo6ilBVxSAxME/g+XfeuoQctrRuIfpNASpyxNQhhjaQ+49xIZmvXH411JnaxlpxaXE
         5YP4cay3g2PNHUNC/dKgbtLm8334mjd6al/JpxV13vxYqA8amGHJTCj9vXA7t7BSc3NU
         ufUcKLlm1j6qjKz+GSO7x+SzkdBhWbF9FB7eJ2IvroOUFucI8AQCYhqvx82W0V/X1ndv
         C7LLgZCoVD8fiiOWhyVAr1nbsNUgwVXmOt/IATMd26RUgk3nRdY/o4OhuzJOxK80lu3W
         Ne8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797457; x=1691402257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G4xCUnvnajAMffo2tQXzXco0sqRw4y5MSAi7V6IpqSc=;
        b=TBDvnXmLtZhjqFEXU9qQrO5pCg4v54hkY0+BIgenXY6kM0oTWOoYNuhA2eEaUMokRo
         kNOBsi86Wwr8S6OnVd+qxFrlJrv+s/bklrV9Nkx+ubKpjk3tFoTArk+kxUm1zq9p/NXt
         4Keyv13wKo7KL1Cjh1PuF/BOgr3CbwrYyFm1LXAqpYJ4GYjlpdAYkGcZJJB2AgHCUpsl
         /K8fIfji+QXZ+hSbYIhldZlih/WlmSTUd67ST7SY3GFeytu6uGdCGdh+ZpmjbNoHxYl5
         WSkru9YREu5nJqiLAu1BOiB1WrPPLT2huWAXfxEPUmM5dk1iRQq323YiovvVZEhayYo0
         RooQ==
X-Gm-Message-State: ABy/qLaUUVC6pFNU3hrEjWo67MYkNGdNAUYXHTnzwRxw6ykORZJ7LnaB
        FWwa/UBwOriC+XStnZ3cwK4YXQ==
X-Google-Smtp-Source: APBJJlFn3ZlVsvPPiPpm8oX/qFYOcB7wdnVWDdBaGtr/0cKHqgTzV15smjb3dX99cybUxZ0O8Fmz7g==
X-Received: by 2002:a17:906:518f:b0:99b:ed53:5bff with SMTP id y15-20020a170906518f00b0099bed535bffmr7183670ejk.10.1690797457393;
        Mon, 31 Jul 2023 02:57:37 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170906abc600b009828e26e519sm5860678ejb.122.2023.07.31.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:57:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/8] ARM: dts: samsung: exynos4412-n710x: switch sound card to audio-routing
Date:   Mon, 31 Jul 2023 11:57:26 +0200
Message-Id: <20230731095730.204567-4-krzysztof.kozlowski@linaro.org>
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
 .../arm/boot/dts/samsung/exynos4412-n710x.dts | 39 +++++++++----------
 1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-n710x.dts b/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
index 9ae05b0d684c..0a151437fc73 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-n710x.dts
@@ -76,34 +76,33 @@ &s5c73m3 {
 };
 
 &sound {
-	samsung,audio-routing =
-		"HP", "HPOUT1L",
-		"HP", "HPOUT1R",
+	audio-routing = "HP", "HPOUT1L",
+			"HP", "HPOUT1R",
 
-		"SPK", "SPKOUTLN",
-		"SPK", "SPKOUTLP",
+			"SPK", "SPKOUTLN",
+			"SPK", "SPKOUTLP",
 
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
 
-		"IN1LP", "MICBIAS2",
-		"IN1LN", "MICBIAS2",
-		"Headset Mic", "MICBIAS2",
+			"IN1LP", "MICBIAS2",
+			"IN1LN", "MICBIAS2",
+			"Headset Mic", "MICBIAS2",
 
-		"IN1RP", "Sub Mic",
-		"IN1RN", "Sub Mic",
+			"IN1RP", "Sub Mic",
+			"IN1RN", "Sub Mic",
 
-		"IN2LP:VXRN", "Main Mic",
-		"IN2LN", "Main Mic",
+			"IN2LP:VXRN", "Main Mic",
+			"IN2LN", "Main Mic",
 
-		"IN2RN", "FM In",
-		"IN2RP:VXRP", "FM In";
+			"IN2RN", "FM In",
+			"IN2RP:VXRP", "FM In";
 };
 
 &submic_bias_reg {
-- 
2.34.1

