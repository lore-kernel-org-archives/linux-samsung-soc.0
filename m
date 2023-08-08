Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2111CC001DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 17:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbjHHR5X (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbjHHR4c (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 13:56:32 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99A4844AA
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:25:34 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bf91956cdso769625066b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511924; x=1692116724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tJ6rclTR0PEh2oroSnTnDtEG+/lNahgfPTnucDt2ik=;
        b=tc1sSPEoLW/wJNv1Hszn+BIBihepQ6vMCYWy1OlaUNdIZwzAk3jw17aj8u4M0vufgj
         VuWI/bsH08+yDX8xJm0AgKnoKjMO/CFMQl4h6mtAQDOYz7VOrAmQ9foOpypn6QnY0r+q
         nTbp+BKaXChHksiGqhjp6bDsA9PqXY9dzRo9SRKZZ32qCqU1g0FDaOIp50/kqdbMbxPz
         cizA4u4UtE2MHZzHnA9VuR5/ULECvbbflf9L4G44gGJOTDHcbwX5oJ1/FhvJP61L1Ak8
         7F6LM4PSyuW/cufBz1S3vIuGpAReiif3bx3T8Q7/EddZSQrDh2C4+d80fpM3MEM7LA18
         LeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511924; x=1692116724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tJ6rclTR0PEh2oroSnTnDtEG+/lNahgfPTnucDt2ik=;
        b=JNtTZ9TcKb4KtSFZqOOPnqDRB79v/1/r6w8kKyfK18zooMA1VpIFpLxY899YKv43KM
         CpGROQNHnntVR8q//fIyB5jUT7rIBySFsj/a7+p05QgXPOnxEcyqWekGqMoGybkaQ3oj
         TEpoFM9kyAuFkwkVpeXvCnlCrSm2OUihS6oAifuP7dDsfFYXZByhfaKrVyeGYa31WDiB
         VnLrH41pt4nk/F/BaTLHpwczD6QA7YV78vD9AzXE2I8E9e68zZy2Haq341xzjJJ5cF4k
         vNuMISU8rFt9sfrbcOC/wf9dbrNX1qaJLNxo1nSegpqlFem+BCkUxg/thq5/p1Kijlta
         mfIA==
X-Gm-Message-State: AOJu0Yz2N/qNFuQRx66F03Dl7p+Bd/avah9n4EoS7DYtyez0oHVGgq3w
        YFleNUeoTlDCfGlRJRR9Ve874x7BZkBaNIFwNWA=
X-Google-Smtp-Source: AGHT+IFYJ1tDnISQpqIa3O1xFstJdgHXSmoJBbKAjvv0Omwmg90Vc69nrF9vgwo5e9S+tacn/hSCZQ==
X-Received: by 2002:a2e:9b01:0:b0:2b6:c790:150a with SMTP id u1-20020a2e9b01000000b002b6c790150amr9582164lji.22.1691502405476;
        Tue, 08 Aug 2023 06:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:33 +0200
Subject: [PATCH 06/11] regulator: mt6311: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-6-939b5e84dd18@linaro.org>
References: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
In-Reply-To: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The mt6311 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/mt6311-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/mt6311-regulator.c b/drivers/regulator/mt6311-regulator.c
index b0771770cc26..63a51485f2cc 100644
--- a/drivers/regulator/mt6311-regulator.c
+++ b/drivers/regulator/mt6311-regulator.c
@@ -4,7 +4,6 @@
 // Author: Henry Chen <henryc.chen@mediatek.com>
 
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>

-- 
2.34.1

