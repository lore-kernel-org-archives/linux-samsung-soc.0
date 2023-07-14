Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576EAEB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 14 Jul 2023 05:03:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234751AbjGNFDc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 14 Jul 2023 01:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234745AbjGNFDb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jul 2023 01:03:31 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5662D5F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jul 2023 22:03:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31441dfbf97so1692080f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jul 2023 22:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689311008; x=1691903008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tX9dAg9Z2unJC3pHf2Z5DOZUouKHxctPcJNS/6UJayM=;
        b=NDIMRZFXfKhI/GbAFRavn+QkEDqPzVXBMp4CkFHf86pBeSvyemf8lx+GUs0O3ypGqh
         Dii/aJ820X0TTGUs14N+bu5DEoO5aRoelF2zkkkgDoDzp09ZYy5o6fdC2g8rQAytazvz
         MrmtYDppmH61VZttMbX8KxfyZpzpN6smiHbtbL0b0cvmG3qyvUKdWUr4U9siA8HKKEAs
         oJImnPKndiXIObEd+0Kz00owImyj3uWSH6CjusTXAOckDRKe2c0qC/WEel2ydryFz4Fo
         P2Ns0YAoplh8FWJchQjSh3kmrIJpXml3d6J3Oga3k0A7bxMuM4yV2Pc84noKpm8R/cnK
         TSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689311008; x=1691903008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tX9dAg9Z2unJC3pHf2Z5DOZUouKHxctPcJNS/6UJayM=;
        b=EGtNp7csLaW+CbBW1Rt8mKd/rqv/PHtiz91y+Nrsk9LF2iMr7p8WItY0azXQ5qacCt
         JdVIjaPM0WVLMjw6kUb1PJCZCtp3TmMafA02z/fkhWWvsrK8lnoSHLJt1oqVcvwjjZ7x
         U83c6Jo2tzMZ/2tjGf9fZpVKs6iLVnzyVdWv/cbvsBcyJDXmjPOKuW1Dy6FYdiXFAlIV
         7nw0kEoShmr1VHUATGTGNB/Ly1WFNEs8QYA9NiwtFaoS065NSFY9p1WrcAVbnfFpAjLV
         Tj4uh+kvVPi5YqgNpTu2wPxyEfrSmUmSfmz+iOZmtXkql4AnKwr/QKJJZCIaztM1pz5V
         GwlQ==
X-Gm-Message-State: ABy/qLbb1okG/NjN3QQfX9LiwAhSIOmkixxWYDz8Ylo7Zjz9WQdrgX+x
        4etPUj4DD/M5Y8InJ7jFvuahWIvL3lMR+XSOpsQ=
X-Google-Smtp-Source: APBJJlGXloEV5t6PJTFoUlQh2npgiYtXnhIvDspCbHc4ipFaroX1UaF04+28soNd3GA8b3nthzAxvA==
X-Received: by 2002:a05:6000:c3:b0:316:f00c:7682 with SMTP id q3-20020a05600000c300b00316f00c7682mr221875wrx.65.1689311008095;
        Thu, 13 Jul 2023 22:03:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id j18-20020a5d4492000000b00315a1c160casm9690702wrq.99.2023.07.13.22.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 22:03:27 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH] MAINTAINERS: mfd: Un-support Maxim and Samsung PMIC drivers
Date:   Fri, 14 Jul 2023 07:03:13 +0200
Message-Id: <20230714050313.8424-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Since few years no one is really paid to support drivers for: Maxim
MUICs/PMICs for Exynos based boards and Samsung PMICs.  Correct the
status to keep them as maintained.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ab839af24fc3..0b8cd03f5e52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12840,7 +12840,7 @@ F:	drivers/power/supply/max77976_charger.c
 MAXIM MUIC CHARGER DRIVERS FOR EXYNOS BASED BOARDS
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-pm@vger.kernel.org
-S:	Supported
+S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/power/supply/maxim,max14577.yaml
 F:	Documentation/devicetree/bindings/power/supply/maxim,max77693.yaml
@@ -12851,7 +12851,7 @@ MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BOARDS
 M:	Chanwoo Choi <cw00.choi@samsung.com>
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-kernel@vger.kernel.org
-S:	Supported
+S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/*/maxim,max14577.yaml
 F:	Documentation/devicetree/bindings/*/maxim,max77686.yaml
@@ -18809,7 +18809,7 @@ SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
-S:	Supported
+S:	Maintained
 B:	mailto:linux-samsung-soc@vger.kernel.org
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
-- 
2.34.1

