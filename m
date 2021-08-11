Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02786C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 11:48:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5C0060FA0
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 11:48:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237416AbhHKLs5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 07:48:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237358AbhHKLs4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 07:48:56 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C827CC061799
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 04:48:32 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id i6so3314249edu.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 04:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XqDR8o25I9iZ0astV4MjqX8UHWoiuFZZ1Xjx/J4Frsw=;
        b=CjpV2FHaTieFaab7z65Ddlq+e/euf14JUs8OuIRGO0rjskWhkNfmnkaUSqUCSvjDOW
         E+5XwPWpnADC+Cg7yE4vRXSfwCXE1EUjP/5PvskRI3sUZo2N4FC+POGxIvJtQARNtrF4
         EjlyZ4LG1sXaQlE7uS71SW0LhNOHOmXCPRdnKbRrlLLmRdVmjjiqVi6tyDer51e+M5nc
         Bl9T8J/TTFCbip4kI23JRoV3MTooNsesJdQ3ycHMX+8qie/XqmMMDgkR5ylzrQmaJWkL
         D1xmzdPntg2TDUQhmXs0Vjpl6Asng9pZ5lJ28NRkJ0SHtGWg7N0jitlWn4CY3MIKLf26
         noQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XqDR8o25I9iZ0astV4MjqX8UHWoiuFZZ1Xjx/J4Frsw=;
        b=HkA4ifNq+99cZq1eNSYfNdLBs5EL36vfjapI78ediFY9cabqk4lTxcM7HsoAcIsgy4
         rTguQMhMVT1fhR3lrK+5gSqfgdA0YmZqkgrA3TVDEWgc7YQB87tIFYWxyZa2IG4E2dl9
         0Gs86knIXyeBvHFFuMTRqg2YSxhuGPkxTpdA9XkZR/92VeuECetVxq8QPbcnAtGuH4y7
         Q8VMx5Vy+8L9EWhSlTfr+7cSZ/qgDVJIlJt1wGALdwQKtao4b8xGZdu8m2dm9dsQNnnj
         c5F+LXAX1cXNxn5HYk5EXCQ5/labOhPs5bGW9nlkdF1xbiX1ZsGBPpnDxSYH7OesVneN
         ckcQ==
X-Gm-Message-State: AOAM531YoO6FWstneTv6C9bKVTrGjtSslAV/C8sN0kKAuML8baB1Uzbs
        B3IZc7iBqd0JF48TBtDfR6V/Kg==
X-Google-Smtp-Source: ABdhPJxPBr/lOttW3KXHEiYkxvP2K+24XoIasoO/NkyDAIWnHAl0QvjC9nJL3wA9vLAPNR8U2zYf+g==
X-Received: by 2002:a50:d4cf:: with SMTP id e15mr10933562edj.2.1628682510972;
        Wed, 11 Aug 2021 04:48:30 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m25sm5446793edv.81.2021.08.11.04.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 04:48:30 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v3 1/7] dt-bindings: pinctrl: samsung: Add Exynos850 doc
Date:   Wed, 11 Aug 2021 14:48:21 +0300
Message-Id: <20210811114827.27322-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811114827.27322-1-semen.protsenko@linaro.org>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document compatible string for Exynos850 SoC. Nothing else is changed,
as Exynos850 SoC uses already existing samsung pinctrl driver.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - None

Changes in v2:
  - This patch was made the first in the series

 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
index 38a1416fd2cd..e7a1b1880375 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
@@ -22,6 +22,7 @@ Required Properties:
   - "samsung,exynos5420-pinctrl": for Exynos5420 compatible pin-controller.
   - "samsung,exynos5433-pinctrl": for Exynos5433 compatible pin-controller.
   - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
+  - "samsung,exynos850-pinctrl": for Exynos850 compatible pin-controller.
 
 - reg: Base address of the pin controller hardware module and length of
   the address space it occupies.
-- 
2.30.2

