Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E31CCA47B
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Jun 2022 16:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351314AbiFEQhb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351292AbiFEQhZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:37:25 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7925E13F60
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:37:22 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id h19so15966391edj.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tDldJvUWq/t8HkLjmMBt3wQxs1mV2YA2MEy0H6KrEa4=;
        b=ysq/Iri4liff7CJIoTo1y5wFmbEIb9R6jfMyb+LG3b6Fszgn7m8JxMb3+NMPgirSiP
         gFrUUJCxpoKLcL/rXgLz4QqqYFudxqInIfWAyKzMKAR9L93y51KO5SLSqMO/0NXDtF8h
         8CAhDlJP4Q4fI4WfVWNVlAvgzBUvS1IGDY17snDvNgaHUnph2wgNvz3Q9Up1dhLwK5Gs
         7ZOfJmt554aJEQ5pu6o7SBDh6I4A/cAUVyvA81rnP9/ByYRqWyvsmyOUc0RbajLKVkaK
         /unmqzh5xiJjWMyVNaxPOH7BIeqlFkr8N0ucKuyT3z6baI3w6aeZGOlfqBX/OiruFj4c
         d0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tDldJvUWq/t8HkLjmMBt3wQxs1mV2YA2MEy0H6KrEa4=;
        b=3AfYfrhitJKIlJbZ8l45YhKET40/f3LFpVj+fN6D4SsJPDW/5WkWeV2PfTli7Igg9Q
         I+EpYuv0i1TPJnwUSe9mkjsDs6IKI+oj7jR9+MZwLB6xAHzVE0fjkf3LLweNkDP5dCbx
         IyU8Q/SNx3aFGYIuF/wqXWnWL2yjQFNaWsJmfO320QRBEQam1yXWLFEC459J8un9TqyW
         Bf5wQ1Qrav464Ks4lIZhk77CaR8E7xwTNmUAXTKmf9wD4ujOpfqp1H4cZykfBLa7hZoK
         fI2avb2MfFBhoDoW+JKJY3Wv+yyFeXK4s4qgJrJyfiw9pQY9Y2UC/LpbkMgwpRSdSMT4
         FsxQ==
X-Gm-Message-State: AOAM530hAVoCYyHcvH12RM7WsgJOykP7sDqj6/Dud80nsZUBB457WplU
        9ioWtHh+w53LHrTT2Ouu0g8GGQ==
X-Google-Smtp-Source: ABdhPJzd89enCk6VoI47naeAR6OkRQL5XmJ0KABR2EGaW+DwnKnSpXmAIFglSzBNiUEw2ulcYYPRng==
X-Received: by 2002:a05:6402:2553:b0:42a:ef31:4444 with SMTP id l19-20020a056402255300b0042aef314444mr21971360edb.46.1654447040879;
        Sun, 05 Jun 2022 09:37:20 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w3-20020a1709064a0300b006ff0b457cdasm5346770eju.53.2022.06.05.09.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 09:37:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 4/4] dt-bindings: mmc: samsung,exynos-dw-mshc: document Exynos5420 SMU
Date:   Sun,  5 Jun 2022 18:37:10 +0200
Message-Id: <20220605163710.144210-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605163710.144210-1-krzysztof.kozlowski@linaro.org>
References: <20220605163710.144210-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the compatible for Samsung Exynos5420 SoC Synopsys Designware
MSHC with SMU, already used in DTS and driver.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index 80c557e938a2..fdaa18481aa0 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -19,6 +19,7 @@ properties:
       - samsung,exynos4412-dw-mshc
       - samsung,exynos5250-dw-mshc
       - samsung,exynos5420-dw-mshc
+      - samsung,exynos5420-dw-mshc-smu
       - samsung,exynos7-dw-mshc
       - samsung,exynos7-dw-mshc-smu
       - axis,artpec8-dw-mshc
-- 
2.34.1

