Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAED0C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:22:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A06496108F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 31 Oct 2021 12:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbhJaMYy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 31 Oct 2021 08:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbhJaMYw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 08:24:52 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2383DC061746
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:21 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id w1so1028704edd.10
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrX17JLN3iZK9elmHvVA7fpxdjI/sdFhycMWQkjxxmg=;
        b=EoJorhiELL6i8YX9P+3PygS5UCUPug1ARREUj9jNmgGMuJ+8cio7Zc3HRIdeQEveTz
         swQRHS1aFNJ+72CRMI1zdgXUe2ds+ldsMQRUBhO3dlShrcmTWOG+3Gcjq3z0EC/zydGw
         VimMqtPezFOWur3Ysv6cc5+/m6TkT+Rqot13TMNA3oOsb51G7+myt48d3LoUZ+lvV1DI
         TmRJsrg9kWimfBRRvzzpSbSwBgF2+m8XdkQAcBRNjyAJIYjPo5Jbm5uwhHlRrjGeTS3o
         cZlOTCMUC2mCQTUxnN/q9DO8yqkaMaI/StRj7xwUC5EqLo2r3SxqGxcUjk+bgNlriJdo
         7RkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrX17JLN3iZK9elmHvVA7fpxdjI/sdFhycMWQkjxxmg=;
        b=yaFHdA3V7F+S54p2wq0T9Bk58WrrlgmKSvyqQo0pUfwlnYyVY0FU1NwyJi7OAUMrxN
         JhKQax6vzn6Cj2NUQasJ0172raNPZUv7nuAqY5GOkEvNrfBPVBya4Nws6EWfLNFtNSUI
         /FMUTnzv+K4TIoAEzxKFMbQMRP4UnANNg9A0r5mP8exk1UwAKA+WBULwO+mT0g0ZqjE/
         WL2awFVNjkGUQelPrXVmaff88IfqlTZcB7S9joOc+cEFp6E/nDHnYK+AXbb6W9ZvFMXL
         WilOiWa2EVvN2qB4Ng+B0rvgizuh8/ZQ2R45C1XgdCNP/7Dsyot3uu7piZRuaX+StylT
         CSnw==
X-Gm-Message-State: AOAM53187iB2IEIHBjyt3cl8x5aSn+UCmuBKHekqAcSEgmF5ecdxD/Yy
        kzoS8APcLMUlApJqxIp/3NFfZw==
X-Google-Smtp-Source: ABdhPJxuGF6wQckRdjEtPpGPkF2sf452nvOubT7XXExNKWVcsdUQCtuxKqSxcFUKSExu8kZCUIhqSg==
X-Received: by 2002:a17:907:86a1:: with SMTP id qa33mr28216618ejc.270.1635682939671;
        Sun, 31 Oct 2021 05:22:19 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id ga1sm5738052ejc.40.2021.10.31.05.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:19 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 01/12] dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
Date:   Sun, 31 Oct 2021 14:22:05 +0200
Message-Id: <20211031122216.30212-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos7 watchdog driver is clearly indicating that its dts node must
define syscon phandle property. That was probably forgotten, so add it.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Fixes: 2b9366b66967 ("watchdog: s3c2410_wdt: Add support for Watchdog device on Exynos7")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added "Fixes" tag

 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 76cb9586ee00..93cd77a6e92c 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -39,8 +39,8 @@ properties:
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      Phandle to the PMU system controller node (in case of Exynos5250
-      and Exynos5420).
+      Phandle to the PMU system controller node (in case of Exynos5250,
+      Exynos5420 and Exynos7).
 
 required:
   - compatible
@@ -58,6 +58,7 @@ allOf:
             enum:
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
+              - samsung,exynos7-wdt
     then:
       required:
         - samsung,syscon-phandle
-- 
2.30.2

