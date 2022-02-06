Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E2DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Feb 2022 14:04:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234043AbiBFOEN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Feb 2022 09:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbiBFOEL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Feb 2022 09:04:11 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B410AC043182
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 06:04:10 -0800 (PST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4811D3F4B4
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Feb 2022 13:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644155892;
        bh=mhgmyPNP0m0BNQfRJEs+RA1d8S2sGALTwPK2/PdoeqQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=v5oXsn68VIdN1DEfQjdrnLMIbNtjhKQVdRTLIpyWFGu7KtADdIH2BnaBBaRqkNYs3
         sJPwrs5EqumdYc0vg/ll5QJhqNFCMfobsjWcIh+LevVwnGKg6laZRBIarHg1moOzcB
         W4ueC0DJGi4DkgbaMlT+ymkKVgIHNM2ZBocrdbTqdqnRYjEvEdWtljwury4QAvoSpF
         hvUoZbZTztKYGPsCw9slT6LWPrgznnynRcqGrMWCBitsr9sJK5uSS9MlWbcmNWuF1t
         q3JLFYknEammWovNUMefdyW4glbF9svB8fNiuKvY5S1mrsj7yBoGLiGrjQNF2cw2Zy
         J+BHo2sbD79jQ==
Received: by mail-wm1-f69.google.com with SMTP id i8-20020a1c3b08000000b0037bb9f6feeeso1552935wma.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Feb 2022 05:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mhgmyPNP0m0BNQfRJEs+RA1d8S2sGALTwPK2/PdoeqQ=;
        b=oKtB1Gljl31q29Wq1xoWSqhEAPQGJQRxO4a581mSdidp2PmuajrxfHViOUX5puHlxy
         t0S09OGFjhsydeNWfKTH4lv/n1AzREuMt9Gm0M48ZhXWrxdLUTrLS02oD/Tdob5l/6J7
         gAwB1nJeyQZYW1kX1KmQXmSrYmA6UyVZ6nxQ2ZkvgBdSyXE1Ulf9/1m8cDJV+JE9wzaH
         KRzgh3kB3y6HiwSW4gZ24wW3vL+kmAZenKMSXRU/t+ZUg2RA+lANJiliYJO27xbdXg4P
         YVjrEsKN+0dD1H7IAZd6E429hcsvEIB8RQYBuYqhvyUVVhXQ2ZNXZdli6weylKI9fKy5
         X/hg==
X-Gm-Message-State: AOAM530q54PMVi0Ax+ZfG2Ld5RYQmb7Uivq91PA0AzPC7q9c6Uf2b8A+
        l6gCbT8dAsOA+Yyj9kPekFq6D6U5flanVUu/WzjU3KqSNoXabDoCYWBGIwtGRNnZcPcDryK94HL
        U63gxTX6R4MKSSERsDehf7QhMxBXsw4SFqBqHl9bg0UC4tesr
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr6590035wrz.518.1644155891717;
        Sun, 06 Feb 2022 05:58:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkiHDCFlLARyPWdpSZMkOvUKQbIp825ke8GbU3gUeldtdtLFyU8aMsXLtKzR3p0cg53OhdNg==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr6590019wrz.518.1644155891514;
        Sun, 06 Feb 2022 05:58:11 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e9sm8296888wrg.60.2022.02.06.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 05:58:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/8] dt-bindings: memory: convert to dtschema
Date:   Sun,  6 Feb 2022 14:57:59 +0100
Message-Id: <20220206135807.211767-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v2:
1. Re-order patches so timings get converted earlier. This fixes dt-checker
robot report.
2. Add Dmitry's review tag.
3. Three new patches:
   #6: dt-bindings: memory: lpddr3: deprecate passing timings frequency as unit address
   #7: memory: of: parse max-freq property
   #8: ARM: dts: exynos: remove deprecated unit address for LPDDR3 timings on Odroid

Changes since v1:
1. Drop patch 1 (ARM dts) - applied.
2. Correct description in lpddr2-timings (Dmitry).

Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  dt-bindings: memory: lpddr2-timings: convert to dtschema
  dt-bindings: memory: lpddr3-timings: convert to dtschema
  dt-bindings: memory: lpddr3: convert to dtschema
  dt-bindings: memory: lpddr3: adjust IO width to spec
  dt-bindings: memory: lpddr3: deprecate manufacturer ID
  dt-bindings: memory: lpddr3: deprecate passing timings frequency as
    unit address
  memory: of: parse max-freq property
  ARM: dts: exynos: remove deprecated unit address for LPDDR3 timings on
    Odroid

 .../ddr/jedec,lpddr2-timings.yaml             | 135 +++++++++
 .../memory-controllers/ddr/jedec,lpddr2.yaml  |   6 +-
 .../ddr/jedec,lpddr3-timings.yaml             | 157 +++++++++++
 .../memory-controllers/ddr/jedec,lpddr3.yaml  | 263 ++++++++++++++++++
 .../memory-controllers/ddr/lpddr2-timings.txt |  52 ----
 .../memory-controllers/ddr/lpddr3-timings.txt |  58 ----
 .../memory-controllers/ddr/lpddr3.txt         | 107 -------
 .../samsung,exynos5422-dmc.yaml               |   3 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |   7 +-
 drivers/memory/of_memory.c                    |   6 +-
 10 files changed, 564 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2-timings.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3-timings.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr3.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2-timings.txt
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3-timings.txt
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3.txt

-- 
2.32.0

