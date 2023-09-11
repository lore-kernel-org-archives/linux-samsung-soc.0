Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D914CA0EC8
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 11 Sep 2023 23:02:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348990AbjIKVcF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236906AbjIKLjh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Sep 2023 07:39:37 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACC6A12E
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Sep 2023 04:39:32 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401d24f1f27so49416145e9.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Sep 2023 04:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694432371; x=1695037171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xobEw3dWGWqa/MKJ616lGiXiH8NsToU1rm76WPlst0=;
        b=o0UCY5vZafH9Qz1ohhA/zZyXJ8vmxDxBTsFYXkLGQtGZ/ebv05FHsHSpA0xtKiar+E
         ck5bF54C3nUFD0dIh0ag5bOCBl4jKYTGYBjqxdOi0G7zsZnzxfMRU6nw2kxP1wTLMGVb
         9Jb7csZCkkIN8BNzeMIt6Ltbwxuw+ehawMeVU9WS097gmT/Zf/n3JRKt2nQxBZ/bjkX1
         8nLCKUJHcWvvsSzFl3KYF9btOVp8R2CcFEIWHZE4Flw14yyAKKla0WkdDMv4s0UVkPAR
         ppEJTp0ygOZ2IO6h93YLpQODg79FrioQlY/Uvr4TZlEHacMnZMqnOzEahYUv/CRihAJY
         2JSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694432371; x=1695037171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+xobEw3dWGWqa/MKJ616lGiXiH8NsToU1rm76WPlst0=;
        b=tgZnAya3K1K0lANfsxyUYC5lg5+6X2uTDOOyT0WLUPlIjXiB+CdM3bcK7Uf/+2OkY6
         F1Cj0m94tg+ks3l7PI75Sr9TV0yGN9d2UXYr5NPMY5rcsRZR9I7ucBK1q8QW/otTa8B5
         le5do5+YnCtkAPelve/yQnhe1h5vp/8TLQmmwQ723VdUgWE0OAxFX/EeKtaCDs/dfFpC
         CM823R6bjowvXN5ai+pLxJpidvx9xuBKxyP4pMRJpSx/9JsC35Abd7HoI6DuVjTXwaBy
         K5tpjJuPuScILsFFZEbV+SwrLr9xlKZ9D4285D4jddVzs/pEqKmGuBDoG4BG8efY0C6B
         JciA==
X-Gm-Message-State: AOJu0YzOc21ciYI4Ro+H2M9K5rK3yG5h9SCTWIfEmHcIcQpyBF5EjCEq
        izipb7b785gVsxtW04EIDGSjYw==
X-Google-Smtp-Source: AGHT+IG71SGDp/D1D4AhCLBkMhgmC1yfDcdZoDBZg1is1WJqDXuiI7ooRn5v+pBNF3d59frbXMBphQ==
X-Received: by 2002:adf:f302:0:b0:319:790e:3bc5 with SMTP id i2-20020adff302000000b00319790e3bc5mr7018815wro.41.1694432371116;
        Mon, 11 Sep 2023 04:39:31 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id g15-20020a056402180f00b00523b1335618sm4431003edy.97.2023.09.11.04.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 04:39:30 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/8] arm64: dts: exynos: exynos5433-tm2: switch sound card to audio-routing
Date:   Mon, 11 Sep 2023 13:39:23 +0200
Message-Id: <169443234709.34398.9426055874115362482.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731095730.204567-1-krzysztof.kozlowski@linaro.org>
References: <20230731095730.204567-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Mon, 31 Jul 2023 11:57:23 +0200, Krzysztof Kozlowski wrote:
> "samsung,audio-routing" property is being deprecated, so switch to
> generic "audio-routing".
> 
> 

Applied, thanks!

[1/8] arm64: dts: exynos: exynos5433-tm2: switch sound card to audio-routing
      https://git.kernel.org/krzk/linux/c/4179ae98fd525f2895ac726fcd433e730c5e8727
[2/8] ARM: dts: samsung: exynos4212-tab3: switch sound card to audio-routing
      https://git.kernel.org/krzk/linux/c/fc730f1702e2a5de9ad52f98189460c0d7d75916
[3/8] ARM: dts: samsung: exynos4412-galaxy-s3: switch sound card to audio-routing
      https://git.kernel.org/krzk/linux/c/a1116f96688c7e2d210635ec7cb631473d8ef653
[4/8] ARM: dts: samsung: exynos4412-n710x: switch sound card to audio-routing
      https://git.kernel.org/krzk/linux/c/1222d604dbbbe54a9e9d5811d46f0680cc9972ce
[5/8] ARM: dts: samsung: exynos4412-odroid: switch sound card to audio-routing
      https://git.kernel.org/krzk/linux/c/f632a4376134722cb16c78d819505aedd9c0d8e3
[6/8] ARM: dts: samsung: exynos5422-odroid: switch sound card to audio-routing
      https://git.kernel.org/krzk/linux/c/c670e7c8f72f68b4fc20eb85fa6101b5ce108515
[7/8] ARM: dts: samsung: s5pv210-fascinate4g: switch sound card to audio-routing
      https://git.kernel.org/krzk/linux/c/04e08772a1ffa0620fbf89dfaed3a7aef724c739
[8/8] ARM: dts: samsung: s5pv210-galaxys: switch sound card to audio-routing
      https://git.kernel.org/krzk/linux/c/8edc16a1e27a941670907a94d15dbf7f68fbf8c7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
