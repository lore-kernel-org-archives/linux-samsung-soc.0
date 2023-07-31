Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 484A2C04A94
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 09:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbjGaJ7P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjGaJ6k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:58:40 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E74C10F4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:42 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c136ee106so142410666b.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797461; x=1691402261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fo+0+vHRPXrDtZ0tjQ0v+C3nzYHHH+ZPuoUPguExYlo=;
        b=bRdfh7zayUh7aqsg780V5bn+wNnhzY3nk6VWazS3ho77ejVFkv4/nvSEg+bdgvVrXm
         XADgcLLTEptPX6ysTK9okJ9ZSr5vcsugy3/N9ipsO1wOPWJ2uq3mzpDZchB+ZOHmLEPF
         nhfmSrmNLC2FVnAHrZUGVjXWzuL9Att+eAsBFGwHdyyewQ4XU8mP7R8cVQL/XsOyln1v
         SQrmzU50ZEdu08/MFaVn5DKSfxUGxii7p92jVZI5gMVE5K/SJRMWa5eHlpY2bMIBq4CK
         DJuCqcZl/MfpGWmqWLTPRBgNb3URC1lhOMYhkx3F3XuCeHQj+X3Du+NP7Gu0xJKuboLv
         aLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797461; x=1691402261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fo+0+vHRPXrDtZ0tjQ0v+C3nzYHHH+ZPuoUPguExYlo=;
        b=VGwnnIVuqyh2xHEcu8BWmg3h1TczcQEHMbfDt2NLIbX1il5J9KGjYpLU8ofuQz3W7Y
         0D8todqzJufuNRn1iHStl9BeGoQovelc1ndkljjfCPFVU4z9tco5G81IALEpjCBnRuuG
         5uqjBpWYMv4RCNkqmPSxYzaPRctXue/UrR/JwJDIzQ3uxe0Ir+mdv+7hDz35Tfpk7f2w
         dCBaECvfS5raoH8hyVp+phhJkEdS1w6be9Ns9QhtnU9ayJh2BON8U8gNkiOfIZfdgihX
         VkhabJUJStwRY6Xized1hajh8/iGKHHyDSh/U2K2nzFfpiq1YjpdPk2djuOvoeB5UYoX
         EN8Q==
X-Gm-Message-State: ABy/qLbe0inpBFzQ+NFwfXhygjmpJT6/7q/lChTv+oL98pneZAfYFs0W
        uJyJYkT2RmUm5claz567k5VeZw==
X-Google-Smtp-Source: APBJJlG7U0zWI7OPl82f1WVMHJKL4xOV+ZQ6cmw+FWnEq8/Et0UZbSHmy41qMNCFe4tv0h81tzEXlQ==
X-Received: by 2002:a17:906:2181:b0:997:865a:77e5 with SMTP id 1-20020a170906218100b00997865a77e5mr7773666eju.45.1690797460913;
        Mon, 31 Jul 2023 02:57:40 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170906abc600b009828e26e519sm5860678ejb.122.2023.07.31.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:57:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/8] ARM: dts: samsung: s5pv210-fascinate4g: switch sound card to audio-routing
Date:   Mon, 31 Jul 2023 11:57:29 +0200
Message-Id: <20230731095730.204567-7-krzysztof.kozlowski@linaro.org>
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
 .../boot/dts/samsung/s5pv210-fascinate4g.dts  | 33 +++++++++----------
 1 file changed, 16 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-fascinate4g.dts b/arch/arm/boot/dts/samsung/s5pv210-fascinate4g.dts
index eaa7c4f0e257..149e488f8e74 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-fascinate4g.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-fascinate4g.dts
@@ -74,30 +74,29 @@ sound {
 		headset-detect-gpios = <&gph0 6 GPIO_ACTIVE_HIGH>;
 		headset-key-gpios = <&gph3 6 GPIO_ACTIVE_HIGH>;
 
-		samsung,audio-routing =
-			"HP", "HPOUT1L",
-			"HP", "HPOUT1R",
+		audio-routing = "HP", "HPOUT1L",
+				"HP", "HPOUT1R",
 
-			"SPK", "SPKOUTLN",
-			"SPK", "SPKOUTLP",
+				"SPK", "SPKOUTLN",
+				"SPK", "SPKOUTLP",
 
-			"RCV", "HPOUT2N",
-			"RCV", "HPOUT2P",
+				"RCV", "HPOUT2N",
+				"RCV", "HPOUT2P",
 
-			"LINE", "LINEOUT2N",
-			"LINE", "LINEOUT2P",
+				"LINE", "LINEOUT2N",
+				"LINE", "LINEOUT2P",
 
-			"IN1LP", "Main Mic",
-			"IN1LN", "Main Mic",
+				"IN1LP", "Main Mic",
+				"IN1LN", "Main Mic",
 
-			"IN1RP", "Headset Mic",
-			"IN1RN", "Headset Mic",
+				"IN1RP", "Headset Mic",
+				"IN1RN", "Headset Mic",
 
-			"Modem Out", "Modem TX",
-			"Modem RX", "Modem In",
+				"Modem Out", "Modem TX",
+				"Modem RX", "Modem In",
 
-			"Bluetooth SPK", "TX",
-			"RX", "Bluetooth Mic";
+				"Bluetooth SPK", "TX",
+				"RX", "Bluetooth Mic";
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&headset_det &earpath_sel>;
-- 
2.34.1

