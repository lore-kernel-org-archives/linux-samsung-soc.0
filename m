Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C88C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 16 May 2022 14:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244401AbiEPOLw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 16 May 2022 10:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244489AbiEPOLv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 May 2022 10:11:51 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05D7120F4F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 May 2022 07:11:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id c24so16544698lfv.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 May 2022 07:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/pFhyZ7PlSKfX2hWY5gCxthekoCEZH2niVLMkmY+d0=;
        b=qD8VsVBt4UMCA5G5JENPpcOuQCAaOzdAneycAjMg6LOQpyS4sAHT54G6k2mvmnIbv2
         98ZRbpvEtB3simyFamItgL4TNTf2gC66bDXzAOVk3KfZx4B5KylFpRhyQOVdaccaASb6
         ukhlSb9fZ8j+Wgz/yNsIUyFXGuMUcdlvYCr0lFYE2dlugp0M7wSdfF7IgzpGbAzh6OvN
         schXFtDwJ4M122WVipx30WqBa4jFjkUshjkwu7ZfzRgyeZMBJmUNwKOVNzjTz9Qn4Jkv
         w8chTblgTAdDv4rljzbioSWAPaJn1tma3WPLrONkCe87raEFv7lQZpEnPEA2l+6RiJYp
         o5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V/pFhyZ7PlSKfX2hWY5gCxthekoCEZH2niVLMkmY+d0=;
        b=x2b+3reeGSxL8mlWZQb44mxxwHsdSeB5MIh1K2K2PGll67GRaK0LTUAFaii4/m9N3L
         utj+/yuelXIEtCMu31TU0ebcCvSbOJwnHg0TgYu9008gVwkRQOvyoDr/7mBdQfes1eMO
         HeSWpANtdeAoodFoUgS3my4vVcThZFJ+Xk5o1aclLOV1RCaLI1YaWLJ9qzQApxEABI6k
         oHvCmPb/vrbaNhfsU8SVnQtE0oR7W4gG9GaMlQ55jdHXwu5k5CmXMX29Dc9DDny4c2fl
         g1KYYsSIKH0C0SAy+pNt18gLkrS5l4fARJkR4oWLY276603P0WMW2KQovwIA2rxDEvDY
         L8IA==
X-Gm-Message-State: AOAM530UP7hLR0KRFPtb9eZDRmaNN0aUF1Bc+w28bSBIONWzWQbGFnZv
        B5ZNYaXPkd1QmbePuLhpYSwdjA==
X-Google-Smtp-Source: ABdhPJyMPsqvy8XDKgku0gZQwXhmnnZ5EpgXXspxlZSWVKx1viBGeZmSndZZ79xeXmlvrRfbouhPyQ==
X-Received: by 2002:a05:6512:33c8:b0:473:9d8f:a01b with SMTP id d8-20020a05651233c800b004739d8fa01bmr13369570lfg.619.1652710304272;
        Mon, 16 May 2022 07:11:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b5-20020ac247e5000000b0047255d2116bsm1315538lfp.154.2022.05.16.07.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 07:11:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2] dt-bindings: mfd: samsung,exynos5433-lpass: drop useless 'dma-channels/requests' properties
Date:   Mon, 16 May 2022 16:11:23 +0200
Message-Id: <20220516141123.4579-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The pl330 DMA controller provides number of DMA channels and requests
through its registers, so duplicating this information (with a chance of
mistakes) in DTS is pointless.  Additionally the DTS used always wrong
property names which causes DT schema check failures - the bindings
documented 'dma-channels' and 'dma-requests' properties without leading
hash sign.

Reported-by: Rob Herring <robh@kernel.org>
Fixes: e18183cefc8b ("mfd: Add DT bindings documentation for Samsung Exynos LPASS")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. v1 was ment to be applied but I cannot find it in MFD tree.
2. Drop the properties entirely as turned out during discussions.

v1: https://lore.kernel.org/all/YmpkE0FgEhPNneg+@google.com/
---
 .../devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml       | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
index f7bb67d10eff..69c15744c864 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.yaml
@@ -79,8 +79,6 @@ examples:
             clocks = <&cmu_aud CLK_ACLK_DMAC>;
             clock-names = "apb_pclk";
             #dma-cells = <1>;
-            #dma-channels = <8>;
-            #dma-requests = <32>;
             power-domains = <&pd_aud>;
         };
 
-- 
2.32.0

