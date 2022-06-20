Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C5EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244768AbiFTR5r (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:57:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244875AbiFTR5e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:57:34 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034101DA67
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:33 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id ay16so3236785ejb.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rD/1Bx8Gd7OKYwtuHbi2Y1F/IfDjcD3uslaR6lEC5yw=;
        b=ipFDuv4n3A1+nSYNYbYqP4cwwOOxYGDeDoT73Hwaj1DFAB+JRAgNKMJFgr4qHgMqfd
         Qh2KjLziahDKA+HISDeMsTd9uUqE4+vYzkk25EhjzATWhVLJDOXpXXwCXvUYGeljfWkB
         lgNX1Hve9Bd0DdlLwZt1rNvp1wCrIEKIkiHVI9G/TwE6tk/Rc3sZLi/tE56rV6O59s7e
         luHo8jLctvl70fE7onDQAKy5lrrc61ln98NPl7FkgrGob7oK6++vmtIItnXVWtCzqNJl
         wIMtfmNPrHrv92mhQ7cFCa3kDru/TtpAJvRqpsv9n7sqlFLo1+LK/6DYNoMuIrBbvQG4
         2Hsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rD/1Bx8Gd7OKYwtuHbi2Y1F/IfDjcD3uslaR6lEC5yw=;
        b=1K0YuExZa2wRmKeItCJYhoewKSAgQ9Sg5bv3LF4M97mSNplJpsphdM66N9yp5pFz7S
         ZG6XugygEgDWaP2/26NKE5wo/ty50NxGjehAvVIy+Rp8Qx5OrgGMYGg01aByskIu+udn
         GQvkdxDaClCuD3WQkGs9y01w3WuVonfSVFAwXzD0661h+RRF1qnjabdP73c4GQpRt421
         fgmYSKMDvMPoporSOEd0bDX8CwdtCOo8//jBV3SYcmJz33cwq/EvlwL06APgFFO7WkQw
         2GvgWAJEpq9/zKH4pJaZdJkT/YDLZJN+7U+YsanxtsVfkJzT7cAiN9NhyWnBgam+efsN
         HVkQ==
X-Gm-Message-State: AJIora+ZkziQkRmddA6vbJ/zSGHgAIT6EvYnw80NjhXnH/doHkzSjN7Z
        T8kHiTrRwok+vfAl8GVKovwDBQ==
X-Google-Smtp-Source: AGRyM1u+9YCsOQ1AZPpIAWblqHkPcR65S+1pJ2KFrv7M8q6Tf2EKagfh41Ip0cxx1YDAa8W/7iiAQA==
X-Received: by 2002:a17:906:29d:b0:6f0:18d8:7be0 with SMTP id 29-20020a170906029d00b006f018d87be0mr21750796ejf.561.1655747851602;
        Mon, 20 Jun 2022 10:57:31 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b004357b717a96sm4309925edt.85.2022.06.20.10.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:57:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/8] ARM: dts: exynos: add function to LED node in Origen 4210
Date:   Mon, 20 Jun 2022 19:57:09 +0200
Message-Id: <20220620175716.132143-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
References: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED property - the function - to LED node in Origen 4210.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4210-origen.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
index a08ce2f37ea2..82c4ebdf98ac 100644
--- a/arch/arm/boot/dts/exynos4210-origen.dts
+++ b/arch/arm/boot/dts/exynos4210-origen.dts
@@ -15,6 +15,7 @@
 #include "exynos4210.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include "exynos-mfc-reserved-memory.dtsi"
 
 / {
@@ -86,6 +87,7 @@ leds {
 		compatible = "gpio-leds";
 		status {
 			gpios = <&gpx1 3 GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_HEARTBEAT;
 			linux,default-trigger = "heartbeat";
 		};
 	};
-- 
2.34.1

