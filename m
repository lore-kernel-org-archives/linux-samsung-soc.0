Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FDEC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Jan 2022 08:23:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242134AbiAXIXy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Jan 2022 03:23:54 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:42792
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236216AbiAXIXy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jan 2022 03:23:54 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1C0C53F1C6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jan 2022 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643012633;
        bh=7zKcWROJaURhL/8HO42elhk/RcTUKxPURWmHqK9IZzA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=u4RaszLl157WmMEMmSRQZn00r6FUzEri6GDANeynojF9dyfiKh8u/dJbUykgCt1s6
         N9WGYfr0FWTVfMNsKQGlIZ9a0vgxQEAit+LKARkpSDvQvCx70Qrc2joJ2i1oJiVt+6
         tzmturGVzlAnI327bzVMkxNBxa93D3XMBVrFyb95Q5/3vtqwRmIS+4YqnoQCItBHep
         yvEvqfLgR9T+tKPyXfgEOQILcNVTH+WTJ2KfIAdsZXhW8q+ne/DWsTvR99DYT+s2hh
         LognrX3BgHLD31hW6Xb8MtswWbNkfSqUoCCk0THhobRBCqjdF9CF0gP4w2NLUFWv0R
         zEvyDiZcc+HJw==
Received: by mail-wm1-f69.google.com with SMTP id d140-20020a1c1d92000000b0034edefd55caso4290113wmd.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jan 2022 00:23:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7zKcWROJaURhL/8HO42elhk/RcTUKxPURWmHqK9IZzA=;
        b=ildgI+EbzCAZ3K/QgoN0bZRGAe8kMy1DKRHGHGO0ihbdGRZhNatOlAIE2HLHXRx1vB
         uqmV7u4Z/vY7olc7qxK960BH6rtYkG2bzW4VcLpFr7qr+NzGX/EXGpchC70prDjwE1wS
         n+qKZ/kEInPt3eSLbbdzj7Z1zfIGLcWPMqnVxlpn/rMig5brIJ9sW8T8gRUBbaFB+sMT
         07zX67T1CjgviVP5DIaVlq+Vmxs8I3Te5Qev952kpx0MiXrpaMtnhQr7+RmN/BMAV4rw
         eZSwGpIE6I43lXw2WBPQupG919HH9FV2ENaoVDGLUnPRZEH2FWkGc+i9t1JHR3R4d02y
         ebAA==
X-Gm-Message-State: AOAM531JYOdG0o88Ak+0n9j5YU/FUO5v5zyTSrYgHkmF5idIxTszKpry
        ReSaDf0sVZy8lU/omrphcm+geZaFB4/865KoTQniGz8BJFMXuHqTe6Gs4lcnarQHd+WL7yX0xQI
        O1pPf64HUHJnUFVj79q6G6+NyhPc5C36n5nlwSOgnf+pRakjq
X-Received: by 2002:a1c:3b08:: with SMTP id i8mr781517wma.52.1643012632437;
        Mon, 24 Jan 2022 00:23:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZ4msI9DBdqPFRBMYAxKWHo7GfTdXh5lgJOdfR2H1wJlIwpu6wqbPgDj6zli+U2IlDQPbSPA==
X-Received: by 2002:a1c:3b08:: with SMTP id i8mr781490wma.52.1643012632243;
        Mon, 24 Jan 2022 00:23:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m64sm7148550wmm.31.2022.01.24.00.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 00:23:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH v6 0/4] spi: dt-bindings: samsung: convert to dtschema
Date:   Mon, 24 Jan 2022 09:23:43 +0100
Message-Id: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v5
================
1. Add new patch 3 (fix indentation in example).
2. Patch 2: reference spi-peripheral-props in else.
3. Add tags.

Changes since v4
================
1. Do not require samsung,spi-feedback-delay and fold patch 3 into patch 2.
2. Rework message in patch 4.
3. Add tags.

Changes since v3
================
1. Patch 2: correct path in exynos-usi.yaml.
2. Add patch 5.
3. Add tags.

Changes since v2
================
1. Patch 2: drop child device schema, as Rob suggested.

Changes since v1
================
1. Patch 2: describe devices matching compatible, correct issues pointed out by
   Rob, add reviewed-by tag.
2. New patches 3 and 4.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  spi: dt-bindings: samsung: convert to dtschema
  mfd: dt-bindings: google,cros-ec: reference Samsung SPI bindings
  mfd: dt-bindings: google,cros-ec: fix indentation in example
  spi: s3c64xx: allow controller-data to be optional

 .../bindings/mfd/google,cros-ec.yaml          |  31 +--
 .../bindings/soc/samsung/exynos-usi.yaml      |   2 +-
 .../spi/samsung,spi-peripheral-props.yaml     |  33 ++++
 .../devicetree/bindings/spi/samsung,spi.yaml  | 187 ++++++++++++++++++
 .../bindings/spi/spi-peripheral-props.yaml    |   1 +
 .../devicetree/bindings/spi/spi-samsung.txt   | 122 ------------
 MAINTAINERS                                   |   2 +-
 drivers/spi/spi-s3c64xx.c                     |  14 +-
 8 files changed, 246 insertions(+), 146 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt

-- 
2.32.0

