Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5743EC41513
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 09:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230423AbjGaJ7T (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjGaJ6l (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:58:41 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8112117
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:43 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99bcfe28909so609810566b.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797462; x=1691402262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KuWBFCHnpavR+uWZCU4/e6Sz+oK71FihdZ9BIB+RC3Y=;
        b=VXokx3YdZziuf0563Ipki4nEt3pLAjvdLB420+OvDFfu3LcUlzWqwjvH/FLB1vEgFa
         d36eEG9PpTJ/BB0YMsJrnVShxDhufEINJE32dzFMe9B2QFjC3br7kM2tyuXrjDD0f0Aa
         24c1nAXSO4R3SA9ovqpVrHlttsPH40HEJ5Y+cwI8gfrVw4f/+HecNVOe3MIdd4P3HkRl
         eiUqUIYFLj06UT2WfxJg7TmgjCC6zQH9xNgA1x4qvFiSVc5XsbWg2xk1V8YcjT9N5UT3
         ySXTQhTB1ra54Mz+enGkFPY2bjDgaV+/nqp5F2bd4GYIKnTAuJewmsEQt7LbpoKAs94w
         34FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797462; x=1691402262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KuWBFCHnpavR+uWZCU4/e6Sz+oK71FihdZ9BIB+RC3Y=;
        b=J+aueonYmRuIIfdWSv9WxCEp+dab5wCe/BrH+i0SCqhu6CVTQ1kwiT7lojLxLV5KB5
         JRovpLdzbaNXVmq1FJDy6DgxuFuAcaKvXO24yI8ysLQ/0gRDYoBzXIxSphRKRM02aBY4
         OPo8pCG4Q/HF8gekjhljn2p7C9CHTPOv/PjBLKcwjw832thWliCSmbT50tCISMDY4ec3
         0x5xXdp1oSrEKsF2JE+3zSisq4GUdzJC4OCrfcDei3U5IOOi/yo9uFksi/FN0ZLq0AVt
         0Y787kHZAid8s9aUbMddomIAbWjX2YWWrv7UQkWNaCUfjdUrUcJX6Y4PAIowLb+0NesQ
         RBjQ==
X-Gm-Message-State: ABy/qLYwyKgmtBn82L4K+OZXW1v6xRcMGRALTTwXFiDprUO+gHyWAykL
        B3w6Nluf7MTZ3ItXfRRMbYZiu9yZfcQ4vmyU0So=
X-Google-Smtp-Source: APBJJlFskb8gG/g6HOjBS3IXkfNSsbAoR0XYL3/jDv5ziDX5FMRSyVwa1NEpmhuXVijhFvYTJ2yj+w==
X-Received: by 2002:a17:907:a072:b0:99b:efc8:51d with SMTP id ia18-20020a170907a07200b0099befc8051dmr5456986ejc.21.1690797462029;
        Mon, 31 Jul 2023 02:57:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170906abc600b009828e26e519sm5860678ejb.122.2023.07.31.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:57:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/8] ARM: dts: samsung: s5pv210-galaxys: switch sound card to audio-routing
Date:   Mon, 31 Jul 2023 11:57:30 +0200
Message-Id: <20230731095730.204567-8-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/samsung/s5pv210-galaxys.dts | 37 +++++++++----------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
index 532d3f5bceb1..879294412381 100644
--- a/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
+++ b/arch/arm/boot/dts/samsung/s5pv210-galaxys.dts
@@ -101,33 +101,32 @@ sound {
 		headset-detect-gpios = <&gph0 6 GPIO_ACTIVE_LOW>;
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
 
-			"IN2LN", "FM In",
-			"IN2RN", "FM In",
+				"IN2LN", "FM In",
+				"IN2RN", "FM In",
 
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

