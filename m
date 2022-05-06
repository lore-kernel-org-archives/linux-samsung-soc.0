Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63BCC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 May 2022 08:14:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389930AbiEFISc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 May 2022 04:18:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381277AbiEFIS3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 May 2022 04:18:29 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694F668305
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 May 2022 01:14:46 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id bg25so3957773wmb.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 May 2022 01:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xa612yVHb6HXBQzlDy/uT4iwCUAq6n6m6URF8UDTFTU=;
        b=pAiRgKNTrhEaUnUs+8tjgRIqQlOirjUVrUZP7kH10tLCeLNd5ytCQoxAx8PJ5aoK7D
         R/M4OEQtf9Vb4b98mzjUWya4daurbyQyZhbb+r6kjf7fGBG/dWPrJAak1wztEi5whqNu
         xi0l3ylZEt1E3HtxEuwpwhxnRiV4PIUC4o7yHxMPHUtREvsyHjwWNfn58HTitNuWKuFl
         kD3Tur6t5HWrRZWxDNIS4aXwmQii1XKxqU1iZNaeKv9ySfKcpE42spFewIK9XAqVSBIM
         u3zQ4mQx1uNnrFVxq4x7+Tq/mxgdamJlXNPSQ93a9ukGEOXBzW1bKaDg5EShaIXcjjxk
         4YAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xa612yVHb6HXBQzlDy/uT4iwCUAq6n6m6URF8UDTFTU=;
        b=2c1tuAd1NnMp8hcLlHr51v4YIOgqCuknmEmNNxnXNbEIm1JFxzo/bQrCHdMbNoEGN9
         Kfp+BrIDjAVeu4Ejkp7KCXwioemTnO4sG3nfUxzCw3nfdFcSI+nq5M3sYWc8ZIFdxlQL
         TOWhsiugGilm4KcObcgZnicmJqqinRmWms2WYmIuwqnpajaYEeWSXuZOiHlXFvp2SXNC
         PdH/LV0+s7CVThz5ZDiAZLLeOb+l6hjzr19kycMClIXm4HAp3WWGP7n+e4RT74ybYZUB
         bsUfI2mribL5rsSOxW4ELB4RkUqA1U8Urnt599ofaZzIg76pBulCHMpSBkzyp2PCdlr/
         zWGQ==
X-Gm-Message-State: AOAM531qXWdo5K06X82DoCew2j2ZA5fGCAeNVCqCVmFHmBuz7FYDDNGM
        NMORroBwGf+85wKbp7kNI08GsBvqGfNCOvE2
X-Google-Smtp-Source: ABdhPJwEacI0vG9xsyOL4YvQY1+ii+HmvrdPQD6nUpZtBIX974o17ZgCm6xXecCjVVYHxwlQh90a2w==
X-Received: by 2002:a7b:c8d6:0:b0:394:25ff:2de with SMTP id f22-20020a7bc8d6000000b0039425ff02demr8490338wml.154.1651824884930;
        Fri, 06 May 2022 01:14:44 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm3059657wrr.91.2022.05.06.01.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 01:14:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/6] ARM: dts: various cleanup for v5.19, part two
Date:   Fri,  6 May 2022 10:14:34 +0200
Message-Id: <20220506081438.149192-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
References: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull.

Set of cleanup patches for various ARM archs.  Some of them were acked by
respective maintainers, some were waiting a bit so I decided to push through my
tree.

Best regards,
Krzysztof

