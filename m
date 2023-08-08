Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA8BC001DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 20:32:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229903AbjHHUcZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 16:32:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231419AbjHHUbv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 16:31:51 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 273D44BBE3
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:52:07 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9e6cc93d8so94997411fa.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691513525; x=1692118325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXrzYWYweDcdHrf5UFjLFPgu3A2nA2Ia2fp24TPU+2A=;
        b=QGkGFyhr5It0ALGu4s1Qf6Y2wKA5PO4bkeoxX8gpwWwIqL/oscoSczfD71/hkUp4Ji
         h0E2tzBL9ait2wuNmEn0z3VTVoZy5ChkRv3SIj74j/rFB0mIZuwghfI7yDaCQ5TlKpQ6
         hWteCdX/eyRJKNtGDKCFdTU+nMuTKzksSNx4uENYlNJVz+ak889rRN8PA2AN1h6fo55L
         2gnguvSbE/rwCRNBwofpNldaNtIcofv4Hn3kKuoYp3t4IyoY9QFkpRKj2QY7qrLu23PL
         ww3CjnUo/qbODUSWKyJ7DnKeGFlq9dkmTGCFHfYOUz62OZ2PdS9x8Qpot6pUkdVmXNmG
         +FdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691513525; x=1692118325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXrzYWYweDcdHrf5UFjLFPgu3A2nA2Ia2fp24TPU+2A=;
        b=Ku3VocpBw2PI3sWBVGhDp7gvOQOtRz/DOuDpJ6tgr9/UPxwk5c50QxGh/KWSow/Bpb
         Rq5J9j/TaKMrZyUiCc1bb7q0nDDnoIAXZ/sGhEVXVh8E1L4JuqL67OhHV63ZCToqd+1c
         V0mqkPwENqJp3Wk0yk0cqXn2ynrv0SNZhkb6lj8X8HwR+mABE6xvUXqBiUIfX45g746G
         4NBFiKL7b54H5N+LToe2iprOk9jMv5kBE5M7Z2mK+of4Ojrxgw1ph5qX1zfeFjW9Ct51
         bUlkjXiQy+zLnQrlUDCF/fDVuPBxn/STLXAF4ANlBDtl5bd8JcKvXYq2YoS6TN0up9Fp
         sFqg==
X-Gm-Message-State: AOJu0Yxd2wxBEJDDf05BxWcWP8vyGSMIso1Du6F6Tyu2VmTK7OVXqBWe
        JHGygko0V9l9uJ/YO++NN27Jt63QMpnhHYub/pg=
X-Google-Smtp-Source: AGHT+IEowhkuCmUF+r4Qwu7Ea/j6SLAKl0ohXdiWZmoM/iU49rY/8TQNDS4E142VCQ8PM8iR2Ecgeg==
X-Received: by 2002:a2e:90c4:0:b0:2b9:615b:39a9 with SMTP id o4-20020a2e90c4000000b002b9615b39a9mr8639502ljg.52.1691502399150;
        Tue, 08 Aug 2023 06:46:39 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:28 +0200
Subject: [PATCH 01/11] regulator: tps65910: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-1-939b5e84dd18@linaro.org>
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
 drivers/regulator/tps65910-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index 2a0965ba1570..3a3027e0b94e 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -17,7 +17,6 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/slab.h>
-#include <linux/gpio.h>
 #include <linux/mfd/tps65910.h>
 #include <linux/regulator/of_regulator.h>
 

-- 
2.34.1

