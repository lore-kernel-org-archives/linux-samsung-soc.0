Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0543FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 07:29:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D77FA61041
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 15 Oct 2021 07:29:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbhJOHbI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 15 Oct 2021 03:31:08 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40798
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233236AbhJOHbH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Oct 2021 03:31:07 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C16583FFF3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634282940;
        bh=STxvpgXyUSvLYxw4ii45TmrwAbcDPMKJf5rkuTxXNX4=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=sLIYseEOv7DIC0Mm4PYjydVfFF5oId736llhk0t4KMV4m1JI69wZDfLFYHgk8ywui
         IuJn4wqF8PkAI24KhNvze0M8Nskn+gqRyoktwv0laK6vz55b+yZQAQFDViSbdUc3wD
         0KeEzpnjH8dURuHa7QD2sP0TitrsC/hsvgfD/+zR12Ci2zxz6AXeIlZyC8w6yUfjod
         K+6YtR42T3u+IHHOyZ3mMgQiNT1zWrfjdD0UEsd4JZx/H0qBJZWTXxrOsBKPnkcXH1
         ZGu6a98z64hoH+jGixsAYxn9qMCKSrbp/wbcz56AAQVo5tmnCBPresW+C2aon5n6Gr
         CPKvxQxXaaGJg==
Received: by mail-lf1-f70.google.com with SMTP id k18-20020a05651210d200b003fd86616d39so1158814lfg.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Oct 2021 00:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=STxvpgXyUSvLYxw4ii45TmrwAbcDPMKJf5rkuTxXNX4=;
        b=XH3AfcKgJTNVJMVl+aMx+N6xGkkTLAMedhv0QRZHBJpO8C6ktdO+7rGKSPrWe7OC8l
         khuYdNpNrm77N5aakf68CaH6rkbU7KpfYbTSTjaCX1492JksJH8nWHOa73AjekORD0V6
         j8GYP265SSiV8dyPOPTs5/f7uw1yghrvx7ASxboXh/CcoJJmdomb4fhbHIufVeGo4stt
         IrnAevDVHGwImKb+pvGZmKNAec6wD8QXYZcvushUF2CJDEbOayUddVikU04FMK+OtAaR
         bCbYKfGV5+xyIeGxn2ysBKzJDMfo4Ou7jwaNkpe5YpUj3dSTbdIzvugni3BsqrxBMDhS
         lfCg==
X-Gm-Message-State: AOAM53368gi3GFE7mHp85HCa63Dwy8+BUqWx1jk3DlEk5KPz9qzP81Rm
        E6ftNHyskXn6Pcqc4V+2ugongdpsMElBkL4piOHqNXNWoDD2g8b8bWeXx8cFxNA3Zy4TW9Bv21t
        eTSAywR0mgZ+wQbPnAMhFLB+TE/StmNKkRtzKWlRayA5KUL56
X-Received: by 2002:a2e:3315:: with SMTP id d21mr11110253ljc.377.1634282940229;
        Fri, 15 Oct 2021 00:29:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9+NLpbjYfYTu5GOLKMRlKSSfPe3h88aVfbR/xFBKM7+q/PPb60UM1KhCUR5XHhSH70vHI0w==
X-Received: by 2002:a2e:3315:: with SMTP id d21mr11110245ljc.377.1634282940062;
        Fri, 15 Oct 2021 00:29:00 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id r3sm431818lfc.114.2021.10.15.00.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 00:28:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: memory-controllers: correct path to LPDDR3 bindings
Date:   Fri, 15 Oct 2021 09:28:57 +0200
Message-Id: <20211015072857.9770-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The LPDDR3 bindings were moved to memory-controllers/ddr.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

I will fold it into original patch.
---
 .../devicetree/bindings/memory-controllers/ddr/lpddr3.txt    | 5 +++--
 .../bindings/memory-controllers/samsung,exynos5422-dmc.yaml  | 3 ++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3.txt b/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3.txt
index b221e653d384..031af5fb0379 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3.txt
@@ -43,8 +43,9 @@ These values shall be obtained from the device data-sheet.
 Child nodes:
 - The lpddr3 node may have one or more child nodes of type "lpddr3-timings".
   "lpddr3-timings" provides AC timing parameters of the device for
-  a given speed-bin. Please see Documentation/devicetree/
-  bindings/ddr/lpddr3-timings.txt for more information on "lpddr3-timings"
+  a given speed-bin. Please see
+  Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3-timings.txt
+  for more information on "lpddr3-timings"
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml b/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml
index 6f4fd5814bf4..fe8639dcffab 100644
--- a/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/samsung,exynos5422-dmc.yaml
@@ -51,7 +51,8 @@ properties:
     $ref: '/schemas/types.yaml#/definitions/phandle'
     description: |
       phandle of the connected DRAM memory device. For more information please
-      refer to documentation file: Documentation/devicetree/bindings/ddr/lpddr3.txt
+      refer to documentation file:
+      Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3.txt
 
   operating-points-v2: true
 
-- 
2.30.2

