Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202A1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 09:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiGFJus (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:50:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiGFJuq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 05:50:46 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C8C237E2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 02:50:42 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id r9so17757850ljp.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71Kna/9czd4EohADHArXF2GliG2yv9ElmmPlGMx3dPc=;
        b=rqA4uSFtaeSRfqVbXx1KgUGC97AurnQ9NQj27U9JVpTftmqd4IP393pfdEuh+YIg59
         3cNfvCI0I1w7YTWwCva6tdOf7ecccDPM8j/kQI45Db5EkC0FhcG0uVZ7rf+WTxKQcbp3
         UcLRjueW2Bo2VEXYTv4SXIzIod3oiSPH44Zfc35t0PNa1P7R+xrTNk75P9BOU1A3QixA
         JJwjNcUZBnFckGOr1mogDVBP96uEvGTqo/V2Su9K83RTookcf/hIIPBo31CdWvpwUB15
         SiYkcfSOVrVMoyTCDlGLwYET7U1J1HQjRSGvqfbEial42CihZ/FubawppcQgXJmkPB8E
         BRzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=71Kna/9czd4EohADHArXF2GliG2yv9ElmmPlGMx3dPc=;
        b=p2QZQe8Ay837T70nsyfDArB7XOmH8uT74fYrkAT1/dUhUcf+UJI5e+CF3JiLGzVHUD
         MBEeOQShS0f/PpZX1hms7BlDvvhCYltaAw7DzlSrqTo4wdkFFlsxOEKSszKN463oIqvX
         YIrA9ZcWVUhGTiZbcaFMO4vq9/hUbHQtj60QZIBgAK6hlMigGGPTSPvmcbTUN+L8wvfh
         LjGVO0ku9VArSVsTGoxLls7aLO1YAu66+9Z58fG3bxewfrA0JfI1UTPD1cYPUI5sk+ML
         9i3rNAWTDAcSCLwcA1YjK1VbjnUI00yPY491yVsyIS98xIQXw83ahNKdvDphjUhY6uux
         7z2Q==
X-Gm-Message-State: AJIora9Xfi1DWxSKsBSZ3kdRS9b7IxUgv/+O0OdcCxsyt1ewWKo/yVIC
        vAVxYVB7ZrgfjOmOZMV/cdkjHg==
X-Google-Smtp-Source: AGRyM1vzGHD4GprYtW+scuWgo8KTLw+GYTqKz2ZFm84RG1G9aOrnqWXawhGN4REDH4zBQsz0END9dA==
X-Received: by 2002:a2e:8449:0:b0:25d:1a37:ead2 with SMTP id u9-20020a2e8449000000b0025d1a37ead2mr10645814ljh.509.1657101040746;
        Wed, 06 Jul 2022 02:50:40 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id bp23-20020a056512159700b00478f1e04655sm6202957lfb.14.2022.07.06.02.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:50:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: soc: samsung: exynos-pmu: cleanup assigned clocks
Date:   Wed,  6 Jul 2022 11:50:35 +0200
Message-Id: <20220706095037.78542-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

"assigned-clocks" are not needed in the schema as they come from DT
schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index c30a6437030d..a5d489acfdca 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -49,9 +49,6 @@ properties:
   reg:
     maxItems: 1
 
-  assigned-clock-parents: true
-  assigned-clocks: true
-
   '#clock-cells':
     const: 1
 
-- 
2.34.1

