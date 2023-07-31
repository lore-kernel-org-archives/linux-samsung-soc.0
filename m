Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F12CC001DE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 09:59:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbjGaJ7N (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:59:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbjGaJ6i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:58:38 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27CEA199F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:41 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9936b3d0286so687786966b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797459; x=1691402259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5b7lqvl9+xzm2M9ezYAd3WHYZ/uyZwwx1X/wyt05wXs=;
        b=RrUPZyWin4v6xqhOb2Y1XmElltjSC5VEA1bvmL1f6XVdAM5G2xrevzWt/ggzRhCyWd
         UxvIxwCPLekQmyBod/bvd9MorN68QPHzeZZZ5ZlOST5HHgtjoLR5Oz0kOzFYjUvhsqai
         cKb2oRtqvzr1rxI4177VuTWcpcPFH9L69c5wg0ncp0XPGzDbpPCC7bHZzJiaXHVAjpVR
         TclesxItc+RmNuwZbrMRvUtVw9JzwvKSNlAHp4uWAGpb9hJHES2CjgRYjxC4aQsEaS7T
         GkQSA62MCWw4S4xZ2jtly7Qym4FGJvhj0kC3h2p+JA8pXSALTN6gA10RVhO28M4/J5ca
         0ALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797459; x=1691402259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5b7lqvl9+xzm2M9ezYAd3WHYZ/uyZwwx1X/wyt05wXs=;
        b=aMEMVyHqWPxGC8lwq5+/MrRKd31VIlHT1mftAYUa92IlpBqDbiRHRjeJN/YV+vbocW
         9ZZ4UT35aTB5UpZb6yry0IbWcND9WhL2ptsEpiIz1gBQ/Y6K+pSR5xY2nfQJazPhCMzh
         McJWdhnIxT4k9G0p3UFKLYQ3CgSTIl6d8CnwMrhTs/ndL0jPj4SUFmJUnCevtL5ZBXDL
         wFGnntkX5oTJZJlttfODS95tmTwXcDyokZBstGhI2Vzd/nVH3lOZI67Mb7idLWmrsTyu
         H4B+oEBLkSeoemAIkNEeVK8CpFs1kg2i0/zexkAWO4pK8/r3h/ZxEpFJKVnY01Ip4RGD
         CxGA==
X-Gm-Message-State: ABy/qLYr+/8ntTf3J3sewlCCwdxUbxZlqMLAHjunsU/N3ZQrMBSbHOUC
        2wQyfE8f0bj7DeGkWuAwP4JNHg==
X-Google-Smtp-Source: APBJJlFh1J4/vop52FckddnD9utMIv9WonoVRPk4OYaP7UrWchTbyiVrHaCmN/ZYyijZ3PQJl1r07Q==
X-Received: by 2002:a17:906:77d0:b0:99b:ef9c:e634 with SMTP id m16-20020a17090677d000b0099bef9ce634mr6089122ejn.65.1690797459730;
        Mon, 31 Jul 2023 02:57:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170906abc600b009828e26e519sm5860678ejb.122.2023.07.31.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:57:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/8] ARM: dts: samsung: exynos5422-odroid: switch sound card to audio-routing
Date:   Mon, 31 Jul 2023 11:57:28 +0200
Message-Id: <20230731095730.204567-6-krzysztof.kozlowski@linaro.org>
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
 .../samsung/exynos5422-odroidxu3-audio.dtsi   | 19 +++++++++----------
 .../boot/dts/samsung/exynos5422-odroidxu4.dts |  2 +-
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/samsung/exynos5422-odroidxu3-audio.dtsi
index 86b96f9706db..52a1d8fd5452 100644
--- a/arch/arm/boot/dts/samsung/exynos5422-odroidxu3-audio.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5422-odroidxu3-audio.dtsi
@@ -18,16 +18,15 @@ sound: sound {
 		samsung,audio-widgets =
 			"Headphone", "Headphone Jack",
 			"Speakers", "Speakers";
-		samsung,audio-routing =
-			"Headphone Jack", "HPL",
-			"Headphone Jack", "HPR",
-			"Headphone Jack", "MICBIAS",
-			"IN12", "Headphone Jack",
-			"Speakers", "SPKL",
-			"Speakers", "SPKR",
-			"I2S Playback", "Mixer DAI TX",
-			"HiFi Playback", "Mixer DAI TX",
-			"Mixer DAI RX", "HiFi Capture";
+		audio-routing = "Headphone Jack", "HPL",
+				"Headphone Jack", "HPR",
+				"Headphone Jack", "MICBIAS",
+				"IN12", "Headphone Jack",
+				"Speakers", "SPKL",
+				"Speakers", "SPKR",
+				"I2S Playback", "Mixer DAI TX",
+				"HiFi Playback", "Mixer DAI TX",
+				"Mixer DAI RX", "HiFi Capture";
 
 		cpu {
 			sound-dai = <&i2s0 0>, <&i2s0 1>;
diff --git a/arch/arm/boot/dts/samsung/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/samsung/exynos5422-odroidxu4.dts
index f5fb617f46bd..363786f032cc 100644
--- a/arch/arm/boot/dts/samsung/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/samsung/exynos5422-odroidxu4.dts
@@ -35,7 +35,7 @@ sound: sound {
 		compatible = "samsung,odroid-xu3-audio";
 		model = "Odroid-XU4";
 
-		samsung,audio-routing = "I2S Playback", "Mixer DAI TX";
+		audio-routing = "I2S Playback", "Mixer DAI TX";
 
 		cpu {
 			sound-dai = <&i2s0 0>, <&i2s0 1>;
-- 
2.34.1

