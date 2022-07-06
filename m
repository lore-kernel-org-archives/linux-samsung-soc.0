Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01499CCA47F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 16:38:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbiGFQiC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 12:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbiGFQiB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 12:38:01 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC3FC193C3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 09:38:00 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a11so19145063ljb.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BbnF7h70YkDmP9ErED0ng5loM2AwPwzyHrzbSSQ3P9k=;
        b=ProhIAPeKWYYTZO+06j73QlKlAil3gMuBFiaYbqddtRKOkrOxJ/GN5y7paxFRA8ISS
         P/rD5b/Noxn19mWS580dDRSJuOYSYbdqfzKZ/vWERB/s1vrHL6C5Iv3uN+iar2ayOy6k
         wJsGvTXzotAicEJqn7PVeDvc8NEJV8JxCEDruYI48TnX+Yn3xdKZilcL4D/58c2X9f+e
         G9paddKkXzTaOg/c5cOtuW/YTx1zKYTHvgnRgl9q5yWW0DWAWraNf/w3eyv+kHMI0B9F
         6THHJOLmsPzqQnX5OP8AbyPbj+KPhSYLRHyotLbZLdS8wdTfDRjIzhY/CLBK667uRqxt
         0frQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BbnF7h70YkDmP9ErED0ng5loM2AwPwzyHrzbSSQ3P9k=;
        b=DZIl+zkUDwAztjY7hlOOOQAh8q2diYOq2iTa8lhMJMwo3Z+/QI0qQf1DKSa29MnIra
         usOJfewDLwKbMbMPoEDPei42NGVo7sel1XyO2gUOvDP5wDv8VEZx5hpGNHV5tfv508QQ
         zFb25wWXlYZHHAGRen2JwNnpOExDIqw39lRgdiFVaGc2uKap6UJe5Q5jgE+NBbNltHhR
         MLWjzgvB4uXjsFppXkuPNoY8EVrflagZhs4P5s0BZHx4ruwY0BnShxlgPz0Ub7lxmBMI
         UhwdA42gdyDHRf9ve5X0tuTlH5/A9buXAHfptrz3ra2TWVQgm+7mIjtMDdSsNWEzOhyh
         W8YQ==
X-Gm-Message-State: AJIora8im15cDqyu+hmE8IX7xg1KqPRmkh8w6ijPO4JsrpRHV8Hm2fRc
        bMTLSA6sd8o0tOqy1SX2eFpAByftNfjdkx0m
X-Google-Smtp-Source: AGRyM1sDCHefX4WYIuajRhYSYoVSRX5euAvMxSTHGI0Y3Afj0rqHcog4kbAvaRTEQRTKa2relR527w==
X-Received: by 2002:a2e:b94a:0:b0:25c:271:5253 with SMTP id 10-20020a2eb94a000000b0025c02715253mr16611856ljs.16.1657125479124;
        Wed, 06 Jul 2022 09:37:59 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id v12-20020a056512096c00b004831cc659ffsm1168063lft.125.2022.07.06.09.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:37:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: cleanup for v5.20, second round
