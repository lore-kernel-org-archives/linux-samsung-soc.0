Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9613C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 17:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234973AbjHHRud (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjHHRuC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 13:50:02 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B483D27544
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:22:12 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe10f0f4d1so9702576e87.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511698; x=1692116498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1Y4agTqAvpXPwjQ+6mnmjNw7Ui1CynMHOt3cuxZe6w=;
        b=gIz/kIXZlbn79WgRSOykuTeP/eTCVNlJKkD/AZiTsK2g2a1iey398ldGpgoSWveHRN
         uRjIxqDVakeJGBE8lObmuy8Ge/uQifeAW6RO4CvWS7nJuLHkeCXnc4qlwpGGtpPQzKPE
         4m1ukNucFUC9wmdbiGsOH8V6z6W+L1lkX8FLvaOATkaSb67eGign8hRWkgWtpmu3toWb
         tTOSMmekxX1R7jCAT0TrbuajbWB+CbgUb1EUL1aEw6p8f57FHaCGmZgQBnMLRpZyUn+Z
         kiXE7DmpRfDzsNFsS1pL1UNfhuRdKLDxE5UDQ6kxjhxORooWkRngweGHFQtNXJbrxPhu
         6UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511698; x=1692116498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1Y4agTqAvpXPwjQ+6mnmjNw7Ui1CynMHOt3cuxZe6w=;
        b=Hwi0VESwz63RKtJEHAGKydEcBLrnNUTX/ZePKIqOYB03y85pEdn24CtQuqzp8Uk4c4
         kCvYJlEOfDbbAkjpD4fdoYVCF4/Kt8Fvu8MR8EWxftGPSiWvN3sD3JXxEWDOy6aFEINf
         +za/Czb3DVdJDGrvZsO0IxuDFkTfcWW2K5/VfvcGtoFjP8UyUQRHUCcpWtPeCJQTdgAO
         CFOFDul89vPP6rEXYyNkSfopDFDP2lPAuPzZDrPwiNC6K1inUlxzWs0TWMisRTCJl7mf
         FLsjQs2ZVdQom10AKMR/Uwbtl8YVIa2aDp3dLzfhW4bmzdkDlHcAIEAMdCcqG9w4p0wo
         i5zQ==
X-Gm-Message-State: AOJu0Yxca97Mpj7ypr2iGUWaTO2wpm+z3fC4l547JGdrXcxVLay+2rMl
        8d9tTgOvquZDgfM/OIxyZG4bGz6s0OqIZld59t4=
X-Google-Smtp-Source: AGHT+IE0omUPskRY/uk1H5XSLkdMB6vFjj8UCg/c58mkRX+yOkrTBA0j/8iJ1xj+dfPUVFqUwwFdrQ==
X-Received: by 2002:a2e:990c:0:b0:2b6:ecdd:16cf with SMTP id v12-20020a2e990c000000b002b6ecdd16cfmr8260383lji.40.1691502401865;
        Tue, 08 Aug 2023 06:46:41 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:41 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:30 +0200
Subject: [PATCH 03/11] regulator: rpi-panel-attiny: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-3-939b5e84dd18@linaro.org>
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

The RPI panel regulator driver includes the legacy header
<linux/gpio.h> for no reason, this is a driver and <linux/gpio/driver.h>
is already included. Drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/rpi-panel-attiny-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/rpi-panel-attiny-regulator.c b/drivers/regulator/rpi-panel-attiny-regulator.c
index e9719a378a0b..949849baa7dc 100644
--- a/drivers/regulator/rpi-panel-attiny-regulator.c
+++ b/drivers/regulator/rpi-panel-attiny-regulator.c
@@ -7,7 +7,6 @@
 
 #include <linux/backlight.h>
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/init.h>

-- 
2.34.1