The following changes since commit c9bdd50d2019f78bf4c1f6a79254c27771901023:

  ARM: dts: socfpga: align interrupt controller node name with dtschema (2022-04-07 21:30:22 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/dt-cleanup-5.19-2

for you to fetch changes up to 361736cf495ccc49df5ae66d0f9f10a55976d2da:

  ARM: dts: socfpga: drop useless 'dma-channels/requests' properties (2022-05-04 10:26:14 +0200)

----------------------------------------------------------------
Minor cleanup of ARM DTS for v5.19, part two

Align SPI NOR node names to DT schema and drop unused/undocumented
dma-channels/dma-requests.

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      ARM: dts: nuvoton: align SPI NOR node name with dtschema
      ARM: dts: omap: align SPI NOR node name with dtschema
      ARM: dts: marvell: align SPI NOR node name with dtschema
      ARM: dts: zynq-7000: drop useless 'dma-channels/requests' properties
      ARM: dts: socfpga: drop useless 'dma-channels/requests' properties

 arch/arm/boot/dts/am335x-moxa-uc-2100-common.dtsi        | 2 +-
 arch/arm/boot/dts/am335x-moxa-uc-8100-common.dtsi        | 2 +-
 arch/arm/boot/dts/am335x-phycore-som.dtsi                | 2 +-
 arch/arm/boot/dts/am335x-sl50.dts                        | 2 +-
 arch/arm/boot/dts/am3874-iceboard.dts                    | 2 +-
 arch/arm/boot/dts/am437x-cm-t43.dts                      | 2 +-
 arch/arm/boot/dts/am437x-idk-evm.dts                     | 2 +-
 arch/arm/boot/dts/am437x-sk-evm.dts                      | 2 +-
 arch/arm/boot/dts/am43x-epos-evm.dts                     | 2 +-
 arch/arm/boot/dts/am574x-idk.dts                         | 2 +-
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts                | 2 +-
 arch/arm/boot/dts/am57xx-idk-common.dtsi                 | 2 +-
 arch/arm/boot/dts/armada-370-db.dts                      | 2 +-
 arch/arm/boot/dts/armada-370-seagate-personal-cloud.dtsi | 2 +-
 arch/arm/boot/dts/armada-370-synology-ds213j.dts         | 2 +-
 arch/arm/boot/dts/armada-375-db.dts                      | 2 +-
 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts        | 2 +-
 arch/arm/boot/dts/armada-385-atl-x530.dts                | 2 +-
 arch/arm/boot/dts/armada-385-clearfog-gtr.dtsi           | 2 +-
 arch/arm/boot/dts/armada-385-db-88f6820-amc.dts          | 2 +-
 arch/arm/boot/dts/armada-385-db-ap.dts                   | 2 +-
 arch/arm/boot/dts/armada-385-synology-ds116.dts          | 2 +-
 arch/arm/boot/dts/armada-385-turris-omnia.dts            | 2 +-
 arch/arm/boot/dts/armada-388-db.dts                      | 2 +-
 arch/arm/boot/dts/armada-388-gp.dts                      | 2 +-
 arch/arm/boot/dts/armada-388-rd.dts                      | 2 +-
 arch/arm/boot/dts/armada-38x-solidrun-microsom.dtsi      | 2 +-
 arch/arm/boot/dts/armada-390-db.dts                      | 2 +-
 arch/arm/boot/dts/armada-398-db.dts                      | 2 +-
 arch/arm/boot/dts/armada-xp-axpwifiap.dts                | 2 +-
 arch/arm/boot/dts/armada-xp-crs305-1g-4s-bit.dts         | 2 +-
 arch/arm/boot/dts/armada-xp-crs305-1g-4s.dtsi            | 2 +-
 arch/arm/boot/dts/armada-xp-crs326-24g-2s-bit.dts        | 2 +-
 arch/arm/boot/dts/armada-xp-crs326-24g-2s.dtsi           | 2 +-
 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s-bit.dts     | 2 +-
 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dtsi        | 2 +-
 arch/arm/boot/dts/armada-xp-db-dxbc2.dts                 | 2 +-
 arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts            | 2 +-
 arch/arm/boot/dts/armada-xp-db.dts                       | 2 +-
 arch/arm/boot/dts/armada-xp-gp.dts                       | 2 +-
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts            | 2 +-
 arch/arm/boot/dts/armada-xp-synology-ds414.dts           | 2 +-
 arch/arm/boot/dts/dove-cubox.dts                         | 2 +-
 arch/arm/boot/dts/dove-d2plug.dts                        | 2 +-
 arch/arm/boot/dts/dove-d3plug.dts                        | 2 +-
 arch/arm/boot/dts/dove-dove-db.dts                       | 2 +-
 arch/arm/boot/dts/dra7-evm-common.dtsi                   | 2 +-
 arch/arm/boot/dts/dra72-evm-common.dtsi                  | 2 +-
 arch/arm/boot/dts/dra76-evm.dts                          | 2 +-
 arch/arm/boot/dts/kirkwood-dir665.dts                    | 2 +-
 arch/arm/boot/dts/kirkwood-synology.dtsi                 | 2 +-
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts                | 6 +++---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts                | 2 +-
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts               | 6 +++---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts                | 8 ++++----
 arch/arm/boot/dts/nuvoton-npcm750-runbmc-olympus.dts     | 6 +++---
 arch/arm/boot/dts/socfpga.dtsi                           | 2 --
 arch/arm/boot/dts/socfpga_arria10.dtsi                   | 2 --
 arch/arm/boot/dts/zynq-7000.dtsi                         | 2 --
 59 files changed, 65 insertions(+), 71 deletions(-)
