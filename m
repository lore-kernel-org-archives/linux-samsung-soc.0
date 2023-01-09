Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 265C2C54EBE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  9 Jan 2023 08:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbjAIIkE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 9 Jan 2023 03:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234646AbjAIIj5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2023 03:39:57 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D9A13F01
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Jan 2023 00:39:55 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id r2so7358890wrv.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Jan 2023 00:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ3K/io4iY2GwjynBlbKdP/dQNns/heqzgxTc+VLTbk=;
        b=uoybz+I0rrdzryvAFoZXzdYjqss4CEShTQt9kaZMolZJ3XeINCEyRSF62QWRd/h98X
         /VtYvv+HxunluEMQHCxODay1/luLVAZXtoaNNMphItwULOeLDSLcYbhGxeTEAdQAFoNI
         3x6qByYrV7IJroPxWL9f4rs9wl6kn0QnUPOm8OylgUGXq+r6b+hYvbXVgQI9BB5m6983
         OQ7U7RmB6bIwywvnzFlZfK6fqKT4kAQojqtwRUKbJlka82Zc1tAWeUVAyk8Ka6k26iWO
         W7vpbs5RwCb5064N0vUgGA0ngC5FReDqquwyXOt9/6NphtEN3W4mtg1Eiu/n+OAke6uB
         5eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xQ3K/io4iY2GwjynBlbKdP/dQNns/heqzgxTc+VLTbk=;
        b=4bh4w22tjXjAtDgEyJ1XD+4b8pQkquS5ZtjRBLETNwcDYpWsHErhYVZj/Lbf296ffB
         vAWpHFoLLfxXkkUE4mUTeMgeRlh36r5wJgCPfYglQe16JUhCSQ13edaHQ+MAB9bpOfHc
         hvKnnyy61Z65Uj2bCh1e+A+Bu4To18Yv5fHrUs0Z4A7o9n9lWWdegYVEvRTjquQuIvVA
         k/PiwQRCRF6wwB3HqoFyTi9GzghwUT9hpm8/TTa9IxYsRbLkjzeyVRjQ7xu+jvUvorWq
         t+vqd56vwWEDwQiWKKp7+W35ps1HQ+i4wlMIFYOAwJCvBKu2BbdV/aCJrSjsJiTadYTi
         kbPA==
X-Gm-Message-State: AFqh2kq93U/J+TMo4TnEYApiTrXtlfVYov/gIdhKGH0aeHJO0q+gE4Qn
        52cxf2A9kdMuBPVgoZARAwH+Tw==
X-Google-Smtp-Source: AMrXdXtmW+X3Ei5S+EFkiH61YWcu+ID/9ZhO6toJ7+59ffejgvukY81lSbLVhJyf6Aij7xkA9Qsa0Q==
X-Received: by 2002:adf:eb4f:0:b0:242:659c:dc7 with SMTP id u15-20020adfeb4f000000b00242659c0dc7mr38364812wrn.61.1673253594453;
        Mon, 09 Jan 2023 00:39:54 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b1-20020adf9b01000000b0028e55b44a99sm7853335wrc.17.2023.01.09.00.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 00:39:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sriranjani P <sriranjani.p@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: soc: samsung: exynos-sysreg: correct indentation for deprecated
Date:   Mon,  9 Jan 2023 09:39:48 +0100
Message-Id: <20230109083948.77462-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"deprecated" keyword was indentend wrong - entire list of compatibles
starting with generic Exynos SoC compatible is deprecated.

Reported-by: Rob Herring <robh@kernel.org>
Fixes: 0a2af7bdeeb4 ("dt-bindings: soc: samsung: exynos-sysreg: add dedicated SYSREG compatibles to Exynos850")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 60958dac0345..163e912e9cad 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -36,7 +36,7 @@ properties:
               - samsung,exynos850-sysreg
               - samsung,exynosautov9-sysreg
           - const: syscon
-            deprecated: true
+        deprecated: true
       - items:
           - enum:
               - samsung,exynos850-cmgp-sysreg
-- 
2.34.1

