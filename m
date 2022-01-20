Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4464FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jan 2022 17:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233173AbiATR5w (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jan 2022 12:57:52 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33512
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232955AbiATR5w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jan 2022 12:57:52 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6236A4004F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jan 2022 17:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642701471;
        bh=H2cRLPPzz0F3JUaJ2WyT3i/SWYOSlJ82hwPSyocRI4o=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=e8vMj5brXLRp/pLbFQFcpPVZ7dVW2bPD24JVRGsKMrWEZr9El0gysfYgm8DAgdDtu
         1hz3Qlhm06hMva2dhJbaiUcAV0Ly2XF+MAm6l7Y4/sXQymwwe38QaP0y2JrlCVN1Zs
         gAa47qheybeOe0NT5NHDR5HvRRdWQS0PjKl9iXcOtFbvNkz1RNXGDtWQDae0uM/EkE
         xE/wZG578Xy7/FwaKGJepEnPfymINRoQgSrm7be0hBsWwwieq5VLz12bS3hlxtfFd8
         JPVPm1x44dHkxWAZGEUACTvp1RHIuNhRkRnJNjVaDIdsnaKEVZEcZgZEBIGMtoiMW1
         Wuxkj3wjtjHcQ==
Received: by mail-wm1-f70.google.com with SMTP id 14-20020a05600c024e00b0034a83f7391aso4572083wmj.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jan 2022 09:57:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H2cRLPPzz0F3JUaJ2WyT3i/SWYOSlJ82hwPSyocRI4o=;
        b=Ampxknb+gPfsGz+NV7nwI3Ha2jdDi7uTqJSFc8pTPmDNNHT4m7RkiCTjL+guNX14Xw
         euX6a+4M20CbFD11Q9TdLg6LBI7RYHStFaRxeBmBAxUxpa1vRZvi/MBFRu7ywld8jaqJ
         BLBrMFdHJrC0ISCD6932wnsebUU+v/SVeW+yaEjtINgby32qM3vPCzHSICg3UdeZEM4s
         9txdnUZqcoZjuooRFbhXhZ+TcKpLVAwlIY98s8WqltsNb4mjIBHGiibIUbX3hyKmD5qV
         CgVfojjMdtI9rO7ihFqoUagpdgC+z224CwuIp0wJiAkT2z3UrpGBbtb5OAcyMdI78tca
         Y/zQ==
X-Gm-Message-State: AOAM531dQmJlln48Cs2c1AnuLmeiuibvjxHJBffXJNPV0ttdQ+9XZ//E
        X5ies7qOqOME7RT6VO2ozRBvl99/6qPoWW13LwTeRcLNf6OEM/lRNgptt7bXI3iLVcif1fXLafm
        dgKj9ZvQVVjFARDrE/ZGXBCQOxpMGKdg9tKVeg2xLkxvLX9R9
X-Received: by 2002:a1c:4e13:: with SMTP id g19mr9968779wmh.109.1642701470789;
        Thu, 20 Jan 2022 09:57:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw56dT1lF/ETeqcH6kQkH3+bC8cHsW8qZI7riVZOspMW5WbuM+u8GRe/kQSaObq8lAdFHgBmw==
X-Received: by 2002:a1c:4e13:: with SMTP id g19mr9968756wmh.109.1642701470597;
        Thu, 20 Jan 2022 09:57:50 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id a15sm3345248wrp.41.2022.01.20.09.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jan 2022 09:57:49 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andi Shyti <andi@etezian.org>, Mark Brown <broonie@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v5 0/4] spi: dt-bindings: samsung: convert to dtschema
Date:   Thu, 20 Jan 2022 18:57:43 +0100
Message-Id: <20220120175747.43403-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

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
  ARM: dts: exynos: split dmas into array of phandles in Exynos5250
  spi: dt-bindings: samsung: convert to dtschema
  mfd: dt-bindings: google,cros-ec: reference Samsung SPI bindings
  spi: s3c64xx: allow controller-data to be optional

 .../bindings/mfd/google,cros-ec.yaml          |  29 +--
 .../bindings/soc/samsung/exynos-usi.yaml      |   2 +-
 .../spi/samsung,spi-peripheral-props.yaml     |  33 ++++
 .../devicetree/bindings/spi/samsung,spi.yaml  | 187 ++++++++++++++++++
 .../bindings/spi/spi-peripheral-props.yaml    |   1 +
 .../devicetree/bindings/spi/spi-samsung.txt   | 122 ------------
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/exynos5250.dtsi             |   9 +-
 drivers/spi/spi-s3c64xx.c                     |  14 +-
 9 files changed, 248 insertions(+), 151 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi-peripheral-props.yaml
 create mode 100644 Documentation/devicetree/bindings/spi/samsung,spi.yaml
 delete mode 100644 Documentation/devicetree/bindings/spi/spi-samsung.txt

-- 
2.32.0

