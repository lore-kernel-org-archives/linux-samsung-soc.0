Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8FE8C27C7C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 13:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbjATNSj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 08:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230507AbjATNSf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 08:18:35 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76544C41D3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 05:14:52 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id g10so4042839wmo.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 05:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AfFIuRH2b9FfD0CydIJ5oSJmwUczAEd83CzMQhgLMzM=;
        b=V0vHFo7ysajexa+NmYC+hGR0na69vwSKGypzgdxWvgYKSvjzxKe352iDiDda+iA3mx
         yV1M86QhpEfjVSIfxLh7krDmwkDhF1x6zb78M3srZw5LGqDLW3bKJYIhANFA63HuYH2k
         PtsSQbuSmNOD2lKTl5e8lILbSdv3Sr8Xv/lVYIgFsuYJ0V9nnw6tfT4DGjAtY5B8TwcW
         vJUB3A04EV0j2x4NJa8OvGtYMo+UKu+CEKXa08aQrgEpwxxi7U9hdaA968AwQ1mykVlM
         qR/gfFLCDu2i0Pb0UeHyyhPK/KzcJe33g2to4tX1G50G4DtKjFJLXPzIVkKMhWELCs0o
         TCGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfFIuRH2b9FfD0CydIJ5oSJmwUczAEd83CzMQhgLMzM=;
        b=u3oVNMBsdqoWSBGTPm2JstbqHZ9zlk1rj92fW7aF7O1QsXYcxk3DAoBlmTbfO1f4M+
         Y/UYRyRauluud0QSd8Wt5sXcGNRVo3bZB/t/DdZ8rUCCeJlyMsTbBqYQP7NLUTNSf4pW
         pKPcJu3yEcTKUvu3sN7cZritxHrEjmzrsUzKeJgEonwzPm/KZlvChzmJKYIoRTeSB32S
         19Vf6pxKaiOHuGJpShcSP84FN1nBDQZwi/MLcVGhLd+T6PBOr1LzHTM0yt4foU9LQYWB
         Ivz034vt6s17nB3XPkuFvytw5Cz9N9XIGyfbouoso6KRmk12Ei9tpUQdLG5mo1h+mf3O
         XpJA==
X-Gm-Message-State: AFqh2kpBXhXOBEK069w3jG4bf8clMv8pvvDjWEQFaY+0frrrCbSfXgq5
        onnyn7gg7DoSuus+V+1rLjkSTA==
X-Google-Smtp-Source: AMrXdXvP3mf/U+3R2kQJkj9RTHm/6Qvd9bJpocAhTuHbHTW4xJISAGMZj4sGLykeOAtsY+vu4wFQ6Q==
X-Received: by 2002:a05:600c:a29e:b0:3d9:ee01:ae5b with SMTP id hu30-20020a05600ca29e00b003d9ee01ae5bmr14064047wmb.12.1674220491033;
        Fri, 20 Jan 2023 05:14:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q18-20020adfdfd2000000b002bdc129c8f6sm24518977wrn.43.2023.01.20.05.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 05:14:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     stable@vger.kernel.org
Subject: [PATCH] regulator: dt-bindings: samsung,s2mps14: add lost samsung,ext-control-gpios
Date:   Fri, 20 Jan 2023 14:14:47 +0100
Message-Id: <20230120131447.289702-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The samsung,ext-control-gpios property was lost during conversion to DT
schema:

  exynos3250-artik5-eval.dtb: pmic@66: regulators:LDO11: Unevaluated properties are not allowed ('samsung,ext-control-gpios' was unexpected)

Fixes: ea98b9eba05c ("regulator: dt-bindings: samsung,s2m: convert to dtschema")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/regulator/samsung,s2mps14.yaml   | 21 +++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
index 01f9d4e236e9..a7feb497eb89 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
@@ -19,8 +19,8 @@ description: |
   additional information and example.
 
 patternProperties:
-  # 25 LDOs
-  "^LDO([1-9]|[1][0-9]|2[0-5])$":
+  # 25 LDOs, without LDO10-12
+  "^LDO([1-9]|1[3-9]|2[0-5])$":
     type: object
     $ref: regulator.yaml#
     unevaluatedProperties: false
@@ -30,6 +30,23 @@ patternProperties:
     required:
       - regulator-name
 
+  "^LDO(1[0-2])$":
+    type: object
+    $ref: regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      samsung,ext-control-gpios:
+        maxItems: 1
+        description:
+          LDO10, LDO11 and LDO12 can be configured to external control over
+          GPIO.
+
+    required:
+      - regulator-name
+
   # 5 bucks
   "^BUCK[1-5]$":
     type: object
-- 
2.34.1

