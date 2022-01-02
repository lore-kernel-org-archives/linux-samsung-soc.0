Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC776C2BBC7
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  2 Jan 2022 11:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232996AbiABLyL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 2 Jan 2022 06:54:11 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39964
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232991AbiABLyJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 2 Jan 2022 06:54:09 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 076DC402E9
        for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Jan 2022 11:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641124448;
        bh=8Iiswqq3lRgfFSSwuunIJRGY+0Um9RImCxO/Z027Tqk=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=YIQE4WFbCgTWZVcHGeIChkCjXArbnI+6wjpVxr3J4UjVhTuz2fDqxja8dqjIxpI6g
         OaLB/V0pDTs7KsJDoHRQgrGCGpVttNJWdIbFVbLuMDMwYvPO6OEJVPjjG/hVwSaw+t
         H5OD27M4pwMYgB385AJK9NkjVkd8djcoSWGRqUMJwU3ZGBzHc4kTpyClFTkOopDNjW
         eOSNSVXoxb542cJRguUzkU9frg4sBP023CD0W3KHV5TN8gQdlJ8xOHUWnZQigQX72n
         bYVLbqtzR2nFg44C8EjW6xLuJZzjGdg9ph6CqcQAK2AGpZWiRk2eCq8Sm0auwJ3at6
         6Hsi/L2lvHu3g==
Received: by mail-lf1-f69.google.com with SMTP id t196-20020a19c3cd000000b0042a2598bebaso1478063lff.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Jan 2022 03:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8Iiswqq3lRgfFSSwuunIJRGY+0Um9RImCxO/Z027Tqk=;
        b=QMNQ4fL0pd/syMgMBZ/vPaioHdiOUDFzBd1e4oxGRZDdGK6YSiPAasSb4bpN4+aWB/
         WUccxbGq01jpjZ8YFW49mwlv6deXNcuizC3fr0BuzaeTF4GUcZDss/5CYBeHIgf87Uh1
         JhSeqreAPhuEXGSdntAJfHOblZN9YLx+bqOJ6Ma4M98r8qoZIcIThM6rGyHODLGmzOSx
         qYvG/FMGTd/rNA4DPcRzdHpu+j0oig94kqhJvjWK38WHxNC2FqriVRS599SLZUT6wT3F
         z8sZowLlmOC4wPIm2ES+VWEKTQwyLgBSO4CDw8QdnYcXB1f8OFmFhh11/C+C3fW7Qn2B
         Omag==
X-Gm-Message-State: AOAM533MhZMHyXHWLOVNNwREfcL3Rhi4a6P4RuHBKwVkhazCQxxQEwA1
        MD75+QcAxzBXYrIdtpYy6m/JAUJ/12il4m7iY99xk0F/Mapjq0wKR/kM0Gb5lsF/DT+XF0qWLGr
        /CMD+vtfXY4TcKRl7RkbPCU1EWDrzEAXDetqsLjsu8YqwDlWy
X-Received: by 2002:ac2:490f:: with SMTP id n15mr20601496lfi.141.1641124445746;
        Sun, 02 Jan 2022 03:54:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1GLEvNRCyNXDFJt1JJlRQIBOZJk+LUIbE17ZkCXTGpyGMuiMGyECp9GHjOloBT5pb9ZPESQ==
X-Received: by 2002:ac2:490f:: with SMTP id n15mr20601481lfi.141.1641124445591;
        Sun, 02 Jan 2022 03:54:05 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l2sm2368014lja.51.2022.01.02.03.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 03:54:04 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] dt-bindings: clock: samsung: extend Exynos7 bindings with UFS
Date:   Sun,  2 Jan 2022 12:53:53 +0100
Message-Id: <20220102115356.75796-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220102115356.75796-1-krzysztof.kozlowski@canonical.com>
References: <20220102115356.75796-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The UFS for Exynos7 SoC clock controller requires additional input
clocks for the FSYS1 clock controller.  Update the bindings to reflect
this, at least in theory.  In practice, these input clocks are ignored,
so it is rather adjusting of bindings to existing DTS, without affecting
any real users.  I understand that is not how it should be done,
though...

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../devicetree/bindings/clock/samsung,exynos7-clock.yaml   | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
index f3fa6c7ef48b..599baf0b7231 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml
@@ -209,14 +209,17 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
-          maxItems: 4
+          minItems: 7
+          maxItems: 7
         clock-names:
           items:
             - const: fin_pll
             - const: dout_aclk_fsys1_200
             - const: dout_sclk_mmc0
             - const: dout_sclk_mmc1
+            - const: dout_sclk_ufsunipro20
+            - const: dout_sclk_phy_fsys1
+            - const: dout_sclk_phy_fsys1_26m
       required:
         - clock-names
         - clocks
-- 
2.32.0

