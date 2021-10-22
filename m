Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 374BFC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 22:46:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A02161039
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 22:46:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhJVWsT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Oct 2021 18:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbhJVWsR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 18:48:17 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB8CEC061766
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 15:45:59 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id p16so45243lfa.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 15:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bm1KHOnXO9Nvs/x1NBP6TsM2Dt9DXyHWBfDOZJg27a8=;
        b=EtCKFiatwuzA4uM+E8PWtwbbAe8XzQ7UUvuAMd8cRA8gKX4PEY/yqts7H6YG7/CMLM
         a/wNQytvXMKCr3maJK5FIRa31QxjMM8iA5ywrCoMBLH9Jql9MR1sDkCUUBtS15bBFVTz
         Tik5sNTQW1jbgyPq7wLbDyz21Bm3qgQmhPnOfhgIBwCGXT5vqsDTnCEuObZXvNCxaKI2
         3whQfZotJTMYyoXnHeYrq4a4wY27kJO99HoCgE6XBori3Dovuo+ufpEG6Pgbl42ce2ar
         wRVIKqlyderP80WeRrnGsPmnpsw7fdZoWXUlcvX1NvMLHAiuMkf30s8/jC02vQ3C+/qO
         KWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Bm1KHOnXO9Nvs/x1NBP6TsM2Dt9DXyHWBfDOZJg27a8=;
        b=LGTiXyCXvL19Krjd5JlV2Y9KNR8E1Umraax/wHCsR4KlYM2G4QCWZUwOv4MfcTG+Mz
         6OAs0qKDkp1JJxlBljhsdWfkPepeT5Y2f8zbSa7BNqcXeUGhFzpMAhNmqysjZkgYIk9O
         hpSgVNIMKJ9qQAcTN9W2JwwBeFS+4IZVNKyAElUX+MEOIbn04UmR27poS/Kynk6q2I1d
         wLb/iIwf48HwfZ/KSbzPwKIw1hN3+875hKkT/RKzLfPH2bFTtS2yzjWyOrqkqLTla4vC
         IrimmcrwvEhO8ZXYbTmns4thGAoKG0GT6ZO5BUmFbIkvzCzgJx7nJtd9xqVrDyJasQ7V
         kf2w==
X-Gm-Message-State: AOAM532QIfTr0kBMWOj1NBhgBJc+vT+pgypv6Fu6N2+MhxijpDvL+SPL
        RvLR2oM2j+hJXWbwLRTPg3dXIg==
X-Google-Smtp-Source: ABdhPJykSinQrW5tYMCkfcTqTWeVNXJPpKFxklqqD0dxJjpM+ZDacTlJnAzr/PdIr/kg70ibBzjdKg==
X-Received: by 2002:ac2:4426:: with SMTP id w6mr1158404lfl.90.1634942758007;
        Fri, 22 Oct 2021 15:45:58 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id b39sm923707lfv.200.2021.10.22.15.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 15:45:57 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: clock: samsung: Document Exynos850 CMU_APM
Date:   Sat, 23 Oct 2021 01:45:55 +0300
Message-Id: <20211022224556.18742-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_APM generates clocks for APM IP-core (Active Power Management). In
particular it generates RTC clocks, which are needed to enable rtc-s3c
driver on Exynos850 SoC.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
Changes in v2:
  - Added R-b tag by Krzysztof Kozlowski
  - Added Ack by Chanwoo Choi

 .../clock/samsung,exynos850-clock.yaml        | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
index 7f8c91a29b91..5618cfa62f80 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
@@ -32,6 +32,7 @@ properties:
   compatible:
     enum:
       - samsung,exynos850-cmu-top
+      - samsung,exynos850-cmu-apm
       - samsung,exynos850-cmu-core
       - samsung,exynos850-cmu-dpu
       - samsung,exynos850-cmu-hsi
@@ -68,6 +69,24 @@ allOf:
           items:
             - const: oscclk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-cmu-apm
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: External reference clock (26 MHz)
+            - description: CMU_APM bus clock (from CMU_TOP)
+
+        clock-names:
+          items:
+            - const: oscclk
+            - const: dout_clkcmu_apm_bus
+
   - if:
       properties:
         compatible:
-- 
2.30.2