Date:   Wed,  6 Jul 2022 18:37:54 +0200
Message-Id: <20220706163754.33064-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706163754.33064-1-krzysztof.kozlowski@linaro.org>
References: <20220706163754.33064-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 2f7a7f941d770c03942fefe1d91ce954cb329c7e:

  Merge branch 'for-v5.20/aspeed-dts-cleanup' into for-v5.20/dts-cleanup (2022-06-27 10:19:57 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/dt-cleanup-5.20-2

for you to fetch changes up to 3d34cae102b0612dcce0bd4603a4d6302b8039ed:

  Merge branch 'for-v5.20/aspeed-dts-cleanup' into for-v5.20/dts-cleanup (2022-07-05 13:44:14 +0200)

----------------------------------------------------------------
Cleanup of ARM DTS for v5.20, part two

Series of cleanups for ARM DTS - white-spaces, gpio-key subnode names
and gpio-key properties for more boards: TI, Marvell, AT91 and Aspeed.

----------------------------------------------------------------
Krzysztof Kozlowski (12):
      ARM: dts: ti: adjust whitespace around '='
      ARM: dts: omap: adjust whitespace around '='
      ARM: dts: marvell: align gpio-key node names with dtschema
      ARM: dts: marvell: correct gpio-keys properties
      ARM: dts: omap: align gpio-key node names with dtschema
      ARM: dts: omap: correct gpio-keys properties
      ARM: dts: at91: align gpio-key node names with dtschema
      ARM: dts: at91: correct gpio-keys properties
      ARM: dts: at91: drop unneeded status from gpio-keys
      ARM: dts: aspeed: align gpio-key node names with dtschema
      ARM: dts: aspeed: correct gpio-keys properties
      Merge branch 'for-v5.20/aspeed-dts-cleanup' into for-v5.20/dts-cleanup

 arch/arm/boot/dts/am335x-boneblack-wireless.dts    |  2 +-
 arch/arm/boot/dts/am335x-boneblue.dts              |  2 +-
 arch/arm/boot/dts/am335x-bonegreen-wireless.dts    |  2 +-
 arch/arm/boot/dts/am335x-cm-t335.dts               |  4 +-
 arch/arm/boot/dts/am335x-evm.dts                   |  8 ++--
 arch/arm/boot/dts/am335x-guardian.dts              |  2 -
 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi  |  4 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi  |  4 +-
 arch/arm/boot/dts/am335x-pcm-953.dtsi              |  4 +-
 arch/arm/boot/dts/am335x-pepper.dts                |  8 ++--
 .../boot/dts/am335x-sancloud-bbe-extended-wifi.dts |  2 +-
 arch/arm/boot/dts/am335x-shc.dts                   |  6 +--
 arch/arm/boot/dts/am3517-evm-ui.dtsi               | 26 ++++++------
 arch/arm/boot/dts/am3517-evm.dts                   | 18 ++++----
 arch/arm/boot/dts/am3874-iceboard.dts              |  4 +-
 arch/arm/boot/dts/am437x-idk-evm.dts               |  6 +--
 arch/arm/boot/dts/am437x-l4.dtsi                   |  2 +-
 arch/arm/boot/dts/armada-370-c200-v2.dts           |  8 ++--
 arch/arm/boot/dts/armada-370-rd.dts                |  2 -
 arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi |  8 ++--
 .../dts/armada-370-seagate-personal-cloud.dtsi     |  8 ++--
 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts  |  2 +-
 arch/arm/boot/dts/armada-385-clearfog-gtr.dtsi     |  4 +-
 arch/arm/boot/dts/armada-385-linksys.dtsi          |  4 +-
 arch/arm/boot/dts/armada-388-clearfog-base.dts     |  2 +-
 arch/arm/boot/dts/armada-388-clearfog.dts          |  2 +-
 arch/arm/boot/dts/armada-xp-axpwifiap.dts          |  6 +--
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts      |  8 ++--
 arch/arm/boot/dts/armada-xp-openblocks-ax3-4.dts   |  6 +--
 arch/arm/boot/dts/aspeed-bmc-ampere-mtjade.dts     | 30 +++++++-------
 arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts   | 48 +++++++++++-----------
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts       | 10 ++---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts       | 14 +++----
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 22 +++++-----
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts        | 23 ++++++-----
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts        | 20 ++++-----
 arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts        |  2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts       |  2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         | 30 +++++++-------
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts        | 14 +++----
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts        |  4 +-
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts   | 16 ++++----
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts         |  4 +-
 arch/arm/boot/dts/at91-foxg20.dts                  |  4 +-
 arch/arm/boot/dts/at91-gatwick.dts                 |  2 +-
 arch/arm/boot/dts/at91-kizbox.dts                  |  8 ++--
 arch/arm/boot/dts/at91-kizbox2-common.dtsi         | 10 ++---
 arch/arm/boot/dts/at91-kizbox3-hs.dts              | 12 +++---
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi      |  6 +--
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts        |  2 +-
 arch/arm/boot/dts/at91-qil_a9260.dts               |  4 +-
 arch/arm/boot/dts/at91-sam9x60ek.dts               |  5 +--
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |  4 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts      |  5 +--
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |  5 +--
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts          |  4 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |  4 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts        |  4 +-
 arch/arm/boot/dts/at91-sama5d4_xplained.dts        |  4 +-
 arch/arm/boot/dts/at91-sama5d4ek.dts               |  4 +-
 arch/arm/boot/dts/at91-sama7g5ek.dts               |  4 +-
 arch/arm/boot/dts/at91-wb45n.dts                   |  7 +---
 arch/arm/boot/dts/at91-wb50n.dts                   | 10 ++---
 arch/arm/boot/dts/at91sam9260ek.dts                |  6 +--
 arch/arm/boot/dts/at91sam9261ek.dts                | 10 ++---
 arch/arm/boot/dts/at91sam9263ek.dts                |  6 +--
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi        |  6 +--
 .../boot/dts/at91sam9g25-gardena-smart-gateway.dts |  2 +-
 arch/arm/boot/dts/at91sam9m10g45ek.dts             | 16 ++++----
 arch/arm/boot/dts/at91sam9n12ek.dts                |  4 +-
 arch/arm/boot/dts/at91sam9rlek.dts                 |  6 +--
 arch/arm/boot/dts/da850-evm.dts                    | 18 ++++----
 arch/arm/boot/dts/da850.dtsi                       | 12 +++---
 arch/arm/boot/dts/dm8148-evm.dts                   |  2 +-
 arch/arm/boot/dts/dm8168-evm.dts                   |  2 +-
 arch/arm/boot/dts/dra62x-j5eco-evm.dts             |  2 +-
 arch/arm/boot/dts/dra76x.dtsi                      |  6 +--
 arch/arm/boot/dts/omap2420-h4.dts                  |  2 +-
 arch/arm/boot/dts/omap3-evm-37xx.dts               |  2 +-
 arch/arm/boot/dts/omap3-evm.dts                    |  2 +-
 arch/arm/boot/dts/omap3-gta04.dtsi                 |  2 +-
 arch/arm/boot/dts/omap3-igep.dtsi                  |  2 +-
 arch/arm/boot/dts/omap3-ldp.dts                    |  6 +--
 arch/arm/boot/dts/omap3-lilly-a83x.dtsi            |  2 +-
 arch/arm/boot/dts/omap3-n900.dts                   |  4 +-
 arch/arm/boot/dts/omap3-n950-n9.dtsi               |  4 +-
 arch/arm/boot/dts/omap3-overo-base.dtsi            |  2 +-
 arch/arm/boot/dts/omap3-pandora-common.dtsi        |  2 +-
 arch/arm/boot/dts/omap3430-sdp.dts                 |  6 +--
 arch/arm/boot/dts/omap5-l4.dtsi                    |  2 +-
 91 files changed, 301 insertions(+), 348 deletions(-)
