Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAE1DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 30 Dec 2021 19:53:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240601AbhL3Txh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 30 Dec 2021 14:53:37 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33608
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240414AbhL3Txh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Dec 2021 14:53:37 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F00093F1A4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Dec 2021 19:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640894015;
        bh=IkNBdPvO0WBW1RMTehOrcXz9DKxSm9w/tT6yjAM5hts=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=qb8e71SBcKeZl93uper2QUNJThRhb5KKYK0TVTY1ZcQOLJB7iONzoi26ehctJU8o/
         KT2WlhPPpSs0odvGDf+ld1C1pTqqbanGVr/zAQKNfJbd/0CtTF8aY8ybtYRWIYGFDT
         oXGIo4KEmLgmFRuXU3AxMNU5DBCclpYMlMnvXzXiA3abxVBFM8Ho7c1hT1WwYNQag7
         P+lSgq4cD6w8RHdeNRK+oE5XAiU8SP8LsoKLWEExqULigAgz++jbeToObrB1SsLZVW
         gQ+4SeCAXOZQ/NAeXJcC7tL/YbXKdqVa5KZzM+4gnXtE0PgCjVdUOtw6W4fcZ8KZG3
         tvK02tCRNmk8g==
Received: by mail-lj1-f199.google.com with SMTP id k20-20020a2e9214000000b0022d6b13bc8aso8488756ljg.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Dec 2021 11:53:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkNBdPvO0WBW1RMTehOrcXz9DKxSm9w/tT6yjAM5hts=;
        b=xjz1SZs772EveK9zAsyYdLsftk+tmnOGkkCVnqcpm4xHEQ4m71bwHidrYTlzizPk26
         3qfiVgyRe6SmQtuD8n/7cDw+sCwDJnAG53wleFafkK9iUpYkifx6hGLU/53FLPdWKRvw
         f4l2VB71UWZBsy2hGgrOIzYz+EHl/5fpNR7J8RXy3K9nW1DMK/m5kxSC14abz241UHAN
         3yXWnsQlRugwKJzKoZuk2KKjMtpWJkCovSrwaZGphWlShxCpc4DhvBECnx/4bQEzvok1
         WP9S+OkAwgVLR9Ujf/MtPAfnafeX6FT3rgC2X3chOxJIsvTbTVHV+7C38escXsQlRPvB
         BOmQ==
X-Gm-Message-State: AOAM531XhRIC9a4DPYkGmRKxbiGP/ObLqHj2sxMSp0VjaPPdhtLXVX5S
        /LHkaHYXFamUKlImv1sMQmbAnw7YF8dfF4lUzT/pxech+1w2oM/4l0XhD4cbGzcR0GXkruXAy6S
        T7xqDNkonlLa5ZGLNV+mCGg/O68Uxar01G48cR6GS1TLV2qLv
X-Received: by 2002:a2e:b818:: with SMTP id u24mr20156780ljo.426.1640894015357;
        Thu, 30 Dec 2021 11:53:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzCxn9v+74EYdO2VRQPTiHMdXaG/xqPgeB6RVZO0ch93m20tllLyIOYqIKVcNZ6kp/IBgkQ1w==
X-Received: by 2002:a2e:b818:: with SMTP id u24mr20156769ljo.426.1640894015212;
        Thu, 30 Dec 2021 11:53:35 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v9sm2454505lja.109.2021.12.30.11.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 11:53:34 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>, stable@vger.kernel.org
Subject: [RFT][PATCH 1/3] ARM: dts: exynos: fix UART3 pins configuration in Exynos5250
Date:   Thu, 30 Dec 2021 20:53:23 +0100
Message-Id: <20211230195325.328220-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The gpa1-4 pin was put twice in UART3 pin configuration of Exynos5250,
instead of proper pin gpa1-5.

Fixes: f8bfe2b050f3 ("ARM: dts: add pin state information in client nodes for Exynos5 platforms")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
index d31a68672bfa..d7d756614edd 100644
--- a/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5250-pinctrl.dtsi
@@ -260,7 +260,7 @@ i2c3_hs_bus: i2c3-hs-bus {
 	};
 
 	uart3_data: uart3-data {
-		samsung,pins = "gpa1-4", "gpa1-4";
+		samsung,pins = "gpa1-4", "gpa1-5";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
-- 
2.32.0

