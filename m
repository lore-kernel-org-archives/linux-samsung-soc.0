Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C9CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Feb 2022 16:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351733AbiBKQsA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Feb 2022 11:48:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345025AbiBKQsA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Feb 2022 11:48:00 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E058D
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 08:47:58 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B533E3F1C1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644598077;
        bh=4lswzRVAGMbVN4fxZWJ4W9VwOoIlRM/pZiE0wihHuB4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=us/gU3pKk5J87Pblr93ix2D+jgvo73/Dr/tZoalVjJXOo8ZG1yG2QfouR3BZzujKM
         QEDq6b9KIt3QeTZXEzYOIk587GYdmzBPKEYAUqIEQH19878FttW7qmWcp/uSmJa4zL
         ICZ2hH9bhJhBXYMrkuSfmExx2FPRGUTvLiKg5f1DnS89Gnv5q1rnemmYq4M+k6+13E
         i48gqu0cze+/TRADulutiYKNWyulxRWR1DfZ6AvFNdk1OCibbkAv1RWXwe405lw1ks
         dA58ErSCLn49TAK6kq2zqGRBpIEyMNDdjaBHw1EQN+pTUP5Aj4oaaFe4wsl6notxzN
         K7vamXY+54JbA==
Received: by mail-ej1-f70.google.com with SMTP id q3-20020a17090676c300b006a9453c33b0so4310350ejn.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Feb 2022 08:47:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4lswzRVAGMbVN4fxZWJ4W9VwOoIlRM/pZiE0wihHuB4=;
        b=Q/Bx2IoIUR/dXm+0NbDyJcS25Spm+29JdnzTspedLepF4Vijm/EUEEelrjxKHmj+ZW
         TLTVYweru2r/mMYr0zzGiuq44Zt3Rq3Yq6Y/paY33diE8FexlP1wrSb2nEyKQAbc2s1x
         VikI+lDRR1axX+57NSELb54EF4HHSSTWALR7eUe75Nhdu91siHf83fj4Yk4qJuj6X/JO
         3aFCQhjjbZnO3Y2Fm4+OAINOfqNiIS1WktdB1Cd9NTSl39uHhDUif1txNGBDYX46feDE
         L6KP92TLvTisdYFY6geq/CmEme1voQdUDAXsZBeE8VFbk0GVsR607yPsKGdbEsSi2jmZ
         EMeA==
X-Gm-Message-State: AOAM531wJ/knXqFHoQnU8w38QujkQpD3JIoYrpXBcRlpPzZqp9CMh3yW
        p7EtDHrUu6IaW1FwhN51ewmSXVcY821tOtSQ47qszx/WOYHa94CyGuso4FFjJabg+AvLZMb8byr
        4GgpyzROdmwGAjpCpb/OOAy7MkHO26dXNm0S3VLqw5xIwnoLJ
X-Received: by 2002:a17:906:d550:: with SMTP id cr16mr2076700ejc.257.1644598077406;
        Fri, 11 Feb 2022 08:47:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVaaGgrMK6Xd0ZUKTGZK48foO64fs4vM24QmAKR7PNgLUxAff0uHLt5kCrVQyMq6YcUbvD2Q==
X-Received: by 2002:a17:906:d550:: with SMTP id cr16mr2076686ejc.257.1644598077198;
        Fri, 11 Feb 2022 08:47:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id n24sm5036951ejb.23.2022.02.11.08.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 08:47:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: soc: samsung: usi: refer to dtschema for children
Date:   Fri, 11 Feb 2022 17:47:16 +0100
Message-Id: <20220211164716.120880-1-krzysztof.kozlowski@canonical.com>
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

Changes since v1:
1. Drop entire paragraph about USI nodes.
---
 .../bindings/soc/samsung/exynos-usi.yaml      | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
index 58f2e9d8bb0e..a98ed66d092e 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
@@ -17,13 +17,6 @@ description: |
   child nodes, each representing a serial sub-node device. The mode setting
   selects which particular function will be used.
 
-  Refer to next bindings documentation for information on protocol subnodes that
-  can exist under USI node:
-
-  [1] Documentation/devicetree/bindings/serial/samsung_uart.yaml
-  [2] Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
-  [3] Documentation/devicetree/bindings/spi/spi-samsung.txt
-
 properties:
   $nodename:
     pattern: "^usi@[0-9a-f]+$"
@@ -75,10 +68,17 @@ properties:
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

