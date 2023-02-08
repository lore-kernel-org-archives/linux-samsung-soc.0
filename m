Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A8A3C636D7
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Feb 2023 17:27:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231288AbjBHR1V (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Feb 2023 12:27:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbjBHR1P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 12:27:15 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC63126CE
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Feb 2023 09:26:50 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id o18so17533189wrj.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Feb 2023 09:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bepz1Z/udBgbBXD5pI7+Z6at3sTDiRBON0IEQlG7D4M=;
        b=cSkUzqywHkQwtAFMOHt60QrzMP673nuDfK7sUlOPosNsYyRfwMcspD5/OwfjD49wBn
         SP9FP9JKN8Pfme9DsDrIcr9ysAUEjb4rxG5CfYF+mdiWr05afyYZVIYcJ0YKmPP7g1CN
         kaHp8XETnecVsWRxbk07G/shclciwhxndIJvF5rPnpsuoojFu2Ijr/EdH7pYsId2nGJT
         LeMkPehFWCL+aOStzT/iQIYCS8y3J16M+po29pnjfRRoReTMEfmQNS83w3cxyOX3/ZAj
         rv3JUQFhWoAnXvO7e56Hmen0K5MIRT5nEqrEh8J7M3ayRWb8VhI25s+HB4wURRRQhh8X
         0DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bepz1Z/udBgbBXD5pI7+Z6at3sTDiRBON0IEQlG7D4M=;
        b=G2jB3OfOO6FVJnX9YoaiDxZjniLTwJ/s7OwE2st7Hq0qUs3Ella7IjSVAPAGziq3m1
         dVptdErDdohZMbzECz46ddjpfsmx3Tw3YDUnj4CkcmFsEXjqZK0SD0ElzyxI9YWTECnw
         wcAQQnC2gs93qsj6OqxmmOY60kfu8hryF1HOYav8VL0VNpmRRK1n7YhoAMGOqhkU0Jhs
         /nYA7laJa0Qh+BEIzQYiVDRmnC/x+myXMj4bcqoTSuWmI7CJ/kkLP3RPmTAGX7L7PZeY
         wFb7DnIp99S8Z9P419VzjDcBWtfAoTsGoANCiqR4JapJOWY/d9NUN0LlRXgA21WMHrKz
         N0IQ==
X-Gm-Message-State: AO0yUKVv2a8vfcKHB8syquNlfWpCGGFkX7H9spUzWg0gxlyyt6AZ3209
        k1U+j5OuczcPXRB+pgoBYA3jIw==
X-Google-Smtp-Source: AK7set9sIVeegYMYb+vFVH6Qx/wCEg9tvUvr35XorEpbq2zmYuYPix/sJedoX50P3YgGazJE81nOSQ==
X-Received: by 2002:adf:ea45:0:b0:2bd:c1de:a33f with SMTP id j5-20020adfea45000000b002bdc1dea33fmr7574384wrn.19.1675877206114;
        Wed, 08 Feb 2023 09:26:46 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c2ca100b003dc3f3d77e3sm2624502wmc.7.2023.02.08.09.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 09:26:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>
Subject: [RFT PATCH 2/3] ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Arndale
Date:   Wed,  8 Feb 2023 18:26:33 +0100
Message-Id: <20230208172634.404452-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230208172634.404452-1-krzysztof.kozlowski@linaro.org>
References: <20230208172634.404452-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The GPIOs properties should end with "gpios" suffix and Linux gpiolib
already handles both names, so switch to preferred one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 6134bc9c8212..2e3da5670bc2 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -537,8 +537,8 @@ wm1811: audio-codec@1a {
 		SPKVDD1-supply = <&main_dc_reg>;
 		SPKVDD2-supply = <&main_dc_reg>;
 
-		wlf,ldo1ena = <&gpb0 0 GPIO_ACTIVE_HIGH>;
-		wlf,ldo2ena = <&gpb0 1 GPIO_ACTIVE_HIGH>;
+		wlf,ldo1ena-gpios = <&gpb0 0 GPIO_ACTIVE_HIGH>;
+		wlf,ldo2ena-gpios = <&gpb0 1 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.34.1

