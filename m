Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C87C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Dec 2021 16:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhL1QnM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Dec 2021 11:43:12 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:39604
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231670AbhL1QnM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Dec 2021 11:43:12 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0E6623F32E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Dec 2021 16:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640709791;
        bh=QEjdNCFh1I2/FVAvbi9/CNnV0tj1pywVMVJDrsQ6S/M=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=hO9SBTCvj4yJwTZp4qQSCrRm12qihM+xaKjm7ujrza1iXtVu9AQTt5G36Vx95Gfvi
         EsijNpVbzvR166Ax2BY7iX/DxHHwx70mPpi4tJl6is55ctFMtWFWIJxV8g8AyYQuMU
         XZNCvv2PlSwwTcb1gF5a6Sp79afhLQPtBjS9m7aanaD9UzODD8kA53Gu+ixpsBwtuz
         hZeK5/1XDBJ4qdwrMNqAnwYhQad2SUx91h47nurd+KDw0GjwbIhhAzfUVAAbQwTx+R
         yx7bhEYsYAntoj/cdmQ67XC9hk9ZZi2wv1f7ruADMUvlgzCNKLRBSRDH3XYhRAW5lr
         NTzXM3pddjQuA==
Received: by mail-lj1-f200.google.com with SMTP id bn28-20020a05651c179c00b002222b4cc6d8so6213842ljb.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Dec 2021 08:43:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QEjdNCFh1I2/FVAvbi9/CNnV0tj1pywVMVJDrsQ6S/M=;
        b=iux4L7AU/cjP3GorhCU3Ujd9RGIb4+ratK82CI0w5Tdi8PiU0ltMZgTgu0fCgl1NbC
         1F0P6N0BOOrgPLMRfhV9nCznV9+o40HHa+kRg9F9Y6ePIMvJDqmWDvecQ+IaqwZIoP3G
         UOscg4J2/K1RoIQXJtANhVq6Zb8vq56/hqEt/Nx/b36D/E2cv/eudJVDoRAijHPx+PIL
         wCZpz7JQCUv9GveqQUqkpW2PD4Hg7MQgsUhIYZD37CFRGFiX8N0iRdaLLs/wMTC9eAq7
         zwG98Oujwf5EZhhm3nAEkX3H4kctg8+RRoMl/AbaUn4GSX8HFy0Vh05L7OsqA4LbmEBe
         5/Ng==
X-Gm-Message-State: AOAM533r6VsWiNT9R33eYWO6mRJnUrYGwHKbJKas1+ab7t0R7iGBCTgx
        enYlJKHixB4WCLRw2qgvMwoVoh9rFBCq84Rt1WBqHdenBIFwRCwepj6hHW4Pqmr8fQmVrawbW02
        mEd2UR7P9rbkMikgEXOgNIwUVGTw5OMTwH9pU7hr/5IzYNprM
X-Received: by 2002:a05:6512:2103:: with SMTP id q3mr12696198lfr.538.1640709790381;
        Tue, 28 Dec 2021 08:43:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuF3oWT8cZMD7Nqx/2DjV9aAVXl8AQ/O4g5c+EzTbwKY07FXphsdOMJMAV+vz7PorU0kowRQ==
X-Received: by 2002:a05:6512:2103:: with SMTP id q3mr12696184lfr.538.1640709790220;
        Tue, 28 Dec 2021 08:43:10 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u5sm968701lja.36.2021.12.28.08.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Dec 2021 08:43:09 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Javier Martinez Canillas <javier@dowhile0.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/3] regulator/mfd: dt-bindings: maxim,max77802: convert to dtschema
Date:   Tue, 28 Dec 2021 17:43:02 +0100
Message-Id: <20211228164305.35877-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Dependencies:
1. DTS patch: nothing depends on it, sending here so Rob's automatic
   checker won't complain about DTS.
   I will take it via Samsung SoC tree.

2. Final MFD patch depends on regulator, so the two last patches could
   go via Rob's, Mark's or Lee's trees. :)

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  ARM: dts: exynos: drop unsupported MAX77802 regulators on Odroid XU
  regulator: dt-bindings: maxim,max77802: Convert to dtschema
  dt-bindings: mfd: maxim,max77802: Convert to dtschema

 .../devicetree/bindings/mfd/max77802.txt      |  25 ---
 .../bindings/mfd/maxim,max77802.yaml          | 194 ++++++++++++++++++
 .../bindings/regulator/max77802.txt           | 111 ----------
 .../bindings/regulator/maxim,max77802.yaml    | 118 +++++++++++
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts     |  12 --
 6 files changed, 313 insertions(+), 149 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/max77802.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max77802.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/max77802.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77802.yaml

-- 
2.32.0

