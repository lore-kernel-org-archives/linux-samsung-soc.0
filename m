Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46284EE49A8
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Aug 2023 03:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244645AbjHSDR4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 18 Aug 2023 23:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244663AbjHSDRg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Aug 2023 23:17:36 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2008C421D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 20:17:34 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-6bcb5df95c5so1261313a34.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Aug 2023 20:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692415053; x=1693019853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=terWZwySlnATmuJMOqlx8HX9SM+9JePulFK7w3bJmCk=;
        b=uzjnUdmBIA+M9L8UZ815q/Hme4Tyj4IIPDcJIxvfc9JIAjGh2xQs/+apf6waiQbTQf
         1GGjkprqSGhXZwyF7wf2UuyUJj/c/3Pp/XUeEx+LvJTK1ymI28NmKaZynCuJCLOMVXyj
         2T/PAHrzx/dhxdOsU0YhoalSUHh4ItTqRdNp4YvyiP335Sn7vEfQMrdJkTc3eDF6lwyy
         MmIlgjNxgD68asVA9VDblH5IJeuEkqjQyp6504HV0GB2svmgH34FxP0CTqL5+2VCGV0t
         wLlqfyHQF6ycsrg44Pgw2srVBbEdbOFlyHu/KV0eJgksLhpMKmkfkg8hHkxng5yKV03+
         Fw8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692415053; x=1693019853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=terWZwySlnATmuJMOqlx8HX9SM+9JePulFK7w3bJmCk=;
        b=SxfCRMVYEYeiJ/f9/GVAUORgOckMl9mxnw9ZiFCPUk4ZS0jBCAPmIxPfg3DnFn4ad/
         1M4DEaazeYon//XEY0zQyEAGag5F1ER28aWphdtikxqmtbGaDAZIk4x1ubk50wImu4aY
         DXZLGorZiIGWUAQs5BXRpglVUHjjHyBcY0K+FQ2J5CN9E5yKfS4Y3stn7AJkP4VcZWm5
         bbus4TvoErVQ29MtkCjViD1irpLNowFqdhhGS+fpYHX3w7AXxclVy2H658dxSmAWDY/8
         sRQwYDAZ3TRWvsdtNE3IP+HQlxCXdh9Za1STiwki5SXCHHQJY4G1/uI2yp8ajdmXwpeU
         +X2w==
X-Gm-Message-State: AOJu0Yzma0Yw+eFhX0vosz2EatKLfzG4xpI73mK/W+e5ZBDwg0twniJ/
        AyAc+j5BkjSrTqr3UXr0WJsjwg==
X-Google-Smtp-Source: AGHT+IE9p0fUrSh0BRemD6/2a57NfR3EO4r8wsYb4VaF67YNneCxT3TlxARU9Tja4q4pBzykKbc+LA==
X-Received: by 2002:a9d:4d8e:0:b0:6bc:f85e:ab0 with SMTP id u14-20020a9d4d8e000000b006bcf85e0ab0mr1464160otk.3.1692415053415;
        Fri, 18 Aug 2023 20:17:33 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id a1-20020a056830100100b006b922956cecsm1447686otp.25.2023.08.18.20.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Aug 2023 20:17:32 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     JaeHun Jung <jh0801.jung@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/8] dt-bindings: usb: samsung,exynos-dwc3: Add Exynos850 support
Date:   Fri, 18 Aug 2023 22:17:24 -0500
Message-Id: <20230819031731.22618-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230819031731.22618-1-semen.protsenko@linaro.org>
References: <20230819031731.22618-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos850 has dwc3 compatible USB controller, so it can reuse existing
dwc3 glue layer. Document a new compatible for Exynos850 and its clocks.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../bindings/usb/samsung,exynos-dwc3.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 42ceaf13cd5d..fc9a425be5fe 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -15,6 +15,7 @@ properties:
       - samsung,exynos5250-dwusb3
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
+      - samsung,exynos850-dwusb3
 
   '#address-cells':
     const: 1
@@ -101,6 +102,21 @@ allOf:
             - const: usbdrd30_susp_clk
             - const: usbdrd30_axius_clk
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos850-dwusb3
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: bus_early
+            - const: ref
+
 additionalProperties: false
 
 examples:
-- 
2.39.2

