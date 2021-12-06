Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE5FC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Dec 2021 12:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243304AbhLFMrS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Dec 2021 07:47:18 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50712
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243292AbhLFMrR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Dec 2021 07:47:17 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6176E3F1E5
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Dec 2021 12:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638794627;
        bh=2ccnvvjzh+vr27cmDIxMLKkuyPKdTXHoRsCzeOVPF7c=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=eEmJYfaiZO+/iHRvWxq8KF1GbQir4H1bi4y4JgahBCNZVqqIT9ihpBxN96LgC7NKQ
         dy2oIc0VlduOjJijtyz4aCMYi4VtN4ZPYzk1nfh9dw3iqYkoYLiL0ufzj3B/LRGjx3
         3cAqCAeAgxpBBCbHNfztfVHGD3uYcxJu/B/HbexftnWtT7seEz6p8Kq0FlcPP/JZXH
         R2V1eLvbfXXbVKHog2Nt14KEH8eSaC8C78TCUle1bRqfXQ/1kFsmdz6pOaQfdKsvxs
         ztO4+pc1yL4VIX0Fq38VunhuN7VW1ubc8ZP+0U5AIXCok8G1zRpNJ/WjWo28O7rSkM
         DgzTSZRjksvhg==
Received: by mail-lj1-f199.google.com with SMTP id w16-20020a05651c103000b00218c9d46faeso3412145ljm.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Dec 2021 04:43:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ccnvvjzh+vr27cmDIxMLKkuyPKdTXHoRsCzeOVPF7c=;
        b=seK/3LHt7Jzwbwz+0dESdtEXcxV8P4F8Nl5u6I49QZoDwujLr0Kj0sn6ERKdfm1S4r
         LQNXpH2+PUsS23bUGhLw9guIDskyBh80gLbJb6yfUoQ+JwRqr61Mu5nDdK5RByIEjDOL
         PJ/04PSah2N3MHu51449cUD1z6xNeyjz4601qmhLQfezmqHsgKJhDzJKXIA/WduYuwJK
         1IDBB37TdDTm0rSzO6skZTSzJD+BvQV0w+rpCkOwto4EX9t2rJhmoco2OsI0J7WVvDmn
         9Nl02yuTXRHTT/yp7CNkaakqqiKMT8pbZckdvoeB1P00mPo5D9cA7O+JC6OIZbKix8uD
         gCvQ==
X-Gm-Message-State: AOAM532fraRuQ/pYytdH2J7GKXogeSbx3cwRZ0G103VaiiZJ5ah/AA8p
        6UlINL5QgPcxHcPQR1vyIbvUYt8nkcx240BI8JWYHMtlOEMjHWBUIKRprA1gTbJqnKB5GVHEP1S
        OVWydRRxrf88m++mGylM1Bz7go6NYZrPLdj2qTZvAoCkFVNi8
X-Received: by 2002:a05:6512:1313:: with SMTP id x19mr35524135lfu.279.1638794626788;
        Mon, 06 Dec 2021 04:43:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEMmT5tdvgU9TQ9t8yV5F7fDNCa+/K4eYR8uaI1kK7FvQ6ULIl3dE3GYPMmHi49FXSHjzxDw==
X-Received: by 2002:a05:6512:1313:: with SMTP id x19mr35524106lfu.279.1638794626513;
        Mon, 06 Dec 2021 04:43:46 -0800 (PST)
Received: from localhost.localdomain (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u14sm1296006ljd.12.2021.12.06.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 04:43:46 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, stable@vger.kernel.org
Subject: [PATCH] regulator: dt-bindings: samsung,s5m8767: add missing op_mode to bucks
Date:   Mon,  6 Dec 2021 13:43:06 +0100
Message-Id: <20211206124306.14006-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

While converting bindings to dtschema, the buck regulators lost
"op_mode" property.  The "op_mode" is a valid property for all
regulators (both LDOs and bucks), so add it.

Reported-by: Rob Herring <robh@kernel.org>
Fixes: fab58debc137 ("regulator: dt-bindings: samsung,s5m8767: convert to dtschema")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/regulator/samsung,s5m8767.yaml   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
index 80a63d47790a..c98929a213e9 100644
--- a/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
+++ b/Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml
@@ -51,6 +51,19 @@ patternProperties:
     description:
       Properties for single BUCK regulator.
 
+    properties:
+      op_mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 1
+        description: |
+          Describes the different operating modes of the regulator with power
+          mode change in SOC. The different possible values are:
+            0 - always off mode
+            1 - on in normal mode
+            2 - low power mode
+            3 - suspend mode
+
     required:
       - regulator-name
 
@@ -63,6 +76,18 @@ patternProperties:
       Properties for single BUCK regulator.
 
     properties:
+      op_mode:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2, 3]
+        default: 1
+        description: |
+          Describes the different operating modes of the regulator with power
+          mode change in SOC. The different possible values are:
+            0 - always off mode
+            1 - on in normal mode
+            2 - low power mode
+            3 - suspend mode
+
       s5m8767,pmic-ext-control-gpios:
         maxItems: 1
         description: |
-- 
2.32.0

