Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A9DBC64EC7
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Feb 2023 17:27:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231707AbjBHR1U (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Feb 2023 12:27:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbjBHR1P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 12:27:15 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7F8A5EF
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Feb 2023 09:26:48 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id u10so10792228wmj.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Feb 2023 09:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PTB+kn5OHzrK76DFGgifiq/bBOHjSff6c06ytq0LeG8=;
        b=PJQHQB6suTprZ+B5q6crGllreJnIOzwF6L1019hH/KbIaQN5LVKFUiQb34RosXdyIe
         rptvHTsnKteguT0OO4GwP2rRGYxxRrit1lSjPk1DkUo6RlEzdWcHORq8ukghwDKEdRBA
         gQBup0PxXlYGmyXrFynoZkmYkM8HResj1oW+QsgigDgz9pacJOw6Fu9EmT9XXynr4xqN
         otrH3E0RqTKtT7f7Iuhk6ZT4tM7GfhWi/Sm/03qC8zP5BeWVdAaxofCwLFCyhLqjr5+i
         RBJwHAzfXA5wZC/GFUY3Jkhy4N1sUmEd+WGmgy7ezv4fCmppUjfKTfcjdAZT/sSHP1Rz
         3fGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTB+kn5OHzrK76DFGgifiq/bBOHjSff6c06ytq0LeG8=;
        b=oafYST6FUlHEbDPO5oO0aePi3WcGvBUb/sGr3xsMmu42tE7xHWEXc5aDut7W5S1KGD
         Pqqbwc7De48hCwcUYl6sr/P3B/9m5421NPMwBW6HE/V7/8DhRCOftKt6PmSwkQCBGDfT
         U7omONGVXHWrDj9N1jzt/UG8dQToJz+xbjxszOZeU1rtPUQZh6wqX++OR7U6U0m82/W6
         94NaVzfpo+vcnktQC7WEpshCidq4St7XdBLkNfM4pyg/wttGESaYv8p630zGrELBGFpT
         KHPs1NstzSnMI7mYr+KNwQSCHNlW3+YU60EoxJ26VlUDrhDSrDzkYgU6Zj6CJ8NKEA4n
         AdQg==
X-Gm-Message-State: AO0yUKXjvTgKEmw9ImYSTzHIzDu8wDsot8Wnv9cSJk1hUb8hQ/Coh25u
        jDxKP0TI9J/CUjQonC76RAQklQ==
X-Google-Smtp-Source: AK7set870vm3+lGW8S93Tx7ST0ROVr/EZF9AnP+//pii2ImLkyUNYR9v3kXSy0jlT23mL7LhhdcJIQ==
X-Received: by 2002:a05:600c:16c8:b0:3e0:185:e935 with SMTP id l8-20020a05600c16c800b003e00185e935mr7214991wmn.36.1675877204933;
        Wed, 08 Feb 2023 09:26:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c2ca100b003dc3f3d77e3sm2624502wmc.7.2023.02.08.09.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 09:26:44 -0800 (PST)
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
Subject: [RFT PATCH 1/3] ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Midas
Date:   Wed,  8 Feb 2023 18:26:32 +0100
Message-Id: <20230208172634.404452-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The GPIOs properties should end with "gpios" suffix and Linux gpiolib
already handles both names, so switch to preferred one.

While touching the lines, replace open-coded GPIO_ACTIVE_HIGH flag.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index d5074fa57142..525f945c4b91 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -653,8 +653,8 @@ wm1811: audio-codec@1a {
 		CPVDD-supply = <&vbatt_reg>;
 		SPKVDD1-supply = <&vbatt_reg>;
 		SPKVDD2-supply = <&vbatt_reg>;
-		wlf,ldo1ena = <&gpj0 4 0>;
-		wlf,ldo2ena = <&gpj0 4 0>;
+		wlf,ldo1ena-gpios = <&gpj0 4 GPIO_ACTIVE_HIGH>;
+		wlf,ldo2ena-gpios = <&gpj0 4 GPIO_ACTIVE_HIGH>;
 	};
 };
 
-- 
2.34.1

