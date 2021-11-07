Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AE3C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12BF361075
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  7 Nov 2021 20:29:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236436AbhKGUcd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 7 Nov 2021 15:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236428AbhKGUcc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 7 Nov 2021 15:32:32 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E106CC061746
        for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Nov 2021 12:29:48 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id s24so25467686lji.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Nov 2021 12:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fB9ob4LNIR2u2sgphH9lU6cuRm+hn58c7lOXUO4ktBs=;
        b=vOL0kGMnYshUb/PsTpfeURp/YT0JgkqGon/OnJhKim1Adc8XVKRrxPVgNyQoYylGHD
         L3IWHdIHRKXBKxeCjfaLS72gyENJ/duhyiIes3IrZyeYVXCKvPwHjIpxpZQMAkqu7kQM
         +uGZKzzkmL+VjCNtBKNMHsErHMFADkZplOGhAnpPoBzNMeWYxTi0RPYxaIA/57ZcPZmW
         C5kkzzwGn0numO3nZZtPe9pO5QFwkrtsUjX96IrAR83qQLcjvY3fGLRCOMmkvBtCBICm
         byK3XC3fQtwwozC8MwCsrh1XV7IioiM99V4oWDBXb/AOPfa6rAmYTd7Q88xW1JIhEUVz
         oPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fB9ob4LNIR2u2sgphH9lU6cuRm+hn58c7lOXUO4ktBs=;
        b=O6mhZFoAiHRbF3v9UHEZqLHpPuTyyybG5oDMOcBQAdgHbSfazRgnTDSGK7fjGGfBdP
         YwEdML6eV+kPD9MHnMlzvgIpcq/oX1HL+Ybr4A92q9TpivDTHoQowp107Y3G9bCRJiRL
         jcndIm1G2sMcE0GFfYMqNYWLkUm28bJtbX3+4aJYxcgGvVTyQ4LPZuZmGgrpu2XQ1HKK
         rvPJA606kywbvtiVplCPMpbUjSU0Yd4iulf/IZJWLECINV4DZO4YEuaQyjs3AdNsuNnK
         2rVt+1R5IwMXvsakHmQnkOrZAdmuiMaXtQPYTXu5HRKoyIvoLy8fSHcFiyQuFU+QQ3Io
         lC8A==
X-Gm-Message-State: AOAM533A0uCDzHf4s4unEyGZKJ2A8xL8y1rt5FdZ5FtypjXnJ6XXlln/
        ti/eJ2DmDM3+aLJFwmsl4ACocg==
X-Google-Smtp-Source: ABdhPJy4vBcWfqjg1/hSuRkd/Z+6z/H7WYEzyZLU7G4cAO8MPEkz6SfknIAVDTKCh4XzvQxKHD3YLQ==
X-Received: by 2002:a2e:391b:: with SMTP id g27mr78258688lja.126.1636316987253;
        Sun, 07 Nov 2021 12:29:47 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id o14sm1566490lfu.253.2021.11.07.12.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:29:46 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 01/12] dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
Date:   Sun,  7 Nov 2021 22:29:32 +0200
Message-Id: <20211107202943.8859-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
  - Added R-b tag by Rob Herring

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

