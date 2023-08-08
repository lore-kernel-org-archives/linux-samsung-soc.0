Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C881C001DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 18:03:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbjHHSD1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:03:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjHHSDS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 14:03:18 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6830AF3A39
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:37:17 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fe426b86a8so48942085e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512599; x=1692117399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+dlxZR3XfI563ojSxefCjRIUUjTHomDfo7z0fT83jY=;
        b=qtj3B+Z9xC5E0WirROk+Rkk7nH0pDV7rPyOilHAxpfdIvEiNx+kE+CPxVtvqnoE8G6
         ePTUxB/CAxSPDaJTztYGY6Y1jAUklkvsB3BMrjNbsF+DDGHaMPTSayYa5+ycukZdP01U
         Wj40l/mhGzIRjhrAmQoBbNlStToqQPDRoarlGq2Kjv27++NQisayV8VJVReJl/1+sEY7
         9KzDhFzBlVFSAF6Xf64el3E1TAkMSHpdbJn8/wPeEhhRbLNLvmUnFiguUqMqGhAQ631b
         zun8i8OWTB27hQlNjEMkus2FkjsN7lIE0wageKNyTj5lBiYLZLwH9FjrkLoG/+UIyIRa
         RZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512599; x=1692117399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+dlxZR3XfI563ojSxefCjRIUUjTHomDfo7z0fT83jY=;
        b=Bi53tAXoQozDnqhwSiVMKoeYZ6kjkFh0zBHvoxVKGHF5QhDCVX6xyFf/35410FPmD/
         /fZhQqsynSEF7fDbwoDT6T59LPx0FW98E6hPbL/5ZCz9Xb70OHXchgfn8maYcaGyHKeH
         nBC4G/hOCetPxVROfzY1zu9BbWU9xB9M9Fqr1sNmU/690ftSiMl2f4LYkYZlWPKSHr97
         8wOFHOcgdZVfo2Si3IQv5zp69S0Ofm+nYAJnHgvsGutNUuMrN804qFg8OTmD2e7HjjSg
         Sbnm2nK06YgV5WMKGqaroUgYKHPQTgQeGSyLpdvjXtlVRJ6PlpKdyZxIX1+xrItqM0EA
         8oAw==
X-Gm-Message-State: AOJu0YzLG91TKwR6vHVCKvJ4s0sDiH+STDYCEhSEMXFFbwru2YJUhq9E
        H/OFhtRlKiDNtFGSVfy4DHaWO61ldoTvpn8HJyY=
X-Google-Smtp-Source: AGHT+IE+SDMqqQOfzDMcBQm6Q8z18mxaHPEwNvAM53y4c2JzhwsSdcZlgBmTg4v2rNjwyQRUpQmonw==
X-Received: by 2002:a2e:8791:0:b0:2b4:7f66:8c92 with SMTP id n17-20020a2e8791000000b002b47f668c92mr9274596lji.31.1691502410752;
        Tue, 08 Aug 2023 06:46:50 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:50 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:37 +0200
Subject: [PATCH 10/11] regulator: bd71828: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-10-939b5e84dd18@linaro.org>
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

The bd71828 includes the legacy header <linux/gpio.h> for no
reason, drop the include. The documentation mentions GPIO but there
is no usage of the GPIO namespace.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/bd71828-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index f3205dc9d4fc..08d4ee369287 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -5,7 +5,6 @@
 
 #include <linux/delay.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/rohm-bd71828.h>

-- 
2.34.1

