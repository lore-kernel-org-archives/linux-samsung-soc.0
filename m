Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25291C001DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 17:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbjHHR4a (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbjHHRz6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 13:55:58 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1552A826
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:25:19 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3175f17a7baso4421512f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511910; x=1692116710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0cDrJs50zXCjDACInHgYpsbmw7IC3CDn78nE0wDJEU=;
        b=M9P030ZmUKza6/c7B8NnjeoiOein61E66DGDC8mAo6ARaUpxx33HMpXUo46vICtuHh
         rFalUOFsJOAqeOYN6gsomQ9vPioHHnbUilOvf8S4Gja6R+7uh0wNBCF7jfguKghQDlzn
         yfEKnFAAlGLChCrYPtichGX600RUdPRju6q0Q//WNknssixrL6ks2iW2bTqXoffl9J5D
         I4HFovczK9mgBEw4k+0H0FFUmozRTiO99EO8DU5LdFy3n1zQKD/iZkFyT1FiTQVprGgm
         cvn7w5rVnYsmPMeERZz3XKfa+V1qQnYnMBN6KV8ftEdSbL+vq9x3oGbKFtFnU0Ya7FF2
         SVDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511910; x=1692116710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0cDrJs50zXCjDACInHgYpsbmw7IC3CDn78nE0wDJEU=;
        b=GMrRa0zEMQP5AxkG6Ipmggftj6osa274s5qMyi+Yxh6wgr3Ary0iC3J9Gm8g2JNLUi
         XULUhiiFpnu/XtYMkR6ybOZlRcXAdzeJU7A06A3bPXgZSNb4/0sxyMXv+1/Qsh3JtSOA
         xZYwu/9EP2Hz/FQCatjVUzrkrzeIZH1NwM9GqiGBnodinm7jLh/I+awwbXGbKglpu4KJ
         9C8yo9WsP8rsfQmGoFZi95cHBMcK0rPAwcR1ihrHYaHC3pdU4BZfiakJ1fctQIm+MBb5
         fl6GaC/JcDlumshe5kyOh1GGmk4rRhqJeUBfwYOecSwd2vqZUyh67owAG4X71YLvny4k
         w8eA==
X-Gm-Message-State: AOJu0YwMURfbXB97dQetj5ZjFZVs9j1QYwKehP1pCQqL3CMjbn5nqNct
        a16+Mzk5crU5LQTuaX22Azr9DuCjKN26Qyn4aLM=
X-Google-Smtp-Source: AGHT+IHyCb1MAZ9guoP9QuCWqFrH2Mfihs7/gMTBRCoMInNTntAhiMDP4HfHYPGkmdal7HBOrio1hg==
X-Received: by 2002:a2e:b708:0:b0:2b9:d074:1871 with SMTP id j8-20020a2eb708000000b002b9d0741871mr8655874ljo.45.1691502408584;
        Tue, 08 Aug 2023 06:46:48 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:47 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:35 +0200
Subject: [PATCH 08/11] regulator: max20086: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-8-939b5e84dd18@linaro.org>
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

The max20086 regulator driver includes the legacy header
<linux/gpio.h> for no reason, it is already using the proper
<linux/gpio/consumer.h> include. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/max20086-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/max20086-regulator.c b/drivers/regulator/max20086-regulator.c
index fad31f5f435e..32f47b896fd1 100644
--- a/drivers/regulator/max20086-regulator.c
+++ b/drivers/regulator/max20086-regulator.c
@@ -6,7 +6,6 @@
 // Copyright (C) 2018 Avnet, Inc.
 
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>

-- 
2.34.1

