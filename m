Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6520FCCA47C
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 08:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238775AbiFGIyR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 04:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238812AbiFGIxz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 04:53:55 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C527AE27B0
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 01:53:49 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id h23so22696338ejj.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 01:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pIg+CahqaTlAIc8abTH45c6tboCmTrQs/b0+gs1DDec=;
        b=Wmt3WkfQAxJcyqO1RMeCSulBf5MfEf6x75VtRaiFDlraQwBAMff94cvZ9wxr3eUYYp
         WbsAQq/aRiNWZqNZxEa5bPCuhDtRA+xxD/OprmefYpSXPw3iKnflHtqdYitflmY8gBoG
         Q3lVXN6UXdlylxdKjEF0c5ZVFDFQLG4QEu5xZ8IUL89SnMPpvRXn1IKpXD8jbTIUw5zw
         P9830DYNdaJsOQFRsjlAJVhj9sp7xBmAz3dQ8P+IdCjSVfg1A3VHepmFtdgFRq0UFiV0
         QuGoZTKMji54VwMzTG+rk7MtTQVxdDlDYRbbguBlFH45X2ep7iNj0m90pncthDsG81Ct
         WfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pIg+CahqaTlAIc8abTH45c6tboCmTrQs/b0+gs1DDec=;
        b=zrxGkBtNGLKA6kasZsTFplq0GO3wHd63xwigA10PydfaJe9IxQW9k5iaoA8bXhB7BV
         J+OR1Adj9XiteNiJdl7O/mzKi7FWNYVHHXBVwYL40Y1oJ/Z/GaKodmvpgZRWApdLTw3z
         8IiKWktWub9r34AIS7EJFoBIjiSYSX0g1aUzxpwLBJ6R5yQkOwwPWE0PFjFFyX8geaOC
         eVVmJGxhChj80fu6loQ7ox3iv+Z8FQIaB1DiPBG03HrXn1W3UgdWD2MdxjEZkoEjV40s
         5ASODqQRXwZFV+UVqxxI+1jWXklQkMrCcZwMqqkd0z6Y9TQJd2YdMi2YTSqIKJYNgczY
         9UxQ==
X-Gm-Message-State: AOAM533P8aaD1xm+34q0TILbAOkuW01i1nTA7MBhanH9yl2oZzVRWDVM
        xTzS7FHxZP5uz7lu23Uv8cxAWw==
X-Google-Smtp-Source: ABdhPJzlc4UfIcbo4lt+tExZxEqs80aD/mhH62tRVZNmsGTPLGAWchklnkFLnZ78s0lUo5qmG+VEiQ==
X-Received: by 2002:a17:907:2992:b0:70c:4ddf:5d88 with SMTP id eu18-20020a170907299200b0070c4ddf5d88mr21824993ejc.20.1654592027886;
        Tue, 07 Jun 2022 01:53:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k16-20020a1709061c1000b00705cdfec71esm7176703ejg.7.2022.06.07.01.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 01:53:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ARM: dts: exynos: add function and color to aat1290 flash LED node in Galaxy S3
Date:   Tue,  7 Jun 2022 10:53:43 +0200
Message-Id: <20220607085343.72414-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607085343.72414-1-krzysztof.kozlowski@linaro.org>
References: <20220607085343.72414-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add common LED properties - the function and color - to aat1290 flash
LED node in Galaxy S3.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 72901772fcad..d76f3678dcab 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -7,6 +7,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/leds/common.h>
 #include "exynos4412-midas.dtsi"
 
 / {
@@ -27,6 +28,8 @@ led-controller {
 
 		led {
 			label = "flash";
+			function = LED_FUNCTION_FLASH;
+			color = <LED_COLOR_ID_WHITE>;
 			led-max-microamp = <520833>;
 			flash-max-microamp = <1012500>;
 			flash-max-timeout-us = <1940000>;
-- 
2.34.1

