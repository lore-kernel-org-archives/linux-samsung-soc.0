Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0423C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 15:20:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8791261177
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  6 May 2021 15:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbhEFPVu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 6 May 2021 11:21:50 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41502 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbhEFPVs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 6 May 2021 11:21:48 -0400
Received: from mail-qk1-f199.google.com ([209.85.222.199])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lefo1-00037v-SH
        for linux-samsung-soc@vger.kernel.org; Thu, 06 May 2021 15:20:49 +0000
Received: by mail-qk1-f199.google.com with SMTP id p17-20020a05620a1131b02902e45c6e4d33so3722100qkk.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 May 2021 08:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cQf4MjiqPeV3cfZrYpEWKZORZH0m9Y7Wed5/vpwhH/8=;
        b=sqkWOXb5fkKM/CK8qPZu6LbsMGcS2kjQvhCYdHg3++x/x2AH2f0PWVAk82F2a22JOY
         CHyj30bjZfotEaI7nv6T1FA7QLALKazJCFxKfiVVsZ0UadTRCqUBY8rI37X7aL7YL82e
         27PilNP/y+yb2EqFzE8qLt5qJq46EQGGf1tdqfRmTRYeh6cZ2DtlFK5IGVdS5pXbDsmf
         X0+BrjwpzZfdeCBwYOU5rzdlazK9lcxodzzvt6b3mTgMmSPDsZZmZjvpWT4JggBaniii
         Psya2pWAEXFPyfphVyBb8u3AYuSewA405bS+DDsihtGKVQgJyfpP3SYbhdTd+Utro3SC
         hvZg==
X-Gm-Message-State: AOAM531sgNd8t88WXhQy5QSJAU8zI4c21EaQco5DHcJvKDg99oqz6ExE
        maEfKQRyrvMSOhNnvBzgAoa3TNzl/VF/LtOU5x0KiTaHWCjY1B0PIVl5G+NQiJ1AR1cz8gw0mCo
        R/eaStzfQDnauxLWu4FSUbie9LMJ7uLRm2r7C2BX1Mcy6yo2t
X-Received: by 2002:a37:6850:: with SMTP id d77mr4605619qkc.57.1620314448557;
        Thu, 06 May 2021 08:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiaCcE9k/KLZzFM/F0Z3mcERK+7wGrNRw+WINMCIvWA+NLoEI5nNx/djusvRAdAwLVIH/T7g==
X-Received: by 2002:a37:6850:: with SMTP id d77mr4605603qkc.57.1620314448407;
        Thu, 06 May 2021 08:20:48 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.3])
        by smtp.gmail.com with ESMTPSA id 19sm2115882qkn.111.2021.05.06.08.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 08:20:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: s5pv210: remove unused Atmel touchscreen properties in Goni
Date:   Thu,  6 May 2021 11:20:44 -0400
Message-Id: <20210506152044.37579-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Atmel bindings and driver do not use custom properties like
x/y-size, burst length, threshold and so on.  The driver gets necessary
data from the device directly.  Remove unused properties to fix
dtbs_check warning:

  arch/arm/boot/dts/s5pv210-goni.dt.yaml: touchscreen@4a:
    'atmel,burst-length', 'atmel,orientation', 'atmel,threshold', 'atmel,x-line', 'atmel,x-size',
    'atmel,y-line', 'atmel,y-size' do not match any of the regexes

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/s5pv210-goni.dts | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210-goni.dts b/arch/arm/boot/dts/s5pv210-goni.dts
index 5c1e12d39747..c6f39147cb96 100644
--- a/arch/arm/boot/dts/s5pv210-goni.dts
+++ b/arch/arm/boot/dts/s5pv210-goni.dts
@@ -358,15 +358,6 @@ touchscreen@4a {
 		reg = <0x4a>;
 		interrupt-parent = <&gpj0>;
 		interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
-
-		atmel,x-line = <17>;
-		atmel,y-line = <11>;
-		atmel,x-size = <800>;
-		atmel,y-size = <480>;
-		atmel,burst-length = <0x21>;
-		atmel,threshold = <0x28>;
-		atmel,orientation = <1>;
-
 		vdd-supply = <&tsp_reg>;
 	};
 };
-- 
2.25.1

