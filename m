Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A93C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 22 Feb 2022 14:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233027AbiBVPAM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 22 Feb 2022 10:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbiBVPAK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:10 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D29910CF39
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:45 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 276C240049
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 14:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645541984;
        bh=74/pBhghHeWH7/mWTs7/IJw313x+oiYcimgGGTWLW0I=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=niBofM20C0r4XBxO6g+H2P4uTa1vJxPqXFwSgzAvoZ3Kr7g6vjTigfXg44iUkc1+x
         YzCVKMCeGi4bYA6ZB4yF+/naHtftl/Z1Gj6jxMyFDl8WX+5qiaE5vQVFNtmNh4IXc2
         Qh+WPZLDIUctGQhFHSWH5qU/+klIPOEu24U1IgPmc58L97d0X6ZZ71eqrUIKBmggOs
         174OS82nOAf1KCoEDeoB0u8OFctK6Iw1Oq5XGwmMYeB6flvEqHQ/VQmaHvtc1r24i3
         M6p4lgg2IbMmodnpfNTXDG0xckK+pFWzy7JS28B2sHvPgxxShHUm5JeyQRwfHZ5eJJ
         HXjqCloVYl2vQ==
Received: by mail-ed1-f70.google.com with SMTP id f9-20020a0564021e8900b00412d0a6ef0dso7114219edf.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 22 Feb 2022 06:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=74/pBhghHeWH7/mWTs7/IJw313x+oiYcimgGGTWLW0I=;
        b=XGgUtwt3ie/uA+pQiZ4b4Gm/PoN8tbaOx4+TLl0HsmwDoFxPxIeAxhB167569oMuem
         1pL8g0xff56l7Z/j2nhaYwjPAQrzAv8K4Q0LOrR8SEirw2qLbEK/blCgm+I+Js7FZNza
         JDQ91LQJoppNGXP2iwuQkERwB1/kfEyWfiJZA7jnqDTR/Snzd4IxHOsPbEHHMXM6+j0e
         IJEDrlNx4YW1UWYnrFlPeSVOPVBEFFjbKo4/Kkfd1Yv3qHxev7SC9LdLjsutiMdy1gtY
         ZZzY1uD16F+gCaLPOzd/lFAP3FDX9JpiiyZNsPViibcEciNRKNOiTbhyHcatrW9XNFpm
         oFUg==
X-Gm-Message-State: AOAM533N0INCKFK84FWKVxTw/D1DEiW190Gpa9JHLm17ySD14hYmf30Y
        f09Gt+ZmP6/VRTHFj5+7NCwwftYbbjhqXu9r0KwRPDXRAvsUnaRRrdADGn2nSk/oyDwVQdy5c98
        5fg5SJPYhfGvIAn27CNNoRmwv8fQL49rTwV86W8dx5SfQS/3s
X-Received: by 2002:a17:906:194f:b0:6ce:3670:92b with SMTP id b15-20020a170906194f00b006ce3670092bmr19235870eje.737.1645541983430;
        Tue, 22 Feb 2022 06:59:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnm5ZDMw7fGj3UZIRVOLHmbWI713Qr92YShXMsW7GfodY/Q/WqKceA948ZzJpTHBhv2Bc9gQ==
X-Received: by 2002:a17:906:194f:b0:6ce:3670:92b with SMTP id b15-20020a170906194f00b006ce3670092bmr19235863eje.737.1645541983264;
        Tue, 22 Feb 2022 06:59:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 02/15] dt-bindings: ufs: samsung,exynos-ufs: use common bindings
Date:   Tue, 22 Feb 2022 15:58:41 +0100
Message-Id: <20220222145854.358646-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use common UFS bindings in Samsung Exynos UFS to cover generic/common
properties in DTS.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

