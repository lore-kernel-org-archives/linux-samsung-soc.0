Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D054C4321E
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 19 Feb 2022 18:42:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242818AbiBSSm7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 19 Feb 2022 13:42:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242866AbiBSSm6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Feb 2022 13:42:58 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1793275C8
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 10:42:36 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4A188405BC
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 18:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645296151;
        bh=rlo6dv8R8AO8D00xVoydpkfzh23wJWM99TpGFXJ1F5U=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=nIe/GF4eFfgeyjk+3IYN8rKCtt4tUs8OBkVKrg6MHbSYhaYX0oTxXTdolv32g95E/
         CSgMMOZtCaEEgi8fOsmtSJInJSWl77dq9uU4ZTpnJD1vRhnnkHKztqlcVOZMdF19VK
         KPopoU4+Gs1eaC4acd/lOylK7MaBoaNcaoLE5jJEZy/eCrqlS0O3MPYHiKNz1G19tu
         IkCgla8+QkdO2ezXkuPtGk+5bBCbUtNMJedzdOGnsc+vP2brMnXtWmXdVI1HP8EbXS
         Sjw1C/LtZXWSfCUSkh4/RRmvGtYHkYDdzUNSwreLPCowwHamgDd+xTHj+zF3VgJkgC
         OL1HX/aR8Q6qg==
Received: by mail-ed1-f70.google.com with SMTP id k5-20020a508ac5000000b00408dec8390aso7510404edk.13
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Feb 2022 10:42:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rlo6dv8R8AO8D00xVoydpkfzh23wJWM99TpGFXJ1F5U=;
        b=WM+vgOB7Btkn0fnGa9PDcQ2J0y1j8NW4ertwn9PKkmjRc25tD+7POHWyj0uro4la9F
         8kPsNwUFujpemgsxo86axXKDRqES+Wqcd3bG/qhyrC6ozHns3ldETI3UiXu5Kn7rzHko
         SkzV/HZNZulkDAuJwGBZE1tq4Hw92Em2kwYnGSbHCWL3xxXaWYsfZIK7vC2+PNJCClSE
         5R6gfyVesCS6Za8+TgFiWONpen9giQuweoSVTx2vJm3Nz0NQR0Po/GDm9RN80lmGt/c6
         jBO0IU/v8RbASLABtOKeObZHcQH7odUt8nUHQVwBE0DlgbbfUqdqQ4WhsviN4qGOGwUd
         rMng==
X-Gm-Message-State: AOAM533hg9fz4yCvqlHw5NashbgKEhaT5zYRbgNQ6HmEkcUNkaOVPTuz
        4znqTMt/P20qzvovK7nfzrZI4OuyJAqsN8GkIqQWcXBYHjlt0TGg1Egq7Emd+6a+wQmYD63UiHg
        +IthnYYGnkrpdrXDk3GeRRnwy0hY6FTtreyabBzpiRWFXPhJZ
X-Received: by 2002:a17:907:3a13:b0:6cf:1186:1381 with SMTP id fb19-20020a1709073a1300b006cf11861381mr10792773ejc.539.1645296150908;
        Sat, 19 Feb 2022 10:42:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2naSdEU4Ep7cfPOis7zL8hDLMxXjvy+MqwgzXgYHKGMAwKMtnXxUn3sccavk0GfxDOqA4cQ==
X-Received: by 2002:a17:907:3a13:b0:6cf:1186:1381 with SMTP id fb19-20020a1709073a1300b006cf11861381mr10792750ejc.539.1645296150719;
        Sat, 19 Feb 2022 10:42:30 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id j8sm6680745edw.40.2022.02.19.10.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 10:42:30 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Jan Kotas <jank@cadence.com>, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [RFC PATCH 2/8] dt-bindings: ufs: samsung,exynos-ufs: use common bindings
Date:   Sat, 19 Feb 2022 19:42:18 +0100
Message-Id: <20220219184224.44339-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
References: <20220219184224.44339-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use common UFS bindings in Samsung Exynos UFS to cover generic/common
properties in DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/ufs/samsung,exynos-ufs.yaml    | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index 95ac1c18334d..e01408b4fcc2 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -15,8 +15,10 @@ description: |
   in the common ufshcd bindings
   [1] Documentation/devicetree/bindings/ufs/ufshcd-pltfrm.txt
 
-properties:
+allOf:
+  - $ref: ufs-common.yaml
 
+properties:
   compatible:
     enum:
       - samsung,exynos7-ufs
@@ -47,9 +49,6 @@ properties:
       - const: core_clk
       - const: sclk_unipro_main
 
-  interrupts:
-    maxItems: 1
-
   phys:
     maxItems: 1
 
@@ -67,13 +66,12 @@ properties:
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

