Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2571C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  4 Feb 2022 15:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359783AbiBDPlU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 4 Feb 2022 10:41:20 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52188
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1359680AbiBDPlT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 10:41:19 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6126D3F1A1
        for <linux-samsung-soc@vger.kernel.org>; Fri,  4 Feb 2022 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643989278;
        bh=HhMWPtfkpkPYK76tVGoLvZIgiOxfmrxT8MjHu4n/xKU=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Yg/ktSVcmQEcyXpYfCx9+cMjsgU9L/tW5L8zuirnJNJ8/VrqWAQMwfWGaHsMv1MUM
         6Ok671JGT/CszjALJmkeih+tUb1wagVhWAqfhuhhz7ueZquNYNW69brHHByoRNMX8W
         y6RBO8xx9OyRFmfyvZ0fnb/3SOicNdj1mQn40d9pRte6apUra/ZGihstXQdl1Rgwo4
         prRj6o04lt7vf/x9bHghoB14UM5VdAWDCvjkCSseuU80BzA1V6LSYsDZ81rjsh6QST
         UcGWkGCoAHHxxdfWOBxwDhMYRKinDZmR9SZ7I5gIo+IwIpFfubNtW5vaQeedr89ZnA
         Zu+epfrQwky2Q==
Received: by mail-ed1-f71.google.com with SMTP id b26-20020a056402139a00b004094fddbbdfso3465297edv.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Feb 2022 07:41:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HhMWPtfkpkPYK76tVGoLvZIgiOxfmrxT8MjHu4n/xKU=;
        b=BO0cz+eRAub8OIVLixHSzaYp1Cp3FAs+Yiv+sYGBdOLwKRuWS+fy1ArcjefK13Uw6M
         HsCRAnz1qrN5KN+f5OMFOmusiHBcHD2lSumO6Dedo6O2uC42PW7ArPOSSZ1b/B5KoWvH
         PUabJB+RtJ5XeYCDbXi8YpoOOtyJzYwO2w4rgu8Roz5/TLHZ0YXEj54XlDk61+ID1oN9
         nLIiyXNga3SDF8vxYLAKZtHczl1al257/mWSZ6/L5AN6wMgNVPCplWuHtPuH72e35onP
         skkaD5NRe5+3daF+yYnTFDR93DaWTOd5QpMbTqVnygiaoYjNKfsRlppS8zH0nv1SMydk
         TkfQ==
X-Gm-Message-State: AOAM5319Z5SWEKgHYl+fmAPZ1u38qI4r0yrY8EV5Esv1GHiKwnqVo9a3
        Ak7VO5C4bqJ7sc1iBQ42ncab+OoStKfyuhTTSpvzKSYwuE36j1dCHjpVrJN8HsY/8UqN4fOjzpz
        Zwhb8TsLsZgzTRUbGdx50sKf+tXZS8aAHPErOd8bPcy1n8Voc
X-Received: by 2002:a17:906:478c:: with SMTP id cw12mr2970519ejc.214.1643989278064;
        Fri, 04 Feb 2022 07:41:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw27rzlsVhz2k63QiDYhx2I/GqUBW5UCh9ihXw6hsKmtBpPQSfcx9JVgv0MXBr0AQWQD0C0rg==
X-Received: by 2002:a17:906:478c:: with SMTP id cw12mr2970501ejc.214.1643989277887;
        Fri, 04 Feb 2022 07:41:17 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id rn16sm770753ejb.61.2022.02.04.07.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 07:41:17 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL 2/2] arm64: dts: fsd: tesla for v5.18
Date:   Fri,  4 Feb 2022 16:41:12 +0100
Message-Id: <20220204154112.133723-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220204154112.133723-1-krzysztof.kozlowski@canonical.com>
References: <20220204154112.133723-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

The dedicated branch for Tesla FSD: bindings, DTS plus platform enablement.
This merges dt-bindings headers from PULL 1/2 (only headers!), so everything
can be applied cleanly within one set.  There is no mixing of driver code, only
dt-bindings.

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/tesla-dt64-5.18

for you to fetch changes up to bd1e3696a052b9b2bd3c1c72ef4bf800a3a1e286:

  arm64: dts: fsd: Add SPI device nodes (2022-01-29 12:28:09 +0100)

----------------------------------------------------------------
Tesla FSD ARM64 changes for v5.18

Add Tesla FSD SoC ARM64 platform: bindings, DTSI+DTS, maintainer's entry
and defconfig change.  This brings and enables this new platform.

This includes clock controller bindings (header files with clock IDs)
which are shared also with Tesla FSD SoC clock controller pull request.

----------------------------------------------------------------
Alim Akhtar (7):
      dt-bindings: add vendor prefix for Tesla
      dt-bindings: arm: add Tesla FSD ARM SoC
      dt-bindings: clock: Add bindings definitions for FSD CMU blocks
      dt-bindings: clock: Document FSD CMU bindings
      arm64: dts: fsd: Add initial device tree support
      arm64: dts: fsd: Add initial pinctrl support
      arm64: defconfig: Enable Tesla FSD SoC

Aswani Reddy (1):
      arm64: dts: fsd: Add SPI device nodes

Krzysztof Kozlowski (1):
      Merge tag 'samsung-dt-bindings-clk-fsd-5.18' into for-v5.18/tesla-fsd

 Documentation/devicetree/bindings/arm/tesla.yaml   |  27 +
 .../devicetree/bindings/clock/tesla,fsd-clock.yaml | 198 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   8 +
 arch/arm64/Kconfig.platforms                       |   6 +
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/tesla/Makefile                 |   3 +
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |  39 ++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         | 335 ++++++++++
 arch/arm64/boot/dts/tesla/fsd.dtsi                 | 731 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 include/dt-bindings/clock/fsd-clk.h                | 150 +++++
 12 files changed, 1501 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/tesla.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
 create mode 100644 arch/arm64/boot/dts/tesla/Makefile
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-evb.dts
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/tesla/fsd.dtsi
 create mode 100644 include/dt-bindings/clock/fsd-clk.h
