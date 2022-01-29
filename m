Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00404C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 29 Jan 2022 19:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353098AbiA2ThT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 29 Jan 2022 14:37:19 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:60276
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353117AbiA2ThM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 14:37:12 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EAC364004A
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643485017;
        bh=hAGep8pVNTsPRC1nSKuBp/hWEFmbR4UGlLqtXTKGMQk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nSJv/MwgBEuO5Vy/5scnJeRmNIWGghzKmuYqPQUG1go/uh9RK/NKg3fHk4q5VdfPo
         N94GcYxzNgGeoBMBxC1ri8khrO/jU6b1BMCZijygMlXKQjusS7N7djZ96IBFwDxmsU
         QYDeDqdPB+Kza9oo3NWIhUhcfHLQwSiOBgEKgItgIsCJ8w/zkardhWbL8hMy9ypjea
         AZwhzJGUsRLpvRBXLKqdtVVW6fHGE7VfUH9mBlKphEAhfC0ILjRs6lktmt/30pNEuF
         1GG5k8RD1ZiHnQe9UrCMl+pwgmWpxiPj3TfUPQV8ASRZWwBKKa0RFc2rpDDnPsviiu
         cprsxPTKnwQTQ==
Received: by mail-ed1-f70.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso4753078edt.20
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 11:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hAGep8pVNTsPRC1nSKuBp/hWEFmbR4UGlLqtXTKGMQk=;
        b=xBgA56/F6K0ozj0RQmDQEcSNbNwyf5F4mD5XVqex8juhn55964bMtLLRm1lSBUrjBk
         i58CVafEVlHClNQVjc1x0lmd6pykU0gzns3HqONVtIYbe91eP+qsrWZ++ghEIAMvsG0P
         /8kaw0PRWlYpsGmg8YzVKalMZIz6lq+gihTT44Bi5Z2KDuMcw2QQRb0HqJaa407M847s
         MvmddqmI8dgZf5rPr2Tr+6DARS6X03suk6TB5ZWHDfaOkmT+k8l7qSM4ZnD/zGHuEnBn
         13FWuUYF+np2mp/ouoR5xbq69X+H5iz32wlQwUReGVfaFXCXgnDZOgfrdciuUcLtgA92
         Wxfg==
X-Gm-Message-State: AOAM531J3MZRb3kz2CZnb7QeBD8mfYTGeIQQ81Ta7l1hluSto87pE12I
        /t3GN54Ko7p0Se7e/uszcEwN/KwWB+JSakJJm/fb6ZIMKADYM6UVrhCDmkb8lOSXlrN640RmTTV
        BKwgteyIPsWf8DAhvFigIiVyuoE8mo5Pfb+Anj1d2zOuPJUlQ
X-Received: by 2002:a17:906:e0cb:: with SMTP id gl11mr11488649ejb.135.1643485011238;
        Sat, 29 Jan 2022 11:36:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6nnWsixSDr5XE5v72szvmmUfsStrbIoMAbLaY3/xYGrtNlZ1bDnYpJvY48+Oy+FGS75nXxw==
X-Received: by 2002:a17:906:e0cb:: with SMTP id gl11mr11488637ejb.135.1643485011078;
        Sat, 29 Jan 2022 11:36:51 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id bf21sm14968026edb.2.2022.01.29.11.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 11:36:50 -0800 (PST)
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
Subject: [PATCH 2/8] dt-bindings: phy: samsung: drop old Eynos5440 PCIe phy
Date:   Sat, 29 Jan 2022 20:36:40 +0100
Message-Id: <20220129193646.372481-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
References: <20220129193646.372481-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Exynos5440 PCIe phy support was removed in commit 496db029142f
("phy: samsung: phy-exynos-pcie: rework driver to support Exynos5433
PCIe PHY") (with its own bindings), so drop the old bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/phy/samsung-phy.txt     | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung-phy.txt b/Documentation/devicetree/bindings/phy/samsung-phy.txt
index 8f51aee91101..390065f49b62 100644
--- a/Documentation/devicetree/bindings/phy/samsung-phy.txt
+++ b/Documentation/devicetree/bindings/phy/samsung-phy.txt
@@ -191,20 +191,3 @@ Example:
 		usbdrdphy0 = &usb3_phy0;
 		usbdrdphy1 = &usb3_phy1;
 	};
-
-Samsung Exynos SoC series PCIe PHY controller
---------------------------------------------------
-Required properties:
-- compatible : Should be set to "samsung,exynos5440-pcie-phy"
-- #phy-cells : Must be zero
-- reg : a register used by phy driver.
-	- First is for phy register, second is for block register.
-- reg-names : Must be set to "phy" and "block".
-
-Example:
-	pcie_phy0: pcie-phy@270000 {
-		#phy-cells = <0>;
-		compatible = "samsung,exynos5440-pcie-phy";
-		reg = <0x270000 0x1000>, <0x271000 0x40>;
-		reg-names = "phy", "block";
-	};
-- 
2.32.0

