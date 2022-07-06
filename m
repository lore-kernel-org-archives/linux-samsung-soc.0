Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A65ECCA47F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 16:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbiGFQDI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 12:03:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbiGFQDF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 12:03:05 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E672314F
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 09:03:04 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id i17so14263330ljj.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0GgJ6BhZLjEyccD5dT1mFsO+Qymgb1Y77t6VsVmFiSk=;
        b=V/f9MEN4Bs+sOu6BnobaGtIISK4TiLchKwfg5lKq0wErktegWSgCxjirFEjKCfYmGk
         p9gvzsh7QZtIadYTUW47dxlUmgdF6PyXby7OHob04au8Bb+H1fh8D2kBbIRdVXtAPCrl
         wwJNo0S1jj5bpUreTRgOA8hyRIk+ydXQKZhGFUY21wbRMjvARL+qbqDl9ooH+o2TUiHD
         DR/IySn4alZxaxir1sR5Z742JKyLe6ibIxF5HgZ2Mqd9Bi/HHY4Yp0pKn8oDVLEEollE
         zD/skHxkTPBeRKqTbZDyiXQLYHtnsCtVwKZ+vNg0kSju3hcbtF5Fh7a+cLvp7nqM6rto
         I40w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0GgJ6BhZLjEyccD5dT1mFsO+Qymgb1Y77t6VsVmFiSk=;
        b=VutPbBjwvaSt0ycbr1PsZo8h8woKofrWTl4gMnRrW9W5S8mU48hC6tqp6PeK/zPJUy
         lzZNA8SHiJUqd2nnXj9/0VuZ49AE8mfJF28mKovYnnS3ZEBRpE1SCsqDFTmUvzQWBvx4
         Rf7/KA7l+2B04xYNfGiQlITX/KFGh3LTAZZ3nmnTpxhfqQKIEcqlPnGeae0JVrN0KHiq
         gCArijD/8g2RSfL6n6RECgxCxph0t7mFINn71O8iTNRCl0vb4AI7HtesffSy71w51vBY
         FS3R6EejqoqfoDkINHEtXgI6hMXhKZZD93nCZiR7S8jRJ/orM5JIDtprJorx3+8Q6Rvb
         fXWw==
X-Gm-Message-State: AJIora/MmCnv7QSQWKiYtrEVw970qcDEy7kMl3dlVEcjt6VKJP7ggVdZ
        IkLCBVpBkyJwsELJnPtkGxqqZEQJ43dFjSOG
X-Google-Smtp-Source: AGRyM1s9oBgMdHI5KXbYVoMLbyLx4rtrYfqgxsr6Iuh/0LEp8kXCDcrPz9APgp26dlJR7DFVvCr6jg==
X-Received: by 2002:a2e:a781:0:b0:25b:bf59:c6a1 with SMTP id c1-20020a2ea781000000b0025bbf59c6a1mr23949870ljf.218.1657123382863;
        Wed, 06 Jul 2022 09:03:02 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id w10-20020a2e9bca000000b0025a65ed7aa4sm6291292ljj.51.2022.07.06.09.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:03:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] dt-bindings: soc: samsung: exynos-pmu: add reboot-mode
Date:   Wed,  6 Jul 2022 18:02:57 +0200
Message-Id: <20220706160257.27579-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706160257.27579-1-krzysztof.kozlowski@linaro.org>
References: <20220706160257.27579-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

ExynosAutov9 gained a reboot-mode node, so document the property to fix
warning:

  exynosautov9-sadk.dtb: system-controller@10460000: 'reboot-mode' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

---

Changes since v1:
1. Add Rb tag
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

