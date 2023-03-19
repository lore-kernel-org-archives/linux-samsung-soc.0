Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEE5C7618A
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 19 Mar 2023 15:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbjCSP1t (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 19 Mar 2023 11:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbjCSP1r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Mar 2023 11:27:47 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A815B1EFD6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Mar 2023 08:27:45 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id cy23so37749337edb.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Mar 2023 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679239664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btf04DuiQhB9X18hLvJQP2+uq59G2JcTyG4E+evpdrk=;
        b=jZ86PcRXCyuvFtD4O4YDLdPXc6UStKeJVz8B2x5LqEnIkFbT5VEDaeV9kE1TgwrW3S
         8PPjp546vUnF9qyqL/IfReOc/upuSIE5QCqBRj5fc9LpdNrNuSyJxUiIcDMxhX+ulVMQ
         Vj+N4+pZdcsVwrPD3bOZvwewnRO2uiUTUPOQmeVp67prf4pUBCtn7C94Xp1CtCsOn1E3
         OefiJ7QW0RB3mmpSjVDrFkOEUIL+kH15yezkvLqfmdTI3pkKgNgGuKWMEE4xSpFVZr7P
         DyvIDN2xIWPu1nPAnRznCz+YqcF2vMUjlyPkQXpLKqjNfE+1HBacr9JP2Zm0pee0dazI
         BR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679239664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btf04DuiQhB9X18hLvJQP2+uq59G2JcTyG4E+evpdrk=;
        b=OvQJ0WzxBJzutMBHx0mpJ5pLgdby29Q0bF18GpLes8e61PzpcY4aN4NVK4wUHDHgBN
         f53UA5x/JroERteYe3KynmrwI5RloWQUsXoo+LUGQWEIblkfS6fkee/QA4piB/fcKlja
         HdDaZWk0TnR2k0z4agoSxeofKRJsXBMBtynKmJ3eO7HR6AR5b+RfZFVp9gxzRCUp9Jor
         zmPUZAhiCJ04lqQPkyMHSCvhlCXBkNkvrth1uTHGc3mgiHG9qBnquSFcv0Y0sd3CgCON
         mYgeHmbQYO1HkwoN06BEBJSlQVvpKVrQi4Jj7e4y/21q7D4Hd0GvCXJe+Mgs7quw8ibx
         LGoA==
X-Gm-Message-State: AO0yUKUGfk6BoONUFvFup4NZmiF+1d0gmxlgt4OjjHj4K7DIOsyJkYGm
        b1KqAZDYOF8MxIqDj7Bl+i7KuQ==
X-Google-Smtp-Source: AK7set8dTQz+GK5qZqXqshzMDzIkzel/SC4URpp1ZrQOXGslo8nsuHaUFu055ExOlc0D6tTx8CSwlw==
X-Received: by 2002:a17:907:175b:b0:92d:591f:6586 with SMTP id lf27-20020a170907175b00b0092d591f6586mr5811607ejc.34.1679239664162;
        Sun, 19 Mar 2023 08:27:44 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id t7-20020a1709064f0700b008cda6560404sm3340857eju.193.2023.03.19.08.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:27:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [GIT PULL] ARM: dts: few cleanups for v6.4
Date:   Sun, 19 Mar 2023 16:27:40 +0100
Message-Id: <20230319152740.34551-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230319152740.34551-1-krzysztof.kozlowski@linaro.org>
References: <20230319152740.34551-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.4

for you to fetch changes up to aff750faa5ac699df7ade5a31b6ba52ab1072d8a:

  ARM: dts: hisilicon: use "okay" for status (2023-03-12 18:01:00 +0100)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.4

1. TI, Marvell, HiSilicon: "okay" over "ok" is preferred for status
   property.
2. OMAP: align UART node name with bindings.

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      ARM: dts: omap: align UART node name with bindings
      ARM: dts: marvell: use "okay" for status
      ARM: dts: ti: use "okay" for status
      ARM: dts: hisilicon: use "okay" for status

 arch/arm/boot/dts/armada-388-db.dts     |  2 +-
 arch/arm/boot/dts/da850-evm.dts         |  2 +-
 arch/arm/boot/dts/dove.dtsi             |  2 +-
 arch/arm/boot/dts/hi3620-hi4511.dts     | 12 ++++++------
 arch/arm/boot/dts/hip04-d01.dts         |  2 +-
 arch/arm/boot/dts/keystone-k2e-evm.dts  |  2 +-
 arch/arm/boot/dts/keystone-k2g-evm.dts  |  2 +-
 arch/arm/boot/dts/keystone-k2hk-evm.dts |  2 +-
 arch/arm/boot/dts/keystone-k2l-evm.dts  |  2 +-
 arch/arm/boot/dts/omap-zoom-common.dtsi |  8 ++++----
 10 files changed, 18 insertions(+), 18 deletions(-)
