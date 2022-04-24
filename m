Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DF5C43217
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 24 Apr 2022 15:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231880AbiDXPHC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 24 Apr 2022 11:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233053AbiDXPGk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 11:06:40 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4C21632EA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 08:03:39 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id p4so107431edx.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Apr 2022 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=imdpb9BcNvoBxz8VstNHOahw6NQzvSepwCUsQdb1ePw=;
        b=tvounvEF2ErW2m4F6PCn/HYtOr4SKC7Beq5VyBvzI7T3mLDE3Ta7w9MxfnvjyBwYDw
         ljbpr+i+i5wwZIcA3MwHc/PuSBGDz1ffE1lGSJhEegJAFYzC9DOT0x/IQYJb/4hfEjxI
         pQHqy9CKZnUeVOFrPQFqZD+s1RG8OZkuI9Twi/k1yAPfEjfDF4OC/WKKRSHrTj16IER7
         jItDnrqeRPHg/A0RtZfqbgSMNaZfRwNAc6LZaxYB9HVZbw+g5oi/GBnG9FI6RYfNoDK2
         OH/MgcYXPLMXdxYuxIcZEdVm4aEZVRegdExm4OLOs7etbOmCqsIBOu4BFuszSfJNiQAh
         ytzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=imdpb9BcNvoBxz8VstNHOahw6NQzvSepwCUsQdb1ePw=;
        b=3P8NRVbsJecaoNMs1EiLikIKGOneOwua2NdYXNDiKUPMV00M2lufk7ETI67i7qiC8L
         dqH+iTDXBxkKKYocV73DMIVlSFz5WEDMuH1qTP1kNTYDOcTivVz1DX7pv30TWLWppm6Z
         FxUdA3ht9j5jfhlLQcBkQnzu15pG1JjSkK3Yh+1ndVX0X3fcYKv15DDQ9YVdbBq/Bq7m
         Rs/N8bH2vKdtOpGz5brhE/PV4Cy1la2KKa9Kt8rVcXvD47GSF6jn43c2ErTsB9dABB2q
         1PKgzV7TH6UmKoRkqsIptz6lFc4dXaLssNDmNUOoBQRd8ay6Nrz/JQ/5ksd+8QnUzV9v
         Z45Q==
X-Gm-Message-State: AOAM530xqPCsrXF1Lif8j4EPsR29vJZeZBQQr1pmlJnR+cDJcEW6ZQOh
        Wh6fK7HEqoiuUC+z/hL4GMucLA==
X-Google-Smtp-Source: ABdhPJyDavVGTPq3xB1BL4WX5orcU209o/fZzkJ0GEvoCa636xAJdSaGT0IikwvFGtWzvVfTS9B44Q==
X-Received: by 2002:a05:6402:50c9:b0:423:e4b1:baac with SMTP id h9-20020a05640250c900b00423e4b1baacmr14728501edb.146.1650812618107;
        Sun, 24 Apr 2022 08:03:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y23-20020a170906071700b006e8a19cefa6sm2655165ejb.106.2022.04.24.08.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 08:03:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: timer: samsung,exynos4210-mct: drop unneeded minItems
Date:   Sun, 24 Apr 2022 17:03:32 +0200
Message-Id: <20220424150333.75172-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220424150333.75172-1-krzysztof.kozlowski@linaro.org>
References: <20220424150333.75172-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is no need to add minItems when it is equal to maxItems.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 1584944c7ac4..0e28d9bdb8cb 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -35,7 +35,6 @@ properties:
           - const: samsung,exynos4210-mct
 
   clocks:
-    minItems: 2
     maxItems: 2
 
   clock-names:
-- 
2.32.0

