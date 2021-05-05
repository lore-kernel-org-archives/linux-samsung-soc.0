Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B87DC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 14:02:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F271613C3
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 14:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhEEODI (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 May 2021 10:03:08 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54827 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233665AbhEEODI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 May 2021 10:03:08 -0400
Received: from mail-qk1-f197.google.com ([209.85.222.197])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1leI6M-0008Ro-Tv
        for linux-samsung-soc@vger.kernel.org; Wed, 05 May 2021 14:02:10 +0000
Received: by mail-qk1-f197.google.com with SMTP id d15-20020a05620a136fb02902e9e93c69c8so1162479qkl.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 May 2021 07:02:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uG3IhWnYJ6fyYsVocuySQ5JKR2LBx5PqBbvNRl2SVd0=;
        b=YeMuXBxav27zYh61BEbTHqoTVxise+6Iuu4ijAidtOzJcJ83TccyU+mVA0fLUiVvdf
         lxOHExigblPPf4MJfOC6WnwzByEqWRszInHSMaD4cCR98tA5We7RraaOT775+r9h2bN/
         Wc332lNjW/pVD6sC4oyUMH0TjoKC3gjJ4/eT2GwR6kYW0EMgGUvQzniJE97kKIEoCPZR
         /PiJMpzbSK8VOf6OJpuEujvzcK8SNv2l0VBxOrVHoCYo4viEKpDEQ6Gc+1cymbkzp5vp
         ugakyPt/Z1wOu0X9Qv17qsZo2hlPKxhC0OXPuJR6YhqOOOvvwHexYzQuPKQ3GSHkkzHX
         pvrg==
X-Gm-Message-State: AOAM533gZFmnu1PQ/CtGO0bdm0lx5uiJOf+lOMtaulejUY4A/194Q9tz
        VDNwF845C+Nong5K/CwwCN2uMhLOm19nvs/cFJGyBVymZjfBj3AretL1QnjgZhZb84+fAYqKTH7
        YpIBKLNaI2kszVXQ6MkrHrkZgRkNkIxTDufGqOEoj8qMW8Y3q
X-Received: by 2002:a0c:bdae:: with SMTP id n46mr19634792qvg.8.1620223330119;
        Wed, 05 May 2021 07:02:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvpwKt32Tux6lMKuRokRqen9fF9Fsl6hXDXet9MjMQiWuxT9uXSD7+Nhiu/bsn0sJalz7Xxw==
X-Received: by 2002:a0c:bdae:: with SMTP id n46mr19634777qvg.8.1620223329987;
        Wed, 05 May 2021 07:02:09 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.2])
        by smtp.gmail.com with ESMTPSA id 97sm5016632qte.20.2021.05.05.07.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 07:02:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] ARM: dts: exynos: replace legacy MMS114 touchscreen x/y properties in GT-N7100
Date:   Wed,  5 May 2021 09:59:38 -0400
Message-Id: <20210505135941.59898-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
References: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Replace legacy MMS114 touchscreen properties to fix dtschema warnings:

  arch/arm/boot/dts/exynos4412-n710x.dt.yaml: touchscreen@48:
    'x-size', 'y-size' do not match any of the regexes: 'pinctrl-[0-9]+'
  arch/arm/boot/dts/exynos4412-n710x.dt.yaml: touchscreen@48:
    'touchscreen-size-x' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos4412-n710x.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
index c49dbb7847b8..2c792142605c 100644
--- a/arch/arm/boot/dts/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/exynos4412-n710x.dts
@@ -50,8 +50,8 @@ touchscreen@48 {
 		reg = <0x48>;
 		interrupt-parent = <&gpm2>;
 		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
-		x-size = <720>;
-		y-size = <1280>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
 		avdd-supply = <&ldo23_reg>;
 		vdd-supply = <&ldo24_reg>;
 	};
-- 
2.25.1

