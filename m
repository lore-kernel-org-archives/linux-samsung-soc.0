Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C53C001DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 18:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232849AbjHHSAg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjHHSAP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 14:00:15 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 270672C9A5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:27:36 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe5695b180so23735375e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512003; x=1692116803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NUr4rBKoQ5U9kNDxTC6J3Fd6dDx63tGiQB8aHXquZB0=;
        b=WUi8MGhbt1J94FKJX0OCMHhxHhm7MxscNpEDL07HqJLGS2tN7I1xjyCfutHwSSkvR0
         +nGU/d5T7hVPpP9+Uu3lXO5MtiY2dq1oETV/gwljnbA3vo0rFY4Qy7ruw0Mn7WFEIbV9
         19rZujkISslOBuB+l+yVX6BDu+qSDsMx/k9mc7d4CtZNnz4X0EBi8wl7ilbfToREeOGC
         nMyGeHOBrp0dLtlXXPjNC+2y3jELlNssUO/eOObmuF+1xRdDcOv4drOwwZKWR5Tg1qWt
         uXHdwwoDUWaBnzCJJ8U/qfHVD3vI88fo0oQn3HcHxYHffnPCOodLESWpsQP90FM7KWmu
         62cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512003; x=1692116803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NUr4rBKoQ5U9kNDxTC6J3Fd6dDx63tGiQB8aHXquZB0=;
        b=FT2X1AkdBW0tEjtGyxCxKG4xu7rxzWqGiRdldpYCA1EMBbnBKktxiCaOMye3DYndjq
         jH1cDy5SGaMLxuXJo1CaY3dPeGkSXW9YR4lPFY3zlTe8ybBA8LHH8YrEh7WjxOdEQGol
         mT4ZP57cSUcPIxnY4ptSZ5yWx5cbqdOSUzAmHPIOGYpa1GppaH1ndOW/JVl1/dPQGOZo
         Mrm70Y+mot6gCckfLjpherTvXfe4LWxgPLWwzZ0Rg5L8JBJUftUedp8K8KatNA8beJSb
         1VorAwM7lqRxHYJ4zRodHXDvszWo/ITEjdb1JLaIPY8YwkF68DdgYu5eCX0b93NqwjR4
         YAWQ==
X-Gm-Message-State: AOJu0Yyfw9auzmTDbdvY2n1LPDcgo950+/LcxSKmJ+8N5vhKt1SgSVFX
        a2jI4pzEI9bbYAGH4Udl4c5uMODviaftbSHR/gs=
X-Google-Smtp-Source: AGHT+IGl6ac+w+vJLfJZuq8P35/Ynv+o1liAhoqzrNLA3A9/ISpnNwHIwbTBb6DgRgGMJoZAmBq78w==
X-Received: by 2002:a2e:95cf:0:b0:2b6:a763:5d13 with SMTP id y15-20020a2e95cf000000b002b6a7635d13mr8927600ljh.27.1691502409667;
        Tue, 08 Aug 2023 06:46:49 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:36 +0200
Subject: [PATCH 09/11] regulator: lp8755: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-9-939b5e84dd18@linaro.org>
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

The lp8755 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/lp8755.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/lp8755.c b/drivers/regulator/lp8755.c
index 4bc310f972ed..8d01e18046f3 100644
--- a/drivers/regulator/lp8755.c
+++ b/drivers/regulator/lp8755.c
@@ -13,7 +13,6 @@
 #include <linux/err.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
-#include <linux/gpio.h>
 #include <linux/regmap.h>
 #include <linux/uaccess.h>
 #include <linux/regulator/driver.h>

-- 
2.34.1

