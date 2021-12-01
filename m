Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7979CC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Dec 2021 19:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352608AbhLATIY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Dec 2021 14:08:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352412AbhLATIW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 14:08:22 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89BA1C061756
        for <linux-samsung-soc@vger.kernel.org>; Wed,  1 Dec 2021 11:05:01 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id r26so65448342lfn.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Dec 2021 11:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B59ufmsrpetzrryOxTGflLKDbB0Sxf7ZYCipjPGD1eM=;
        b=l4PxZ0qxUWAdi1BGpU14w3Y1eKPueJzM61nR71M4hvCyBWp5qyggMByjbBnYeVUmIm
         4P2xc8pMOpk3HuxA/FmTj5jLjqIefz2zM/xuC6bTUHC1Kfk2WCMMQGyUX7Apj0536mvs
         BgND9HlDNvs+HS+iIGx1W7SaoqlxODocr5710jmXCFj8OgO/s/HPdimWyOFQyRIsCY9b
         VXksr3gwPiwVb2kTrzwXwLKASl9mmeYtEMKPE4IlbOjV1oc7YjwyIzRE7IM1aNp37kJU
         hEvZReTpTuzNrr7d4gCd9puiaAA6WyjlR7JV/YH5+5dHzGcQqnI/j11IEPXExPRJztvI
         mgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B59ufmsrpetzrryOxTGflLKDbB0Sxf7ZYCipjPGD1eM=;
        b=v+/QTaMzrTdCWBjmjA2mG7nQgIPgP/3Ryqcw2DdjEZuhTIThYxEjzKPvjIoQwuoJ/g
         C3SBMj+kBhl6RYLuog50fA3bA2hrkMkKcPfKMboVkeBW65nVtLwQnGuoM95dLo0WwuWf
         KyHVmSzCfiJ+FLvWgoP+GuWvhM/QvjOTEqfZRyu2dUNF/lx5S9stal6eKk0LsRbr8BRu
         ZK7fe+3+GCeB64OMPMaqQS+zlOmLxM1SU1YarkR/8jt3TxrHGTZQYblB+k3y1YpRD3tK
         1vWoNPOojSbDdpFwzVPFEABpDFMOkf3b1xbDFE4/g5rMQCCXJCm48rBRmTWCAY5smDdL
         KsFQ==
X-Gm-Message-State: AOAM5317Ad2+zFbdiSPDaqiCvyV4qKJvJ3xggjHB+JCKu9VHDWFcs57t
        vrAiAlGVMOJZPXLEAt2A/YYuVw==
X-Google-Smtp-Source: ABdhPJwYmOC/AgyAZDvE8TeHFpvtm2tQg4UjMnVF8iz8/nBgV2qS64s67Aopur9Vk6oPMQgYw2YZ1g==
X-Received: by 2002:a05:6512:3988:: with SMTP id j8mr7597661lfu.599.1638385499863;
        Wed, 01 Dec 2021 11:04:59 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id v185sm72425lfa.54.2021.12.01.11.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Dec 2021 11:04:59 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: i2c: exynos5: Add exynosautov9-hsi2c compatible
Date:   Wed,  1 Dec 2021 21:04:51 +0200
Message-Id: <20211201190455.31646-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211201190455.31646-1-semen.protsenko@linaro.org>
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Jaewon Kim <jaewon02.kim@samsung.com>

This patch adds new "samsung,exynosautov9-hsi2c" compatible.
It is for i2c compatible with HSI2C available on Exynos SoC with USI.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
index 53df1571eff1..db20e703dea0 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
@@ -13,6 +13,11 @@ description: |
   The Samsung's High Speed I2C controller is used to interface with I2C devices
   at various speeds ranging from 100kHz to 3.4MHz.
 
+  In case the HSI2C controller is encapsulated within USI block (it's the case
+  e.g. for Exynos850 and Exynos Auto V9 SoCs), it might be also necessary to
+  define USI node in device tree file, choosing "i2c" configuration. Please see
+  Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml for details.
+
 allOf:
   - $ref: /schemas/i2c/i2c-controller.yaml#
 
@@ -23,6 +28,7 @@ properties:
           - "samsung,exynos5250-hsi2c"    # Exynos5250 and Exynos5420
           - "samsung,exynos5260-hsi2c"    # Exynos5260
           - "samsung,exynos7-hsi2c"       # Exynos7
+          - "samsung,exynosautov9-hsi2c"  # ExynosAutoV9
       - const: "samsung,exynos5-hsi2c"    # Exynos5250 and Exynos5420
         deprecated: true
 
-- 
2.30.2

