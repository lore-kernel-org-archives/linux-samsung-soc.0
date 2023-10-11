Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF34CDB47E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbjJKSt1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Oct 2023 14:49:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbjJKStV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 14:49:21 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87D5BA
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:18 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40566f8a093so2150235e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 11:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697050157; x=1697654957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sJ3da2zR4moBialQV4IOrG6Elhg9sobhVZVNX5p/jc=;
        b=Vb3iVZSEzScUycXz76wnJ9U7Zh8dMr/e5Tohy3NOFtPqlhheFzsEQ8l5O6iZIq24Vw
         9zHdP7uBq0p/ztxTDtJxdtl9AmlratWy0I15c928u99yB6JTWNBOp0ZuYg0Go3SYKEUj
         V19gkzUIr1Z0kekfzp88TGHaP5u6gSzLlmZSzdeN3+fRvHjMMEZGuDhvyaxEG6cWonNh
         05GFZM2W9GJPSglB5ynnL0QUtlMsELEjGrib0nFJDtfakZPok1nvKbPOaZaIye2W1rb+
         6InaFSWRUQaYXePI2L8uLFL5NO/MaebofN1Oj85LMdSVGatC5dL9kcESLw+7czXv4aXB
         3y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697050157; x=1697654957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sJ3da2zR4moBialQV4IOrG6Elhg9sobhVZVNX5p/jc=;
        b=b6ZV9prG4l2gSav4dw8WD1iN3ZlO8Xfkqki/y0GgUApUCNT41Pj//cJFBvJiZ9zfdp
         kOG3LiM/lKP7hgX6DGp4T5dzFo1uF6SKgTXg3mqNvTHeUyhz+MC0vX/OO8Xwlm/PENlt
         SZxoH2557dysjtNF3BsKs0zffHhGRQDS1V/MX0tTbpd4AtG6JS/UOk6KbCN8yhzqN4EQ
         waWIqhqJtJbDMsSlCbKOwsM0HoNx963dgSU5clu7OqitYzXSS5J3uF5aydcpsWHswPqC
         4k/F6aErYhPB2IYNT9IstCeUr0FwND8A6mhV009AQMmhByjI6QY70/N2sSSt5d4WO9qs
         8YdQ==
X-Gm-Message-State: AOJu0YxsA7TuUBu3mlLKc6wTqUv5v/nZomvYfJ/8PMbBiSevSL3z3gEx
        y0TJM6RUWD6AGWDweAzOTQRzfQ==
X-Google-Smtp-Source: AGHT+IFxlm4cPaWsTc52dhhsUdZJ7p0CWvQbKiYLmqnWDAlsMz9mO82xwtskyxNES5kIDLvUoOD0dg==
X-Received: by 2002:a05:6000:a12:b0:321:9c00:b886 with SMTP id co18-20020a0560000a1200b003219c00b886mr9286954wrb.68.1697050157235;
        Wed, 11 Oct 2023 11:49:17 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id v6-20020adff686000000b0031980294e9fsm16003875wrp.116.2023.10.11.11.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 11:49:16 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v3 04/20] dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
Date:   Wed, 11 Oct 2023 19:48:07 +0100
Message-ID: <20231011184823.443959-5-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
In-Reply-To: <20231011184823.443959-1-peter.griffin@linaro.org>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
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
2.42.0.655.g421f12c284-goog

