Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A867BC43460
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 14:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BA34613BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 May 2021 14:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233690AbhEEODO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 May 2021 10:03:14 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:54838 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233696AbhEEODL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 May 2021 10:03:11 -0400
Received: from mail-qv1-f69.google.com ([209.85.219.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1leI6Q-0008Sp-PA
        for linux-samsung-soc@vger.kernel.org; Wed, 05 May 2021 14:02:14 +0000
Received: by mail-qv1-f69.google.com with SMTP id l5-20020a0ce0850000b02901c37c281207so1714580qvk.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 May 2021 07:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PTU4LvKoIv4gbIfQl210SnqkxjG4gaXmVLweqPSDUqI=;
        b=VfJQlued7dyO8ImHUqPmv48GQdKVkhNBAbQfIoziI4/vJZz+39VoWqBqw8W9PN7Qv5
         baxFUvT3PZB34aQk3c4krjKrbJ+shx9Y+V9G3gk+eNIvIWTlyOtLT2yyo43eDfI+lhkZ
         6ZIa3V+K81usQXofM9POuyWEkPDgTDx0zHymU3suJr5odsOCAOSuGDLjUuZJIgYLTN87
         /z/MVH9VcB1xG5A3iS8rEpMZzWR5kq7wU6YvvC1xdBXkUTLNzNRy9Dzioggr+SH3BGvS
         LwFkPpzsV4nQ//oRdeiqv31PqCoajfh7Rg5Z253htHi2lf6jluwfUA7VmVwHTS7qdmds
         dPfg==
X-Gm-Message-State: AOAM533D/omKHsMXS7jCURGJSYUkIpH605JsMZQ0XzH8Nu6LwGrOCM/O
        FcMA7vD18XjhcWXrQhuOirTJW9G9zg9pS6MOvZ34KbzYtah7xQIiKrKnxENyPoVTl6GOa0HLxnF
        +gU0H/y8vei5JmnY4wuRGKKuIs9QKr9Pl2un5QpSa+JTCz0Ip
X-Received: by 2002:a37:a6c6:: with SMTP id p189mr22059579qke.161.1620223333157;
        Wed, 05 May 2021 07:02:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNcZdZr9OarCUN7JS5MpdDZOe89c0ANjh7iN+CrZx0Za+sQThYLZ0fXL8V4Op7GS3d+n0c6Q==
X-Received: by 2002:a37:a6c6:: with SMTP id p189mr22059565qke.161.1620223333014;
        Wed, 05 May 2021 07:02:13 -0700 (PDT)
Received: from localhost.localdomain ([45.237.49.2])
        by smtp.gmail.com with ESMTPSA id 97sm5016632qte.20.2021.05.05.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 07:02:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] ARM: dts: exynos: fix PWM LED max brightness on Odroid XU/XU3
Date:   Wed,  5 May 2021 09:59:39 -0400
Message-Id: <20210505135941.59898-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
References: <20210505135941.59898-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is no "max_brightness" property.  This brings the intentional
brightness reduce of green LED and dtschema checks as well:

  arch/arm/boot/dts/exynos5410-odroidxu.dt.yaml: led-controller-1: led-1: 'max-brightness' is a required property

Fixes: 719f39fec586 ("ARM: dts: exynos5422-odroidxu3: Hook up PWM and use it for LEDs")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
index 2fc3e86dc5f7..982752e1df24 100644
--- a/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
+++ b/arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi
@@ -22,7 +22,7 @@ led-1 {
 			 * Green LED is much brighter than the others
 			 * so limit its max brightness
 			 */
-			max_brightness = <127>;
+			max-brightness = <127>;
 			linux,default-trigger = "mmc0";
 		};
 
@@ -30,7 +30,7 @@ led-2 {
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

