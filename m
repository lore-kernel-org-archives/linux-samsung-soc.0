Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FAEC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 20:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346558AbiAKUTH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:19:07 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60488
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345746AbiAKUSe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 15:18:34 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B8FC940ADB
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932312;
        bh=kQHLxaxxJLFmOGqzWUxDRLkwO6oKafieScmNTdNr7i4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=VeAGBk987DL99eyMA326D2qBmIp6pbLOyKqIahGvEtrCQcWtGZGsR7wfHQA2OvL+h
         IyLIoRdozt4bnkBE0/V25LMMX3rmcF1bd4Y+c3e5jFQLUWMUHjM7YuF4s+b33WrDSW
         QVKClLFciVl1JnMLAqk42iYL51KqHLSTJN/BVO9DnKat3Tse2NOEqNl9eFgYqRzfBU
         B7yJAkRSmlz5EMzjS8oG2y8rOzpHfOWbcPv/FnpSdYNZrIKVMqyHumRXrpkQeYWqHt
         fEfX+p6nu3eKdPAXlxF1LAgG6wUbbbS/j9yx9zjN82EwLFTplGw22Xrf6hq8fypzWy
         GWrK9L18+3NpA==
Received: by mail-ed1-f71.google.com with SMTP id r8-20020a05640251c800b003f9a52daa3fso148819edd.22
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 12:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kQHLxaxxJLFmOGqzWUxDRLkwO6oKafieScmNTdNr7i4=;
        b=DR3sVQ25JASN9hj0S69mg05kh8wBBIQxiyEbyMAYF0hRhSz+46veBfKw1Xjro0yUDx
         RI4TPxSMnmkEOLEyR0itK87lnaLlrkHPIh9XtNemWDSN0hgpMuVbYTCSOAB/LKYk1Mi+
         Lkmp7VJJ+nPg3/AOYxq6EABhXH14cVDXWA/1sABfIvKXCcO46YYXZ0atZHrjYbqYDaMU
         PcuDx933+JWFZtFKQi3BzZ6dHSuLau3SmgfY2govgkBa+qqvRFkW5g4ehoWOd8EqF5MN
         sfDtgwARWTC7xOZsXyzxnqdGSLCA2MgIScR8VXLOLOVjMETIUbLHfb/dLdCgM0q+Ed5a
         aXrQ==
X-Gm-Message-State: AOAM530ZwGhSg7ZmQrlR6etRkfKL7UJxwYTIHGfjicMF9pZs3Frg+IDV
        w+juufp6cOBfvdKoVQ8gb+pCD5ZWnp8mtTTlJRwRhNNSqv53oUIq+tZQa/luFOtH8iUaxIYscC+
        pVk833WHnsendrIPDJTDsu+JPaNJf6A8Oe17o3tQokFPT+Gq7
X-Received: by 2002:a50:f086:: with SMTP id v6mr737732edl.94.1641932312220;
        Tue, 11 Jan 2022 12:18:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJA2UIH8S5lzI4JycUQ9WDc6T41H+sPiiwxmzpWvqHdoH7V+UxlOdlH0f0srHDP5vkj+BfXg==
X-Received: by 2002:a50:f086:: with SMTP id v6mr737711edl.94.1641932312024;
        Tue, 11 Jan 2022 12:18:32 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e4sm4030881ejs.13.2022.01.11.12.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:18:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 28/28] arm64: dts: exynos: use dedicated wake-up pinctrl compatible in ExynosAutov9
Date:   Tue, 11 Jan 2022 21:17:22 +0100
Message-Id: <20220111201722.327219-22-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Older Samsung Exynos SoC pin controller nodes (Exynos3250, Exynos4,
Exynos5, Exynos5433) with external wake-up interrupts, expected to have
one interrupt for multiplexing these wake-up interrupts.  Also they
expected to have exactly one pin controller capable of external wake-up
interrupts.

It seems however that newer ARMv8 Exynos SoC like Exynos850 and
ExynosAutov9 have differences:
1. No multiplexed external wake-up interrupt, only direct,
2. More than one pin controller capable of external wake-up interrupts.

Use dedicated ExynosAutov9 compatible for its external wake-up interrupts
controller to indicate the differences.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index de8fcb82eaec..807d500d6022 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -208,7 +208,7 @@ pinctrl_alive: pinctrl@10450000 {
 			reg = <0x10450000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynos7-wakeup-eint";
+				compatible = "samsung,exynosautov9-wakeup-eint";
 			};
 		};
 
-- 
2.32.0

