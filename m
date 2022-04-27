Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8750AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 27 Apr 2022 15:59:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241083AbiD0QCe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 27 Apr 2022 12:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241012AbiD0QCX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 12:02:23 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9BB14D9C3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:59 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id i19so4279060eja.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Apr 2022 08:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IksiNhcQ6mciop9yOBJfsgBTzjVfi6pE2+JXa5kV6jQ=;
        b=beD8ORtMzxP6rFpwCfmFTFN1r6Yb1KIRS/9H+HxtQMyp3BfaB5MUx/4CsZPnAA/dZ8
         ZxnXELdl/VWcT4X2ygao3zP1cHUfTTEanMUQbRn7qDU2Zqcg1CC+2I4xwL6FM5IS6ZeL
         vUnbb2Ahx4bllPivcg2dXne3HFQCtFutDAoCbUCx1aMdkaOKqPbmlcvdFh4ZEQLRMiKQ
         WxDLBf4qLZDmpf0EVOFJ6VpzXQrbznf+lAj0GJSo/ysQiEBzUR1cmB2mXRQ/CAfUds7c
         Kq607GEACCNcao8/Z2lZuH4R5aJEZH+GELyfXfqhS+I79k9h3iCmszY8DtWmvD6MceYQ
         rUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IksiNhcQ6mciop9yOBJfsgBTzjVfi6pE2+JXa5kV6jQ=;
        b=rENrJNf6O/dzM/sL/PGJB6WI+aJAsoyWJLrkaC7Tcg1JgxHvihRpxOkeS2sXMhCwnv
         rZ9kkyxA40tBL8L8IUZHJMoKaj4Dbtx7X8Tt7wCZpWxNrfETUB58POOmk41zBUHV9+0d
         El7bUkgMaHFtfmcCdpUlgKdabwurgQ+j+npDjll+0ec9QyHLwPFwjIRW60G4gSYHFnGb
         pZTysRPhl8X3E9nSY4AUEO9D0IF+uFaryBNVBtsVoBgMFOk/KBiEKlIhjT66J8wabkge
         o8Glr4azlPP535eG7oGl5uh2h8VPKZSz6JSkxwrcTEjKXWWHOWfpSFYowgozpo6Ffx+r
         GxCw==
X-Gm-Message-State: AOAM530d5HLtNUxVfu2q1WIeewthImrhznGuBTapmCCZB3roG3GB5w/D
        asUMkxO0CQwEbQgGXffoyAT+9w==
X-Google-Smtp-Source: ABdhPJytNvI2RmQmaTFyUReVtLPKo6iYa/E2OYQyQive6MOG9yr+D0tvn9hqoKO/QQWI7KDnvCSYJQ==
X-Received: by 2002:a17:907:6d9b:b0:6f3:9a8d:6a08 with SMTP id sb27-20020a1709076d9b00b006f39a8d6a08mr14580252ejc.87.1651075134261;
        Wed, 27 Apr 2022 08:58:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l20-20020a1709062a9400b006ce71a88bf5sm6931993eje.183.2022.04.27.08.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 08:58:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH 06/10] dt-bindings: mfd: samsung,exynos5433-lpass: fix 'dma-channels/requests' properties
Date:   Wed, 27 Apr 2022 17:58:36 +0200
Message-Id: <20220427155840.596535-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220427155840.596535-1-krzysztof.kozlowski@linaro.org>
References: <20220427155840.596535-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

pl330 DMA controller bindings documented 'dma-channels' and
'dma-requests' properties (without leading hash sign), so fix the DTS to
match the bindings.

Reported-by: Rob Herring <robh@kernel.org>
Fixes: e18183cefc8b ("mfd: Add DT bindings documentation for Samsung Exynos LPASS")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
index f7bb67d10eff..b97b06848729 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
@@ -79,8 +79,8 @@ examples:
             clocks = <&cmu_aud CLK_ACLK_DMAC>;
             clock-names = "apb_pclk";
             #dma-cells = <1>;
-            #dma-channels = <8>;
-            #dma-requests = <32>;
+            dma-channels = <8>;
+            dma-requests = <32>;
             power-domains = <&pd_aud>;
         };
 
-- 
2.32.0

