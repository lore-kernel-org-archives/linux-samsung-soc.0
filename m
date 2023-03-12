Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9BCC6FD1F
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 13:10:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbjCLNKX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 09:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjCLNKX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 09:10:23 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6941246097
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 06:10:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id bp27so2139112lfb.6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678626619;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2tChENWyDZGQKa5Zk1lhzLBop14+1J962hBMY2G3xM=;
        b=qzCPJCkkwzh2IRULikZr4rmRYGRrc/+B6CNsHIfSQ3nG4O2iV3XJbEKw9rgl6tvGsV
         3+9xiHx4QOK/QsE63CMmYXis300wzxjJ1Cp7U0F/54CNAvyOPw17DRQOOtZZJ1Q/Lad0
         QeVjDJ+vGK8WiIj9vY298P5z1nMZOtBHkzC37ZViQD8nTRRlvsTkFzs52GdFMx9MWytk
         1ZjQh7k1K1V+84l5kFSAK7AiRqXM+VoKgsJIXPnJV530b/7d3Y/3vw3q6Cfbbf7kbsHl
         xLpH9K0QC4yuS4ri7/7yCgxWZctYZwzsalnyXfBaJQdFVJNUK8Etls+zeExBYNjJiAug
         XDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678626619;
        h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2tChENWyDZGQKa5Zk1lhzLBop14+1J962hBMY2G3xM=;
        b=j8SBF4DvkyeCsDojH74R+3sdwnwshgNmJpd8ZO2Lg7T6fuPLQg9o7KCSVR+iFSGxHl
         utbtKeevq0cQMLZchhRO1Ot9LqoE+C3VX304o42OTpi0YALDQIYGzCxjwstZCa1FEbqp
         Uml7CQ98N2TLMCbav1KEfnZ/AdllUUIZ/U2pU8Tu9B38ICWFdYqaekMPlJ2HBv9TVp67
         tu/dVUCY96hoLLuEqKFQF4hvlX54D2uq1PH315xoVTYGXg4CxkDPX8DfDFkOwDn5mIpg
         +KaoqZcM09VXXxcrSmpp07fADkRl8AEw1JstOA9zkEoA2OVrWNbPNdzfJblkXsQiXrSX
         5TRg==
X-Gm-Message-State: AO0yUKUmUyBnn/nPfsTLZ2yDyVw1xlbkbY0bTUMPuoJN+6fm2dHGPU0Q
        y08WW8+aU5KjvYuXT24MmXY66P63SIf3/ERx
X-Google-Smtp-Source: AK7set/VykAie+xm20IVxmw1mytKAPgDNZPrJtZWqRw1jOfABHdU/wQaqGJdtParsk9Txy8kpI5wxw==
X-Received: by 2002:a19:c216:0:b0:4b4:8f01:f8b1 with SMTP id l22-20020a19c216000000b004b48f01f8b1mr8437489lfc.31.1678626619537;
        Sun, 12 Mar 2023 06:10:19 -0700 (PDT)
Received: from 0000-cover-letter.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id s4-20020a19ad44000000b004d863fa8681sm651069lfd.173.2023.03.12.06.10.19
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 06:10:19 -0700 (PDT)
Message-Id: <1678626510.1783316-0-sleirsgoevy@gmail.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 16:03:15 +0300
Subject: [PATCH v3 0/2] mmc: dw_mmc: fix DW MMC cores with 32-bit bus on 64-bit Linux systems 
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

DesignWare MMC cores have a configurable data bus width of either 16, 32, or 64
bytes. It is possible, and some vendors actually do it, to ship a DW MMC core
configured for 32-bit data bus within a 64-bit SoC. In this case the kernel
will attempt 64-bit (readq) accesses to certain 64-bit MMIO registers, while
the core will expect pairs of 32-bit accesses.

It seems that currently the only register for which the kernel performs 64-bit
accesses is the FIFO. The symptom is that the DW MMC core never receives a read
on the second half of the register, does not register the datum as being read,
and thus not advancing its internal FIFO pointer, breaking further reads. It
also seems that this FIFO is only used for small (less than 16 bytes)
transfers, which probably means that only some SDIO cards are affected.

Changelog:

v3:
- removed "fifo-access-32bit" devicetree property
- added "samsung,exynos78xx-dw-mshc" compatible string
- added "samsung,exynos78xx-dw-mshc-smu" compatible string

v2:
- added commit messages

v1:
- added "fifo-access-32bit" devicetree property
- added DW_MMC_QUIRK_FIFO64_32
- added new dw_mci_{pull,push}_data* variants (...-data64_32)

Sergey Lisov (2):
  dt-bindings: exynos-dw-mshc-common: add exynos78xx variants
  mmc: dw_mmc: add an option to force 32-bit access to 64-bit FIFO

 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |   2 +
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    |   2 +-
 drivers/mmc/host/dw_mmc-exynos.c              |  41 +++++-
 drivers/mmc/host/dw_mmc.c                     | 122 +++++++++++++++++-
 drivers/mmc/host/dw_mmc.h                     |   2 +
 5 files changed, 165 insertions(+), 4 deletions(-)

-- 
2.38.3


