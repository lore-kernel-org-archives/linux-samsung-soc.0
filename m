Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2F66CCA482
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:57:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244859AbiFTR5v (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244936AbiFTR5j (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:57:39 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B071EEFA
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:38 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id eo8so16234156edb.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QdYt/KuZ8ZY9+ff+QpyUq9uIL2yZfZHFaxnC+UiSozk=;
        b=qLTElkzwNBDDwmCKMVWclmi43W4+alHdokrH8RMkKOesGUAkWBitUjkLetqlPBvlLm
         gNuJ4oVMlAUa8WE7tMEs8IRNSLsZzaVPayI/Lj8BmWMtXSiDqQqnrNRXt7Z2A+l6t0SF
         YD5vaW/+C39T0QMGweFTdnBtKsAi1lvSaoDEsCeFclz+hUDaX+hbiwF7rRtIk4R7hSll
         PX+GcMKf405+ZYNuYph2fmfu93bQpSZTsfDVp7VL1V8M+ZyrUMjiuKKmR2F4An9yZ1x2
         AYZTuSlKZGsrjBz/2bPMNh0qvLL6Xj8vv/C6+Nq5QEoQxd10YZHT9HZkiM9fueA1rW9j
         ooTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QdYt/KuZ8ZY9+ff+QpyUq9uIL2yZfZHFaxnC+UiSozk=;
        b=QvQb8/uU1upgGcZNNXMWFIKOef1eUh47HjYJY3wZexGmTTGXCDGfIiQC7rTLkVEo+0
         a94/BhxOe8SelfD9kOHhebtcRc/Tg9MGg36DJKORtl0Oxf887wMQJnJWocreQTNaQrvN
         O2U2T3yTci0LsOB5MxTLMAEgim4Arx5pWe3Xh91CbUoEUcry9vfJ6ZcNMgnJ2kflYWtn
         G0eH270csWYOSHhq6w/Z0nvR+GIKHRW0gPv5OJ03B+nFPX6wj9HUbGTSuLc8DvNsV+B3
         InQVGnVXN69Tb+1BsiaRyE5dLJ4zq14leVy5EJfXlxn3X6ogyfjxn9Bz/0dM+wEzMNnb
         r3Pg==
X-Gm-Message-State: AJIora824UByYSvKTldktHiLTL04Zv5LvaaOFJvOAbAnfarMVumCWu3D
        YYW/3SzheVlDd2QI4ClN7TGhzg==
X-Google-Smtp-Source: AGRyM1uMebg0/BpFhY5Q5IqpYhWsyjyLUKCGWnRAk/WrVI15dgi8rFqj9bqqwWpi9+FapDAJJdhKOw==
X-Received: by 2002:a05:6402:3713:b0:435:539e:a939 with SMTP id ek19-20020a056402371300b00435539ea939mr26643572edb.160.1655747856830;
        Mon, 20 Jun 2022 10:57:36 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b004357b717a96sm4309925edt.85.2022.06.20.10.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:57:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 6/8] ARM: dts: exynos: add function and color to LED node in Odroid HC1
Date:   Mon, 20 Jun 2022 19:57:14 +0200
Message-Id: <20220620175716.132143-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
References: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to LED node in
Exynos5422 Odroid HC1, so we can drop deprecated label property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5422-odroidhc1.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroidhc1.dts b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
index d91f7fa2cf80..3de7019572a2 100644
--- a/arch/arm/boot/dts/exynos5422-odroidhc1.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidhc1.dts
@@ -8,6 +8,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include "exynos5422-odroid-core.dtsi"
 
 / {
@@ -19,7 +20,8 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-1 {
-			label = "blue:heartbeat";
+			function = LED_FUNCTION_HEARTBEAT;
+			color = <LED_COLOR_ID_BLUE>;
 			pwms = <&pwm 2 2000000 0>;
 			pwm-names = "pwm2";
 			max-brightness = <255>;
-- 
2.34.1

