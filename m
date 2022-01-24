Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33778C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Jan 2022 08:24:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242187AbiAXIYC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Jan 2022 03:24:02 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:42880
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242170AbiAXIX7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 03:23:59 -0500
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C56EE3F1B4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jan 2022 08:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643012637;
        bh=E9f604EUNMRc1K0x625ft9mXrJ60309YtLmhBOy5gsM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=v+DBhu3sktcFphvHKKSRsuAILy5dcdiMVQTYsr4JIvBnVUx6mDnP9hHzeCDfqeZBV
         8doIQx0Y7mW1CyYD4vP/cG9DRqinrfZfCQUOoH42jqi0HRcGGS5dCcTkx6644Pbehk
         fjiTdeTVDQNdbk/BaAeC0lQUUCfVAkxlXD/ALH6tTjbsaVZ/2qxW76DNCmI0WK+urk
         VQE15zdR5tP3YE8i112ORxZ+mx7EH+uiiKWJxXNqH+0UhHvcof6SwjdAVEMmoTqbSE
         Wdqq71DIItIx45aDddCTdTo7HmeZ3zwrFstmnkSsAoGkoNBRzpW7PSxwzhU7fh599H
         mMnVBk04SVPjg==
Received: by mail-wr1-f71.google.com with SMTP id w7-20020adfbac7000000b001d6f75e4faeso1547976wrg.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jan 2022 00:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E9f604EUNMRc1K0x625ft9mXrJ60309YtLmhBOy5gsM=;
        b=fKMOIlbMxgNSE0MsobQJ99KAFOJ3noVoTXeuruOX/zizWR+Z/UBxcimzc97SpCf8iZ
         r+M5sI1AubrLx6DRnbTnYEGP5SqLOLy1duMvUt/S9hQ7+nySvxBMSOug5I9C0vfXhpMS
         GRs/djy8bo4G0vq0zh+fkIWnKQiy+LsXh7m43Ii5HLoLxiqquzl0jw1xYNIPCiXPyYsc
         n974NVlRxn7IQOXFCOln6a/su3b/lG4G1YKzW4a7Hg2gjDxTqAxlzOdFlUdjgAK6NmBI
         HyEsY92GbyYmujjQ8Yd54/RLWEwjzzSB9ZGLXF9ylaPiivUihENaOPs5wJCPUCEv07C+
         c9qQ==
X-Gm-Message-State: AOAM532TfbFHUsul07/3d8dlDEVJc4OQifPZ6jCLflhZqNyUr5PckEN6
        6S+0LDLGK3Pwuspi6cXIZsaOxnf7RGL1pXfUhYODNP4T1X9kIxco6hIJFagcQs+oDGeEwLSOhzA
        PIkV72rhhIFNg+z357k5V1nn5ZjxYTKhjzBmA0+VoWvdhs1um
X-Received: by 2002:a5d:4803:: with SMTP id l3mr9501287wrq.339.1643012635036;
        Mon, 24 Jan 2022 00:23:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpvjCvKyZkS3eDZZP0ZWE7Zg9akUafDchzT87csJ7JBjny0Ukmeg3wKlAmCj1K+MrEAi1FMw==
X-Received: by 2002:a5d:4803:: with SMTP id l3mr9501274wrq.339.1643012634897;
        Mon, 24 Jan 2022 00:23:54 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m64sm7148550wmm.31.2022.01.24.00.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 00:23:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v6 2/4] mfd: dt-bindings: google,cros-ec: reference Samsung SPI bindings
Date:   Mon, 24 Jan 2022 09:23:45 +0100
Message-Id: <20220124082347.32747-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
References: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The ChromeOS Embedded Controller appears on boards with Samsung Exynos
SoC, where Exynos SPI bindings expect controller-data node.  Reference
SPI peripheral bindings which include now Samsung SPI peripheral parts.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/mfd/google,cros-ec.yaml          | 29 ++++++++++---------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index d1f53bd449f7..525ab18005b3 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -31,7 +31,7 @@ properties:
 
   controller-data:
     description:
-      SPI controller data, see bindings/spi/spi-samsung.txt
+      SPI controller data, see bindings/spi/samsung,spi-peripheral-props.yaml
     type: object
 
   google,cros-ec-spi-pre-delay:
@@ -148,18 +148,21 @@ patternProperties:
 required:
   - compatible
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - google,cros-ec-i2c
-          - google,cros-ec-rpmsg
-then:
-  properties:
-    google,cros-ec-spi-pre-delay: false
-    google,cros-ec-spi-msg-delay: false
-    spi-max-frequency: false
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,cros-ec-i2c
+              - google,cros-ec-rpmsg
+    then:
+      properties:
+        google,cros-ec-spi-pre-delay: false
+        google,cros-ec-spi-msg-delay: false
+        spi-max-frequency: false
+    else:
+      $ref: /schemas/spi/spi-peripheral-props.yaml
 
 additionalProperties: false
 
-- 
2.32.0

