Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A2DC001B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 19:20:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236026AbjHHTUj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235986AbjHHTUL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 15:20:11 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866071068D9
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:43:29 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so40357a12.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691513008; x=1692117808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MBd/Q+2ZcBfYYCCch4YtWUjRgawyqEqYs8LS5NaBJY=;
        b=WVDoXb0X4G7NqWcVcqgy3RVQelImjtLTer8ktnuFN4Lys6G+LzFGXiXdY6CA/t492N
         OxIXPbTun12VeXnmzuc9My2AGpy4koX3X0q6Q8uYbQmv7xSUjG3rUxggWUTagyTJ7PCX
         GL7+YF7JQrodAYzBnNSzf1aL52fScj+fa9kvkJr7y7BvISFhR16ukHkrYmLH26icsvZK
         d5gQev+G8p7fV+9j7cOB1nzoMGMBc/nDhvzX7OVPUPiXlhlZ8n5NyhxREytrxx7pdxED
         9060pJbpzcGyZlq27B6m3pc9Dq2S4pRQm9SwEcw1hu48ppoLJAtozVv4a9P79Jc9sc1J
         DK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513008; x=1692117808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0MBd/Q+2ZcBfYYCCch4YtWUjRgawyqEqYs8LS5NaBJY=;
        b=h2kKTmWwA0CDXJm2WTQ47O4zgs/SJdfj31XlzPnwHU5oAyusjEBJ7JOStWXiE+z0dK
         KZp+Q5blnL4fTJGgdbWzhrtOEIoeB+SRHrIXp65DJkGtcp1qu8WcyjC9m60riUPc4EO7
         HJ/oymGCT4t34PkY4QVu3gHhufgzAxIHnIiUzS+jQtskYWEIcWHci79Z8QTV7K3HLM4e
         OwLmA8SJT4nXp9Vbp+uAM3gux8NRTiWhQyiPrTeFs1oX63NAxogzDi8WLjHTWTAxy94o
         gv7B037RgLjq2vuR0M1tsrfwfQ76ob6fBaEB+s3CnuygpJ6R5H0Qh4f+zMRkzZiJHxtr
         Ehyw==
X-Gm-Message-State: AOJu0YzkH0zys9xmmkoQYjmwBAOTehJmlzkkwhZIspoMsNYL18XdA+Zv
        mzxNwiz0Vx8GlK9qHZIgLCaNdQR/dTyN5tYMXyg=
X-Google-Smtp-Source: AGHT+IHYNMNNe16C8Pb0pzogia3/9JPgNoj8pGTGRiE0IjzmUtDSgfL9UVebVwyuLdRgkO5hZzY/1w==
X-Received: by 2002:a2e:8e22:0:b0:2b9:b8ce:4219 with SMTP id r2-20020a2e8e22000000b002b9b8ce4219mr3051478ljk.6.1691502407365;
        Tue, 08 Aug 2023 06:46:47 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:34 +0200
Subject: [PATCH 07/11] regulator: mcp16502: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-7-939b5e84dd18@linaro.org>
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

The mcp16502 regulator driver includes the legacy header
<linux/gpio.h> for no reason, it is already using the proper
<linux/gpio/consumer.h> include. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/mcp16502.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/mcp16502.c b/drivers/regulator/mcp16502.c
index 6c6f5a21362b..7a472a2ef48a 100644
--- a/drivers/regulator/mcp16502.c
+++ b/drivers/regulator/mcp16502.c
@@ -8,7 +8,6 @@
 //
 // Inspired from tps65086-regulator.c
 
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/kernel.h>

-- 
2.34.1

