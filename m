Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B50C001DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 17:58:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235183AbjHHR6D (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjHHR5X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 13:57:23 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12E7FC20A5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:26:02 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-52307552b03so8071905a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511949; x=1692116749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d/kMxPLtuYtfsGSJG2tOdeZ1yEQcKsWU7BmPk/CzUa0=;
        b=tv4vzLr5H1s4ugTiC4gQeKDTg7aW3O54JLSjTrscVnNJsO9XxOW4s70nVTrn5oIbWe
         k/9WOnox+FuLd0p8oP7ZxEZzKuW/VOihKG4HmlQfkts68VSKaS+3pgO7PGJb7C1wWPGh
         2dQ7DMRnEk+D7f3GTR3UbK5l8iNwvLbISbqNUTqq+rc548munc3p3Yk2HWKz7JuWksek
         cPrX3aMYTJh7IYQttK5YxOKGTRgpc3+ILtEeZ41Y2w7iYeUw1duL7Lkb++BxexAio2QF
         buNwhHwlT6QM5I7DVTSzOy43kVBv+BAJGi4cEFOahVZOHfq5SlXvOZ6MckoaRuRmA1A8
         z0Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511949; x=1692116749;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/kMxPLtuYtfsGSJG2tOdeZ1yEQcKsWU7BmPk/CzUa0=;
        b=gwMVV/Spb5jEFhYaJat+b2vidSUo3OZjUBMVaWkZRI5A1yjqN+7K1TmzQe4FsTnst0
         73/mJbZn6EViZCySR7gOOIowhbKNaqI6Ib7lv/hYnhB0gNCRX6R7DfHBcm5sQp/OPc9C
         h/6h+NWz7akwIjmW8X+PblAixi/H8t2HPYOJyr73RKXZhfo3EcjX4WXjq2x0c7mDGsU9
         7z6QxsKzlkgm1xI69k29ucBdZR6oVKnqCHB56dtbxJ2Se7dU4h1dT684VUcFkG0Pe6/+
         aTtKKPXatDeAlaL6KtEAuyKZVCgvI3nf8/BPUge3Al6A4zqJSmH+XleGzgGcdCvag6Wp
         lHzg==
X-Gm-Message-State: AOJu0YzosvYb9QFxjjomwT6V3oAzq8pfbunH7qtTxWP1MZ+MSu2HwlG1
        lkp6FFy8MLT4uH9FP+V/ijSVaUvnc8AfesHserU=
X-Google-Smtp-Source: AGHT+IHWCMZNWUenzR2ow6DEw9qzbs1hN0zvPorE5eMO9zjCNiMy4ZjezjEMoOdrW0oJwauJJK4sjw==
X-Received: by 2002:a2e:9e0c:0:b0:2b9:a6a1:f12 with SMTP id e12-20020a2e9e0c000000b002b9a6a10f12mr8506359ljk.43.1691502397847;
        Tue, 08 Aug 2023 06:46:37 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:36 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 00/11] Regulator legacy GPIO header removal
Date:   Tue, 08 Aug 2023 15:46:27 +0200
Message-Id: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADNH0mQC/3WNQQqDMBBFryKzbkqMtUpX3qO4iGaiA2Jkpg0tk
 rs3Fbrsbt7n/zc7CDKhwK3YgTGSUFgzlKcCxtmuEypymcFoU+lWN8qhjEzbI7Aoxum52HyqCl1
 jL8Y73RjI243R0+vw3vvMM0muvY83sfymP2P7xxhLpZXxvq4GfbVDbbuFVsvhHHiCPqX0AYvhI
 ou7AAAA
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

This removes some low hanging dangling <linux/gpio.h>
includes.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (11):
      regulator: tps65910: Drop useless header
      regulator: s2mpa01: Drop useless header
      regulator: rpi-panel-attiny: Drop useless header
      regulator: rk808: Drop useless headers
      regulator: rc5t583: Drop useless header
      regulator: mt6311: Drop useless header
      regulator: mcp16502: Drop useless header
      regulator: max20086: Drop useless header
      regulator: lp8755: Drop useless header
      regulator: bd71828: Drop useless header
      regulator: bd71815: Drop useless header

 drivers/regulator/bd71815-regulator.c          | 1 -
 drivers/regulator/bd71828-regulator.c          | 1 -
 drivers/regulator/lp8755.c                     | 1 -
 drivers/regulator/max20086-regulator.c         | 1 -
 drivers/regulator/mcp16502.c                   | 1 -
 drivers/regulator/mt6311-regulator.c           | 1 -
 drivers/regulator/rc5t583-regulator.c          | 1 -
 drivers/regulator/rk808-regulator.c            | 2 --
 drivers/regulator/rpi-panel-attiny-regulator.c | 1 -
 drivers/regulator/s2mpa01.c                    | 1 -
 drivers/regulator/tps65910-regulator.c         | 1 -
 11 files changed, 12 deletions(-)
---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230807-descriptors-regulator-3ed7a42fd072

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

