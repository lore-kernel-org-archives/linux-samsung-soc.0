Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4918DE9271F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 16:05:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235789AbjJEQE4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234310AbjJEQDt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:03:49 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8539186830
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 08:57:31 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3231d67aff2so1168085f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 08:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521449; x=1697126249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WotVRIx4IfQWLl7bsIqhgSrhHJCYtM2efkzCcXjlJ0=;
        b=fKN0FNxZQsnaKhU8KpZohEQIexiyaLjkt2O8JHVuY7/rXBtmgp3DFt7ZxA0wRpyq5b
         AuEruZGCxhuOFpECFlxMjvVYAxLQfeUWE/RB86KG13uiKAQYpWJ76kTIVA2MytD/TlnV
         1nRdb/Y9JepnHmfTfIxzx9TJlhQRXRoq11GNI1fK59ETXEI4RIzTHSG9PSH6GS5K+ekz
         u0YLO8grA92CM82ZjQ4HEfd0Hw0ArC28hrC9XdFCkqR2t3OQuMCJfyvFs9ZsQu3RH9n6
         U6LSF1g+6XbMis2C9W7lVPCGzxoOrTEsVEL0CX80rtx/5ctxE/LPwqra+9vOh9w7EDLA
         C1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521449; x=1697126249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WotVRIx4IfQWLl7bsIqhgSrhHJCYtM2efkzCcXjlJ0=;
        b=b6R171WgKmDvTINMkA+9PDaDaxLOhCJwj6eIoO/AAvKdZQg00HRLKhbV25UrSB5hVk
         31TIfs2mfbQRHFEHUouYcwsyvFkZ+YGeva/cYRSCD4CfGbLca+d5+8Fj0FG9GodEeRga
         Qy35nUafBsy20MCgf0+CbY695I5VKNEpyJOaN4w8Pv6THsA2OU+audtnvzBxw7APAdo3
         mNoE8JsENe3e70ajqJv6MZVA8Cr6supsI4Et+DfJl/1kCs+D8yWvDEszWt9jctl9k4uJ
         06qRmvZ92cTfmYCA/xB/HZLHwH0BXF9K6qcr7D649vipCc8d8qUTIaOQqdM6lAGUnqX2
         SVXw==
X-Gm-Message-State: AOJu0YyevViRf7DD2+pHJuWMAEtdC/DlPoQaxFEQJRBxGs5QWDy1zekh
        AIcw7ENOguHomrzTFQwwFnEAMQ==
X-Google-Smtp-Source: AGHT+IHb0s500PrFGOrLeuuBwpGQ7OFg+clB+5dsL7CoXu4v4IuKDCuex94QNDTzGTMDp0JcDuLSUg==
X-Received: by 2002:adf:cc81:0:b0:321:5971:23a5 with SMTP id p1-20020adfcc81000000b00321597123a5mr5355332wrj.20.1696521449677;
        Thu, 05 Oct 2023 08:57:29 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:29 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 07/21] dt-bindings: pinctrl: samsung: add google,gs101-pinctrl compatible
Date:   Thu,  5 Oct 2023 16:56:04 +0100
Message-ID: <20231005155618.700312-8-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add the "google,gs101-pinctrl" compatible to the dt-schema bindings
documentation.

Add maxItems of 50 for the interrupts property as gs101 can have
multiple irqs.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/pinctrl/samsung,pinctrl.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
index 26614621774a..e0f37f8ae8e7 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
@@ -54,11 +54,13 @@ properties:
       - samsung,exynos850-pinctrl
       - samsung,exynosautov9-pinctrl
       - tesla,fsd-pinctrl
+      - google,gs101-pinctrl
 
   interrupts:
     description:
       Required for GPIO banks supporting external GPIO interrupts.
-    maxItems: 1
+    minItems: 1
+    maxItems: 50
 
   power-domains:
     maxItems: 1
-- 
2.42.0.582.g8ccd20d70d-goog

