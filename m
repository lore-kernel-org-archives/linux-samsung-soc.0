Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A90C25B4E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbjATPyT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbjATPyS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:18 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943F8CE21E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:15 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m15so4435410wms.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3737LN6JMArpu9npMGU+/Di0awr+ndesozY0qYT5pM=;
        b=daroAtBqlgELP+ojMemB7rJDnmTABKAOHct0ITbz0JRCQ4Mcgf/bMAgUAP3dxQFuP9
         u5NjepYEpMcGu9tsXR/W8R2IfFWJs9+CuNwVFWJ4u+oTI7NluSFsN8InXYbx+I79KqOu
         QaT6hRb1U2ThJsG9OMnJesDqkkSh+3LPoOBaOk7dwYeVDHhGmkh6N74fqnJjESZcaQGj
         CIUxqfzHXhM0oJldiqcZUS1xyIWMFPjtXmTlslJ4NH3MD42rWTolZMVOZ8izlWG1rwr7
         X4ss69iNCkkxy9iLJLYjoa1zEWStZ9qnBXhwf5NMpaGw2wEXTuqpbhEGZLZuPsRHJeuA
         ms5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l3737LN6JMArpu9npMGU+/Di0awr+ndesozY0qYT5pM=;
        b=SfLoaVLOd6AYxoqRJ8vHqXrSYHDuMOk6UeKdukww7t1p6wYVShlavkH3jbn47aQH5M
         cYa0xk7IX+9D6NX9G5nF4iXKfBIzDKHiMyadnf7DEi9UZmKMj62XveGhlBZQDxld7ILg
         xlK14a/NEiquH3QCbnXRKMCiflrfGwzGfbghNDpH5+8W/oPAkcO/x/0g9SqvZ6z/MTTD
         VAwVuc1O2GoN03GwYjgK3ebChlj+Y8lkA1aAgHsphKqJTMFVwWHov6/Lw6jqQUZmeQGk
         FxefERno+ggDYfKP7C1w1bX1VEb/3KimuE8rHOftVO0CY6MY7OqH4ryu6BFZM8yyLM3P
         pHhg==
X-Gm-Message-State: AFqh2kqkjHgRC8FwPLB3wL1cBWoX2gTJMPXb3BBp1toOuR895nxQvec+
        kMH1JQVUw2+m3bhyAJueSxwvmA==
X-Google-Smtp-Source: AMrXdXsskLxZJgCL+QLsAneKnFsLGIgjGgUszvjm3IYoSEj0LnnRUNqouyz4gC2xlsUY7NfV/btyqw==
X-Received: by 2002:a1c:4b09:0:b0:3db:f0a:8726 with SMTP id y9-20020a1c4b09000000b003db0f0a8726mr11538534wma.28.1674230054169;
        Fri, 20 Jan 2023 07:54:14 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/11] ARM: dts: exynos: correct wr-active property in Exynos3250 Rinato
Date:   Fri, 20 Jan 2023 16:53:54 +0100
Message-Id: <20230120155404.323386-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The property is wr-active:

  exynos3250-rinato.dtb: fimd@11c00000: i80-if-timings: 'wr-act' does not match any of the regexes: 'pinctrl-[0-9]+'

Fixes: b59b3afb94d4 ("ARM: dts: add fimd device support for exynos3250-rinato")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos3250-rinato.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 6d2c7bb19184..2eb682009815 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -250,7 +250,7 @@ &fimd {
 	i80-if-timings {
 		cs-setup = <0>;
 		wr-setup = <0>;
-		wr-act = <1>;
+		wr-active = <1>;
 		wr-hold = <0>;
 	};
 };
-- 
2.34.1

