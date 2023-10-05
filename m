Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE61FE92737
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 16:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237537AbjJEQFF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236827AbjJEQDs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:03:48 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A67408680F
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 08:57:28 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40537481094so10222115e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521446; x=1697126246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xm1Xoms6oZd6xtVAii0x+Ehd7QscBFZjC7N/3rM4L+E=;
        b=AbQZamJfp1IPbiUPXSmmAsLLQmEA3T1t7xh+w7asSiyjfiE0qjoH4Fs3u1UeeohUq9
         Czuk9yuTlYjzysGOe1Dv2pJJDCwqk+bnkU3KxitfjpRolhLh96/upJYn0QjqTaI2UT+0
         yNWNKTIeVxp+JvfjMGhxjyWY7+kXbXJmNejWwM5ScUD3Ac3fhRSW6hz4HN6C7bmIMpsa
         A9LaTEeTK2NEMwyD0SGk0BaVHaKFygv/QObVt5C8Ck4GObzbPCFw9fKvNtPHprgOfZ6j
         mmDCpjq1nQE6DpAsz4oGQ64JH9DbjDx8MBEvMw+xWQ9y6oX8d3dmsqm3d3MMKWaA7MFg
         uA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521446; x=1697126246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xm1Xoms6oZd6xtVAii0x+Ehd7QscBFZjC7N/3rM4L+E=;
        b=Hmmg0UWl9n6Uf6w1/PolzE3BeNxqdDqaiTHTFH8Dqtw7yKiiiBN1X7LTh27bkEDcu3
         ozxieMv7uFmH/yNeHFsGAje+2r/DE41QxMxnhw0NH+owccQxoGgzoMQb7tLB780kppL4
         ZtD3bXwxe+aA2jUz75h5uEEj7CeGYU3WXqYIbF722+PXT6OFbydzlC6H7Nq+MyTCEQxU
         s5HEGZ4ueeYxINiHmb2vXYQJILp+l1ark0JGTJYkTpoT8iNVy9gQeX0aix2mWhQ76mz3
         Yf7XfKkzrzdmn/f4IO5lnDLhMW/qQ6EBw5AgpZSm7wYO0nlv7VX62WkM0lqfAa1rDk4V
         QcCw==
X-Gm-Message-State: AOJu0YxiK5tmGVQDcKDW81MZHiq6YQ6X+Q3aK0sNczSyWZTOjIfLA/Yg
        yVniIIc91BKq7LT3K85VGC58Qw==
X-Google-Smtp-Source: AGHT+IEMvnjwfd4IeLtIJsxbXTd4pMr2IsgDm+E4xxpemwktFFHqJeH+cuxPlOWDyzgeNbQFbEBaMA==
X-Received: by 2002:a5d:4c4a:0:b0:322:478b:2be9 with SMTP id n10-20020a5d4c4a000000b00322478b2be9mr5294165wrt.25.1696521446692;
        Thu, 05 Oct 2023 08:57:26 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:26 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 05/21] dt-bindings: watchdog: Document Google gs101 & gs201 watchdog bindings
Date:   Thu,  5 Oct 2023 16:56:02 +0100
Message-ID: <20231005155618.700312-6-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
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
index 8fb6656ba0c2..30f5949037fc 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -24,6 +24,8 @@ properties:
       - samsung,exynos7-wdt                   # for Exynos7
       - samsung,exynos850-wdt                 # for Exynos850
       - samsung,exynosautov9-wdt              # for Exynosautov9
+      - google,gs101-wdt                      # for Google gs101
+      - google,gs201-wdt                      # for Google gs101
 
   reg:
     maxItems: 1
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
2.42.0.582.g8ccd20d70d-goog

