Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1E3C6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 18:16:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbjCLSQN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:16:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbjCLSPx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 14:15:53 -0400
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D5D921A0B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:08:22 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id b10so10438068ljr.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678644287;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THHnNubc2+UuqNjcDLN8j6le5gzsAvvJJbRATCHsptA=;
        b=WSQwHyx0Zu1wxpiUOe0rrfJmYxZQhQCZNMNAhhO3qpeuE1sOvBSjA23P/0ankrG3k9
         NpX9Mw3SECa/Jv9XtpvKgLrxsfCsXY9nILLmGc/zOCFaXvjZXAbzFbH059n3jjcUwGLJ
         +Px55MOsDiD1+s508fOtCtRVHPTjV9kchlYkl+XNm859DQuBAQevbfD1KYOpHdE7FiyF
         LOX4vqleu5zVChs/XmDOdj57xxnCgo7Tcbz9HyYZWDsS+o6EF1riU+iWMC5b3fNXmA5q
         9vKKc8tacE3DnbjeczVQI4khPkSYZoj2oI11suMBqrG/5aRfk/1n1nyKID1SooKs0QXV
         bv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678644287;
        h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THHnNubc2+UuqNjcDLN8j6le5gzsAvvJJbRATCHsptA=;
        b=ZfM1s6KFsv7XwST83UXeo7Og7PY7bt42DRZCtNWuKE3N872PZsTOCY23MzbcxNfKPE
         yeCtR+UDI+8RFyboCZdIG4AyGKlNbK3U/PH1QY2hwh0gpkWxJPHDOy47A7f6dLHaiutF
         eznJ+TDDoyn7R9qjOYctn+WUNa9DrJ36AVCrCDHeqtQocUZfOSPR0Hj9Xpjsu4L/sSQN
         EMxWfrsb0rIILZPIiTKBW4L5kU6mwhqzQcf/r3Er0BOezReHI8vHkAUVciH5WmYIPDrP
         QY7vNW1iuyfhnENWxHBxu3dsL/oj4zUOrlasAlZuxOd4guX5NuyxCTrPOMO5AyzqT4D9
         GUtw==
X-Gm-Message-State: AO0yUKXnSfk2rZo31H4Eus01oho6gD+LWlmpCJeOdMhjEYPrBWMwkWjk
        opKDPpEoa/L0/g/6V44+UVBMjiJgX4IA+WQG
X-Google-Smtp-Source: AK7set9r9UxJees8xWjmdulg8ucGHojcP9q3eHgjTiJV//JfW25xU1WtJtLS1ucfAgTj3zqzmOLkwQ==
X-Received: by 2002:a2e:8816:0:b0:295:a96e:4f22 with SMTP id x22-20020a2e8816000000b00295a96e4f22mr8803480ljh.17.1678644287214;
        Sun, 12 Mar 2023 11:04:47 -0700 (PDT)
Received: from 0001-dt-bindings-exynos-dw-mshc-common-add-exynos7885-var.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id s6-20020a05651c200600b00295a8c68585sm723054ljo.56.2023.03.12.11.04.46
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:04:46 -0700 (PDT)
Message-ID: <640e143e.050a0220.73b97.1b14@mx.google.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 20:58:50 +0300
Subject: [PATCH v5 1/3] dt-bindings: exynos-dw-mshc-common: add exynos7885
 variants
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some Samsung Exynos boards using the arm64 architecture have DW MMC
controllers configured for a 32-bit data bus but a 64-bit FIFO. On these
systems the 64-bit FIFO registers must be accessed in two 32-bit halves.

Add two new compatible strings, "samsung,exynos7885-dw-mshc" and
"samsung,exynos7885-dw-mshc-smu" respectively, to denote exynos7885
boards that need this quirk. But it's very possible that all
"samsung,exynos7-dw-mshc" boards are actually affected.
---
 .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
index fdaa18481..3eebaed2c 100644
--- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
@@ -22,6 +22,8 @@ properties:
       - samsung,exynos5420-dw-mshc-smu
       - samsung,exynos7-dw-mshc
       - samsung,exynos7-dw-mshc-smu
+      - samsung,exynos7885-dw-mshc
+      - samsung,exynos7885-dw-mshc-smu
       - axis,artpec8-dw-mshc
 
   reg:
-- 
2.38.3


