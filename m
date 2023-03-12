Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24372C6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 18:25:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbjCLSZz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 14:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231193AbjCLSZh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 14:25:37 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69553E0B0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:18:55 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id t15so9334470wrz.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 11:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678645054;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdTNsWpg9ZM8ehZQeKtTu+6KMOIWutkVZQ0G5s6b6sY=;
        b=c3sN1OgBoYUga628ShZksN2feROkArSb7mdaMt2DAQoBBU49GgChPjiseLuRMBPb8I
         nyvCajF71bXewykV990tYQOEYNI5EMON17C2Rqy3bsxWk7X/3FvAjBsGrUqVz4baZlXN
         Nb+5kzHtcRpCO1GZxunKzStHsw6qg5v4Nk4WxGNQa8PF/OhtPzfLe24HVFO0cXzpIwZR
         id2hgHfu1gIOCRcqMK1s5tISGG1dm4h2Wh52b/hneDwU+N7MOT5HJvkKmhFbylgWRkRN
         t8z74eG35ETKvLUaDEDbA/H08Q96FvxJDGMb578fFU7Te/OeMwXaGntQm6eSZUmcaNRa
         CosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678645054;
        h=cc:to:subject:date:from:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdTNsWpg9ZM8ehZQeKtTu+6KMOIWutkVZQ0G5s6b6sY=;
        b=VdfpY6vBFjm11nga0oVM/g39Ksj4atCRdwdgWDaonJH1c+HcYgOL/1FsZVyScqy6Cx
         8LhxtrYoR1da/T31woIOqdUYVNoCBr5pf9lEkN6Gl6pBKpw4iiiJqFcKobdVySaRFib3
         ob99xyVQiMuXVAMJFT75dxWWv/86Ijau5eTSOXORKYbjYdN+7oZfnzgwEBo00xr0QqvG
         NrJf3bBbAo5CIJPzsVgVHD99SMdLRRQslbsZDHaPlbgWfagQDk8+42YCgonCQId4Aa9T
         Lf4mi4gDvD7BkuFBIDI8dkiLyKdkyeQRQg9G45g9GDGbETMhKPjK6zPFwPgSYFNGQ7VF
         Rokg==
X-Gm-Message-State: AO0yUKX3uceiMVtUlMfuO6vAdQoJjYjti9KuUSJcMRGG3cPw/F0EyJUI
        /npLva2x0NwKS/RRkEGfJoqW6YibnrkyZfRM
X-Google-Smtp-Source: AK7set8F0bGnACiNxAPldOvswRWWcW0afjw7Wv7rXeUWPBhJmOBMMCs73kE/JUfPC8KhImZ720KJUA==
X-Received: by 2002:ac2:5dfb:0:b0:4d5:ae35:b221 with SMTP id z27-20020ac25dfb000000b004d5ae35b221mr9090502lfq.34.1678644626704;
        Sun, 12 Mar 2023 11:10:26 -0700 (PDT)
Received: from 0000-cover-letter.patch (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id d25-20020ac25459000000b004e670ce364bsm709133lfn.277.2023.03.12.11.10.26
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 11:10:26 -0700 (PDT)
Message-Id: <1678644516.665314-0-sleirsgoevy@gmail.com>
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


