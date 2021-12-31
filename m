Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA69FC43217
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Dec 2021 16:22:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231332AbhLaQWR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Dec 2021 11:22:17 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46790
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229807AbhLaQWO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Dec 2021 11:22:14 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B43A13F17B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 16:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967733;
        bh=kDoTHutMEAOdfAvEQmMCvsGPLxW8/ktRUinuzsYc7Nc=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=KJLJlHo0AJqCD4UZgLL97AyGGMSnzkFEI/XD88ePNQ1WVkWNzq1hsQo48yJbz+KHe
         ePI+Kg8SlfoRg9gaQArAPKUNWPX0VgoaUEAoI8VBd+Hjw3FXunCvIpgr6370dmSkBF
         vLldAezy7zBzzlgyHC7+0vqXO7kO4K4K3JNJ9JGeheCYC/DCTvwv1hTmvweKUuRooc
         kF7P7gl2/WP/4xRfaY2v8Ih/icF2CnjYFNICT7DZleeIO6/igCewQhFn6lk8Htu4O/
         rVdNSJGD/2ouVdd+BVGwQAMItBeFgRekgSA+t8tl5c7PNPUTcvuF+Vyvbb0L+AjTdL
         JQTnSU4RYr/bw==
Received: by mail-lj1-f200.google.com with SMTP id a13-20020a05651c210d00b0022e1dc44d53so1404330ljq.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 08:22:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kDoTHutMEAOdfAvEQmMCvsGPLxW8/ktRUinuzsYc7Nc=;
        b=ZFJ7/OYM+HL1Hb6NeELY90T21E6ECzMc8c9K2pKLfV7C/I+hNYTgdiGRoCpVbkTrDw
         rJyX46SCM6ycs3DvGy0LaMd/BzVNpOu4QVVGMgs/JAOTCLE+Do3bR/ilyCGB+pC8Akdf
         yIuOtcoAJuPa7bFl3jHxp7FwsxChi5kN3oBZoXyf3X3mHi/ptpmgizXKVLr1pfhg5Fyf
         NYw3WeP59PyGzslJx1Ox3DlhQB3tEVTI8SQE6IqHVDAckFx8oRetT0kzZ1wyTg8CIKe5
         y2BoYrZBIW8cMVJe3hUA+8VdOSI2CTiusnF5CZ+OCRwaYESSe/Vbhcc0dkhsICD9FmRE
         OU/g==
X-Gm-Message-State: AOAM533ZiSsmiZCERhdqDsiPvVeJ2uEzw2RS0d2h0H6p5pMoWg78kQxe
        cMLYDcPkliXPePSFcQqfhvUS0WypAinCNLfMlcdNUJ6vjUwNijo+TFFcylCo8KsnA0f8GHINRX7
        6QCyMnN4b7VGuI69TBU6AO8oFUi675X7EEbShjRKuk7xQlMuN
X-Received: by 2002:ac2:4189:: with SMTP id z9mr3080463lfh.639.1640967733214;
        Fri, 31 Dec 2021 08:22:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzj2gThzWoyI9QubMge0h0BQecBvCdmbDjWIZBlaRnaejJXNiEiNSgi9MQggMIsd1wLrH6Now==
X-Received: by 2002:ac2:4189:: with SMTP id z9mr3080444lfh.639.1640967733004;
        Fri, 31 Dec 2021 08:22:13 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y36sm2796514lfa.75.2021.12.31.08.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:22:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 09/24] ARM: dts: s3c64xx: drop unneeded pinctrl wake-up interrupt mapping
Date:   Fri, 31 Dec 2021 17:21:52 +0100
Message-Id: <20211231162207.257478-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Simplify the nodes of S3C64xx pin controller with wake-up interrupts by
removing the artificial pinctrl-interrupt-map mapping node and use
interrupts-extended.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/s3c64xx.dtsi | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
index cb11a87dbc42..67a7a66e11d5 100644
--- a/arch/arm/boot/dts/s3c64xx.dtsi
+++ b/arch/arm/boot/dts/s3c64xx.dtsi
@@ -178,20 +178,12 @@ pinctrl0: pinctrl@7f008000 {
 			interrupt-parent = <&vic1>;
 			interrupts = <21>;
 
-			pctrl_int_map: pinctrl-interrupt-map {
-				interrupt-map = <0 &vic0 0>,
-						<1 &vic0 1>,
-						<2 &vic1 0>,
-						<3 &vic1 1>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				#interrupt-cells = <1>;
-			};
-
 			wakeup-interrupt-controller {
 				compatible = "samsung,s3c64xx-wakeup-eint";
-				interrupts = <0>, <1>, <2>, <3>;
-				interrupt-parent = <&pctrl_int_map>;
+				interrupts-extended = <&vic0 0>,
+						      <&vic0 1>,
+						      <&vic1 0>,
+						      <&vic1 1>;
 			};
 		};
 	};
-- 
2.32.0

