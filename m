Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90F1C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 12 Jan 2022 10:00:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239480AbiALKAx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 12 Jan 2022 05:00:53 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55452
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239446AbiALKAw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 05:00:52 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5292740749
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jan 2022 10:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641981651;
        bh=W175jQsAVD8hOk96CzYOc00tw1PfuOzVPDQUy/HubXs=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=SeTM6o1R5wkC3yB+e74hE8vaAn0n1KUuY7LANuT/ISacS9vNwgj9pgKrHQhf+eDwn
         PmO1swnC/bVE5AebupZSLdBr2gUA7r8yAIExm3AP57oNWoEhtu/daeEsWnIc5dg09j
         I+8cWpLuLFsqs+riOZlKTQYFep+aCVyLGulw9L3VExmviNVbpvmjKxzs08mtg+izFS
         bxy3Do3WWbQHXeX+u5JcpSXnFHDRiOdxBnR/0ua5AZhkdKhk53nyJM3zCaIYcV5H1f
         S57LBqvpzugzJbGXM6AjXqSSMXYjlTtZYTmvMplS7lmEUfDsJZ+9TREZB/TpcDMSua
         T3sgf6n6Gv26g==
Received: by mail-ed1-f69.google.com with SMTP id z9-20020a05640240c900b003fea688a17eso1809185edb.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jan 2022 02:00:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W175jQsAVD8hOk96CzYOc00tw1PfuOzVPDQUy/HubXs=;
        b=HRg5aTgBoBz9Rh+2YJ2EZN+15Iw7+Ibz7hWqcsaRK5UCSehF4AVL4YbDnX+IAm8QSm
         Uog2BW/BFLw8ep9EC5/oWUlWILecajtBptD9JV/TP4TiRyb1ihRRP6KBaSTb7SAUPR4x
         wczxU6UWu/MfLgLkbNuAvefgfhKapBU2GGotdWgxKwsggw+mCSQYSCtA5PdvAm1c626M
         emDmeVkmQjHAHeHI5oW/hatIxu2iYdeikPrbCLmoYAeJih0o2k6kVZsqStsGRLyzfykq
         qCI46NInjAUJF6eVw0h97mYxhnr2AO1cyMluyYsMSFLb49vxCCl6HlcwdEHHcI9cY5Kf
         OYbQ==
X-Gm-Message-State: AOAM533Dtsw4A1/XTotuVphnj1bWXmgBa0jZ313rUzZyNCOU0r4WGNmk
        DwcGr9vsdxWXJhPmDnNakWGy1Ctghzvg9oXmcj0DmILE56N6ETLIcT7Dd41URThCT18AGTzFOdq
        gN+blQs8zUAiEA6/yuLD9GXKHv57fyjyxDtGB/M08TK39NLCi
X-Received: by 2002:aa7:c584:: with SMTP id g4mr220255edq.78.1641981650533;
        Wed, 12 Jan 2022 02:00:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPwXb8C8jwC0AeCFbhlzmt3R55DzsEBM3z+QQv07WnckbiFJGdXv4Kanz5OlMs7VuMIKn9xw==
X-Received: by 2002:aa7:c584:: with SMTP id g4mr220236edq.78.1641981650275;
        Wed, 12 Jan 2022 02:00:50 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id hb11sm4311083ejc.33.2022.01.12.02.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 02:00:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Pratyush Yadav <p.yadav@ti.com>, linux-spi@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v3 0/4] spi: dt-bindings: samsung: convert to dtschema
Date:   Wed, 12 Jan 2022 11:00:42 +0100
Message-Id: <20220112100046.68068-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

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
  ARM: dts: exynos: split dmas into array of phandles in Exynos5250
  spi: dt-bindings: samsung: convert to dtschema
  spi: dt-bindings: samsung: allow controller-data to be optional
  spi: s3c64xx: allow controller-data to be optional

 .../spi/samsung,spi-peripheral-props.yaml     |  36 ++++
 .../devicetree/bindings/spi/samsung,spi.yaml  | 187 ++++++++++++++++++
 .../bindings/spi/spi-peripheral-props.yaml    |   1 +
 .../devicetree/bindings/spi/spi-samsung.txt   | 122 ------------
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/exynos5250.dtsi             |   9 +-
 drivers/spi/spi-s3c64xx.c                     |  14 +-
 7 files changed, 234 insertions(+), 137 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt

-- 
2.32.0

