Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988EEC6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 18:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjCLSkq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjCLSkp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 14:40:45 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495EF1A95A
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:40:12 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y15so3518897lfa.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678646360;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdTNsWpg9ZM8ehZQeKtTu+6KMOIWutkVZQ0G5s6b6sY=;
        b=CFsrHmddjlTLsDC/LFd3NDmpJa8ouTpboUjcsCAJCFUGjnGq/tj9gtXaKZNYMNYUHR
         2gV/3RkSJtoYjIWD41vE7i/dPpAUbe36eMwu44MKXp7Z0hPAPwI548GnjHbjNYlcKjfA
         LLon8+XzjTNVhejbRC8yXnuCrX6RFXwzyXGucfyckeRlhU0b0RJPfl3WojtalNMSRqyv
         GkeYq3yY/wXLtu9pXr490P8c4sJW0o1lHKCZBrQQXlGFRI8p14G1d4dHEtDzDTnciW2t
         pTH26uoBSZJ4RPRp0xk3bjlVMkNlB3wTZW5Wf02DRf2rz+mBINh+ODuxXk0wlWg/YPxd
         0KmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678646360;
        h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdTNsWpg9ZM8ehZQeKtTu+6KMOIWutkVZQ0G5s6b6sY=;
        b=UsbBpnIYNTaKvbHMnyOYgYbI/4k2eKKsDpBZ2RvIAU/DfG0aVrmuwl4ADMdhIoeYNz
         evCgPCE+GrdCOSLK+JwlZXLjss/Tb5UhN2ZXQfYbCRxe90koOcdMAlQ/ybHZ8LhjXYjJ
         hME0KoaleyscKoijnovh0p1F9dBRU9ByogAs23DsUQDwgSpQvoFKzUCFGil7uiBn0jTb
         z+vfNv3PYuq9jJn0kjrzyjBnZlXFvWriqSwwFU8/8PtxVyBnWYp1O79R7E8a8RIQ8Rwo
         TjnvmwPdZVRxnXJeBvo142yO7GOJ4pcptTLNU6nfLW+iCYTWiAGvoAcYp1GYYSvsONwM
         pbFw==
X-Gm-Message-State: AO0yUKUe77OxRwNghNbKtXOq7KJUcnhjz3r2z8VgdU78mYFsmR1KZup4
        omug7TNeHwOFMD28LX+HS3C7FHfOzGGqXV1B
X-Google-Smtp-Source: AK7set+FIfQmzyjh3eIbMBJlrpRVTOlVZWeGarucBRaB0FtQQXE/hiYT5FOeFwawgpR+viQe7Ep29g==
X-Received: by 2002:ac2:5dd9:0:b0:4df:1d72:8e88 with SMTP id x25-20020ac25dd9000000b004df1d728e88mr9155013lfq.59.1678644273080;
        Sun, 12 Mar 2023 11:04:33 -0700 (PDT)
Received: from 0000-cover-letter.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id q9-20020ac25289000000b004ceb053c3ebsm726292lfm.179.2023.03.12.11.04.32
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:04:32 -0700 (PDT)
Message-ID: <640e1430.c20a0220.e532e.1b63@mx.google.com>
From:   Sergey Lisov <sleirsgoevy@gmail.com>
Date:   Sun, 12 Mar 2023 20:58:50 +0300
Subject: [PATCH v5 0/3] mmc: dw_mmc: fix DW MMC cores with 32-bit bus on 64-bit Linux systems
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

v5:
- rename "samsung,exynos78xx-dw-mshc" to "samsung,exynos7885-dw-mshc"
- rename "samsung,exynos78xx-dw-mshc" to "samsung,exynos7885-dw-mshc"

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
  dt-bindings: exynos-dw-mshc-common: add exynos7885 variants
  mmc: dw_mmc: add an option to force 32-bit access to 64-bit FIFO
  arm64: dts: exynos: fix wrong mmc compatible in exynos7885.dtsi

 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |   2 +
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    |   2 +-
 drivers/mmc/host/dw_mmc-exynos.c              |  43 +++++-
 drivers/mmc/host/dw_mmc.c                     | 122 +++++++++++++++++-
 drivers/mmc/host/dw_mmc.h                     |   2 +
 5 files changed, 167 insertions(+), 4 deletions(-)

-- 
2.38.3


