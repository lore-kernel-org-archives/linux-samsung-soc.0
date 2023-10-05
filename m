Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09261E9272F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 16:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237025AbjJEQFB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235969AbjJEQDc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:03:32 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D9685DA6
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 08:57:23 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3247cefa13aso1121933f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 08:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521442; x=1697126242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UG/bg5G9/fDNb2RLAmV1TJrt5LfCg6WF+hEcmIIxqnc=;
        b=jiqyH7cunnf/JEabZwEZDd2O4nj2wMEE0hzmpjkxFr2yFyQ9nhrtaD5cJO+7m6yshj
         Y7UX86aWK77koJE6+G3liLTywsaOtlSEPIM7ZG5+eA3bfyNbrQqMKwLmHvrY4XHc/gHf
         Elj2KC0cDFmbyge3Y6gSlsNwqNQJLKkk5UbU8hEY95hTIzB0gl26Ssh5BzYC1cZBbYB9
         JB5U6cKDO06fn8/VT0ArBwFZZ8cB2YFR3OyG/2PopIvR06dM3cP4tZjG4YDdbkb9FV6G
         gqH1DuEddV7vvLzaDKcUD4DKOyZ2cIP6QxAq2lLarC0spE9GQUldGVoYy9k1C4y1OrHX
         Gc9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521442; x=1697126242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UG/bg5G9/fDNb2RLAmV1TJrt5LfCg6WF+hEcmIIxqnc=;
        b=NGSpjnjO6N/9QwaIZgYk7KCH47oAdd3PYZAODnF1JHCbUOOZ1iMCYP3zr2nMV/ZTqw
         TbWZf+NSFSIirqF+5vGsDYty1j5F5ja0L3wIYj9iDwhnk7FUaaYRZKOCXpYKksjh8XOj
         LmtQIK9uf5LRKgENZzKZSsdmPfQpKjiFTiIf69ZU8u3GZoBNwH1wxaxpgzD/270Jgo5+
         L2hzxcTMtWrxwAxXAWaN12JgU8ipnzcM4LRCJrk7EWi5SQG9WZuJgW+7FjhqIfNBFMFL
         /Nq0dtm+4hX7i/Wf19pdXLbXN1I8EmXUTKw8jcDx9paTpi54NeGngXPl3rZZitT7lI9r
         7V+w==
X-Gm-Message-State: AOJu0Yx4qFaakF+J7bLMPevaRimkMibNWgYqj6ExESTzGQ0NzVZ9xUjK
        TJDVmRX5R4q6xeq+RcVE/ox0Iw==
X-Google-Smtp-Source: AGHT+IHDCU4B/onZx0tGuUNfz7neahjevgz/cbddvl2YQ0egs2QVaDB52giQXOGLKKgxCDABFc/Ptw==
X-Received: by 2002:adf:f182:0:b0:321:589b:bcb5 with SMTP id h2-20020adff182000000b00321589bbcb5mr5475234wro.57.1696521442234;
        Thu, 05 Oct 2023 08:57:22 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:20 -0700 (PDT)
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
Subject: [PATCH 02/21] dt-bindings: soc: samsung: exynos-pmu: Add gs101 compatible
Date:   Thu,  5 Oct 2023 16:55:59 +0100
Message-ID: <20231005155618.700312-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add gs101-pmu compatible to the bindings documentation.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index e1d716df5dfa..e6abf7b55909 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -27,6 +27,7 @@ select:
           - samsung,exynos7-pmu
           - samsung,exynos850-pmu
           - samsung-s5pv210-pmu
+          - google,gs101-pmu
   required:
     - compatible
 
@@ -47,6 +48,7 @@ properties:
               - samsung,exynos7-pmu
               - samsung,exynos850-pmu
               - samsung-s5pv210-pmu
+              - google,gs101-pmu
           - const: syscon
       - items:
           - enum:
-- 
2.42.0.582.g8ccd20d70d-goog

