Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB206C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 27 Jan 2023 19:42:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbjA0Tmv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 27 Jan 2023 14:42:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbjA0Tmt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 14:42:49 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50E1B761C0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 11:42:14 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id m14so5443410wrg.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jan 2023 11:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndc/iaR7jbpFClfbGd4ofgtC3FYEzqRlKdVRxlgp+PA=;
        b=gMwA6nngkfIZpPGhH4Lg/vrN9j2ELujkTuJqBUSU0s9NpnlZLPoQnnLWHJ+VMshPmf
         0ArZIdo133rszRVf0iJ2GO63/wyxGgraKhAkhxVfZ/Jt4p4yM8rodnooVDmEZLgrWw2m
         23R2CkmGjix/NtD0tDEvjzBwq/EDjm87xVWKfZElSSAhJjP/t/rsszjrU9B/+21CKGU4
         DOhc7gnw0m778fPEPCma2jSv0z4yRfhpBRchmtpriTsKcmpd90a5xrTIIRcBCmEH9fnQ
         fZEsDS/bvvYNstFae5exsHqllPmbfDrjUJnZUZpYarguFuMJ05V4vEeIk8xO7wyD4xjB
         hhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ndc/iaR7jbpFClfbGd4ofgtC3FYEzqRlKdVRxlgp+PA=;
        b=M5Ucfyhxn1IJ6faHAYi4IepOXXqbgwwwPv0jTQj57FlZF54pRUrlrZqIvKEK+Kq/mr
         unJd7c2Bhe+v4oqw6m5lrmPMHUiSzXMzIqAshL+I9PDaXV9wxWw4eyQKZk122g24iZ9L
         z+PAQqum+UfPtvDWNa5+xbfQXgRHupOJP9zkJcDdteGvyrwNkoXMFMqRYMJwIccvCsFY
         NqZ3qMFTheMlA2ynxFhLRbMCX4YcRQVfCRlf5gCd5XP5qi/7kfpK5FW2aS06/XlJO854
         59DRmQY1kMspodJ85WQrA6N2qG1oi5PDz5AKp3vt7WmjfR1ht/XhUdH7Uu2nUlV5Wxkr
         z/fg==
X-Gm-Message-State: AO0yUKWjCT2Jpx1WZ0cvQDTxWfiG/qAd+X+mqgzLSgYaXqhLiz0dq/Mj
        C7gQXX7JPmHfgAnxnHIIHZ/hPw==
X-Google-Smtp-Source: AK7set+pMclzg8jxiXChlpxrY5YQXujzRSx2mjUjSxo2KkccFdEEzPo3yaBlRtyHd8d+lw/pLZGQCg==
X-Received: by 2002:adf:a153:0:b0:2bf:b710:c0b with SMTP id r19-20020adfa153000000b002bfb7100c0bmr10540460wrr.1.1674848472491;
        Fri, 27 Jan 2023 11:41:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y17-20020adffa51000000b002238ea5750csm5822417wrr.72.2023.01.27.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 11:41:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/8] dt-bindings: phy: samsung,mipi-video-phy: deprecate syscon phandle
Date:   Fri, 27 Jan 2023 20:40:52 +0100
Message-Id: <20230127194057.186458-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
References: <20230127194057.186458-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The MIPI phy is actually part of the Power Management Unit system
controller, thus it should be its child, instead of sibling node with
syscon phandle.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/phy/samsung,mipi-video-phy.yaml          | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
index 415440aaad89..b2250e4a6b1b 100644
--- a/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,mipi-video-phy.yaml
@@ -35,15 +35,18 @@ properties:
 
   syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
     description:
       Phandle to PMU system controller interface, valid only for
-      samsung,s5pv210-mipi-video-phy and samsung,exynos5420-mipi-video-phy.
+      samsung,s5pv210-mipi-video-phy and samsung,exynos5420-mipi-video-phy (if
+      not a child of PMU).
 
   samsung,pmu-syscon:
     $ref: /schemas/types.yaml#/definitions/phandle
+    deprecated: true
     description:
       Phandle to PMU system controller interface, valid for
-      samsung,exynos5433-mipi-video-phy.
+      samsung,exynos5433-mipi-video-phy (if not a child of PMU).
 
   samsung,disp-sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle
@@ -81,13 +84,10 @@ allOf:
         samsung,disp-sysreg: false
         samsung,cam0-sysreg: false
         samsung,cam1-sysreg: false
-      required:
-        - syscon
     else:
       properties:
         syscon: false
       required:
-        - samsung,pmu-syscon
         - samsung,disp-sysreg
         - samsung,cam0-sysreg
         - samsung,cam1-sysreg
@@ -99,7 +99,6 @@ examples:
     phy {
         compatible = "samsung,exynos5433-mipi-video-phy";
         #phy-cells = <1>;
-        samsung,pmu-syscon = <&pmu_system_controller>;
         samsung,cam0-sysreg = <&syscon_cam0>;
         samsung,cam1-sysreg = <&syscon_cam1>;
         samsung,disp-sysreg = <&syscon_disp>;
-- 
2.34.1

