Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A099CCCA47B
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Jun 2022 16:37:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351270AbiFEQhV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351256AbiFEQhU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:37:20 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80EC01208A
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:37:16 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id kq6so11781016ejb.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Y+9d1+OO9cS6GSXXKsYHP0IPTFCyxWK3UPU27LfYvY=;
        b=krGDWQbU8FlEbUNByXNyqn1DUlVJRdUW+YI61vu8d4lPd76fIBVxV6C1rdvEIWyZI5
         4cHK0DOIqfzv/XvvnJcqB6gKn6MC2vuuIdl9HK5Arq1M3fTCfthhtcRjan2D/fW4KWHh
         UQHiXLE5erUGkwRQ4Q715vzurGBh8gWH+OrGc+Ve8pd9+UgGA/Xbxk0zEsDHhrjRzWkP
         B3Tn3xjHe7O3GqQclBiE9Yx6hH3PXtVrVXQWl93JEnG/qyFhpKEkREYT2KB9PIkNgey0
         wQLqn7zxdCQEsb/GEQijdpnkQbzG8LCEG/3ktS6ozHgkqjivO2qEyfZlxyyWzDq1FEkA
         Breg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1Y+9d1+OO9cS6GSXXKsYHP0IPTFCyxWK3UPU27LfYvY=;
        b=syZMcez+CmlFIAIkAsCainlqDtSPCAqCohUhp0NzWURg96x0Vt0ueUfOaxBIcyUqoo
         4B/qyu1nwRJXgBDQTXrZZZCQvW92a7LA3PBbu1yrnR2GUavtpnkYE7Un9uPDbUt7kJkh
         TyUGBZTQqce06NriexsAuxjzGvdinosxCEKkdkWrExhJ159cl88Fogv3N3bV3JmQzAdx
         3gg7L+MDFCSwi5OUkWP4/qEyCkCSgnMqC+9ZFKdV3EMJ4lrGgdNE/o4XebVAZ7MuW3NA
         c5y1868aw8XYK0A6z5JRTjc7MgTY76C1FXwJFiuFNfvMZP2At3Y7hCHSTDXEUqmS0LBN
         9Pwg==
X-Gm-Message-State: AOAM5308OeF+AYoOV8ZvJwJjunJNzHCyhPDleWpXRylgyx1sGs3uPrgO
        xz6Vrp/uC2eljyyf3rOpbttixA==
X-Google-Smtp-Source: ABdhPJz5PVIbveEyD/s2fmUpKmKTuS4EOwTP0W93iIA1qKtSRsivtTlk2Zv212mb6+qiZYy0hllPcQ==
X-Received: by 2002:a17:907:d1d:b0:6fe:f789:31e with SMTP id gn29-20020a1709070d1d00b006fef789031emr17561851ejc.697.1654447035096;
        Sun, 05 Jun 2022 09:37:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w3-20020a1709064a0300b006ff0b457cdasm5346770eju.53.2022.06.05.09.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 09:37:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] mmc: samsung,exynos-dw-mshc: convert to dtschema
Date:   Sun,  5 Jun 2022 18:37:06 +0200
Message-Id: <20220605163710.144210-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

I will take the DTS patches via Samsung SoC.  The MMC dt-bindings patch
probably via MMC or Rob's tree.

Changes since v1
================
1. Add patch #4 documenting missing compatible.
2. Add Rb tags.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  ARM: dts: exynos: align MMC node name with dtschema
  arm64: dts: exynos: align MMC node name with dtschema
  dt-bindings: mmc: samsung,exynos-dw-mshc: convert to dtschema
  dt-bindings: mmc: samsung,exynos-dw-mshc: document Exynos5420 SMU

 .../bindings/mmc/exynos-dw-mshc.txt           |  94 ----------
 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  | 160 ++++++++++++++++++
 arch/arm/boot/dts/exynos3250.dtsi             |   6 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |   6 +-
 4 files changed, 166 insertions(+), 100 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml

-- 
2.34.1

