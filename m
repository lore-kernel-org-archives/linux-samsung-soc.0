Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74633C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 10:13:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348547AbiAKKNo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 05:13:44 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:41794
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237471AbiAKKNn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 05:13:43 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F1B283F207
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641896021;
        bh=dor9qMPQ0mrrX4bfZ8uDHf6Jen+W2LQ6ZgWRYFeDuWA=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=mBHpXTQ9NSk07MLK7pvpGDnTRvRdw2s3kyy3kNedNQv2oFrKpxRaRJf/BN712aaR3
         UqHnsGjhVYeGIltNvVDaPGX1w3FTgb6sSNohtO3Yv7gXGq+hvwZ9bLRquFuwOwyjr/
         GolYdnMoH8dhagiaQ/63aHVvyKN5y/7UGouAt3bfchsHmV4mqeVFGnLIxmvmL+9TxN
         e6m/EhMorqK1thDUBHqivWSyKQzqZVQirbWuHMyP+g6AtfSo8X97eYNmoLLlkXckDN
         13jGPAohD7gpkJPjjJEXKgDz9vLFoXmDk1gswtGiAu0b2LxbNWE7sFjGJlGUys5ICX
         M95h7GKuxg1WA==
Received: by mail-ed1-f71.google.com with SMTP id q15-20020a056402518f00b003f87abf9c37so12845424edd.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 02:13:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dor9qMPQ0mrrX4bfZ8uDHf6Jen+W2LQ6ZgWRYFeDuWA=;
        b=nCGqfQ7/PAmemFEU82RgYDvbbhtiQo1BS8v9SSdutCleqhZZgXVC4i0Fm442rj66Ov
         KpQu+SWTI4BcydteNoqExtlmfP3evXS2JbpeCdvCu2Q22f8cVmFicpz4A81BNJzNutlY
         9tz2BRHWX630nR/03BYu6sqrkkyN3tPK07Z0dZGXlr+8AQgbW4l8rIeXEC3+J5r5WVdE
         U5lxWMrroPlIc+7W1UeG5DU0ld+H8I/Bcns/JDZgJVAy1uHo2D5P7np0vjrRffdzswKt
         mSABqEcCc98DsCs0pDva/As5C7O2Fm73ocp5GdsTtS2EXRJHS0VOqQVcq5IBGXZFjZRw
         iFmQ==
X-Gm-Message-State: AOAM53323m3EJzg9sdZ8q1FDF9BgLw/0EXnpA+NKvWU43YXESY/USYVk
        IcvZUvouFHI0TxvwJ/in6ehjae1PXf/Nm3z36OEMNcxZe3NrJbST/B/ooVvYIi3IBG4Qz0EhLoG
        J7plzcLoEnLNoFNsd7C84DwBcKLz1XCvacZ8+siUwkLbW1zM2
X-Received: by 2002:a17:907:7812:: with SMTP id la18mr2985719ejc.361.1641896021583;
        Tue, 11 Jan 2022 02:13:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzS+KRg2Po2ZmPguoYjn6vWAcaef7toI3fl6TH95T7A0/0ObQGfS0r1niugTRZEPPNRwiEOTw==
X-Received: by 2002:a17:907:7812:: with SMTP id la18mr2985700ejc.361.1641896021430;
        Tue, 11 Jan 2022 02:13:41 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 26sm3431268ejk.138.2022.01.11.02.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 02:13:41 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v2 0/4] spi: dt-bindings: samsung: convert to dtschema
Date:   Tue, 11 Jan 2022 11:13:34 +0100
Message-Id: <20220111101338.58630-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1
================
1. Patch 2: describe devices matching compatible, correct issues pointed out by
   Rob, add reviewed-by tag.
2. New patches 3 and 4.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  ARM: dts: exynos: split dmas into array of phandles in Exynos5250
  spi: dt-bindings: samsung: convert to dtschema
  spi: dt-bindings: samsung: allow controller-data to be optional
  spi: s3c64xx: allow controller-data to be optional

 .../spi/samsung,spi-peripheral-props.yaml     |  36 ++++
 .../devicetree/bindings/spi/samsung,spi.yaml  | 195 ++++++++++++++++++
 .../bindings/spi/spi-peripheral-props.yaml    |   1 +
 .../devicetree/bindings/spi/spi-samsung.txt   | 122 -----------
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/exynos5250.dtsi             |   9 +-
 drivers/spi/spi-s3c64xx.c                     |  14 +-
 7 files changed, 242 insertions(+), 137 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt

-- 
2.32.0

