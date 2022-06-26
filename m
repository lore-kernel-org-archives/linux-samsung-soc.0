Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF48EC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 26 Jun 2022 12:03:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234318AbiFZMDt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 26 Jun 2022 08:03:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiFZMDs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Jun 2022 08:03:48 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BE3DEA2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jun 2022 05:03:46 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id c65so9428574edf.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jun 2022 05:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsABAicRvcChQL+dBsFsAqIQBSwYBfRLyHvxx/EjEAc=;
        b=RaoY3Z4G3hIju/NgnA1mb3Gn43W23OKW7Ox9ZCdiGyGO4nKI0D9FdPOicxxPgHYwXh
         EVM+7ckP5U9x/Ip4nLMrEKgpuiHqYApQJF9XmsB/PV8Qfk8oJ9nysoIBYdzyLE6FIzcv
         g1o8OJ61Xf/wzz4ZxOWEQGdKYvRNoA+sdYaq/yKL1rGdlCx0ck7sUq38nV678OPHR49X
         8Ku6I0Kd6oYfeEFQIo+wxWHY/HPxQmu53eyKRwQ/N8K3JURKmO/Iu6nz+EiKTRnoQXwO
         QAAHLLMQVLH+3YNQIMoH0uS8fhuiDmbmgHLxWLxKJuFfXUZJG6oR9NKCv8F/T+dEPNNq
         VOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsABAicRvcChQL+dBsFsAqIQBSwYBfRLyHvxx/EjEAc=;
        b=p7+SiP/t1Ijk82Vub28SbzF9Jxi3rpHbG60E9GidllksQZuJPwu+tnlRFr8TkttI5N
         uun8F+9lycR8GCz+gqhmEEoz5/kkSDDwqq8TWX3PXmSU2scMLQx1wMY4YoQO2bfymv4A
         mhV7Evk3wR3GiU1vgm68kHLbGfYzmSmdvxll0eYoYSAuj8AJZjt+q69Ja1IWfJT5b1tW
         NXJd0LvqsL+AxvhkuXQwVoTmfxoRDZkTm0LLWVAOwYp1gU2NB1cG3P/xOd+b8HdPHCUZ
         MB8LxX6lMqdW89Kxm15FnoRxCmKIFY+hhutMAcqb/TFkC8OGl8Pb4d2ds73DHnHVudHZ
         ygew==
X-Gm-Message-State: AJIora+NHS71+VdJfrgROnbZ+Sf7/gDYMegJ/GYZp+1W3paKIMR8y6Be
        wfBbkVF9CQTGeqcEYb9aK3BOKA==
X-Google-Smtp-Source: AGRyM1vSiUGeDGrWoAfLuZEiBmbedMflmPiR4Vn8nuoypYTKzW3zgy4s6H+x5QfZVYILjBT9kOkBAg==
X-Received: by 2002:a05:6402:84a:b0:426:262d:967e with SMTP id b10-20020a056402084a00b00426262d967emr10327651edz.286.1656245025126;
        Sun, 26 Jun 2022 05:03:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906b29800b0072629374590sm3751585ejz.120.2022.06.26.05.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 05:03:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/5] mmc: dt-bindings: samsung,s3c6410-sdhci: convert to dtschema
Date:   Sun, 26 Jun 2022 14:03:37 +0200
Message-Id: <20220626120342.38851-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

I'll take DTS patches via Samsung SoC. The MMC bindings could go via MMC tree.

Best regards,
Krzysztof

Krzysztof Kozlowski (5):
  ARM: dts: exynos: align SDHCI node name with dtschema
  ARM: dts: s3c24xx: align SDHCI node name with dtschema
  ARM: dts: s3c64xx: align SDHCI node name with dtschema
  ARM: dts: s5pv210: align SDHCI node name with dtschema
  dt-bindings: mmc: samsung,s3c6410-sdhci: convert to dtschema

 .../bindings/mmc/samsung,s3c6410-sdhci.yaml   | 81 +++++++++++++++++++
 .../devicetree/bindings/mmc/samsung-sdhci.txt | 32 --------
 arch/arm/boot/dts/exynos4.dtsi                |  8 +-
 arch/arm/boot/dts/s3c2416.dtsi                |  4 +-
 arch/arm/boot/dts/s3c64xx.dtsi                |  6 +-
 arch/arm/boot/dts/s5pv210.dtsi                |  8 +-
 6 files changed, 94 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/samsung,s3c6410-sdhci.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/samsung-sdhci.txt

-- 
2.34.1

