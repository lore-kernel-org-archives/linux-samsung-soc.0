Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A9AC4320E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 08:40:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8576860FDA
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 11 Aug 2021 08:40:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236313AbhHKIlP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 11 Aug 2021 04:41:15 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:45518
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236266AbhHKIlL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Aug 2021 04:41:11 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 2559340649
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 08:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628671247;
        bh=7IJlzam8fj9i6+B2feleMQtESGacIdtIuLP/gvEeeCw=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=F+sKGLWUv4y75hXH1I8HYywT6VfSXXLG68eS/p6IedP8JLrM73GKPrR6BCMaGKpU1
         ZKfkDNcmA5bvgZReJJcTvDLFTXp6wbozje6OS+d1NggTiJi7y6LPLWGzomeqFwiukw
         IsHhEh/eECGVb4tnvMz57doqYkVHZs7iBB5nwaTjr+2JPXIDT+lsvhhwA4ktA+P5IN
         xET5V5aytDynXmmpTBxmttlz/Y52l82USdYl5nEAqLRlnhTf9VdMH+7auiholfP8DE
         CLCkfTDXH9Rorvqfrj7BqU/nFX2UPuTyQvzeOLiPp/OFnQspCWXYiQ3eowp1Sj5Jfm
         a5XfPaSPSAMpw==
Received: by mail-ej1-f70.google.com with SMTP id k22-20020a1709061596b02905a370b2f477so391048ejd.17
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Aug 2021 01:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7IJlzam8fj9i6+B2feleMQtESGacIdtIuLP/gvEeeCw=;
        b=RmNIca1NCOSlj2zcB75x6zLuNl+tZdCSXHWbmiNKCxYvHadWheOGD1831KSPBsPsiZ
         iHCgBZYIIzz5kdp8GLCAPha4t2TVnS2kBPhLny1hfPBxlpqpJBO+54qXd6wYH6CnPk+T
         p41hiASDbtMYBy4D1XsGHe7VFoFAWRe7GO4GP6irnnXkieXMWTP2vNx9oB2PtnOl/D0v
         YVa6hyzJe4JHHsw4xj4WKe/raGcZj4NM8mrTbe16R7TwBXgFmA3tJkcpRZ5Np7JT9h6q
         08yujrKcCSR4QSMp4xut9FQK+7p75k5+uwt6gbW4/rziRDYHnosfmNSSxq+X7HGxL8cq
         qPlw==
X-Gm-Message-State: AOAM533fk+H3QW52e6ld6qUl761hKvCQWwlubnT2+/khaovlXoIXYKnG
        fsJPqZUyFbfjCZXHHQHI4GYKyERhoQUQSUnWimCVOZSIVGCdUffusypFgtnct6FxhAjOYw/+2Wh
        m//PdsRerpBX0DxI5cZrg60HhJLZ281deDEeBOxr/7ga2gXVg
X-Received: by 2002:a17:906:2541:: with SMTP id j1mr2641018ejb.128.1628671246860;
        Wed, 11 Aug 2021 01:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUUDesTyBO0mfEeagVJdMT7XEVX7qkZudK2JBqae0EZ6aa9xBXY9i63c7YHdfe+UIHaDI96Q==
X-Received: by 2002:a17:906:2541:: with SMTP id j1mr2641008ejb.128.1628671246731;
        Wed, 11 Aug 2021 01:40:46 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id t25sm10875617edq.29.2021.08.11.01.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 01:40:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: exynos: drop undocumented samsung,sata-freq property in Exynos5250
Date:   Wed, 11 Aug 2021 10:38:59 +0200
Message-Id: <20210811083859.28234-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210811083859.28234-1-krzysztof.kozlowski@canonical.com>
References: <20210811083859.28234-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The samsung,sata-freq property is not used (and not documented by
generic AHCI platform bindings), so can be safely dropped.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2ea2caaca4e2..c8c41657988b 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -375,7 +375,6 @@ tmu: tmu@10060000 {
 
 		sata: sata@122f0000 {
 			compatible = "snps,dwc-ahci";
-			samsung,sata-freq = <66>;
 			reg = <0x122F0000 0x1ff>;
 			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_SATA>, <&clock CLK_SCLK_SATA>;
-- 
2.30.2

