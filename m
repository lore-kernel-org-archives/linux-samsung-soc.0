Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F2DC43460
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 14:02:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57001613BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 14:02:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbhEEODc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 May 2021 10:03:32 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54851 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbhEEODU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 May 2021 10:03:20 -0400
Received: from mail-qk1-f199.google.com ([209.85.222.199])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1leI6X-0008Ul-RD
        for linux-samsung-soc@vger.kernel.org; Wed, 05 May 2021 14:02:21 +0000
Received: by mail-qk1-f199.google.com with SMTP id s10-20020a05620a030ab02902e061a1661fso1181640qkm.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 May 2021 07:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aFybNoYvXXuMhUMueJoFGIOzsnT8VCCuO9x/0O6WW3Q=;
        b=krNDotDwST7V/ElRceM6afu3UPJ2P/UX4c76dgVdvRq6kMx2yK2RLg3L6ngvVn6wAQ
         dAfO09Fd3xzbORu8QX7d1nCs/rmZXWiswlJOGquFNAsa1+Fd9QyRuk0F3qT0CD4ovj2n
         ezBsffs1eVc5sraoybPw8lZ1kj5OwuKN67431rARzDDmp+V4zNaCT2jyCQswak1Ptcai
         JD7LpujNdCpKIlZwqRiHyhr0ryIe81EvPk/eIBbyhzHYn2BWTmkPu8W+LdDB6QemBszO
         kA9+4W+wmrwEgAlEmEK/NGnH7d+QPluyuKMZYPs8LQ0F5F5en4oMXAWyU6+HLLeaPX+E
         ABuA==
X-Gm-Message-State: AOAM533TpzNntS09g8VB2EBqjCjvOUPV9rrPqW7hpnDds2xRTRitQIOB
        ijZ2n6iRdsK2yUkLyyQz7knomOsSsHEdoiN+R7FidAzWX2RYXiLstNdYzI+r2JcWpB+owv/zbY+
        CPnEMZp42BdTsDaQw0RzcdTbjOBxC+SVe6tyYtCouzSUH675K
X-Received: by 2002:a05:620a:4008:: with SMTP id h8mr30402467qko.366.1620223339202;
        Wed, 05 May 2021 07:02:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxIh64S24rt8pIj4QLk85n1rPZ1rAb4wDfcLPTkMNb4AjA8b8DYcHICmN8fDtMnm0CAKo0PHQ==
X-Received: by 2002:a05:620a:4008:: with SMTP id h8mr30402338qko.366.1620223337602;
        Wed, 05 May 2021 07:02:17 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.2])
        by smtp.gmail.com with ESMTPSA id 97sm5016632qte.20.2021.05.05.07.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 07:02:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] ARM: dts: exynos: fix PWM LED max brightness on Odroid XU4
Date:   Wed,  5 May 2021 09:59:41 -0400
Message-Id: <20210505135941.59898-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
References: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is no "max_brightness" property as pointed out by dtschema:

  arch/arm/boot/dts/exynos5422-odroidxu4.dt.yaml: led-controller: led-1: 'max-brightness' is a required property

Fixes: 6658356014cb ("ARM: dts: Add support Odroid XU4 board for exynos5422-odroidxu4")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5422-odroidxu4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
index ede782257643..1c24f9b35973 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
@@ -24,7 +24,7 @@ led-1 {
 			label = "blue:heartbeat";
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
-			max_brightness = <255>;
+			max-brightness = <255>;
 			linux,default-trigger = "heartbeat";
 		};
 	};
-- 
2.25.1

