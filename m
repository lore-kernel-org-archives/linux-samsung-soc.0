Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9656CD98D6
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Oct 2023 22:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234727AbjJJWuE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Oct 2023 18:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234684AbjJJWuC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Oct 2023 18:50:02 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C02092
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:49:53 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-405361bb94eso63655275e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Oct 2023 15:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696978192; x=1697582992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Hq9vS6neSumB86pCRKEyVFqMD1RM5EQzhHCNjwZkMA=;
        b=x9r1rWekcFEj4aw/+YmLonsUEaLeckF4ZK7Dvpp9HenatJn/RCTRSUWj/jWP6TltFM
         2xC1r545uwkdZRoe7flw0RuNRBF8KH8dLwsB/DY1E2l6aSR1WdtAo1vkrdrQdvj3iQFE
         gVylQmogeXEHRbpMI9szCJ6JYR8O034k3mzJnCjUYMkJXhgiq3aaHweI9IXTGOwmJmFf
         5DHrJLD3xNFedOUz/pImUtE/MB6DMkxPQhs043YbLsPtZxPfxHjBpYnz9fsUJXonhIAJ
         l5dHs9nsvTXehOw/TW/s8/eCfi3a+wnAfp+vJXQpZ4+iC/NaNSraF90l/vvM5uYC3U7U
         YYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696978192; x=1697582992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Hq9vS6neSumB86pCRKEyVFqMD1RM5EQzhHCNjwZkMA=;
        b=oj2EtMNAWahOnOdmdoQf7MH8hH6/fBFZ83mKlkd93Pe/S82lmFuI3CheJQAhBMTLP0
         HfMGqL+BHPo0p3/PWGvah1oE3kyzJxkr26JwCR+RXagxTgWVii5+g/ftiFL9vReh6rMI
         UZxba3PDzLq3SwQBZ/Uam/qqzOms3zyY/BkxTQlmtb551UWZ58Qpx8Ol5iQtLM9RFmlo
         9RZzWcev0ao2y3kv9uDtSCz0H+IEdz24+WANB3Gvk4/GrgrBR24w3rIO5na4k4dsEEzJ
         1x9SdOD6Jzh1lBdopUuz0aFJGNdERJU8k37YX6Z9CXGqnNCkO5GTgst55GTxYlOA7dyt
         o1Ww==
X-Gm-Message-State: AOJu0YxHnv6SouJIP28fFdLk5sIDfAB64Jr722xLxKJm4NdLpNFmDHee
        D/J1+Jrg93HEuOTQrRZPGC6yRQ==
X-Google-Smtp-Source: AGHT+IFq7RnQsFfD4fu2RfO3iXmtJntMfPE1V308P1kDHa+sR25ENbIusBbQyBhO9DhcGLgTsGUgpw==
X-Received: by 2002:a5d:69d0:0:b0:31f:fa61:961d with SMTP id s16-20020a5d69d0000000b0031ffa61961dmr18822018wrw.63.1696978191901;
        Tue, 10 Oct 2023 15:49:51 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id j13-20020adfe50d000000b003196b1bb528sm13689547wrm.64.2023.10.10.15.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 15:49:51 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v2 04/20] dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
Date:   Tue, 10 Oct 2023 23:49:12 +0100
Message-ID: <20231010224928.2296997-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.609.gbb76f46606-goog
In-Reply-To: <20231010224928.2296997-1-peter.griffin@linaro.org>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add the "google,gs101-wdt" and "google,gs201-wdt" compatibles to the
dt-schema documentation.

gs101 SoC has two CPU clusters and each cluster has its own dedicated
watchdog timer (similar to exynos850 and exynosautov9 SoCs).

These WDT instances are controlled using different bits in PMU
registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/watchdog/samsung-wdt.yaml      | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 8fb6656ba0c2..67c8767f0499 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -17,6 +17,8 @@ description: |+
 properties:
   compatible:
     enum:
+      - google,gs101-wdt                      # for Google gs101
+      - google,gs201-wdt                      # for Google gs201
       - samsung,s3c2410-wdt                   # for S3C2410
       - samsung,s3c6410-wdt                   # for S3C6410, S5PV210 and Exynos4
       - samsung,exynos5250-wdt                # for Exynos5250
@@ -42,13 +44,13 @@ properties:
   samsung,cluster-index:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-      Index of CPU cluster on which watchdog is running (in case of Exynos850)
+      Index of CPU cluster on which watchdog is running (in case of Exynos850 or Google gsx01)
 
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       Phandle to the PMU system controller node (in case of Exynos5250,
-      Exynos5420, Exynos7 and Exynos850).
+      Exynos5420, Exynos7, Exynos850 and gsx01).
 
 required:
   - compatible
@@ -69,6 +71,8 @@ allOf:
               - samsung,exynos7-wdt
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       required:
         - samsung,syscon-phandle
@@ -79,6 +83,8 @@ allOf:
             enum:
               - samsung,exynos850-wdt
               - samsung,exynosautov9-wdt
+              - google,gs101-wdt
+              - google,gs201-wdt
     then:
       properties:
         clocks:
-- 
2.42.0.609.gbb76f46606-goog

