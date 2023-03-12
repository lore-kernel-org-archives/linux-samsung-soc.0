Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C751DC7618A
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 17:02:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjCLRCV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 13:02:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjCLRCT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 13:02:19 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD6CD392AE
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:02:18 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id s22so12840470lfi.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678640536;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UV8fqbjOdVKsnwcy5S2/ICsUmjKXmCtfZ/sJfhZkPI=;
        b=A+GLSgDKEsnufpjNH2FhqxKFC5rfCiMMmPujZHtxV/VhVcn2M+qxWyXxWBib6mWrkm
         pjBlUGOAgDh8fps4RLkqQvaQKYoHwBUfpdKcA7ph8v9tFpXGpMHUqpQH1pwbv9fJWo+x
         9lIu/iKNdmyPH+3ye8uJkKT2Thifam2JX/ytKySahMiqmofqaJebtrdT+oPg5+DIww8I
         T+5hLqMErOQfl+g/6VF/vRpeyGDPMBUYcp6/co9AACeP2RofYwlkiRHRXHHmTrgGO8pm
         4hWaJhddocSK9QVjuKjSHoTl71pVL90UVYzMhXXcbb472j9NWQCstWfYVGpKubqcxJkl
         d7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678640536;
        h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6UV8fqbjOdVKsnwcy5S2/ICsUmjKXmCtfZ/sJfhZkPI=;
        b=tBBGfamM4PIUMHu0YsTNDooqCfuJ6J1toAkthVjVK391ZhClPXK9F4qgOmSgLTW118
         7ogvy5TR1wzSDly7gLz1lhKDbLqr09xWE+cgsENcy8gAImr6MVYBVdZEAyr2SRU12sA1
         RJocYF+APtuAIL4UswDS73Au3ZOWpz7yrT6173dgUJBzpULmIH+zb6iA79twTBQIQh8j
         7uCToQjQCn563zViILBXwL/368yTKyK70f9HNzw7j5Zt3DeD96RM9feGZVnjbXMrK6Y/
         twtuag41ctqWUtxygseJGihGjsJoNQw6mhMnqcj3I/Y1I6PrSdxHhiRvFbfhfGjiYQU4
         yvwg==
X-Gm-Message-State: AO0yUKUaEfD3Ab1cNghZkV3AadVlKD1Jg8h8afy32hVSkWIknZXWTlH0
        xFUq6OSnK4Au5L40Q92X0bKqlhL5oyur/3l/
X-Google-Smtp-Source: AK7set9mgi+ouaiiG6YLf9c+GJ4f4JqcVip6ato/GKn/2IpBQfIu7Tyi2z6IUnD8NGLb8QN9vMAPYg==
X-Received: by 2002:a19:c506:0:b0:4e8:17a:c0ac with SMTP id w6-20020a19c506000000b004e8017ac0acmr6857816lfe.9.1678640536689;
        Sun, 12 Mar 2023 10:02:16 -0700 (PDT)
Received: from 0000-cover-letter.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id s4-20020a19ad44000000b004d863fa8681sm708783lfd.173.2023.03.12.10.02.16
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 10:02:16 -0700 (PDT)
Message-Id: <1678640497.9030156-0-sleirsgoevy@gmail.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 19:59:30 +0300
Subject: [PATCH v4 0/3] mmc: dw_mmc: fix DW MMC cores with 32-bit bus on 64-bit Linux systems 
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

v4:
- split dt-bindings and dts update into separate commits
- add an explanation why it'ss necessary to change the compatible string

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

Sergey Lisov (3):
  dt-bindings: exynos-dw-mshc-common: add exynos78xx variants
  arm64: dts: exynos: fix wrong mmc compatible in exynos7885.dtsi
  mmc: dw_mmc: add an option to force 32-bit access to 64-bit FIFO

 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |   2 +
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    |   2 +-
 drivers/mmc/host/dw_mmc-exynos.c              |  41 +++++-
 drivers/mmc/host/dw_mmc.c                     | 122 +++++++++++++++++-
 drivers/mmc/host/dw_mmc.h                     |   2 +
 5 files changed, 165 insertions(+), 4 deletions(-)

-- 
2.38.3


