Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F5EC636CC
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Feb 2023 17:27:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjBHR1W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Feb 2023 12:27:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbjBHR1R (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 12:27:17 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C9A72385F
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Feb 2023 09:26:53 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id z13so6375901wmp.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Feb 2023 09:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IthlQVOkiWnqAVOrcwnjK/hncHhlqSzAla08vNnpBBs=;
        b=ncjbK/IjIRjZSVVCm5UW/GTZ1pFctUORIJobSApOZCmKKSaTi8doyaI2SmDiYIXOuG
         rZCkrlI+NHcVmxry6ifJ4MAkKZL1YE0JPWja0PStq6Aw7JZGWO9Z6S3HdgR/lG5EEbM2
         v/FajlbuQxgf5O1u1+aX3dWS768NFcmn0JB40cDNaGVZaqSOoGIJwwtEMY57DU3SIGAd
         gelL1ma1E7EG3akq1gsdZ1/fgbQgknvnrkX2M+voDswgWdUm7YELvKoejTQ/foUtBQha
         NbORHWu5QUl+RAwboA40YAC7FtpjrbBTL78i+KBfCYD+PsVlz4P/Z7azRNuZfKwG+yqi
         c3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IthlQVOkiWnqAVOrcwnjK/hncHhlqSzAla08vNnpBBs=;
        b=X9OWhensTrfGKLiIhXjAMFc75Id0A17ubsKoamhebVw8bXjhT9tkbFI2QDcKcD2nIh
         2FsObribFfLkt0ik66a1sIKOWHElYyvKHtjJ4S5ctOAus++CB13El2RRfHe6d1xdz90O
         5Pyo7lElIH7DazwYAp0JKR/lv7bP67RepVmby90UiYZFxSJKXiCv/DmCtajK1irWf4vw
         szgaVCvmyJAtyliA22WJNfO3+CX48G+ARAUaPKk2hLzpXRLWM224rYwM+s/19jioJvJd
         GuJbnVfqKpSsYVdiMbE5deSH5i726r6bZhnRM4/zqpCOWHyD9Te2oPEo5iSqdhF2eY35
         zPGw==
X-Gm-Message-State: AO0yUKWdpVSaik6cY8klTolS/bWCMDa4eBuNJDPdXGYrUXp8WwSVqHpm
        HpVcmqAIkrsh5OAE/3sq0P8UJw==
X-Google-Smtp-Source: AK7set9hYTQx01kSCRhx6wENRzX+3TI0Zpz69KEaHspoUsv96TSaQhWtq5bJLXPkeBD+xH475unMCQ==
X-Received: by 2002:a05:600c:16c5:b0:3d6:ecc4:6279 with SMTP id l5-20020a05600c16c500b003d6ecc46279mr7464750wmn.27.1675877207384;
        Wed, 08 Feb 2023 09:26:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h1-20020a05600c2ca100b003dc3f3d77e3sm2624502wmc.7.2023.02.08.09.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 09:26:47 -0800 (PST)
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
Subject: [RFT PATCH 3/3] ARM: dts: s5pv210: add "gpios" suffix to wlf,ldo1ena on Aries
Date:   Wed,  8 Feb 2023 18:26:34 +0100
Message-Id: <20230208172634.404452-3-krzysztof.kozlowski@linaro.org>
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
 arch/arm/boot/dts/s5pv210-aries.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5pv210-aries.dtsi
index 964c5fe51755..f628d3660493 100644
--- a/arch/arm/boot/dts/s5pv210-aries.dtsi
+++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
@@ -135,8 +135,8 @@ wm8994: audio-codec@1a {
 					0xa101 0x0100 0x8100 0x0100 0x0100
 					0x0100>;
 
-			wlf,ldo1ena = <&gpf3 4 GPIO_ACTIVE_HIGH>;
-			wlf,ldo2ena = <&gpf3 4 GPIO_ACTIVE_HIGH>;
+			wlf,ldo1ena-gpios = <&gpf3 4 GPIO_ACTIVE_HIGH>;
+			wlf,ldo2ena-gpios = <&gpf3 4 GPIO_ACTIVE_HIGH>;
 
 			wlf,lineout1-se;
 			wlf,lineout2-se;
-- 
2.34.1

