Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32622C77B7F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 13 May 2023 17:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjEMRhA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 13 May 2023 13:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231864AbjEMRgz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 13 May 2023 13:36:55 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA283585
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 May 2023 10:36:50 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so9028535a12.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 May 2023 10:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683999409; x=1686591409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j/VZpwFdnGxurx8eGzu/FQ1auFqOPYenlMhH8Ov0CLk=;
        b=ff6vyStrNLqN9ZcVCJ5Mbm8qte0bmFpmogFErKEJG59SGxYoZejhww/tL0tcawu/pI
         6wBqMNYzDcgwl27+2oqvScINogeiVCsVpdOMFN45umrinI/FIgXRurpYM7VC6flf4ruO
         ip03EZZttTg6fL2q7Po419a80AsGfjl/z0SASc3ZHd+4NBZyIwvZS8+hRc+Tlx3hCXfp
         IoNncpIl4uspxmh5kZO47ZrBfQLz8koDw1Oyyp/X0/DL3Av7Ja04Lff7iaLW3VyxY1tg
         AqOJvk4uyk06qqIeYpfN1Akm8yQeqh6iRSMVZpssgM7/vzvhSZvEbBs04mb7EmiNFMcw
         3Gwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683999409; x=1686591409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j/VZpwFdnGxurx8eGzu/FQ1auFqOPYenlMhH8Ov0CLk=;
        b=N6LWNSX2zGhEJoiZ0i41jce9XXMtFh8uoZ0aYtFeqkPnJPXfh/saCAgl5F+2Crv2ai
         VWiCn3r++KK+BVvj0avmJCII2HcbAp7hMSyCg+BkQGO2pQifUFon8pv9agHYO8/HsRB0
         n2kqAr6OhuOv7JD/wtDd2HO+itl7/jRN4OsGkNy2WlFlRBA3laFOdcUvRuaDi3z9/RUF
         mGF4tAbiXamAPuWfhsxVqeVxQ5i+miaIDeCLQQD/9ei5nkLe4Y8HZ9PJs9MhXJ7XyzDq
         RTx0L91Z/8K0aGoXiEaefz41YyB4eBdTZdc+YilQvVpxlIoLsyIrzEx2yV+Wz96zbvy2
         J+JQ==
X-Gm-Message-State: AC+VfDzKx+ujIU31LL6f6ohlrT8q7EuYk9mPu2ZVGCQQQk88JtKRDT5O
        ReCuzCUGWcPsN/ByXHKEUpbEYg==
X-Google-Smtp-Source: ACHHUZ6TrxhRFKdRtKYcJoNagcuU6B5le7moBbShUHLvNG2Kk6j+CTO80hdt2HxMzK5vzuFxxT36ag==
X-Received: by 2002:aa7:cfcb:0:b0:506:83e7:8c6c with SMTP id r11-20020aa7cfcb000000b0050683e78c6cmr23563445edy.10.1683999408823;
        Sat, 13 May 2023 10:36:48 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bc2d:23f8:43c2:2aed])
        by smtp.gmail.com with ESMTPSA id w5-20020a056402128500b0050c03520f68sm5163881edv.71.2023.05.13.10.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 10:36:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] spi: MAINTAINERS: drop Krzysztof Kozlowski from Samsung SPI
Date:   Sat, 13 May 2023 19:36:46 +0200
Message-Id: <20230513173646.4306-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove Krzysztof Kozlowski from maintainers of Samsung SoC SPI drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 746ec43ff244..c6edea4e683a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18711,7 +18711,6 @@ F:	include/dt-bindings/clock/samsung,*.h
 F:	include/linux/clk/samsung.h
 
 SAMSUNG SPI DRIVERS
-M:	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 M:	Andi Shyti <andi.shyti@kernel.org>
 L:	linux-spi@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
-- 
2.34.1

