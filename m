Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD0AEB64D9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 19 Jun 2023 10:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231796AbjFSKOe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 19 Jun 2023 06:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbjFSKOd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 19 Jun 2023 06:14:33 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830CECA
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jun 2023 03:14:31 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51a324beca6so4592380a12.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 19 Jun 2023 03:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687169670; x=1689761670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jmy3F/STWdRiL9bkqBfvVFLMvAXz5VhFeOVkXrx1CF4=;
        b=wQThKrx+V5oo09dQi+r3zPsMwmfjwQyVipEpwJsNEiLF1Z4vY+W0lrXMO0WKykqGOR
         EH4bEpxGufI7N5p//HoX3BtghojxkfiHV26ShxRtV+M58RtL1P41umG9+Z4QnWWcJArQ
         qzjKqqn5R6BHN7dVUY9+MrJs3nCsC6OHLQoJPMqZRuspLOwDALCJoDU/J75gAoo1Xw6N
         wHaEe2kbM+UiltiO0JIgYS3PIUOyj8/p8cb4fxJkOqf5CYhiOK/sVgJL4bNEdK36lKWm
         Do36EAxLI7WhFMAuHg41vlV3zIn5th71zojhqj7WE/aaN/Fy8ruoWGcosnvUZcHTWdJw
         GWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687169670; x=1689761670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmy3F/STWdRiL9bkqBfvVFLMvAXz5VhFeOVkXrx1CF4=;
        b=ISwZSXqLtQZ0afaePQqYIlNT7ZppRuRLGVh56tSYmhwqpDHzFpOIHstu/qeSGQdMIo
         4rj9htiRqwZCrVdIRy55SvaV1TMSvmmDIxJXmWbJ2gCMPV+t8D/vRe71UkcovIvAzGCN
         eN5d8RfMQOJlz3IYym8Kyh/CcDawJYUrFy1eQwoQOoiOoBlY0XPbvNFLopwUz0t5IE2n
         e/gsXvJNAXAn92giP3+nJzr4vSExagwGIQ35DvD0UpxMFFQwZ+P1u8RPmhTf97r7vT00
         R3I0rXqaZB3VknkQxw8th+L/gC3rFY9UdgeYzfgWwwCSRQcCC3T4LYtkDEr162BMVJm/
         HUkQ==
X-Gm-Message-State: AC+VfDyx1VYs8o8cCyRtQEXvbWzHsaDVcVTXlEn+pF84OcXXizHAwlBF
        ctFKogP8u5MnFTcAtH/J6BFDkg==
X-Google-Smtp-Source: ACHHUZ64qvqhSjA86PMKDj5ir0y2AJzbUzQGkl3PfbIW4mBGV0fCUurWI+TSUVL56A6MX4V1lAW8iA==
X-Received: by 2002:a05:6402:642:b0:51a:5ebe:4ab9 with SMTP id u2-20020a056402064200b0051a5ebe4ab9mr920088edx.14.1687169670039;
        Mon, 19 Jun 2023 03:14:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id v24-20020aa7d818000000b005184165f1fasm109431edq.5.2023.06.19.03.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 03:14:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: mfd: samsung,s5m8767: Simplify excluding properties
Date:   Mon, 19 Jun 2023 12:14:24 +0200
Message-Id: <20230619101424.25897-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Mutually exclusive s5m8767,pmic-buck[234]-uses-gpio-dvs properties can
be written simpler, with half of the lines of code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mfd/samsung,s5m8767.yaml         | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
index 10c7b408f33a..aea0b7d57d04 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
@@ -153,29 +153,18 @@ dependencies:
 additionalProperties: false
 
 allOf:
-  - if:
+  - not:
       required:
         - s5m8767,pmic-buck2-uses-gpio-dvs
-    then:
-      properties:
-        s5m8767,pmic-buck3-uses-gpio-dvs: false
-        s5m8767,pmic-buck4-uses-gpio-dvs: false
-
-  - if:
+        - s5m8767,pmic-buck3-uses-gpio-dvs
+  - not:
+      required:
+        - s5m8767,pmic-buck2-uses-gpio-dvs
+        - s5m8767,pmic-buck4-uses-gpio-dvs
+  - not:
       required:
         - s5m8767,pmic-buck3-uses-gpio-dvs
-    then:
-      properties:
-        s5m8767,pmic-buck2-uses-gpio-dvs: false
-        s5m8767,pmic-buck4-uses-gpio-dvs: false
-
-  - if:
-      required:
         - s5m8767,pmic-buck4-uses-gpio-dvs
-    then:
-      properties:
-        s5m8767,pmic-buck2-uses-gpio-dvs: false
-        s5m8767,pmic-buck3-uses-gpio-dvs: false
 
 examples:
   - |
-- 
2.34.1

