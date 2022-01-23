Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E85BC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 11:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbiAWLQ5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 06:16:57 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38356
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236207AbiAWLQv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 06:16:51 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A20CE3F17B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642936608;
        bh=T1/sJNIrmDZDbqUoHlf4OrUfADwkzHPJVM35idTFftM=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=W7CqGgEm47DOE81po+P8i7VxjpaXIeR6ut9Z2Mx3WcsmUtiSDGMDPUSTxKHB9vRZv
         dGdDVCTh/CXFePZnqveTmCdaiHSPx/VULH6NqckZeSTa3grvIX+kPksJu1p7DtFstR
         M18NiV8+3/foDPjsmFSrjUMR8KnaMtyg+uSUGTMREV/zObL1zMrJ6dScD9zj+Gw+2a
         ctEMVFeVJnydmZi6D0c9rGEM7DUgJ1jigH3NTRmfy3ySXnM74GaLwFMsXAFCPyzuN7
         5w5oBEEpmNjt6jyGjxxSrmt4ReFxiA/jJ+l2sIC6lTieImzm9ZTvUGwKDghf7U16pd
         fp+EHldvghEkg==
Received: by mail-wm1-f72.google.com with SMTP id f7-20020a1cc907000000b0034b63f314ccso8984670wmb.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 03:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T1/sJNIrmDZDbqUoHlf4OrUfADwkzHPJVM35idTFftM=;
        b=WqVGmRFQ2yL92GjE5Q6/3rUSh941zCBFLd7FmMZuunHTIJFruWRguh+QVjSFs/u7VE
         wbd5d60mWyDAmIonz4Surxz19tNs6XzEC+F4Es4wE90xebE78C3K8XNsOoqqwolX5HMI
         09ltvMQuR+CPxSRITrHavxdIvkzVboDI3Hue8Vd1FLsGkJVPXAZuPAQIK09JEGoem7JZ
         smxRRET+OTUS+tVgFTTNM2BEmRP69BI9NK/XCZRGjkZFHC4GGYgFjlkcttSkehAdNj/A
         tbONH00QKeoCLOpLIoVfwpg03K0ijFb31IIJtOSmbuDsInKFjH948Unp1AtiW1BqF1PT
         JzIA==
X-Gm-Message-State: AOAM533MPYp9FekTz4wmXTLmRS4aIe/guvIP5RDfcX9viVKOCwrbOb2y
        SZpx1aHUMbwYuLLGy/NATh73jL+XTSOlV8+aP7BOPCI3nC27LeztL5z6xERJSdzwEIvvZHvDSru
        oXtlTXHkNHDyWUPGSyP7GgJZzGpga1MaQR8byWs/JC+T+Z4X4
X-Received: by 2002:a05:6000:381:: with SMTP id u1mr10177661wrf.451.1642936608333;
        Sun, 23 Jan 2022 03:16:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgVsVZWODhwq/uXh4NOF8eTHsw3cQNa0zg5QWq4nkKUxlc731vjVtIU/jlG95afPKvbbAcMg==
X-Received: by 2002:a05:6000:381:: with SMTP id u1mr10177645wrf.451.1642936608063;
        Sun, 23 Jan 2022 03:16:48 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id m5sm10143729wms.4.2022.01.23.03.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 03:16:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] usb: dt-bindings: samsung: convert to dtschema
Date:   Sun, 23 Jan 2022 12:16:32 +0100
Message-Id: <20220123111644.25540-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Dependencies
============
None.

The DTS patches are independent and I will take them via Samsung SoC tree.
I am including them here just so automatic robot checks won't complain about
DTS differences against newly dtschema.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  arm64: dts: exynos: add USB DWC3 supplies to Espresso board
  ARM: dts: exynos: add USB DWC3 supplies to Arndale
  ARM: dts: exynos: add USB DWC3 supplies to SMDK5250
  ARM: dts: exynos: add USB DWC3 supplies to Chromebook Snow
  ARM: dts: exynos: add USB DWC3 supplies to Chromebook Spring
  ARM: dts: exynos: add USB DWC3 supplies to ArndaleOcta
  ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pit
  ARM: dts: exynos: add USB DWC3 supplies to Chromebook Peach Pi
  ARM: dts: exynos: add USB DWC3 supplies to SMDK5420
  ARM: dts: exynos: add fake USB DWC3 supplies to SMDK5410
  dt-bindings: usb: samsung,exynos-dwc3: convert to dtschema
  dt-bindings: usb: samsung,exynos-usb2: convert to dtschema

 .../devicetree/bindings/usb/exynos-usb.txt    | 115 ----------------
 .../bindings/usb/samsung,exynos-dwc3.yaml     | 129 ++++++++++++++++++
 .../bindings/usb/samsung,exynos-usb2.yaml     | 117 ++++++++++++++++
 arch/arm/boot/dts/exynos5250-arndale.dts      |   5 +
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |   5 +
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |   5 +
 arch/arm/boot/dts/exynos5250-spring.dts       |   5 +
 arch/arm/boot/dts/exynos5250.dtsi             |   2 +-
 arch/arm/boot/dts/exynos5410-smdk5410.dts     |  23 ++++
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  10 ++
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |  10 ++
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |  10 ++
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |  10 ++
 .../boot/dts/exynos/exynos7-espresso.dts      |   5 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi       |   2 +-
 15 files changed, 336 insertions(+), 117 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/samsung,exynos-usb2.yaml

-- 
2.32.0

