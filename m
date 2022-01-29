Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325A5C43219
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Jan 2022 19:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353075AbiA2ThS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Jan 2022 14:37:18 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37342
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353095AbiA2ThH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 14:37:07 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A55A040029
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 19:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643485018;
        bh=Fc1eyAl7NybW6jYdngJRL9d8j3U5amMxubQkyGhXpG4=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=PgOrk954aJll0U8qHwyfFHfOjAnd61R9wrh74AJF9KhEm1VKcWLNLv6LYNnQxa4Kl
         OBKHAfLpQr6mMqNOkOt7MZ12D8JIpzdJZwitmkod/IX+bWSqmwRR5y/etP2U4Y3IsO
         JJtswVzJzczbxAcuq7YmIr85d+HYIuUrRw/Gv1iEamxL4GNbjn2BS/7Oq3dysUmRIH
         XeSrFw6VZg8k+zL43IzB3zh/fJAz3VlDv1AdvAbrbN3NVejkla4An8Y9hj58As6wFV
         kz3z6Jk1ETbAouWF7bYygJKC93haR7pkSKnUAvcHH+etCaZYbYhvN9wy4pkT1oBNDe
         M//K325mNHeWg==
Received: by mail-ed1-f70.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso4753173edt.20
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 11:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fc1eyAl7NybW6jYdngJRL9d8j3U5amMxubQkyGhXpG4=;
        b=FHT3cno5xfmApmNvspQv8GRCyEogKJo4h880Ou4tTFKOBEyCdQ38B0o9CDxu7arh46
         IldhY1NMvllO81TSqMhbiM08udJ5qOWs7LK7QpVgzVGOsaK72zRXhoWzj+74eB23TA4l
         vs+WI1DMg5yzbpZtwiMtgHYDz7ghlmDqhZ+DSPOu9UGTj28Clj3LvmPxBbosKZDWWO8x
         8ygXNHQEI4WebhP4LCKMfxEHEKKvAiLvQ8mIL7So5UjkYjfBqZmMrkbBRjEE/ZgTJNMh
         Iag6AtFPSPAoN0Adr+p6Lk/Ne7r4pTaHqDYOayIGCRCbMGvtZpZKTMzbWyVmGgh9jDfj
         N/uQ==
X-Gm-Message-State: AOAM531Yi1MGaA9nlP8EU30lNM6M6SSEB2HETR4Ou7E82BjcaKo7rn4V
        OEKC+MmXo3/EySPC7RqMs9qLsdypcEkC9JN9avlzjyLSlF5+mjE4uTaE2Xn9Vfmk1Nsetd8j52I
        GlXFGTq8gM/oBJUJWXITeFFV/fiUqSGIjxHfBxQ/7eEh1YCsF
X-Received: by 2002:a17:907:6096:: with SMTP id ht22mr11140554ejc.611.1643485018007;
        Sat, 29 Jan 2022 11:36:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2C00tlFyQ3RoELXj4WirLkICa8agfl7xt6lK1t4z9axQaIvO2QsBaGqe8J3bXTyJSyrs97A==
X-Received: by 2002:a17:907:6096:: with SMTP id ht22mr11140538ejc.611.1643485017831;
        Sat, 29 Jan 2022 11:36:57 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bf21sm14968026edb.2.2022.01.29.11.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 11:36:56 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 7/8] dt-bindings: phy: samsung: move SATA phy I2C to trivial devices
Date:   Sat, 29 Jan 2022 20:36:45 +0100
Message-Id: <20220129193646.372481-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
References: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The I2C interface for Samsung Exynos SoC SATA phy is a very simple and
limited, so move it to trivial devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/phy/samsung-phy.txt        | 14 --------------
 .../devicetree/bindings/trivial-devices.yaml       |  2 ++
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 1ee78016dc72..b0abeb4ac0a2 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -1,17 +1,3 @@
-Device-Tree bindings for sataphy i2c client driver
---------------------------------------------------
-
-Required properties:
-compatible: Should be "samsung,exynos-sataphy-i2c"
-- reg: I2C address of the sataphy i2c device.
-
-Example:
-
-	sata_phy_i2c:sata-phy@38 {
-		compatible = "samsung,exynos-sataphy-i2c";
-		reg = <0x38>;
-	};
-
 Samsung Exynos5 SoC series USB DRD PHY controller
 --------------------------------------------------
 
diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 091792ba993e..d53a4b2f81aa 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -283,6 +283,8 @@ properties:
           - renesas,isl29501
             # S524AD0XF1 (128K/256K-bit Serial EEPROM for Low Power)
           - samsung,24ad0xd1
+            # Samsung Exynos SoC SATA PHY I2C device
+          - samsung,exynos-sataphy-i2c
             # Sensirion low power multi-pixel gas sensor with I2C interface
           - sensirion,sgpc3
             # Sensirion multi-pixel gas sensor with I2C interface
-- 
2.32.0

