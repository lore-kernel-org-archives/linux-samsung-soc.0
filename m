Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B033C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Feb 2022 19:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386185AbiBHTlb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Feb 2022 14:41:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353821AbiBHTlb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Feb 2022 14:41:31 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7619EC0612C3
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 11:41:30 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8611A3F199
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Feb 2022 19:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644349282;
        bh=IBoZSDY+vh3MSwNsW1pxD5jmNE6UjfMq9hfqIrcXwOQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=K8L1CWA6+gQrk0r2BPB6naeEEC/px6HGeoPbk7cT9kbJS0aSaj2URSSPphSner+Fb
         3wvHQxxCehPuZrpt9wnDXYama7HvoKVkwQOQtgTDr7defUeSnkOQSwK+DmptjJMomS
         4PomZ6ZSyK4K4B/I4JVo/m8jXu4We4jUpPhuEEXVGHQVmwg7O4b34caE57woLgOKhj
         +aEEw2JPgEIHdAJBAWxycfPcmgUIYnmiK3AW+nHm6mwp8tPSkGors4ei/JTcmGiqVc
         kgMjGXPnpLZLN4k2mjkTQZOQK/xlP/BhvnbyYCWaT/qvgpMlnc0/mxuPBhLtz/nYXb
         7EBCmzv+fBLqQ==
Received: by mail-ej1-f72.google.com with SMTP id ka12-20020a170907990c00b006c41c582397so110575ejc.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Feb 2022 11:41:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IBoZSDY+vh3MSwNsW1pxD5jmNE6UjfMq9hfqIrcXwOQ=;
        b=hejVkIejYjOMOJ+uHwYsb7XwvAGRD8qsMajVZpJfqdH92KxRTjt9UhWXToImgsfUPJ
         H0LSFakji+46hLBZazLZU/WEOguUulAziRfNdFRbiWzxjpV1j7kGvlDP8XpJcrAtVPL0
         7q1N9ZHttGQuYrJXsqXU/bMIltvAnIt1obzcROFXFUqlCTJ1B6BmUg7sIsgn8zRgVMtH
         UZeYzuZxekMmPTbrYZiTaGld4h/QRg5D8xVy0Xib05kO2vOtGXroYC9JFsUbhfx5Bosu
         pm2vckLxVlJYaBwPX03gRhezHh/DkAAOtmdYnRc/vYQ3hQJL6R+weuY0N4SdiZCsoKn+
         cKBw==
X-Gm-Message-State: AOAM532GW36H4zEL3Fc8mXq/E3yWgTXeyNxAxL5Rq57jJo5LhzDz1mYr
        5RcC4IzTogngbUlEDGEmUBEqLEZ6zlvmxX5tNKR3a4lnBnQzLYiTC9iEYjBUK4dEQcqxCi35/KN
        lzP0EZoW6PSUGblBlZCnDXVDeobGFW4Cpl4vB/s0iY6UQtljg
X-Received: by 2002:a17:907:16a6:: with SMTP id hc38mr5142708ejc.291.1644349282202;
        Tue, 08 Feb 2022 11:41:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn9tSy823egnQ7yz9s8CuvfmblkNP8GroHvwF86v5BwqvI6RsmXBhjnUpUe0Qp6ywDYxQrXQ==
X-Received: by 2002:a17:907:16a6:: with SMTP id hc38mr5142696ejc.291.1644349282019;
        Tue, 08 Feb 2022 11:41:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id k22sm3887085ejr.211.2022.02.08.11.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 11:41:21 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: soc: samsung: usi: refer to dtschema for children
Date:   Tue,  8 Feb 2022 20:41:19 +0100
Message-Id: <20220208194119.46022-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Explicitly reference the dtschema for USI children implementing specific
serial protocol (I2C, SPI, UART).  The SPI schema is not yet accepted,
so it will be provided later.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 58f2e9d8bb0e..f3aae7e0e2e6 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -18,11 +18,7 @@ description: |
   selects which particular function will be used.
 
   Refer to next bindings documentation for information on protocol subnodes that
-  can exist under USI node:
-
-  [1] Documentation/devicetree/bindings/serial/samsung_uart.yaml
-  [2] Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
-  [3] Documentation/devicetree/bindings/spi/spi-samsung.txt
+  can exist under USI node.
 
 properties:
   $nodename:
@@ -75,10 +71,17 @@ properties:
       This property is optional.
 
 patternProperties:
-  # All other properties should be child nodes
-  "^(serial|spi|i2c)@[0-9a-f]+$":
+  "^i2c@[0-9a-f]+$":
+    $ref: /schemas/i2c/i2c-exynos5.yaml
+    description: Child node describing underlying I2C
+
+  "^serial@[0-9a-f]+$":
+    $ref: /schemas/serial/samsung_uart.yaml
+    description: Child node describing underlying UART/serial
+
+  "^spi@[0-9a-f]+$":
     type: object
-    description: Child node describing underlying USI serial protocol
+    description: Child node describing underlying SPI
 
 required:
   - compatible
-- 
2.32.0

