Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D1AC04A94
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 21:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjHHViJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 17:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbjHHViF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 17:38:05 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B754367D0
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:30:52 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51a52a7d859so52321a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512225; x=1692117025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qejuevXVg8c+kej4ztr9ux7GUIQQ5z+UOyvSNuEDXRw=;
        b=MdR5y/YJzgBn9xsRMxoeTcRu3v/kKjq8wtej92ezftE54MzSUvCbZNaAV3zBNFPqoD
         iPMjhsWely6RdGhS3OGEeP8Unm6VZ2dAqHSRZbytUj9EbRcZJ+2F8dLJ+dRXDgcGnvv8
         1fc7ANbNSvqSxiEjBEqukeqYDJewMRLkA+ByWUyxNuKXWZt/sAGpp/Scsa0v7dKwd2vD
         9njHV3zn7n4o7zxtJJiJ2rdLHk3YZFHiGF8bsZK2911Ra1TeTCF7DEPiXYtdRO6oN1eC
         P//3ufBRKWLbcwelrPfcpUzZ71YsjSoqZ2dqmQDBZMwxGTrCHNzcYE8YjKXbmjVDOxYl
         28MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512225; x=1692117025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qejuevXVg8c+kej4ztr9ux7GUIQQ5z+UOyvSNuEDXRw=;
        b=TT2wNBn74T4JfhZLc3Yq3Tc6eXkttZvrEI6ChO/Hx5UDi0FQrFuzCkkf0tZ8k1LHCo
         zNQbBnt45aXpSJMexps0aWGpuXiMFMkyBpws1WHTCMwNbRhNk3dtmmVg6/fg4k49oSwW
         8sBy++lUa4Gohd1ddxLuUvmyhg0iuZCzrud1oeubGikoSN6jaqPo1mcszPmRGu7XXhpS
         1I0jW4LnOk4VgTBBjYYuhaRBxnRWblm0PbXxI1CMnluT5xlscPWGI3kykXj8Jtx4w+i/
         FHxKDGRD5dUhCBoMa1G93NhNtZaIl2t7+he1lZON0bi98twtJFEoxVVOKqtevK/jTPZS
         NUeA==
X-Gm-Message-State: AOJu0YyZwyhvre24SGPEvXwllyi9rk33I/ffg/yDAkbpv89Ui4z1DbBe
        6nkWCMRFFK5pX19cyTd34YRmn7DxiWjxq9qInBk=
X-Google-Smtp-Source: AGHT+IFQaReEoylTuoBa3pq7fPTiDA0ZX2U+hTy0EvkesIRlzxiuW1TvGZ9HVbCDFIPha62GXZlwgw==
X-Received: by 2002:a2e:9c89:0:b0:2b6:b7c3:bb89 with SMTP id x9-20020a2e9c89000000b002b6b7c3bb89mr3403498lji.18.1691502411764;
        Tue, 08 Aug 2023 06:46:51 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:38 +0200
Subject: [PATCH 11/11] regulator: bd71815: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-11-939b5e84dd18@linaro.org>
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

The bd71815 regulator driver includes the legacy header
<linux/gpio.h> for no reason, it is already using the proper
<linux/gpio/consumer.h> include. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/bd71815-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/bd71815-regulator.c b/drivers/regulator/bd71815-regulator.c
index 475b1e0110e7..26192d55a685 100644
--- a/drivers/regulator/bd71815-regulator.c
+++ b/drivers/regulator/bd71815-regulator.c
@@ -18,7 +18,6 @@
 #include <linux/regulator/driver.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/mfd/rohm-generic.h>
 #include <linux/mfd/rohm-bd71815.h>
 #include <linux/regulator/of_regulator.h>

-- 
2.34.1

