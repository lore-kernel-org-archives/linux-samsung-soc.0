Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D334C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Mar 2022 11:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233283AbiCFLM1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Mar 2022 06:12:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbiCFLM0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Mar 2022 06:12:26 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A7E9606DD
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 03:11:35 -0800 (PST)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B60223F630
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646565093;
        bh=l+3yBFGs2kRX1wnF/pKhhZHPFcB8pp4apl6TxfDIAEo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=cNaou40RPlvBhEhsJwKhPo6bGSoddqMe9MgHZCG9Jb2UvptSeUqi4YeEgCS5/2SsX
         FXECURlxxqHJ3t5jsrjVRGj+Qy3g0+Ne3NKJVAVIwMi7zNdhHo/KwLQTkq2eXAnHGK
         /oPD3YcMzb5W5h7cNz302qKYUF/ZZ0rzr4GYx1+C471gNOmpV1tfOUlr9EA42/xE4u
         wGclw7t9Oo3Jz46gQaEor5Pgjwt0e7DgXJDL0wPJuhI9hbFAFLgQZR8ApFfpWCAT59
         szwUrzxsvny96weNlj4vDtYyvvmNp5Lr1lQboLNEAje+9XQAXdvF4djXmYOTLXhcze
         YZSjtKi0EUWTw==
Received: by mail-ed1-f72.google.com with SMTP id u28-20020a50d51c000000b004159ffb8f24so6769689edi.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Mar 2022 03:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l+3yBFGs2kRX1wnF/pKhhZHPFcB8pp4apl6TxfDIAEo=;
        b=IMM/jDXO6s/Y0X3MHTV7ZyjwAsV38rW6cCnoVY+vOnX8EehUTPYCnvkPP3UiyS0tk2
         mj1e21DWWwUPQhzoHqRbDfG94P7YBFMuaOZXLCDVswjwHHEhHg9mZN41C46QjiOwUWrl
         a6eRiH9lgnYdublOsiwysZ+pPk9hakmgXqDrsKBkxM5vt1UDnqd7jmn6BCrNyycXd/7A
         bxYnjwrHi/8oVxi4ocFSn2fV9GE30XeQR8Po7CO9nIm5H3ykbtCL15Ela35JUBxnAJAf
         aUcX15XWRU6ReUvmDpD+YV98aAwaKgkH0E6iR4yDTWs/Ra/aZyZ2R+fD0jDnqAnT3xub
         R8yg==
X-Gm-Message-State: AOAM532sLgnsblNUkFkxleIOisTR8EnawIHbcRz9205CZJkSkhj3FmlU
        OoA3/GEp3RWISvy5CWagC72ZjPGBU1A6WYwEdNn3Msyi1hZ5Tv5eRdyGC3J1HJbgAcLGkYVq/zZ
        D3ssvF+IS7NeIsqDXT06VDjnAHtJw1D1ekrLSXV+PnWgn/aeA
X-Received: by 2002:a17:906:2bd7:b0:6cd:f89d:c828 with SMTP id n23-20020a1709062bd700b006cdf89dc828mr5685948ejg.232.1646565092948;
        Sun, 06 Mar 2022 03:11:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFqqBEGSiJykeoRQrbuWpAeTlK57pqo/2+l/saQ7OCHi1VkQZAPsAbz54RGXOqql4jg2q7ZA==
X-Received: by 2002:a17:906:2bd7:b0:6cd:f89d:c828 with SMTP id n23-20020a1709062bd700b006cdf89dc828mr5685937ejg.232.1646565092784;
        Sun, 06 Mar 2022 03:11:32 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 03:11:32 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/12] dt-bindings: ufs: samsung,exynos-ufs: use common bindings
Date:   Sun,  6 Mar 2022 12:11:15 +0100
Message-Id: <20220306111125.116455-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use common UFS bindings in Samsung Exynos UFS to cover generic/common
properties in DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/ufs/samsung,exynos-ufs.yaml | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index 95ac1c18334d..c949eb617313 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -11,12 +11,11 @@ maintainers:
 
 description: |
   Each Samsung UFS host controller instance should have its own node.
-  This binding define Samsung specific binding other then what is used
-  in the common ufshcd bindings
-  [1] Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
 
-properties:
+allOf:
+  - $ref: ufs-common.yaml
 
+properties:
   compatible:
     enum:
       - samsung,exynos7-ufs
@@ -47,9 +46,6 @@ properties:
       - const: core_clk
       - const: sclk_unipro_main
 
-  interrupts:
-    maxItems: 1
-
   phys:
     maxItems: 1
 
@@ -67,13 +63,12 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - phys
   - phy-names
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

