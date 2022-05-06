Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99681C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 May 2022 08:14:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389871AbiEFISa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 May 2022 04:18:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238429AbiEFIS1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 May 2022 04:18:27 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688BC67D29
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 May 2022 01:14:45 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id w4so8957481wrg.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 May 2022 01:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/88PareT3FwqgQqeieGvN6EcUA+3T4c6k7+dT7Kdhd8=;
        b=r/cxdJ5nHqykOS3JTkfrKs4GPwUNikKhRZp8payZC+QEejHrBpvXEH58/a03wbuBG/
         VY18f5njTHTnREExBBbT8yoX8BkLGu7N16h+DjFCWqMFG3xDB270EhI1rlwGKAzuQlEN
         X3fTLBW0xyo+MKwnQPF2D0XC63IgshFLpfN68y6s4iSSCRDY94NOOTR/4QDZrwPWFo6l
         Qs+iZt42jCocGmcsWYUAXQffneDbJcE5NTusAxkvn0iaVptGu1ellbDdgE+kLysBhiQO
         lpxatkNrnyak7cyI+ooUnSqad9//ghnbngagLntZaL3SQupdnsIyot2DUFUPKNKMbVZG
         wj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/88PareT3FwqgQqeieGvN6EcUA+3T4c6k7+dT7Kdhd8=;
        b=q9CgULfEdW83e4EO/VsnPiFcCmBEqYtkLrV9ANrnLszhX7ASD6lb3U76kDqaCj/Fqv
         +SW/+2w6gCV2WdO/hMMVkySx93p+M4EG5WFjvnpIEuKwz6qIvbaqu2yWD7zwSm96MVKz
         V7rVPWZ9682CoZg2eLw4OV5PzmoMAhaU0t4XJhM31kChK6GoSB7kq4V2jS7QzjTWhVpP
         7SR1aw+Y/+x/y5HbtnJk3ghP2krZKbchcnps6Kjj5qxQD0wq4qZ/WPkhv8rOVlFWVQg1
         mqHqW44oTtLmUVT0++LSfYW7bhUT9l/BarMKOQ3axgXO3RF0LO2SY9l19JYMntdD7k+6
         oc2Q==
X-Gm-Message-State: AOAM531uQJKYKGoyTfp27cwqEl4Sqr4qoIg2OW3Ka4qMyLwB0jPoBveJ
        cjcYaR3EbD7KfHHqaWJ1CIfUnt+FDISmcFz0
X-Google-Smtp-Source: ABdhPJwYp8Fq7iZ8niSaeSO+xK9EyZuxtnwlwi33jbqc92ETr6vConll0/LoWvaQT2kFOsd2gYwKyA==
X-Received: by 2002:a5d:5051:0:b0:20c:884b:2347 with SMTP id h17-20020a5d5051000000b0020c884b2347mr1684270wrt.224.1651824883839;
        Fri, 06 May 2022 01:14:43 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm3059657wrr.91.2022.05.06.01.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 01:14:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/6] arm64: dts: various cleanup for v5.19
Date:   Fri,  6 May 2022 10:14:33 +0200
Message-Id: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Set of cleanup patches for various ARM64 archs.  Some of them were acked by
respective maintainers, some were waiting a bit so I decided to push through my
tree.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/dt64-cleanup-5.19

for you to fetch changes up to 8dba791a7280542bc125b68b3547bfa2680bc1af:

  arm64: dts: broadcom: drop useless 'dma-channels/requests' properties (2022-05-04 10:26:56 +0200)

----------------------------------------------------------------
Minor cleanup of ARM64 DTS for v5.19

Align SPI NOR node names and freq-table-hz to DT schema. Drop
unused/undocumented dma-channels/dma-requests.

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      arm64: dts: hisilicon: align 'freq-table-hz' with dtschema in UFS
      arm64: dts: microchip: align SPI NOR node name with dtschema
      arm64: dts: marvell: align SPI NOR node name with dtschema
      arm64: dts: stratix10/agilex: drop useless 'dma-channels/requests' properties
      arm64: dts: broadcom: drop useless 'dma-channels/requests' properties

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi          | 2 --
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi           | 2 --
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi        | 2 --
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi                  | 4 ++--
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi                  | 4 ++--
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi              | 2 --
 arch/arm64/boot/dts/marvell/armada-3720-db.dts             | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts           | 2 +-
 arch/arm64/boot/dts/marvell/armada-7040-db.dts             | 4 ++--
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-db.dts             | 4 ++--
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi         | 2 +-
 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts    | 2 +-
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi                | 2 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi                 | 2 +-
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi                 | 2 +-
 arch/arm64/boot/dts/microchip/sparx5_nand.dtsi             | 2 +-
 arch/arm64/boot/dts/microchip/sparx5_pcb125.dts            | 4 ++--
 arch/arm64/boot/dts/microchip/sparx5_pcb134_board.dtsi     | 4 ++--
 arch/arm64/boot/dts/microchip/sparx5_pcb135_board.dtsi     | 4 ++--
 22 files changed, 25 insertions(+), 33 deletions(-)
