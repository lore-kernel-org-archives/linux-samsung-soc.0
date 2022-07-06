Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA63CCA480
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 09:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbiGFJuu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231917AbiGFJus (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 05:50:48 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B938A2409A
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 02:50:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bf9so1757738lfb.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 02:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3JVFL+FX8zzwyBdLEyCZjlDRvezlHHKQHh3EPD34/eI=;
        b=NwzWlnsKnKAb2Kr9ddCPEr7AwIJE4WZzsuKOAGrvPhMbrt1p1PHnauAncvRFKLTjuT
         D6O9pXKJLa3R0snaxpBufrBvmGVDWXlWyYSvdtuXrXZuKHfE2Rec3w4SFwqn6m2C98fX
         LamALdCNb7L+gsVVlcEwXVkjet7H1pRAI05XAMvhXoCbPC5LYuMl0ocf+xNyysu7Psp8
         734k2vhhQ37/OW3K3fTAzWVDI1BgZuJEdTaMRoy2RAxfVUzjOqW7Se0vnJon52WcKkLa
         CsWmkQc6enkyrowiza5mrhPQLnmZBMF64aZVCIoV8LyBXoDuNf6YaZ9hEfJY5qkjztcb
         //2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3JVFL+FX8zzwyBdLEyCZjlDRvezlHHKQHh3EPD34/eI=;
        b=TKJmNlgdMHGs6g8WayCQvwD1HwTJN7PSzsjOoLtwMSwbDqLNXDwaLwma3wDb4dhQ6i
         jwulGPPaN+6NhCgNenJav46SgM3HoFRneTTXjSa7vXeG1KJ0xH9+JC4nPYxrUR6uWcAP
         IG4dvUvDn38Bo41WCq7NV2RBXWkWvrSL9OI84IhCLGejqsaotst/fdQ27RaKGuVaVWuH
         YdV3dV9fFXw3V+cObtjyJvC06Fkjl/LqlkI1naOwqXUR5NYEooQcdsiPmS4ikR6FEnRZ
         TV1ri3TIm3q7/xopj56mN8Z/R41AoqilIbFLmJnjDR+ETFFkb0Tdw/PrrLguF3hnlZ67
         WB0Q==
X-Gm-Message-State: AJIora/O9GB/FDXcv60Ksr64OtbqmYDvArjgECGTLwA9EwVb1bFOl9Fs
        +bkVdMlED3q2NEeqPGB76i5WJQ==
X-Google-Smtp-Source: AGRyM1sTQ/4lcDWBPJz8KoMiiukE3L8YDQACbL8ExtItnGIqHuvZLMnfDRyGH6T4bfzr++kwuEu2oA==
X-Received: by 2002:ac2:4890:0:b0:484:dfa:858e with SMTP id x16-20020ac24890000000b004840dfa858emr4635959lfc.322.1657101042934;
        Wed, 06 Jul 2022 02:50:42 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id bp23-20020a056512159700b00478f1e04655sm6202957lfb.14.2022.07.06.02.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:50:42 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] dt-bindings: soc: samsung: exynos-pmu: add reboot-mode
Date:   Wed,  6 Jul 2022 11:50:37 +0200
Message-Id: <20220706095037.78542-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706095037.78542-1-krzysztof.kozlowski@linaro.org>
References: <20220706095037.78542-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

ExynosAutov9 gained a reboot-mode node, so document the property to fix
warning:

  exynosautov9-sadk.dtb: system-controller@10460000: 'reboot-mode' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 1835ca08416d..13bb8dfcefe6 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -74,6 +74,12 @@ properties:
       Must be identical to the that of the parent interrupt controller.
     const: 3
 
+  reboot-mode:
+    $ref: /schemas/power/reset/syscon-reboot-mode.yaml
+    type: object
+    description:
+      Reboot mode to alter bootloader behavior for the next boot
+
   syscon-poweroff:
     $ref: /schemas/power/reset/syscon-poweroff.yaml#
     type: object
-- 
2.34.1

