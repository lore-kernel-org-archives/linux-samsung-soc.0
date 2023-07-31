Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E65C001DF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 09:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232430AbjGaJ7L (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 05:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbjGaJ6i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 05:58:38 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55CD710D5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:40 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so11538964a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 31 Jul 2023 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690797458; x=1691402258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpkYmwWQAX5IRqIDyYqczdN8ZGCbV1KYfKad4Zm6mVk=;
        b=EZM3AIwQm6576bw8dxiCHAWmm2g+2+mSlfTMvqqSK4gs/zsi9M6ceknMqL0koW31UK
         RHOTdrW7hIoghuJbKhIv+J7sXrB7klxLevcXTj7ott7L05gIN5vQRH6KB/d79uEBkHN8
         IBRAFMKB6xKZXvy6v7d0XRw6zme8qkr8Rl5hEriAr8g1mQzxR/muKWud/oivstd8Xqm7
         fy17qi41OZ5l4okEoMcsVE285FNYT3PI2SzcEBT5fki6zIOl2vIc2RHFiZl61vSiy5hH
         7u5FnvyDdOjo8ctnOcrkcc0o/sgSqfRWBYSdN3fZ22m7Z92tcholMQMXlyvv8pth5UJU
         YWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690797458; x=1691402258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpkYmwWQAX5IRqIDyYqczdN8ZGCbV1KYfKad4Zm6mVk=;
        b=A9TfJODH9XufnwAIj1oB/EiXR32imI/LXNDtM0oWfIXkW84VqWTKvt27Cnt0KFgFng
         a0huvybSlCgpgd2i9/vGUV3x+Yink5TFW5v1jGBjrZaJqr1mhqjAGE23bRAlX6yspgau
         ZyYV13ogZZCfhiTcv69/u/gqT0Y9WBQnIaw70PRtvHv/YbUsIlka48zkdINAeSyyLZjj
         2022E90iM4PMK6t4G83eYDeVDEq4N5MX0tvHCgon2SQxNUO/0/xMctcVhC3RwJk38yJ+
         EtCdohrSNK0QU5ZYUiqwa5qU5KiajTe3GH3vk6WQI9PiJgX4aLKcGklCSs0ZTFmR2Xe5
         J8bg==
X-Gm-Message-State: ABy/qLbn/I8xfW88691Mmpj+FWZTiAnl5Z/kGGMEpb5x6LyBpDsZtVpR
        ptUGPZx/SDLmljtlNKry9JR1YA==
X-Google-Smtp-Source: APBJJlFwFzW2HXitklWzRHyuo6DCMKzATKHjqcNeymxNEs2Hh4dyOJckagIfmIzchdXT4r8E2BZcyg==
X-Received: by 2002:a17:907:e8b:b0:988:d841:7f90 with SMTP id ho11-20020a1709070e8b00b00988d8417f90mr6421072ejc.27.1690797458470;
        Mon, 31 Jul 2023 02:57:38 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id kq6-20020a170906abc600b009828e26e519sm5860678ejb.122.2023.07.31.02.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:57:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/8] ARM: dts: samsung: exynos4412-odroid: switch sound card to audio-routing
Date:   Mon, 31 Jul 2023 11:57:27 +0200
Message-Id: <20230731095730.204567-5-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts | 13 ++++++-------
 arch/arm/boot/dts/samsung/exynos4412-odroidx.dts  |  9 ++++-----
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts
index 42812da1f882..b1b0916b1505 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu3.dts
@@ -138,13 +138,12 @@ &sound {
 	samsung,audio-widgets =
 		"Headphone", "Headphone Jack",
 		"Speakers", "Speakers";
-	samsung,audio-routing =
-		"Headphone Jack", "HPL",
-		"Headphone Jack", "HPR",
-		"Headphone Jack", "MICBIAS",
-		"IN1", "Headphone Jack",
-		"Speakers", "SPKL",
-		"Speakers", "SPKR";
+	audio-routing = "Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"Headphone Jack", "MICBIAS",
+			"IN1", "Headphone Jack",
+			"Speakers", "SPKL",
+			"Speakers", "SPKR";
 };
 
 &spi_1 {
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidx.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidx.dts
index d5316cf2fbb6..0eb8a2680a20 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidx.dts
@@ -135,9 +135,8 @@ &sound {
 		"Headphone", "Headphone Jack",
 		"Microphone", "Mic Jack",
 		"Microphone", "DMIC";
-	samsung,audio-routing =
-		"Headphone Jack", "HPL",
-		"Headphone Jack", "HPR",
-		"IN1", "Mic Jack",
-		"Mic Jack", "MICBIAS";
+	audio-routing = "Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"IN1", "Mic Jack",
+			"Mic Jack", "MICBIAS";
 };
-- 
2.34.1

