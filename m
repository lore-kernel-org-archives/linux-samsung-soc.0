Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56465C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 14:43:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37A3E60FC4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 14:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhJ1Opo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Oct 2021 10:45:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbhJ1Opn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 10:45:43 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63597C061745
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 07:43:16 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id bq11so14074030lfb.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 07:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=148z8Jno5ibjrSfO3iE+zKfRZ+rTkFE53njyJOvaPpE=;
        b=FM3+GGUSfg6YDOe1Wo1KLij7xyUbtrOhNvp+MkkZNaMFKzpKBK1xHqInpLPyQ6Fu5+
         nCwUQODEkDLD+RMo4eYW6XVC8Dc2/aY+djYAUDLKaYKzxEtrl6Mw1M/BxJbOYOosRQuI
         RSYZ+qCyKm4drPnOA+LrKBrBRhmUYu2nTiyLbGw/RkRHpla6vhj53vxN2YiYG7yDyA/I
         K7t/VuQ4K3PPYlPOe2CsJEMnLVeK7lNZ7hfjBU0/vjlbCM8Lh783WXExHiU6NYakmIB7
         h+4q6/zc4jCQW8LJOAsVce89xiPiRSWf+m3scb67KgBxMyzKCPmXVKoPf/2k4kVeuF4B
         PCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=148z8Jno5ibjrSfO3iE+zKfRZ+rTkFE53njyJOvaPpE=;
        b=HDfqER4JXJcZ6MtCwDnjRvKP2U2+m5wh+NUnKZ2+dSdUWGKopBqmTHrtPSGBC7g2EA
         xVq7oGBdjQrzZJZGhZyqge6vdhG1Cpb04lvHeWArOfRvibjauyvzfbLc2v/PeWnyssFM
         4HxCEoEnd4XLW+coOS8y+i5QeclMtwBxLVYopoZXlymmK3MlTPKfhMfN3KJR2FJPAFrs
         7Mv8E76qGDSOfSoSSaXpomRug3ZMJ+Sm8YyB9iozcHkyuWVYmgUpaxKxAKdUs4xf7goH
         skA0YniIG6wscHQj3WwkSO/luug9fOshL8DJlZkvMbShxldTOKMul+aeTKHD7Jwq+PcQ
         RpzA==
X-Gm-Message-State: AOAM531/fA78q+rpumRCsg8Js6PE5DxAHuCMjq8UOITkMZz/S4XHWQo9
        Nv7AzBoCKIphp4Fo1PJAu1tHHA==
X-Google-Smtp-Source: ABdhPJwtVWJTLzQqQ6CF4sgcVaSbsL/TbZAhf+71RjlxI06EBTx9BcGPNlntpxY18ixgsSk2ylCj6A==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr4657354lfr.415.1635432194696;
        Thu, 28 Oct 2021 07:43:14 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id h31sm332844lfv.111.2021.10.28.07.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 07:43:14 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: samsung: pmu: Document Exynos850
Date:   Thu, 28 Oct 2021 17:43:12 +0300
Message-Id: <20211028144313.9444-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos850 SoC can reuse PMU driver functionality. Add corresponding
compatible string to PMU bindings documentation.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
index 17678d9686c1..0bbd89265b28 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.yaml
@@ -24,6 +24,7 @@ select:
           - samsung,exynos5420-pmu
           - samsung,exynos5433-pmu
           - samsung,exynos7-pmu
+          - samsung,exynos850-pmu
           - samsung-s5pv210-pmu
   required:
     - compatible
@@ -41,6 +42,7 @@ properties:
           - samsung,exynos5420-pmu
           - samsung,exynos5433-pmu
           - samsung,exynos7-pmu
+          - samsung,exynos850-pmu
           - samsung-s5pv210-pmu
       - const: syscon
 
-- 
2.30.2

