Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6ED7C25B4E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231617AbjATPyZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbjATPyU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:20 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFBBCFD29
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:17 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id k16so4435910wms.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HCQudDch56P70uwaUppIOC9lzt2ot8bXZgDFBtBAZKI=;
        b=nbV43nQ8zLI8tJJSHbkQaRD9Fend2JZR+XjShcmqxfN1I/CWg4+67yvkoh0JSUY2eI
         BmQl60Qq8knE+nIwd3j3kGWIA6NjoJWma/CG7UJH8WgU7an6w09sdIWZVkZ5IRrSj2bH
         kcAsiio1QfY+T/iRPtdyuJcMh79vq+JeGKEf4BI3yRsAUizmgqkGTwZJ50IPUnU/RGd9
         P4fPq+PY55K3LK0MBVVV7tOxPg2AoQIG8wUSoo1Av4qAylRSA7BqjTrO5yr5ixrUPTC/
         djLm/jaxt9KrmpYkw3SzJjVIA7LpSvVD3jnTtGR0NFNuVXSACWq9fuu4lrSGEtHjiNFO
         SnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HCQudDch56P70uwaUppIOC9lzt2ot8bXZgDFBtBAZKI=;
        b=DXX5YWkJBUyDRLIbTEGaJZR1MALt3zjj7WTLKpE9H+UHuUuE6DAjJ673oWH9TOBAFD
         4ziL9C/7q5EWaryKB0cUExXw9HhaNKlmNuK9EGfBpmaYlTLM5Y1RL4J7HTZdCi4KkcwY
         K3WBQN45mh/wc/ex/FDiQ7aex+ZbqHBFHtcZVOGi04A68kjEdj4OwKlfXL0NRw7ZAXoG
         mHCe1iinIWRuoHqPT9RrqP0luWMnnkwG9Ds3vFYHP2aS+PyjQMZBf0Vizj20+FzzS1LA
         wCCgMMoyJubYKCcPcUEGVSe5lRW4LGjfQSRiJYYhw9erEpMfjkCFCAuT/uz3bWcZTHxf
         HL3w==
X-Gm-Message-State: AFqh2kouBwRnTc81PBRlo5JtGTusk7bNUVeNAAlNNMkdtReqZ+noNyu5
        57RGes9m3DZvAat8wgxTVcq7xQ==
X-Google-Smtp-Source: AMrXdXvFQDqOlp1PdjlLPJfZqpreBLuEL+dtLh2d+Cl5jgOK5iWVsrAD/IOC0dnkn0HGu5+pD+f3jA==
X-Received: by 2002:a05:600c:c8d:b0:3da:fcee:2ef1 with SMTP id fj13-20020a05600c0c8d00b003dafcee2ef1mr14579142wmb.32.1674230055623;
        Fri, 20 Jan 2023 07:54:15 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 02/11] ARM: dts: exynos: drop unsupported desc-num in Exynos3250
Date:   Fri, 20 Jan 2023 16:53:55 +0100
Message-Id: <20230120155404.323386-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is no desc-num property for MMC nodes:

  exynos3250-monk.dtb: mmc@12510000: Unevaluated properties are not allowed ('desc-num' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos3250-monk.dts   | 1 -
 arch/arm/boot/dts/exynos3250-rinato.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
index 02a9dc479d34..c8eacf1b5d0b 100644
--- a/arch/arm/boot/dts/exynos3250-monk.dts
+++ b/arch/arm/boot/dts/exynos3250-monk.dts
@@ -438,7 +438,6 @@ &mshc_0 {
 	broken-cd;
 	non-removable;
 	cap-mmc-highspeed;
-	desc-num = <4>;
 	mmc-hs200-1_8v;
 	card-detect-delay = <200>;
 	vmmc-supply = <&vemmc_reg>;
diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 2eb682009815..812816af8476 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -619,7 +619,6 @@ &mshc_0 {
 	broken-cd;
 	non-removable;
 	cap-mmc-highspeed;
-	desc-num = <4>;
 	mmc-hs200-1_8v;
 	card-detect-delay = <200>;
 	vmmc-supply = <&ldo12_reg>;
-- 
2.34.1

