Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370D2C678D5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:38:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230129AbjCHXia (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:38:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbjCHXi1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:38:27 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BAF58493
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:38:25 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-176d93cd0daso562462fac.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678318705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJnVP86v80cE19P+pF4Y6ZPg1z52ptg2NHYCv/S3Tvs=;
        b=BuQWA5ZBBgtF0cM2MPdV6GoZdjhlbq7bInCPFh7dUmCH8qXz21Any7rCTd4RtTnZrZ
         +/FSoZ+ADeQEBPdIiiDNC5z3WszOLoATv05XbvlMg6YZHC87w/j5dSjE31s/WY7jFnNV
         UOGDkhxTHOJBlNec4dDO5kqngzyV18cq78OvekxCsdJFzpadxWgoW10QmTjmvJ6QtY3w
         yIfsWQXzihe60eNVRnU70ImysdTbjtGlihxLAuuZ58CSITGoDG0LUNEeqCA1+WMss9Ot
         cSMj3v6I3nkvco9lI3uYaPpUORJz7KHvjTCcwRXQ+BfO6SpDaS5rqPWerNCxG2aayIWy
         wJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uJnVP86v80cE19P+pF4Y6ZPg1z52ptg2NHYCv/S3Tvs=;
        b=Ohp85V2cloG9Dw4rHWGmXNtvwXqA1iIij10GUT7ChJ2DfCrRoJsxU+bKdiUPp4sfAZ
         6BFboEpwbWytXujyq81l/AMvMXl3cXVIF4ycH9evHfkHMaR5T6O22UqqHK6hnHGD+p1Q
         6daYVZlLRn1YGepkNV7kvsHuWgozr2slWb0t/mxL/s6/nudbaAPW2mAqMAeHYkeBpZv1
         5IVrc72dzHsDPGu9DxXznIj002vZ6AjHuji3ziJjJFj3vi5yBrlYsMkDLspzvPrUXEXd
         WcbmVL+CVpbyJKlwtPjfP9qEw5gdFTDMQEQNBGbraLzDVrwZq4MmIhnpnm5ZxNwEg+iZ
         KDEA==
X-Gm-Message-State: AO0yUKW0tPcjolkTgiCuUCZGoowiK2X0UiTRSsSttPiN79BMATTlGfP0
        SVwm+VwkJlxUFGUvy9hm6dK8oQ==
X-Google-Smtp-Source: AK7set9ZbuWP9DuATT4yEuGAADPyzGBQZ4BihOLgSjpwiz9NxVFYJNvWYIGSR4vMf1RR4+WAwozzYg==
X-Received: by 2002:a05:6871:708:b0:176:2486:16fb with SMTP id f8-20020a056871070800b00176248616fbmr14787743oap.7.1678318705262;
        Wed, 08 Mar 2023 15:38:25 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id dy39-20020a056870c7a700b001763897690csm6807207oab.1.2023.03.08.15.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:38:24 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: clock: exynos850: Add power-domains property
Date:   Wed,  8 Mar 2023 17:38:16 -0600
Message-Id: <20230308233822.31180-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308233822.31180-1-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document power-domains property in Exynos850 clock controller.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../devicetree/bindings/clock/samsung,exynos850-clock.yaml     | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 8aa87b8c1b33..cc1e9173b272 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -54,6 +54,9 @@ properties:
   "#clock-cells":
     const: 1
 
+  power-domains:
+    maxItems: 1
+
   reg:
     maxItems: 1
 
-- 
2.39.2

