Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10A53C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Mar 2022 18:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243756AbiCNSV3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Mar 2022 14:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243772AbiCNSV2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Mar 2022 14:21:28 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B48D3702B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 11:20:18 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2986A40040
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647282017;
        bh=ZZZmUkbhHody3cQg6YTtcASZbjcHkXRB0CKHR4Vfcs0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=pcz4R4pQTgOWbSqMi/K0lGM02Aag0jQBcF5nHYhwmvoo5bpnn8JCDkku1RG4HrQWz
         A4+ZkU5P4CdO2xU9eCudeyIiDuHLYQV7uJ3n5vq3GdM01YkskS/4eC3fxAR3Onx6hl
         BNd0XwjcePV+E+s0FR+HhWrwGnfyKC5eMmfSY12w3GXovCC7apnPLnTGAxVJxMP9QR
         396T2fHJQFhcFR+r7BTHiSRPNwNrkQVfFTRE39R9CsNyHqJtMi2qh4tx2tlh7NLhUx
         X/rmKWx/0CxzFss3KtSXjy94p9w8WXMCZ6aWAAzPanHDiIjfIJVzcL2sSNSdVkfhdX
         5kRoKssevUUMQ==
Received: by mail-ed1-f71.google.com with SMTP id l8-20020a056402028800b0041636072ef0so9152944edv.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Mar 2022 11:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZZZmUkbhHody3cQg6YTtcASZbjcHkXRB0CKHR4Vfcs0=;
        b=xaew5a56C5TX2MsTmmHbO5IGIi+i9nb/EgfTCdDpuQK3N7OIH3keaGGmNNh1DMjCrf
         T5l0aY+3O2As25rSLyH71KfSQWj7Zq09mg+FC/CYY5wCsqMdvwOwLNwC11JCodoKFnr2
         Y/8sh9qw88awmRFOeAw49bkcr24RYVoJgS4ezfkqF/FUPDwVNCXwc0/8y7Lvm6wdNywj
         p1au8Pea7VXu4N87+Gapcbp8m0eOYiS+IL9mogX/XM3ehnjFFWau8c6HjZ3M//JoqK9E
         evBCj/mfeYMZR+zBfd8kGbJH5nIQw0Ugc9N+rfpuFbuhHAexoLD2ospYXKiLtAJDpe+7
         +tDw==
X-Gm-Message-State: AOAM533dZbqgEESJ9p3+BSrVcV/KjF/rAcfWztYFBsGeIBd8oz0wm8ih
        5y4myjoxX7n9FJRxF+LgC5AbxezLV8u2n3Bi0vxwuMcHXr8TSapuOWjbkWnbeAx/MboRw3LQi1m
        MW8DsyYZ41HspBcJYiwhNZDTZELPZzvNnCgK0sQWicvy8TMuf
X-Received: by 2002:a17:906:174f:b0:6d0:5629:e4be with SMTP id d15-20020a170906174f00b006d05629e4bemr19138898eje.525.1647282016653;
        Mon, 14 Mar 2022 11:20:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxilSk6aR5x6eRg2Sw08ds9XOo2mHj9ui0uVFPKjg2yLuwqGtgXaY6G1Ov0G1h2AdMHYrbneQ==
X-Received: by 2002:a17:906:174f:b0:6d0:5629:e4be with SMTP id d15-20020a170906174f00b006d05629e4bemr19138877eje.525.1647282016448;
        Mon, 14 Mar 2022 11:20:16 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i25-20020a50fd19000000b0041614eca4d1sm8566449eds.12.2022.03.14.11.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 11:20:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 5/5] dt-bindings: usb: samsung,exynos-usb2: include usb-hcd schema
Date:   Mon, 14 Mar 2022 19:19:48 +0100
Message-Id: <20220314181948.246434-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
References: <20220314181948.246434-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove parts duplicated with usb-hcd.yaml DT schema and include it
directly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/usb/samsung,exynos-usb2.yaml         | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
index ef42c6fce73c..76e25b9efebd 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml
@@ -15,9 +15,6 @@ properties:
       - samsung,exynos4210-ehci
       - samsung,exynos4210-ohci
 
-  '#address-cells':
-    const: 1
-
   clocks:
     maxItems: 1
 
@@ -46,15 +43,6 @@ properties:
       Only for controller in EHCI mode, if present, specifies the GPIO that
       needs to be pulled up for the bus to be powered.
 
-  '#size-cells':
-    const: 0
-
-patternProperties:
-  "^.*@[0-9a-f]{1,2}$":
-    description: The hard wired USB devices
-    type: object
-    $ref: /usb/usb-device.yaml
-
 required:
   - compatible
   - clocks
@@ -65,6 +53,7 @@ required:
   - reg
 
 allOf:
+  - $ref: usb-hcd.yaml#
   - if:
       properties:
         compatible:
@@ -74,7 +63,7 @@ allOf:
       properties:
         samsung,vbus-gpio: false
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0

