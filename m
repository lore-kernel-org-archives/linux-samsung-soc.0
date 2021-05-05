Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93473C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 14:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 631DE610A1
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 14:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233754AbhEEODW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 May 2021 10:03:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54845 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233721AbhEEODO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 May 2021 10:03:14 -0400
Received: from mail-qv1-f72.google.com ([209.85.219.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1leI6S-0008TA-Ik
        for linux-samsung-soc@vger.kernel.org; Wed, 05 May 2021 14:02:16 +0000
Received: by mail-qv1-f72.google.com with SMTP id b1-20020a0c9b010000b02901c4bcfbaa53so1701606qve.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 May 2021 07:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q9OdBSHulNH5gFLHkIOCDv8QntRXx2/eXhHIjzSoClg=;
        b=BLkbQtnXTGt7uyN4ejK7gADbZ8qHo7TUuuWAhevkUEkPbWUwWlFYFky9nqZtSkKcDe
         gRelLabwTfp9045k+tOeQ3O+c48n4ECFBrxFNL+nqML0mPx41IzCPELpM98FVO9qD5qd
         /zoEr/20z46dovIAonTA5JVGZC6RNJj10ixxIbO4vej36Why/WUV0nF4PjeLp8qfhos/
         gmwLKB9HC8zmrXTmMbaFpS8GqCz+n+XD1xt1zYzLEC1lvbNnozaJB2kV8sHcFv2bUBc6
         p4rcAg1n55b5MDDXgPoYly5o/QcT9QZtYXGiaZ0yryl1PHVdMC4vnQ1Bi3iC1ROICktC
         bIig==
X-Gm-Message-State: AOAM531Ak2PLazwiO+namnufFZQs6SBQ+mY7SSLywPWJL55I9mJzkitm
        QStKMogxy87sMmfHqNJIJhW+paPSdu45++2OH9m9rO2xo1V+9z1V+Z2Z2A+Y6ZOTMO4GqgJXo+l
        xiUkQqV7JIkdX2EP7d2QssaHHVxCV+GWUGAtjeDApGxim0dL2
X-Received: by 2002:a05:620a:2081:: with SMTP id e1mr18232287qka.44.1620223335448;
        Wed, 05 May 2021 07:02:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFRA7bKadLLvqEd32kd6vTBdINVWvP6c1I10p6p624rchszik9cN6XscoMa8hghI9bn7rsqQ==
X-Received: by 2002:a05:620a:2081:: with SMTP id e1mr18232273qka.44.1620223335283;
        Wed, 05 May 2021 07:02:15 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.2])
        by smtp.gmail.com with ESMTPSA id 97sm5016632qte.20.2021.05.05.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 07:02:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] ARM: dts: exynos: fix PWM LED max brightness on Odroid HC1
Date:   Wed,  5 May 2021 09:59:40 -0400
Message-Id: <20210505135941.59898-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
References: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is no "max_brightness" property as pointed out by dtschema:

  arch/arm/boot/dts/exynos5422-odroidhc1.dt.yaml: led-controller: led-1: 'max-brightness' is a required property

Fixes: 1ac49427b566 ("ARM: dts: exynos: Add support for Hardkernel's Odroid HC1 board")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5422-odroidhc1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidhc1.dts b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
index 20c222b33f98..d91f7fa2cf80 100644
--- a/arch/arm/boot/dts/exynos5422-odroidhc1.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
@@ -22,7 +22,7 @@ led-1 {
 			label = "blue:heartbeat";
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
-			max_brightness = <255>;
+			max-brightness = <255>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
-- 
2.25.1

