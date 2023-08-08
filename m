Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB51C04A6A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 15:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjHHPxE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 11:53:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjHHPvR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 11:51:17 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38A584ECF
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 08:42:42 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99c10ba30afso1457234366b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 08:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509332; x=1692114132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcDUBR/c5KhjxO4gQ1CxNRP1ojo3Pb8MjcUkheghccA=;
        b=NBQNxL9Skqzgm6g/KWrhOpmM5z4Vz5Ne4aPfnzHtdwJxF+0cXflz0a8E+2dWymuJWv
         q9ho1eKNljb8VR2Vz1BpvvG6192ypf4qvnxvIXEajkModD4GZs/0Bnq6KPf9u869vq3b
         H+ZEz5xnp37ynI/sL+MTkPqctrpootCFffO1smFnT4FbNCQa0V8UbdghKdD8otwKMDo3
         BIj9Wj+S68LHRNClYvN2VRrIvWKssowvcZdqe/lyhvVZHSNM1AyaZ4DUhx/j0qOOe7+5
         2GmFK7QOHfTYDb5QFyrgNHNoSGvoeKomgQ3oki2cUtr+iULjwoR1kmBi6lywsKpWm1uy
         7miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509332; x=1692114132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcDUBR/c5KhjxO4gQ1CxNRP1ojo3Pb8MjcUkheghccA=;
        b=IBZdrEYpUz4qOFdi28UmQ76L9i19VSxIAnIwzjRoUYdHBwE8pn+pTlUJEyZ9kO7K7I
         wGo49B2Aw01Fbe/Rv1MaAt+aqYU6c6p2Xsb1C6lUxemOhDxN7ESi0/Di+Fsrt5SjzHv1
         5VkyoalnDp+5HH+6KTie+RzYNvROFkCvEm3hJhSGJxHQhnbEif1QaGq3nGf191CCPzRW
         9WRrLwPn91eHCG+jHI4V1KQaunGwIrXD2HBYOY3CE1y4wTXS1iz5O7OBnWmmapB/W1HB
         G8WtMLnu00u2PBtdJs9v2NrMow47sMVCu521WJKaMFW2GrjlsYn7w60E2d3x9oXrEFvF
         N3WA==
X-Gm-Message-State: AOJu0YyL/JMuoIXrReA+2uUFpfjTt5bdQfimNs235gCXh4gO4WkSxUk2
        5E1+1B004P8eLeugDEN1YfilbU2f9doxTPTsM7c=
X-Google-Smtp-Source: AGHT+IFZRIPMWmSHgF0DTwYm5vWTgh/ZPFdc/lFtKvf3yaRIIaD/Q5hQaG6S670n+MjP6HDGCY+KnQ==
X-Received: by 2002:a2e:9442:0:b0:2b6:d0c1:7cd0 with SMTP id o2-20020a2e9442000000b002b6d0c17cd0mr2966685ljh.22.1691502400352;
        Tue, 08 Aug 2023 06:46:40 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:39 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:29 +0200
Subject: [PATCH 02/11] regulator: s2mpa01: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-2-939b5e84dd18@linaro.org>
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

The TPS65910 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/s2mpa01.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/s2mpa01.c b/drivers/regulator/s2mpa01.c
index b147ff6a16b1..c22fdde67f9c 100644
--- a/drivers/regulator/s2mpa01.c
+++ b/drivers/regulator/s2mpa01.c
@@ -5,7 +5,6 @@
 
 #include <linux/bug.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>

-- 
2.34.1

